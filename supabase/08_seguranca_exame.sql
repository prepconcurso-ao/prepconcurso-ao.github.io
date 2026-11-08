-- =====================================================================
--  PrepConcurso AO — Segurança do exame (anti-fraude)
--  Regista os incidentes detetados no navegador (sair do ecrã inteiro,
--  mudar de aba, minimizar, vista dividida, captura de ecrã…).
--  Ao 3.º incidente o servidor encerra o exame e anula-o (nota 0).
--  Executar DEPOIS de 05_melhorias_exame.sql. Pode ser executado mais do que uma vez.
-- =====================================================================

alter table public.tentativas add column if not exists incidentes jsonb not null default '[]'::jsonb;
alter table public.tentativas add column if not exists anulado boolean not null default false;

create or replace function public.registar_incidente(p_tentativa uuid, p_tipo text, p_respostas jsonb default null)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  c_limite constant int := 3;
  t tentativas%rowtype;
  v_n int;
begin
  select * into t from tentativas where id = p_tentativa and user_id = auth.uid() for update;
  if not found then raise exception 'Exame não encontrado.'; end if;
  if t.estado <> 'em_curso' then
    return jsonb_build_object('total', jsonb_array_length(t.incidentes), 'limite', c_limite, 'encerrado', true, 'anulado', t.anulado);
  end if;

  update tentativas
     set incidentes = incidentes || jsonb_build_array(jsonb_build_object('tipo', left(coalesce(p_tipo, 'desconhecido'), 40), 'em', now())),
         respostas  = case when p_respostas is not null and jsonb_typeof(p_respostas) = 'object' then p_respostas else respostas end
   where id = t.id
  returning jsonb_array_length(incidentes) into v_n;

  if v_n >= c_limite then
    perform _corrigir(t.id, (select respostas from tentativas where id = t.id));
    update tentativas set anulado = true, nota = 0 where id = t.id;
  end if;

  return jsonb_build_object('total', v_n, 'limite', c_limite, 'encerrado', v_n >= c_limite, 'anulado', v_n >= c_limite);
end $$;

-- Pacote do exame (igual ao 05) + número de incidentes já registados
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
    'incidentes', jsonb_array_length(t.incidentes),
    'limite_incidentes', 3,
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

revoke all on function public._pacote_exame(uuid) from public, anon, authenticated;
grant execute on function public.registar_incidente(uuid, text, jsonb) to authenticated;
