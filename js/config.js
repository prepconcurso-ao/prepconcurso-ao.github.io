// =====================================================================
//  CONFIGURAÇÃO — preencha com os dados do seu projeto Supabase
//  Supabase → Project Settings → API
//  (A "anon public key" pode ficar pública: a segurança é garantida
//   pelas regras RLS e funções definidas em supabase/01_schema.sql)
// =====================================================================
window.APP_CONFIG = {
  SUPABASE_URL: "https://mjaoqbkmdjjjjllyteyb.supabase.co",
  SUPABASE_ANON_KEY: "sb_publishable_dCX3Or6iBNhJgpOlMgmojA_QNFnuyOt",

  NOME_PLATAFORMA: "PrepConcurso AO",
  SUBTITULO: "Preparação para Concursos Públicos",
  CONTACTO_SUPORTE: "massallajamesmsj@gmail.com",
  TELEFONE_APOIO: "938 791 898",          // telefone e WhatsApp
  WHATSAPP_INDICATIVO: "244",             // Angola
  // Banner de publicidade (anúncio da casa, mostrado sempre no fim da rotação)
  PUBLICIDADE_ATIVA: true,
  PUBLICIDADE_SEGUNDOS: 6,
  // Quem se regista com telefone recebe um e-mail técnico <números>@DOMINIO_TELEFONE.
  // Se o Supabase recusar este domínio, use um domínio seu (ex.: "tel.minhaempresa.ao").
  DOMINIO_TELEFONE: "tel.prepconcurso.app",
  NOTA_MINIMA_PSICO: 10,  // só para mostrar; a regra real está em supabase/01_schema.sql (_estado_candidato)
  MIN_QUESTOES: 25,
  MAX_QUESTOES: 50
};
