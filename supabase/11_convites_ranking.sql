-- =====================================================================
--  PrepConcurso AO — Convites com prémio e ranking semanal
--  1) Cada candidato tem um link de convite (?ref=CÓDIGO). A cada
--     3 amigos convidados que façam pelo menos um teste, ganha uma
--     2.ª via automática (sem esperar pela aprovação do administrador).
--  2) Ranking semanal por teste (só primeiro nome + inicial; quem não
--     quiser aparecer pode sair do ranking no painel).
--  Executar DEPOIS de 09_minint_livre.sql. Pode ser executado mais do que uma vez.
-- =====================================================================

alter table public.perfis add column if not exists convidado_por   uuid references public.perfis(id) on delete set null;
alter table public.perfis add column if not exists convidado_em    timestamptz;
alter table public.perfis add column if not exists ranking_visivel boolean not null default true;
create index if not exists perfis_convidado_por on public.perfis(convidado_por);

-- nome curto e público: «Pedro M.»
create or replace function public._nome_curto(p_nome text)
returns text language sql immutable as $$
  select case
    when coalesce(trim(p_nome), '') = '' then 'Candidato'
    when position(' ' in trim(p_nome)) = 0 then initcap(trim(p_nome))
    else initcap(split_part(trim(p_nome), ' ', 1)) || ' ' ||
         upper(left(regexp_replace(trim(p_nome), '^.*\s', ''), 1)) || '.'
  end;
$$;

-- ---------------------------------------------------------------------
--  CONVITES
-- ---------------------------------------------------------------------
-- quantos convites são precisos para cada prémio
create or replace function public._convites_por_premio() returns int language sql immutable as $$ select 3 $$;

create or replace function public._convites_resumo(p_uid uuid)
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare v_total int; v_validos int; v_usados int; v_ganhos int; c int := _convites_por_premio();
begin
  select count(*) into v_total from perfis where convidado_por = p_uid;
  -- só contam os convidados que já submeteram pelo menos um teste (evita contas falsas)
  select count(*) into v_validos from perfis p
   where p.convidado_por = p_uid
     and exists (select 1 from tentativas t where t.user_id = p.id and t.estado = 'submetido');
  select count(*) into v_usados from pedidos_repeticao
   where user_id = p_uid and motivo like 'Prémio de convites%' and estado in ('aprovado','concedido');
  v_ganhos := v_validos / c;
  return jsonb_build_object(
    'por_premio', c,
    'total', v_total,
    'validos', v_validos,
    'premios_ganhos', v_ganhos,
    'premios_usados', v_usados,
    'premios_disponiveis', greatest(v_ganhos - v_usados, 0),
    'faltam', c - (v_validos % c));
end $$;

-- O candidato que entrou por um link de convite regista quem o convidou
create or replace function public.registar_convite(p_codigo text)
returns jsonb language plpgsql security definer set search_path = public as $$
declare v_uid uuid := auth.uid(); v_ref uuid; v_nome text; p perfis%rowtype;
begin
  if v_uid is null then raise exception 'Sessão inválida.'; end if;
  select id, nome into v_ref, v_nome from perfis where upper(codigo) = upper(trim(coalesce(p_codigo, '')));
  if v_ref is null then return jsonb_build_object('ok', false, 'motivo', 'codigo'); end if;
  if v_ref = v_uid then return jsonb_build_object('ok', false, 'motivo', 'proprio'); end if;
  select * into p from perfis where id = v_uid;
  if p.convidado_por is not null then return jsonb_build_object('ok', false, 'motivo', 'ja_registado'); end if;
  -- só contas novas (criadas há menos de 3 dias) podem indicar quem as convidou
  if p.criado_em < now() - interval '3 days' then return jsonb_build_object('ok', false, 'motivo', 'conta_antiga'); end if;
  -- sem convites em círculo (A convida B e B convida A)
  if exists (select 1 from perfis where id = v_ref and convidado_por = v_uid) then
    return jsonb_build_object('ok', false, 'motivo', 'circular');
  end if;
  update perfis set convidado_por = v_ref, convidado_em = now() where id = v_uid;
  return jsonb_build_object('ok', true, 'nome', _nome_curto(v_nome));
end $$;

-- Resumo dos convites do próprio candidato
create or replace function public.meus_convites()
returns jsonb language plpgsql stable security definer set search_path = public as $$
begin
  if auth.uid() is null then raise exception 'Sessão inválida.'; end if;
  return _convites_resumo(auth.uid()) || jsonb_build_object(
    'codigo', (select codigo from perfis where id = auth.uid()),
    'convidados', coalesce((
      select jsonb_agg(jsonb_build_object(
               'nome', _nome_curto(p.nome),
               'valido', exists (select 1 from tentativas t where t.user_id = p.id and t.estado = 'submetido'),
               'em', p.convidado_em) order by p.convidado_em desc)
        from perfis p where p.convidado_por = auth.uid()), '[]'::jsonb));
end $$;

-- Usar um prémio: concede logo uma nova tentativa no teste escolhido
create or replace function public.resgatar_premio_convite(p_tipo text)
returns void language plpgsql security definer set search_path = public as $$
declare v_res jsonb; v_estado jsonb; v_pend int;
begin
  if auth.uid() is null then raise exception 'Sessão inválida.'; end if;
  if p_tipo not in ('psico','conhecimento','minint') then raise exception 'Tipo de teste inválido.'; end if;
  v_res := _convites_resumo(auth.uid());
  if (v_res->>'premios_disponiveis')::int < 1 then
    raise exception 'Ainda não tem prémios. Faltam % amigo(s) que façam um teste.', v_res->>'faltam';
  end if;
  v_estado := _estado_candidato(auth.uid());
  if (v_estado->p_tipo->>'feitos')::int = 0 then raise exception 'Ainda não fez este teste: o prémio serve para repetir um teste já feito.'; end if;
  if (v_estado->p_tipo->>'pode_iniciar')::boolean then raise exception 'Já pode fazer este teste. Guarde o prémio para depois.'; end if;
  if p_tipo = 'conhecimento' and not (v_estado->'conhecimento'->>'desbloqueado')::boolean then
    raise exception 'Primeiro deve obter nota igual ou superior a 10 no Teste Psicotécnico.';
  end if;

  -- se já havia um pedido pendente para este teste, é aprovado com o prémio
  select id into v_pend from pedidos_repeticao where user_id = auth.uid() and tipo = p_tipo and estado = 'pendente';
  if v_pend is not null then
    update pedidos_repeticao
       set estado = 'aprovado', decidido_em = now(),
           motivo = 'Prémio de convites (' || _convites_por_premio() || ' amigos) — ' || coalesce(motivo, '')
     where id = v_pend;
  else
    insert into pedidos_repeticao (user_id, tipo, motivo, estado, decidido_em)
    values (auth.uid(), p_tipo, 'Prémio de convites (' || _convites_por_premio() || ' amigos)', 'aprovado', now());
  end if;
end $$;

-- ---------------------------------------------------------------------
--  RANKING SEMANAL
-- ---------------------------------------------------------------------
create or replace function public.ranking_semanal(p_tipo text, p_limite int default 10)
returns table (posicao int, nome text, categoria text, nota numeric, tempo_seg int, meu boolean)
language sql stable security definer set search_path = public as $$
  with ini as (
    -- a semana começa à segunda-feira, hora de Luanda
    select (date_trunc('week', now() at time zone 'Africa/Luanda') at time zone 'Africa/Luanda') as d
  ),
  melhores as (
    select distinct on (t.user_id) t.user_id, t.nota, t.tempo_seg, t.submetido_em, t.categoria_id
      from tentativas t, ini
     where t.tipo = p_tipo and t.estado = 'submetido' and not t.anulado and t.submetido_em >= ini.d
     order by t.user_id, t.nota desc, t.tempo_seg asc, t.submetido_em asc
  ),
  r as (
    select m.*, p.nome as pnome,
           row_number() over (order by m.nota desc, m.tempo_seg asc, m.submetido_em asc)::int as pos
      from melhores m join perfis p on p.id = m.user_id
     where p.ranking_visivel and not p.bloqueado and not p.is_admin
  )
  select r.pos, _nome_curto(r.pnome), c.nome, r.nota, r.tempo_seg, (r.user_id = auth.uid())
    from r left join categorias c on c.id = r.categoria_id
   where r.pos <= least(greatest(coalesce(p_limite, 10), 1), 50) or r.user_id = auth.uid()
   order by r.pos;
$$;

create or replace function public.definir_ranking_visivel(p_visivel boolean)
returns void language plpgsql security definer set search_path = public as $$
begin
  if auth.uid() is null then raise exception 'Sessão inválida.'; end if;
  update perfis set ranking_visivel = coalesce(p_visivel, true) where id = auth.uid();
end $$;

revoke all on function public._convites_resumo(uuid) from public, anon, authenticated;
grant execute on function public.registar_convite(text) to authenticated;
grant execute on function public.meus_convites() to authenticated;
grant execute on function public.resgatar_premio_convite(text) to authenticated;
grant execute on function public.definir_ranking_visivel(boolean) to authenticated;
grant execute on function public.ranking_semanal(text, int) to anon, authenticated;
