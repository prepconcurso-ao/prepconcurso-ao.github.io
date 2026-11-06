-- =====================================================================
--  PrepConcurso AO — Publicidade (banner rotativo de anúncios)
--  Executar DEPOIS de 01_schema.sql
-- =====================================================================

create table if not exists public.anuncios (
  id          serial primary key,
  titulo      text not null,
  texto       text,
  imagem_url  text,              -- flyer (imagem); se vazio, mostra um anúncio só com texto
  link        text,              -- endereço aberto ao clicar (site, WhatsApp, etc.)
  ordem       int  not null default 0,
  ativo       boolean not null default true,
  inicio      date,              -- opcional: data de início da campanha
  fim         date,              -- opcional: data de fim da campanha
  criado_em   timestamptz not null default now()
);

alter table public.anuncios enable row level security;

-- Todos podem ver os anúncios ativos dentro do período da campanha
drop policy if exists anuncios_ler on public.anuncios;
create policy anuncios_ler on public.anuncios for select using (
  public.is_admin() or (
    ativo and (inicio is null or inicio <= current_date) and (fim is null or fim >= current_date)
  )
);

-- Só o administrador cria, altera e apaga
drop policy if exists anuncios_admin on public.anuncios;
create policy anuncios_admin on public.anuncios for all using (public.is_admin()) with check (public.is_admin());

grant select on public.anuncios to anon, authenticated;
grant insert, update, delete on public.anuncios to authenticated;
grant usage, select on sequence public.anuncios_id_seq to authenticated;

-- ---------------------------------------------------------------------
-- Armazenamento das imagens dos flyers (bucket público "anuncios")
-- ---------------------------------------------------------------------
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('anuncios', 'anuncios', true, 3145728, array['image/jpeg','image/png','image/webp','image/gif'])
on conflict (id) do update set public = true;

drop policy if exists anuncios_upload on storage.objects;
create policy anuncios_upload on storage.objects for insert to authenticated
  with check (bucket_id = 'anuncios' and public.is_admin());
drop policy if exists anuncios_update on storage.objects;
create policy anuncios_update on storage.objects for update to authenticated
  using (bucket_id = 'anuncios' and public.is_admin());
drop policy if exists anuncios_delete on storage.objects;
create policy anuncios_delete on storage.objects for delete to authenticated
  using (bucket_id = 'anuncios' and public.is_admin());
