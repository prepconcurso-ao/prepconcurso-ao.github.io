// =====================================================================
//  PrepConcurso AO — funções partilhadas por todas as páginas
// =====================================================================
(function () {
  const cfg = window.APP_CONFIG || {};
  const configurado = cfg.SUPABASE_URL && !cfg.SUPABASE_URL.includes("SEU-PROJETO") &&
                      cfg.SUPABASE_ANON_KEY && !cfg.SUPABASE_ANON_KEY.includes("COLE_AQUI");

  const sb = window.supabase.createClient(
    configurado ? cfg.SUPABASE_URL : "https://exemplo.supabase.co",
    configurado ? cfg.SUPABASE_ANON_KEY : "chave-em-falta",
    { auth: { persistSession: true, autoRefreshToken: true } }
  );

  const TIPOS = {
    psico: { nome: "Teste Psicotécnico", curto: "Psicotécnico", icone: "bi-lightbulb" },
    conhecimento: { nome: "Aferição de Conhecimentos", curto: "Conhecimentos", icone: "bi-mortarboard" }
  };

  const AREAS_PSICO = ["Raciocínio Lógico", "Aptidão Verbal", "Aptidão Numérica", "Atenção e Concentração", "Matemática Lógica"];

  const LOGO = `<svg class="marca-icone" viewBox="0 0 40 40" aria-hidden="true">
      <circle cx="20" cy="20" r="19" fill="#18b2e5"/>
      <circle cx="20" cy="20" r="14" fill="#0e2350"/>
      <path d="M13 20.5l4.5 4.5L28 14.5" fill="none" stroke="#fff" stroke-width="3.4" stroke-linecap="round" stroke-linejoin="round"/>
      <path d="M8 31l4-3M32 31l-4-3" stroke="#f2c10f" stroke-width="2.4" stroke-linecap="round"/>
    </svg>`;

  function esc(v) {
    return String(v ?? "").replace(/[&<>"']/g, c => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
  }

  function loginParaEmail(login) {
    login = String(login || "").trim();
    if (login.includes("@")) return login.toLowerCase();
    const digitos = login.replace(/\D/g, "");
    return digitos ? `${digitos}@${cfg.DOMINIO_TELEFONE || "tel.prepconcurso.app"}` : "";
  }

  function fmtHMS(seg) {
    seg = Math.max(0, Math.round(seg || 0));
    const h = Math.floor(seg / 3600), m = Math.floor((seg % 3600) / 60), s = seg % 60;
    return [h, m, s].map(n => String(n).padStart(2, "0")).join(":");
  }

  function fmtData(iso, comHora = true) {
    if (!iso) return "—";
    const d = new Date(iso);
    const p = n => String(n).padStart(2, "0");
    const data = `${p(d.getDate())}/${p(d.getMonth() + 1)}/${d.getFullYear()}`;
    return comHora ? `${data} ${p(d.getHours())}:${p(d.getMinutes())}:${p(d.getSeconds())}` : data;
  }

  function fmtNota(n) {
    if (n === null || n === undefined) return "—";
    return Number(n).toFixed(1).replace(".", ",");
  }

  function erroMsg(e) {
    const m = (e && (e.message || e.error_description || e.msg)) || String(e || "Erro desconhecido");
    const mapa = [
      [/Invalid login credentials/i, "Dados de acesso incorretos. Verifique o e-mail/telefone e a senha."],
      [/User already registered/i, "Já existe uma conta com este e-mail ou telefone."],
      [/Password should be at least/i, "A senha deve ter pelo menos 6 caracteres."],
      [/Email not confirmed/i, "Confirme o seu e-mail antes de entrar (verifique a caixa de entrada)."],
      [/Unable to validate email|invalid format|is invalid/i, "E-mail ou telefone inválido."],
      [/Failed to fetch|NetworkError/i, "Sem ligação ao servidor. Verifique a Internet ou a configuração da plataforma."],
      [/rate limit/i, "Muitas tentativas seguidas. Aguarde alguns minutos."],
      [/JWT|session/i, "A sua sessão expirou. Entre novamente."]
    ];
    for (const [re, txt] of mapa) if (re.test(m)) return txt;
    return m;
  }

  function toast(msg, tipo = "info") {
    let c = document.getElementById("toasts");
    if (!c) {
      c = document.createElement("div");
      c.id = "toasts";
      c.className = "toast-container position-fixed top-0 end-0 p-3";
      document.body.appendChild(c);
    }
    const cores = { info: "text-bg-primary", ok: "text-bg-success", erro: "text-bg-danger", aviso: "text-bg-warning" };
    const el = document.createElement("div");
    el.className = `toast align-items-center border-0 ${cores[tipo] || cores.info}`;
    el.setAttribute("role", "alert");
    el.innerHTML = `<div class="d-flex"><div class="toast-body">${esc(msg)}</div>
      <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button></div>`;
    c.appendChild(el);
    const t = new bootstrap.Toast(el, { delay: tipo === "erro" ? 7000 : 4000 });
    t.show();
    el.addEventListener("hidden.bs.toast", () => el.remove());
  }

  async function perfilAtual() {
    const { data: { session } } = await sb.auth.getSession();
    if (!session) return null;
    const { data, error } = await sb.from("perfis").select("*, categorias(nome)").eq("id", session.user.id).single();
    if (error) throw error;
    return data;
  }

  async function exigirSessao({ admin = false } = {}) {
    if (!configurado) { renderAvisoConfig(); }
    let perfil = null;
    try { perfil = await perfilAtual(); } catch (e) { console.error(e); }
    if (!perfil) { location.href = "index.html"; throw new Error("sem sessão"); }
    if (admin && !perfil.is_admin) { location.href = "painel.html"; throw new Error("sem permissão"); }
    return perfil;
  }

  async function sair() {
    await sb.auth.signOut();
    location.href = "index.html";
  }

  function renderTopo(perfil, ativo = "") {
    const el = document.getElementById("topo");
    if (!el) return;
    const links = perfil ? `
        <li class="nav-item"><a class="nav-link ${ativo === "painel" ? "active" : ""}" href="painel.html"><i class="bi bi-grid me-1"></i>Painel</a></li>
        ${perfil.is_admin ? `<li class="nav-item"><a class="nav-link ${ativo === "admin" ? "active" : ""}" href="admin.html"><i class="bi bi-shield-lock me-1"></i>Administração</a></li>` : ""}
        <li class="nav-item ms-lg-3 my-2 my-lg-0"><span class="utilizador-chip"><i class="bi bi-person-circle me-1"></i>${esc(perfil.nome.split(" ")[0])} · ${esc(perfil.codigo)}</span></li>
        <li class="nav-item"><a class="nav-link" href="#" id="btnSair"><i class="bi bi-box-arrow-right me-1"></i>Sair</a></li>`
      : `<li class="nav-item"><a class="nav-link" href="index.html#entrar">Entrar</a></li>`;
    el.innerHTML = `
      <div class="faixa"></div>
      <nav class="navbar navbar-expand-lg topo navbar-dark">
        <div class="container">
          <a class="navbar-brand" href="${perfil ? "painel.html" : "index.html"}">${LOGO}
            <span>${esc(cfg.NOME_PLATAFORMA || "PrepConcurso AO")}<small>${esc(cfg.SUBTITULO || "")}</small></span></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu" aria-label="Menu">
            <span class="navbar-toggler-icon"></span></button>
          <div class="collapse navbar-collapse" id="menu"><ul class="navbar-nav ms-auto align-items-lg-center">${links}</ul></div>
        </div>
      </nav>`;
    const b = document.getElementById("btnSair");
    if (b) b.addEventListener("click", e => { e.preventDefault(); sair(); });
  }

  function renderRodape() {
    const el = document.getElementById("rodape");
    if (!el) return;
    el.className = "rodape mt-5";
    el.innerHTML = `<div class="faixa"></div><div class="container py-4 d-flex flex-column flex-md-row justify-content-between gap-2">
      <div><strong class="text-white">${esc(cfg.NOME_PLATAFORMA)}</strong> — plataforma de treino independente para candidatos a concursos públicos.</div>
      <div>Apoio: <a href="mailto:${esc(cfg.CONTACTO_SUPORTE)}">${esc(cfg.CONTACTO_SUPORTE)}</a>
        ${cfg.TELEFONE_APOIO ? ` · <a href="https://wa.me/${cfg.WHATSAPP_INDICATIVO || "244"}${cfg.TELEFONE_APOIO.replace(/\D/g, "")}" target="_blank" rel="noopener"><i class="bi bi-whatsapp"></i> ${esc(cfg.TELEFONE_APOIO)}</a>` : ""}</div></div>`;
  }

  function renderAvisoConfig() {
    if (document.getElementById("avisoConfig")) return;
    const d = document.createElement("div");
    d.id = "avisoConfig";
    d.className = "aviso-config";
    d.innerHTML = `<i class="bi bi-exclamation-triangle me-1"></i> Plataforma por configurar: preencha o endereço e a chave do Supabase em <code>js/config.js</code>.`;
    document.body.prepend(d);
  }

  function confirmar(titulo, corpoHtml, textoOk = "Confirmar", classeOk = "btn-navy") {
    return new Promise(resolve => {
      const wrap = document.createElement("div");
      wrap.innerHTML = `<div class="modal fade" tabindex="-1"><div class="modal-dialog modal-dialog-centered"><div class="modal-content" style="border-radius:16px">
        <div class="modal-header border-0 pb-0"><h5 class="modal-title titulo">${esc(titulo)}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
        <div class="modal-body">${corpoHtml}</div>
        <div class="modal-footer border-0 pt-0"><button class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
          <button class="btn ${classeOk}" data-ok>${esc(textoOk)}</button></div></div></div></div>`;
      const el = wrap.firstElementChild;
      document.body.appendChild(el);
      const m = new bootstrap.Modal(el);
      let ok = false;
      el.querySelector("[data-ok]").addEventListener("click", () => { ok = true; m.hide(); });
      el.addEventListener("hidden.bs.modal", () => { el.remove(); resolve(ok ? el : false); });
      m.show();
    });
  }

  window.App = {
    sb, cfg, configurado, TIPOS, AREAS_PSICO, LOGO,
    esc, loginParaEmail, fmtHMS, fmtData, fmtNota, erroMsg, toast, confirmar,
    perfilAtual, exigirSessao, sair, renderTopo, renderRodape, renderAvisoConfig
  };
})();
