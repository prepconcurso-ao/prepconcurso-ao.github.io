-- =====================================================================
--  PrepConcurso AO — Esquema da base de dados (Supabase / PostgreSQL)
--  Executar no Supabase: SQL Editor → New query → colar → Run
--  Ordem: 01_schema.sql  →  02_seed_questoes.sql
-- =====================================================================

create extension if not exists pgcrypto;

-- ---------------------------------------------------------------------
-- TABELAS
-- ---------------------------------------------------------------------

create table if not exists public.categorias (
  id          serial primary key,
  nome        text not null unique,
  descricao   text,
  ativo       boolean not null default true,
  criado_em   timestamptz not null default now()
);

create sequence if not exists public.codigo_candidato_seq start 1000001;

create table if not exists public.perfis (
  id            uuid primary key references auth.users(id) on delete cascade,
  nome          text not null,
  email         text,
  contacto      text,
  categoria_id  int references public.categorias(id),
  codigo        text unique not null,
  is_admin      boolean not null default false,
  bloqueado     boolean not null default false,
  criado_em     timestamptz not null default now()
);

-- tipo: 'psico' (teste psicotécnico) | 'conhecimento' (aferição de conhecimentos)
create table if not exists public.questoes (
  id            serial primary key,
  tipo          text not null check (tipo in ('psico','conhecimento')),
  area          text not null,                 -- ex.: Raciocínio Lógico, Aptidão Verbal...
  categoria_id  int references public.categorias(id) on delete cascade,
  enunciado     text not null,
  opcoes        jsonb not null,                -- ["A", "B", "C", "D"]
  correta       int  not null,                 -- índice (0..n-1) da opção correta
  explicacao    text,
  ativo         boolean not null default true,
  criado_em     timestamptz not null default now(),
  constraint questao_categoria check (
    (tipo = 'psico' and categoria_id is null) or (tipo = 'conhecimento' and categoria_id is not null)
  ),
  constraint opcoes_validas check (jsonb_typeof(opcoes) = 'array' and jsonb_array_length(opcoes) between 2 and 6),
  constraint correta_valida check (correta >= 0 and correta < jsonb_array_length(opcoes))
);
create index if not exists questoes_tipo_cat on public.questoes(tipo, categoria_id) where ativo;

create table if not exists public.tentativas (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid not null references public.perfis(id) on delete cascade,
  tipo          text not null check (tipo in ('psico','conhecimento')),
  categoria_id  int references public.categorias(id),
  n_questoes    int  not null,
  duracao_seg   int  not null,
  questao_ids   int[] not null,
  respostas     jsonb not null default '{}'::jsonb,   -- {"id_questao": indice_opcao}
  estado        text not null default 'em_curso' check (estado in ('em_curso','submetido')),
  iniciado_em   timestamptz not null default now(),
  submetido_em  timestamptz,
  tempo_seg     int,
  respondidas   int,
  acertos       int,
  nota          numeric(4,1),                        -- 0,0 a 20,0 valores
  detalhe       jsonb                                -- desempenho por área
);
create index if not exists tentativas_user on public.tentativas(user_id, tipo);
-- no máximo um exame em curso por candidato e por tipo
create unique index if not exists tentativa_em_curso_unica
  on public.tentativas(user_id, tipo) where estado = 'em_curso';

create table if not exists public.pedidos_repeticao (
  id           serial primary key,
  user_id      uuid not null references public.perfis(id) on delete cascade,
  tipo         text not null check (tipo in ('psico','conhecimento')),
  motivo       text,
  estado       text not null default 'pendente' check (estado in ('pendente','aprovado','rejeitado','concedido')),
  criado_em    timestamptz not null default now(),
  decidido_em  timestamptz,
  decidido_por uuid references public.perfis(id)
);
create unique index if not exists pedido_pendente_unico
  on public.pedidos_repeticao(user_id, tipo) where estado = 'pendente';

-- ---------------------------------------------------------------------
-- FUNÇÕES AUXILIARES
-- ---------------------------------------------------------------------

create or replace function public.is_admin()
returns boolean language sql stable security definer set search_path = public as $$
  select coalesce((select is_admin from public.perfis where id = auth.uid()), false);
$$;

-- Cria o perfil automaticamente quando um utilizador se regista no Supabase Auth
create or replace function public.criar_perfil_novo_utilizador()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  v_meta jsonb := coalesce(new.raw_user_meta_data, '{}'::jsonb);
  v_cat  int;
begin
  v_cat := nullif(v_meta->>'categoria_id','')::int;
  insert into public.perfis (id, nome, email, contacto, categoria_id, codigo)
  values (
    new.id,
    coalesce(nullif(trim(v_meta->>'nome'),''), 'Candidato'),
    nullif(v_meta->>'email_real',''),
    nullif(v_meta->>'contacto',''),
    v_cat,
    'PREP-' || nextval('public.codigo_candidato_seq') || '-' || extract(year from now())::int
  );
  return new;
end $$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.criar_perfil_novo_utilizador();

-- Converte o login (e-mail ou telefone) no e-mail técnico usado pelo Supabase Auth.
-- Também implementado no JavaScript (js/app.js → loginParaEmail). Mantido aqui como referência.
create or replace function public.login_para_email(p_login text)
returns text language sql immutable as $$
  select case
    when position('@' in p_login) > 0 then lower(trim(p_login))
    else regexp_replace(p_login, '\D', '', 'g') || '@tel.prepconcurso.app'
  end;
$$;

-- Estado de elegibilidade de um candidato
create or replace function public._estado_candidato(p_uid uuid)
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare
  v_psico_feitos int; v_psico_extra int;
  v_con_feitos int;   v_con_extra int;
  v_ultima_psico numeric; v_ultima_con numeric; v_melhor_psico numeric;
  v_psico_curso uuid; v_con_curso uuid;
  v_ped_psico text; v_ped_con text;
  v_desbloq boolean;
begin
  select count(*) into v_psico_feitos from tentativas where user_id = p_uid and tipo = 'psico' and estado = 'submetido';
  select count(*) into v_con_feitos   from tentativas where user_id = p_uid and tipo = 'conhecimento' and estado = 'submetido';
  select count(*) into v_psico_extra  from pedidos_repeticao where user_id = p_uid and tipo = 'psico' and estado in ('aprovado','concedido');
  select count(*) into v_con_extra    from pedidos_repeticao where user_id = p_uid and tipo = 'conhecimento' and estado in ('aprovado','concedido');

  select nota into v_ultima_psico from tentativas
    where user_id = p_uid and tipo = 'psico' and estado = 'submetido' order by submetido_em desc limit 1;
  select max(nota) into v_melhor_psico from tentativas
    where user_id = p_uid and tipo = 'psico' and estado = 'submetido';
  select nota into v_ultima_con from tentativas
    where user_id = p_uid and tipo = 'conhecimento' and estado = 'submetido' order by submetido_em desc limit 1;

  select id into v_psico_curso from tentativas where user_id = p_uid and tipo = 'psico' and estado = 'em_curso';
  select id into v_con_curso   from tentativas where user_id = p_uid and tipo = 'conhecimento' and estado = 'em_curso';

  select estado into v_ped_psico from pedidos_repeticao where user_id = p_uid and tipo = 'psico' order by criado_em desc limit 1;
  select estado into v_ped_con   from pedidos_repeticao where user_id = p_uid and tipo = 'conhecimento' order by criado_em desc limit 1;

  -- a etapa de conhecimentos fica desbloqueada com a melhor nota psicotécnica >= 10
  v_desbloq := coalesce(v_melhor_psico, 0) >= 10;

  return jsonb_build_object(
    'psico', jsonb_build_object(
      'feitos', v_psico_feitos,
      'permitidos', 1 + v_psico_extra,
      'pode_iniciar', v_psico_curso is not null or v_psico_feitos < 1 + v_psico_extra,
      'em_curso', v_psico_curso,
      'ultima_nota', v_ultima_psico,
      'melhor_nota', v_melhor_psico,
      'ultimo_pedido', v_ped_psico
    ),
    'conhecimento', jsonb_build_object(
      'desbloqueado', v_desbloq,
      'feitos', v_con_feitos,
      'permitidos', 1 + v_con_extra,
      'pode_iniciar', v_desbloq and (v_con_curso is not null or v_con_feitos < 1 + v_con_extra),
      'em_curso', v_con_curso,
      'ultima_nota', v_ultima_con,
      'ultimo_pedido', v_ped_con
    )
  );
end $$;

create or replace function public.meu_estado()
returns jsonb language plpgsql volatile security definer set search_path = public as $$
begin
  perform public._fechar_expirados(auth.uid());
  return public._estado_candidato(auth.uid());
end $$;

-- Corrige e fecha uma tentativa (uso interno)
create or replace function public._corrigir(p_tentativa uuid, p_respostas jsonb)
returns void language plpgsql security definer set search_path = public as $$
declare
  t tentativas%rowtype;
  v_acertos int := 0; v_respondidas int := 0;
  v_detalhe jsonb := '{}'::jsonb;
  q record; v_resp text; v_area_tot int; v_area_ac int; v_ok boolean;
  v_tempo int;
begin
  select * into t from tentativas where id = p_tentativa for update;
  if t.estado <> 'em_curso' then return; end if;

  for q in select id, area, correta from questoes where id = any(t.questao_ids) loop
    v_resp := p_respostas ->> q.id::text;
    v_ok := false;
    if v_resp is not null and v_resp ~ '^\d+$' then
      v_respondidas := v_respondidas + 1;
      if v_resp::int = q.correta then v_acertos := v_acertos + 1; v_ok := true; end if;
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

  -- um pedido de repetição aprovado fica "concedido" depois de usado
  update pedidos_repeticao set estado = 'concedido'
   where id = (select id from pedidos_repeticao
                where user_id = t.user_id and tipo = t.tipo and estado = 'aprovado'
                order by decidido_em limit 1)
     and (select count(*) from tentativas where user_id = t.user_id and tipo = t.tipo and estado = 'submetido') > 1;
end $$;

-- Fecha exames cujo tempo esgotou (tolerância de 2 minutos), usando as respostas guardadas
create or replace function public._fechar_expirados(p_uid uuid)
returns void language plpgsql security definer set search_path = public as $$
declare r record;
begin
  for r in select id, respostas from tentativas
            where user_id = p_uid and estado = 'em_curso'
              and now() > iniciado_em + make_interval(secs => duracao_seg + 120) loop
    perform _corrigir(r.id, r.respostas);
  end loop;
end $$;

-- Devolve as questões de uma tentativa SEM a resposta correta
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
      select jsonb_agg(jsonb_build_object('id', q.id, 'area', q.area, 'enunciado', q.enunciado, 'opcoes', q.opcoes) order by u.ord)
      from unnest(t.questao_ids) with ordinality as u(qid, ord)
      join questoes q on q.id = u.qid
    )
  )
  from tentativas t where t.id = p_tentativa;
$$;

-- ---------------------------------------------------------------------
-- FUNÇÕES CHAMADAS PELO SITE (RPC)
-- ---------------------------------------------------------------------

-- Inicia (ou retoma) um exame. p_tipo: 'psico' | 'conhecimento'; p_n: 25..50
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
begin
  if v_uid is null then raise exception 'Sessão inválida. Inicie sessão novamente.'; end if;
  if p_tipo not in ('psico','conhecimento') then raise exception 'Tipo de exame inválido.'; end if;

  select * into v_perfil from perfis where id = v_uid;
  if v_perfil.bloqueado then raise exception 'A sua conta está bloqueada. Contacte a administração.'; end if;

  perform _fechar_expirados(v_uid);

  -- Retomar exame em curso (ex.: página recarregada)
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

  if p_tipo = 'psico' then
    -- distribuição equilibrada pelas áreas do psicotécnico
    select array_agg(id order by random()) into v_ids from (
      select id from (
        select id, row_number() over (partition by area order by random()) as rn
        from questoes where tipo = 'psico' and ativo
      ) x order by rn, random() limit p_n
    ) y;
  else
    if v_perfil.categoria_id is null then raise exception 'Não tem categoria definida no perfil.'; end if;
    select array_agg(id) into v_ids from (
      select id from questoes
       where tipo = 'conhecimento' and ativo and categoria_id = v_perfil.categoria_id
       order by random() limit p_n
    ) y;
  end if;

  v_n := coalesce(array_length(v_ids, 1), 0);
  if v_n = 0 then raise exception 'Ainda não existem questões disponíveis para este teste. Contacte a administração.'; end if;

  insert into tentativas (user_id, tipo, categoria_id, n_questoes, duracao_seg, questao_ids)
  values (v_uid, p_tipo, case when p_tipo = 'conhecimento' then v_perfil.categoria_id end, v_n, v_n * 60, v_ids)
  returning id into v_id;

  return _pacote_exame(v_id);
end $$;

-- Guarda respostas parciais (chamado automaticamente durante o exame)
create or replace function public.guardar_respostas(p_tentativa uuid, p_respostas jsonb)
returns boolean language plpgsql security definer set search_path = public as $$
begin
  update tentativas set respostas = coalesce(p_respostas, '{}'::jsonb)
   where id = p_tentativa and user_id = auth.uid() and estado = 'em_curso'
     and now() <= iniciado_em + make_interval(secs => duracao_seg + 15);
  return found;
end $$;

-- Submete o exame e devolve o resultado
create or replace function public.submeter_exame(p_tentativa uuid, p_respostas jsonb)
returns jsonb language plpgsql security definer set search_path = public as $$
declare t tentativas%rowtype; v_resp jsonb;
begin
  select * into t from tentativas where id = p_tentativa and user_id = auth.uid();
  if not found then raise exception 'Exame não encontrado.'; end if;
  if t.estado = 'em_curso' then
    -- depois do tempo (+ tolerância de 2 min) só contam as respostas já guardadas
    if now() > t.iniciado_em + make_interval(secs => t.duracao_seg + 120) then
      v_resp := t.respostas;
    else
      v_resp := coalesce(p_respostas, t.respostas);
    end if;
    perform _corrigir(t.id, v_resp);
  end if;
  return (select to_jsonb(x) - 'questao_ids' - 'respostas' from tentativas x where x.id = p_tentativa);
end $$;

-- Pedido de repetição de teste
create or replace function public.pedir_repeticao(p_tipo text, p_motivo text)
returns void language plpgsql security definer set search_path = public as $$
declare v_estado jsonb;
begin
  if auth.uid() is null then raise exception 'Sessão inválida.'; end if;
  v_estado := _estado_candidato(auth.uid());
  if (v_estado->p_tipo->>'feitos')::int = 0 then raise exception 'Ainda não realizou este teste.'; end if;
  if (v_estado->p_tipo->>'pode_iniciar')::boolean then raise exception 'Já tem autorização para fazer este teste.'; end if;
  if p_tipo = 'conhecimento' and not (v_estado->'conhecimento'->>'desbloqueado')::boolean then
    raise exception 'Primeiro deve obter nota igual ou superior a 10 no Teste Psicotécnico.';
  end if;
  insert into pedidos_repeticao (user_id, tipo, motivo) values (auth.uid(), p_tipo, left(p_motivo, 500));
exception when unique_violation then
  raise exception 'Já tem um pedido pendente para este teste.';
end $$;

-- ---------------------------------------------------------------------
-- FUNÇÕES DO ADMINISTRADOR
-- ---------------------------------------------------------------------

create or replace function public.admin_decidir_pedido(p_pedido int, p_aprovar boolean)
returns void language plpgsql security definer set search_path = public as $$
begin
  if not is_admin() then raise exception 'Acesso reservado ao administrador.'; end if;
  update pedidos_repeticao
     set estado = case when p_aprovar then 'aprovado' else 'rejeitado' end,
         decidido_em = now(), decidido_por = auth.uid()
   where id = p_pedido and estado = 'pendente';
end $$;

-- Conceder diretamente uma nova tentativa (sem pedido do candidato)
create or replace function public.admin_conceder_tentativa(p_user uuid, p_tipo text)
returns void language plpgsql security definer set search_path = public as $$
begin
  if not is_admin() then raise exception 'Acesso reservado ao administrador.'; end if;
  update pedidos_repeticao set estado = 'aprovado', decidido_em = now(), decidido_por = auth.uid()
   where user_id = p_user and tipo = p_tipo and estado = 'pendente';
  if not found then
    insert into pedidos_repeticao (user_id, tipo, motivo, estado, decidido_em, decidido_por)
    values (p_user, p_tipo, 'Concedido pelo administrador', 'aprovado', now(), auth.uid());
  end if;
end $$;

create or replace function public.admin_candidatos()
returns table (
  id uuid, nome text, email text, contacto text, codigo text, categoria text, categoria_id int,
  is_admin boolean, bloqueado boolean, criado_em timestamptz, estado jsonb
) language plpgsql stable security definer set search_path = public as $$
begin
  if not is_admin() then raise exception 'Acesso reservado ao administrador.'; end if;
  return query
    select p.id, p.nome, p.email, p.contacto, p.codigo, c.nome, p.categoria_id,
           p.is_admin, p.bloqueado, p.criado_em, _estado_candidato(p.id)
      from perfis p left join categorias c on c.id = p.categoria_id
     order by p.criado_em desc;
end $$;

create or replace function public.admin_estatisticas()
returns jsonb language plpgsql stable security definer set search_path = public as $$
begin
  if not is_admin() then raise exception 'Acesso reservado ao administrador.'; end if;
  return jsonb_build_object(
    'candidatos', (select count(*) from perfis where not is_admin),
    'exames', (select count(*) from tentativas where estado = 'submetido'),
    'aprovados_psico', (select count(distinct user_id) from tentativas where tipo='psico' and estado='submetido' and nota >= 10),
    'media_psico', (select round(avg(nota),1) from tentativas where tipo='psico' and estado='submetido'),
    'media_conhecimento', (select round(avg(nota),1) from tentativas where tipo='conhecimento' and estado='submetido'),
    'pedidos_pendentes', (select count(*) from pedidos_repeticao where estado='pendente'),
    'questoes_psico', (select count(*) from questoes where tipo='psico' and ativo),
    'questoes_conhecimento', (select count(*) from questoes where tipo='conhecimento' and ativo)
  );
end $$;

-- ---------------------------------------------------------------------
-- SEGURANÇA (Row Level Security)
-- ---------------------------------------------------------------------

alter table public.categorias        enable row level security;
alter table public.perfis            enable row level security;
alter table public.questoes          enable row level security;
alter table public.tentativas        enable row level security;
alter table public.pedidos_repeticao enable row level security;

-- Categorias: todos podem ler (formulário de cadastro); só o admin altera
drop policy if exists cat_ler on public.categorias;
create policy cat_ler on public.categorias for select using (true);
drop policy if exists cat_admin on public.categorias;
create policy cat_admin on public.categorias for all using (public.is_admin()) with check (public.is_admin());

-- Perfis: o candidato vê o seu; o admin vê e altera todos
drop policy if exists perfil_ler on public.perfis;
create policy perfil_ler on public.perfis for select using (id = auth.uid() or public.is_admin());
drop policy if exists perfil_admin on public.perfis;
create policy perfil_admin on public.perfis for update using (public.is_admin()) with check (public.is_admin());

-- Questões: apenas o admin acede diretamente (os candidatos recebem-nas sem a resposta via RPC)
drop policy if exists questoes_admin on public.questoes;
create policy questoes_admin on public.questoes for all using (public.is_admin()) with check (public.is_admin());

-- Tentativas: o candidato lê as suas; escrita apenas via funções
drop policy if exists tent_ler on public.tentativas;
create policy tent_ler on public.tentativas for select using (user_id = auth.uid() or public.is_admin());

-- Pedidos: o candidato lê os seus; o admin lê todos
drop policy if exists ped_ler on public.pedidos_repeticao;
create policy ped_ler on public.pedidos_repeticao for select using (user_id = auth.uid() or public.is_admin());

-- Permissões das funções
revoke all on function public._estado_candidato(uuid), public._corrigir(uuid, jsonb),
                       public._fechar_expirados(uuid), public._pacote_exame(uuid) from public, anon, authenticated;
grant execute on function public.meu_estado(), public.iniciar_exame(text,int), public.guardar_respostas(uuid,jsonb),
                          public.submeter_exame(uuid,jsonb), public.pedir_repeticao(text,text),
                          public.admin_decidir_pedido(int,boolean), public.admin_conceder_tentativa(uuid,text),
                          public.admin_candidatos(), public.admin_estatisticas(), public.is_admin()
  to authenticated;

-- ---------------------------------------------------------------------
-- CATEGORIAS INICIAIS (pode editar no painel do administrador)
-- ---------------------------------------------------------------------
insert into public.categorias (nome, descricao) values
  ('Informática', 'Técnicos de informática, sistemas e redes'),
  ('Administração Pública', 'Técnicos de administração e gestão pública'),
  ('Recursos Humanos', 'Gestão de pessoal, emprego e formação profissional'),
  ('Contabilidade e Finanças', 'Contabilidade, orçamento e finanças públicas'),
  ('Secretariado e Assistência Administrativa', 'Secretariado, arquivo e atendimento'),
  ('Direito', 'Juristas e técnicos de assuntos jurídicos')
on conflict (nome) do nothing;

-- ---------------------------------------------------------------------
-- PRIMEIRO ADMINISTRADOR
-- Depois de criar a sua conta no site, execute (substituindo o e-mail):
--   update public.perfis set is_admin = true
--    where id = (select id from auth.users where email = 'seu.email@exemplo.com');
-- Se se registou com telefone, o e-mail técnico é: <números>@tel.prepconcurso.app
-- ---------------------------------------------------------------------
