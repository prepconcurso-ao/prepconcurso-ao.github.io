-- =====================================================================
--  PrepConcurso AO — Cadastro só com WhatsApp e senha
--  O candidato indica o nome e a categoria no primeiro acesso ao painel.
--  Executar DEPOIS de 01_schema.sql. Pode ser executado mais do que uma vez.
-- =====================================================================

create or replace function public.completar_perfil(p_nome text, p_categoria int)
returns void language plpgsql security definer set search_path = public as $$
declare
  v_nome text := regexp_replace(trim(coalesce(p_nome, '')), '\s+', ' ', 'g');
  v_atual int;
begin
  if auth.uid() is null then raise exception 'Sessão inválida. Entre novamente.'; end if;
  if length(v_nome) < 5 or position(' ' in v_nome) = 0 then
    raise exception 'Indique o nome completo (nome e apelido).';
  end if;
  if not exists (select 1 from categorias where id = p_categoria and ativo) then
    raise exception 'Escolha uma categoria válida.';
  end if;

  select categoria_id into v_atual from perfis where id = auth.uid();
  -- depois de fazer a aferição de conhecimentos, só o administrador muda a categoria
  if v_atual is not null and v_atual <> p_categoria and exists (
       select 1 from tentativas where user_id = auth.uid() and tipo = 'conhecimento') then
    raise exception 'Já realizou a aferição de conhecimentos. Para mudar de categoria contacte a administração.';
  end if;

  update perfis set nome = left(v_nome, 120), categoria_id = p_categoria where id = auth.uid();
end $$;

grant execute on function public.completar_perfil(text, int) to authenticated;
