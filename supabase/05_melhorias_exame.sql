-- =====================================================================
--  PrepConcurso AO — Melhorias do exame
--  1) As opções A–D são baralhadas em cada exame (ordem diferente por candidato)
--  2) Numa repetição, o sorteio dá prioridade a questões ainda não vistas
--  Executar DEPOIS de 01_schema.sql. Pode ser executado mais do que uma vez.
-- =====================================================================

alter table public.tentativas add column if not exists ordem_opcoes jsonb not null default '{}'::jsonb;
-- ordem_opcoes = {"id_questao": [i0, i1, ...]}: a opção mostrada na posição k é a opção original i_k

-- Questões enviadas ao candidato, com as opções na ordem baralhada (sem a resposta correta)
create or replace function public._pacote_exame(p_tentativa uuid)
returns jsonb language sql stable security definer set search_path = public as $$
  select jsonb_build_object(
    'tentativa_id', t.id,
    'tipo', t.tipo,
    'n_questoes', t.n_questoes,
    'duracao_seg', t.duracao_seg,
    'iniciado_em', t.iniciado_em,
    'agora', now(),
    'respostas', t.respostas,
    'questoes', (
      select jsonb_agg(jsonb_build_object(
               'id', q.id, 'area', q.area, 'enunciado', q.enunciado,
               'opcoes', case
                 when t.ordem_opcoes ? q.id::text then (
                   select jsonb_agg(q.opcoes -> ((t.ordem_opcoes -> q.id::text ->> k)::int) order by k)
                   from generate_series(0, jsonb_array_length(q.opcoes) - 1) k)
                 else q.opcoes end
             ) order by u.ord)
      from unnest(t.questao_ids) with ordinality as u(qid, ord)
      join questoes q on q.id = u.qid
    )
  )
  from tentativas t where t.id = p_tentativa;
$$;

-- Correção: converte a posição escolhida no ecrã na opção original
create or replace function public._corrigir(p_tentativa uuid, p_respostas jsonb)
returns void language plpgsql security definer set search_path = public as $$
declare
  t tentativas%rowtype;
  v_acertos int := 0; v_respondidas int := 0;
  v_detalhe jsonb := '{}'::jsonb;
  q record; v_resp text; v_orig int; v_area_tot int; v_area_ac int; v_ok boolean;
  v_tempo int;
begin
  select * into t from tentativas where id = p_tentativa for update;
  if t.estado <> 'em_curso' then return; end if;

  for q in select id, area, correta from questoes where id = any(t.questao_ids) loop
    v_resp := p_respostas ->> q.id::text;
    v_ok := false;
    if v_resp is not null and v_resp ~ '^\d+$' then
      v_respondidas := v_respondidas + 1;
      v_orig := coalesce((t.ordem_opcoes -> q.id::text ->> v_resp::int)::int, v_resp::int);
      if v_orig = q.correta then v_acertos := v_acertos + 1; v_ok := true; end if;
    end if;
    v_area_tot := coalesce((v_detalhe -> q.area ->> 'total')::int, 0) + 1;
    v_area_ac  := coalesce((v_detalhe -> q.area ->> 'acertos')::int, 0) + case when v_ok then 1 else 0 end;
    v_detalhe  := v_detalhe || jsonb_build_object(q.area, jsonb_build_object('total', v_area_tot, 'acertos', v_area_ac));
  end loop;

  v_tempo := least(t.duracao_seg, greatest(0, extract(epoch from (now() - t.iniciado_em))::int));

  update tentativas set
    respostas    = p_respostas,
    estado       = 'submetido',
    submetido_em = now(),
    tempo_seg    = v_tempo,
    respondidas  = v_respondidas,
    acertos      = v_acertos,
    nota         = round(v_acertos::numeric * 20 / t.n_questoes, 1),
    detalhe      = v_detalhe
  where id = t.id;

  update pedidos_repeticao set estado = 'concedido'
   where id = (select id from pedidos_repeticao
                where user_id = t.user_id and tipo = t.tipo and estado = 'aprovado'
                order by decidido_em limit 1)
     and (select count(*) from tentativas where user_id = t.user_id and tipo = t.tipo and estado = 'submetido') > 1;
end $$;

-- Início do exame: questões ainda não vistas primeiro + opções baralhadas
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
begin
  if v_uid is null then raise exception 'Sessão inválida. Inicie sessão novamente.'; end if;
  if p_tipo not in ('psico','conhecimento') then raise exception 'Tipo de exame inválido.'; end if;

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
    -- não vistas primeiro, distribuídas pelas áreas; só depois as já vistas
    select array_agg(id order by random()) into v_ids from (
      select id from (
        select id, (id = any(v_vistas)) as vista,
               row_number() over (partition by area, (id = any(v_vistas)) order by random()) as rn
          from questoes where tipo = 'psico' and ativo
      ) x order by vista, rn, random() limit p_n
    ) y;
  else
    if v_perfil.categoria_id is null then raise exception 'Não tem categoria definida no perfil.'; end if;
    select array_agg(id order by random()) into v_ids from (
      select id from questoes
       where tipo = 'conhecimento' and ativo and categoria_id = v_perfil.categoria_id
       order by (id = any(v_vistas)), random() limit p_n
    ) y;
  end if;

  v_n := coalesce(array_length(v_ids, 1), 0);
  if v_n = 0 then raise exception 'Ainda não existem questões disponíveis para este teste. Contacte a administração.'; end if;

  -- ordem aleatória das opções de cada questão
  select jsonb_object_agg(q.id::text, (
           select jsonb_agg(i order by random()) from generate_series(0, jsonb_array_length(q.opcoes) - 1) i))
    into v_ordem
    from questoes q where q.id = any(v_ids);

  insert into tentativas (user_id, tipo, categoria_id, n_questoes, duracao_seg, questao_ids, ordem_opcoes)
  values (v_uid, p_tipo, case when p_tipo = 'conhecimento' then v_perfil.categoria_id end, v_n, v_n * 60, v_ids, coalesce(v_ordem, '{}'::jsonb))
  returning id into v_id;

  return _pacote_exame(v_id);
end $$;

revoke all on function public._corrigir(uuid, jsonb), public._pacote_exame(uuid) from public, anon, authenticated;
grant execute on function public.iniciar_exame(text,int) to authenticated;
