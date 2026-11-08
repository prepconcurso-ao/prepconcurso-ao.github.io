-- =====================================================================
--  PrepConcurso AO — Teste MININT de acesso livre
--  Novo tipo de exame 'minint': usa as questões da categoria
--  "Ministério do Interior (MININT) — Prova Escrita", não depende do
--  teste psicotécnico nem da categoria do candidato. Uma tentativa;
--  repetição com 2.ª via aprovada pelo administrador (como os outros).
--  Executar DEPOIS de 08_seguranca_exame.sql. Pode ser executado mais do que uma vez.
-- =====================================================================

alter table public.tentativas drop constraint if exists tentativas_tipo_check;
alter table public.tentativas add constraint tentativas_tipo_check check (tipo in ('psico','conhecimento','minint'));
alter table public.pedidos_repeticao drop constraint if exists pedidos_repeticao_tipo_check;
alter table public.pedidos_repeticao add constraint pedidos_repeticao_tipo_check check (tipo in ('psico','conhecimento','minint'));

-- categoria que contém as questões da prova escrita do MININT
create or replace function public._categoria_minint()
returns int language sql stable security definer set search_path = public as $$
  select id from categorias where nome ilike '%MININT%' order by id limit 1;
$$;

-- resumo de um tipo de exame para um candidato
create or replace function public._resumo_tipo(p_uid uuid, p_tipo text, p_liberado boolean)
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare
  v_feitos int; v_extra int; v_ultima numeric; v_melhor numeric; v_curso uuid; v_ped text;
begin
  select count(*), max(nota) into v_feitos, v_melhor from tentativas where user_id = p_uid and tipo = p_tipo and estado = 'submetido';
  select count(*) into v_extra from pedidos_repeticao where user_id = p_uid and tipo = p_tipo and estado in ('aprovado','concedido');
  select nota into v_ultima from tentativas where user_id = p_uid and tipo = p_tipo and estado = 'submetido' order by submetido_em desc limit 1;
  select id into v_curso from tentativas where user_id = p_uid and tipo = p_tipo and estado = 'em_curso';
  select estado into v_ped from pedidos_repeticao where user_id = p_uid and tipo = p_tipo order by criado_em desc limit 1;
  return jsonb_build_object(
    'desbloqueado', p_liberado,
    'feitos', v_feitos,
    'permitidos', 1 + v_extra,
    'pode_iniciar', p_liberado and (v_curso is not null or v_feitos < 1 + v_extra),
    'em_curso', v_curso,
    'ultima_nota', v_ultima,
    'melhor_nota', v_melhor,
    'ultimo_pedido', v_ped);
end $$;

create or replace function public._estado_candidato(p_uid uuid)
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare v_melhor_psico numeric;
begin
  select max(nota) into v_melhor_psico from tentativas where user_id = p_uid and tipo = 'psico' and estado = 'submetido';
  return jsonb_build_object(
    'psico',        _resumo_tipo(p_uid, 'psico', true),
    -- a etapa de conhecimentos fica desbloqueada com a melhor nota psicotécnica >= 10
    'conhecimento', _resumo_tipo(p_uid, 'conhecimento', coalesce(v_melhor_psico, 0) >= 10),
    -- teste MININT: acesso livre, sem psicotécnico
    'minint',       _resumo_tipo(p_uid, 'minint', _categoria_minint() is not null)
  );
end $$;

create or replace function public.iniciar_exame(p_tipo text, p_n int)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_uid uuid := auth.uid();
  v_perfil perfis%rowtype;
  v_estado jsonb;
  v_curso uuid;
  v_ids int[];
  v_n int;
  v_id uuid;
  v_vistas int[];
  v_ordem jsonb;
  v_cat int;
begin
  if v_uid is null then raise exception 'Sessão inválida. Inicie sessão novamente.'; end if;
  if p_tipo not in ('psico','conhecimento','minint') then raise exception 'Tipo de exame inválido.'; end if;

  select * into v_perfil from perfis where id = v_uid;
  if v_perfil.bloqueado then raise exception 'A sua conta está bloqueada. Contacte a administração.'; end if;

  perform _fechar_expirados(v_uid);

  select id into v_curso from tentativas where user_id = v_uid and tipo = p_tipo and estado = 'em_curso';
  if v_curso is not null then return _pacote_exame(v_curso); end if;

  v_estado := _estado_candidato(v_uid);
  if p_tipo = 'conhecimento' and not (v_estado->'conhecimento'->>'desbloqueado')::boolean then
    raise exception 'Precisa de nota igual ou superior a 10 valores no Teste Psicotécnico para aceder a esta etapa.';
  end if;
  if not (v_estado->p_tipo->>'pode_iniciar')::boolean then
    raise exception 'Já realizou este teste. Para repetir, solicite autorização ao administrador.';
  end if;
  if p_n is null or p_n < 25 or p_n > 50 then raise exception 'Escolha entre 25 e 50 questões.'; end if;

  -- questões que o candidato já viu em testes anteriores do mesmo tipo
  select coalesce(array_agg(distinct x), '{}') into v_vistas
    from tentativas t, unnest(t.questao_ids) x
   where t.user_id = v_uid and t.tipo = p_tipo and t.estado = 'submetido';

  if p_tipo = 'psico' then
    select array_agg(id order by random()) into v_ids from (
      select id from (
        select id, (id = any(v_vistas)) as vista,
               row_number() over (partition by area, (id = any(v_vistas)) order by random()) as rn
          from questoes where tipo = 'psico' and ativo
      ) x order by vista, rn, random() limit p_n
    ) y;
  else
    v_cat := case when p_tipo = 'minint' then _categoria_minint() else v_perfil.categoria_id end;
    if v_cat is null then raise exception 'Não tem categoria definida no perfil.'; end if;
    -- não vistas primeiro, distribuídas pelas áreas da categoria
    select array_agg(id order by random()) into v_ids from (
      select id from (
        select id, (id = any(v_vistas)) as vista,
               row_number() over (partition by area, (id = any(v_vistas)) order by random()) as rn
          from questoes where tipo = 'conhecimento' and ativo and categoria_id = v_cat
      ) x order by vista, rn, random() limit p_n
    ) y;
  end if;

  v_n := coalesce(array_length(v_ids, 1), 0);
  if v_n = 0 then raise exception 'Ainda não existem questões disponíveis para este teste. Contacte a administração.'; end if;

  select jsonb_object_agg(q.id::text, (
           select jsonb_agg(i order by random()) from generate_series(0, jsonb_array_length(q.opcoes) - 1) i))
    into v_ordem
    from questoes q where q.id = any(v_ids);

  insert into tentativas (user_id, tipo, categoria_id, n_questoes, duracao_seg, questao_ids, ordem_opcoes)
  values (v_uid, p_tipo, v_cat, v_n, v_n * 60, v_ids, coalesce(v_ordem, '{}'::jsonb))
  returning id into v_id;

  return _pacote_exame(v_id);
end $$;

revoke all on function public._resumo_tipo(uuid, text, boolean) from public, anon, authenticated;
grant execute on function public.iniciar_exame(text,int) to authenticated;
