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
    psico: { em: "no", nome: "Teste Psicotécnico", curto: "Psicotécnico", icone: "bi-lightbulb" },
    conhecimento: { em: "na", nome: "Aferição de Conhecimentos", curto: "Conhecimentos", icone: "bi-mortarboard" },
    minint: { em: "na", nome: "Prova Escrita MININT", curto: "MININT", icone: "bi-shield-shaded" }
  };

  // Aviso mostrado em todas as caixas que pedem o número de WhatsApp
  const AVISO_WHATS = `<i class="bi bi-shield-lock me-1"></i>O número de WhatsApp é pedido <b>apenas</b> para o cadastro (acesso à conta) e para comunicarmos consigo nos pedidos de 2.ª via de um teste. Não é partilhado nem usado para outros fins. <a href="termos.html" target="_blank" rel="noopener">Termos</a>`;

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

  // Número de WhatsApp angolano → 9 dígitos (ex.: "+244 923 456 789" → "923456789"); null se inválido
  function normalizarWhats(v) {
    let d = String(v || "").replace(/\D/g, "");
    if (d.startsWith("00244")) d = d.slice(5);
    else if (d.startsWith("244") && d.length === 12) d = d.slice(3);
    return /^9\d{8}$/.test(d) ? d : null;
  }
  const fmtWhats = d => (d && /^\d{9}$/.test(d)) ? `${d.slice(0, 3)} ${d.slice(3, 6)} ${d.slice(6)}` : (d || "");

  function loginParaEmail(login) {
    login = String(login || "").trim();
    if (login.includes("@")) return login.toLowerCase();   // administradores antigos com e-mail
    const digitos = normalizarWhats(login) || login.replace(/\D/g, "");
    return digitos ? `${digitos}@${cfg.DOMINIO_TELEFONE || "tel.prepconcurso.app"}` : "";
  }

  const URL_SITE = () => cfg.URL_PLATAFORMA || location.origin + "/";
  const linkWhatsAppApoio = texto =>
    `https://wa.me/${cfg.WHATSAPP_INDICATIVO || "244"}${String(cfg.TELEFONE_APOIO || "").replace(/\D/g, "")}?text=${encodeURIComponent(texto)}`;

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
      [/Invalid login credentials/i, "Dados de acesso incorretos. Verifique o número de WhatsApp e a senha."],
      [/User already registered/i, "Já existe uma conta com este número de WhatsApp. Use o separador Entrar."],
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


  // ------------------------------------------------------------------
  //  Partilha nas redes sociais
  // ------------------------------------------------------------------
  function botoesPartilha(texto) {
    const url = URL_SITE();
    const t = encodeURIComponent(texto), u = encodeURIComponent(url), tu = encodeURIComponent(texto + " " + url);
    const b = (rede, cor, icone, nome, href) =>
      `<a class="btn-partilha" style="--cor:${cor}" data-rede="${rede}" ${href ? `href="${href}" target="_blank" rel="noopener"` : `href="#"`}>
         <i class="bi ${icone}"></i><span>${nome}</span></a>`;
    return `<div class="grelha-partilha">
      ${b("whatsapp", "#25d366", "bi-whatsapp", "WhatsApp", `https://wa.me/?text=${tu}`)}
      ${b("facebook", "#1877f2", "bi-facebook", "Facebook", `https://www.facebook.com/sharer/sharer.php?u=${u}&quote=${t}`)}
      ${b("instagram", "#e1306c", "bi-instagram", "Instagram", "")}
      ${b("telegram", "#229ed9", "bi-telegram", "Telegram", `https://t.me/share/url?url=${u}&text=${t}`)}
      ${b("x", "#111111", "bi-twitter-x", "X", `https://twitter.com/intent/tweet?text=${t}&url=${u}`)}
      ${b("linkedin", "#0a66c2", "bi-linkedin", "LinkedIn", `https://www.linkedin.com/sharing/share-offsite/?url=${u}`)}
      ${b("email", "#5d6b86", "bi-envelope", "E-mail", `mailto:?subject=${encodeURIComponent(cfg.NOME_PLATAFORMA || "")}&body=${tu}`)}
      ${b("copiar", "#173a7a", "bi-link-45deg", "Copiar link", "")}
    </div>
    ${navigator.share ? `<button type="button" class="btn btn-outline-navy w-100 mt-2" data-rede="nativo"><i class="bi bi-share me-1"></i> Outras aplicações</button>` : ""}`;
  }

  function ligarPartilha(raiz, texto) {
    const url = URL_SITE();
    const copiar = async () => {
      try { await navigator.clipboard.writeText(texto + " " + url); return true; }
      catch { const ta = document.createElement("textarea"); ta.value = texto + " " + url; document.body.appendChild(ta); ta.select();
              try { document.execCommand("copy"); return true; } catch { return false; } finally { ta.remove(); } }
    };
    raiz.querySelectorAll("[data-rede]").forEach(el => el.addEventListener("click", async e => {
      const rede = el.dataset.rede;
      if (rede === "copiar") { e.preventDefault(); toast(await copiar() ? "Link copiado. Cole-o onde quiser partilhar." : "Não foi possível copiar.", "ok"); }
      else if (rede === "nativo" || (rede === "instagram" && navigator.share)) {
        e.preventDefault();
        try { await navigator.share({ title: cfg.NOME_PLATAFORMA, text: texto, url }); } catch {}
      } else if (rede === "instagram") {
        e.preventDefault(); await copiar();
        toast("Texto e link copiados. Cole-os na sua publicação ou história do Instagram.", "ok");
        window.open("https://www.instagram.com/", "_blank", "noopener");
      }
    }));
  }

  // ------------------------------------------------------------------
  //  Pedido de 2.ª via (repetição) — WhatsApp + registo na plataforma
  // ------------------------------------------------------------------
  const MOTIVOS_2VIA = [
    "Pretendo melhorar o meu resultado",
    "Tive um problema técnico durante o teste (Internet, energia ou dispositivo)",
    "O exame foi anulado por incidente de segurança",
    "Fiquei abaixo dos 10 valores e quero avançar para a etapa seguinte",
    "Outro motivo"
  ];

  // Mensagem-padrão do pedido de 2.ª via, com as informações do candidato
  function mensagemSegundaVia({ perfil, tipo, whats, ultima, feitos, motivo, detalhe }) {
    const linhas = [
      "📝 *PEDIDO DE 2.ª VIA DE TESTE*",
      `_${cfg.NOME_PLATAFORMA}_`,
      "",
      `👤 *Nome:* ${perfil.nome}`,
      `🆔 *Código do candidato:* ${perfil.codigo}`,
      `📱 *WhatsApp:* +244 ${fmtWhats(whats)}`,
      `📂 *Categoria:* ${perfil.categorias?.nome || "—"}`,
      `🧪 *Teste:* ${TIPOS[tipo].nome}`,
      `📊 *Última nota:* ${ultima ? `${fmtNota(ultima.nota)} valores (${fmtData(ultima.submetido_em, false)})${ultima.anulado ? " — anulado" : ""}` : "—"}`,
      `🔁 *Tentativas realizadas:* ${feitos}`,
      `✉️ *Motivo:* ${motivo}${detalhe ? ` — ${detalhe}` : ""}`,
      "",
      "Solicito autorização para realizar novamente o teste.",
      "Obrigado(a)."
    ];
    return linhas.join("\n");
  }

  async function pedirSegundaVia({ perfil, tipo, aoConcluir = null }) {
    // dados do candidato para a mensagem-padrão
    const { data: tent } = await sb.from("tentativas").select("nota, submetido_em, anulado")
      .eq("user_id", perfil.id).eq("tipo", tipo).eq("estado", "submetido").order("submetido_em", { ascending: false });
    const ultima = (tent || [])[0] || null, feitos = (tent || []).length;
    const motivoSugerido = ultima?.anulado ? 2 : (ultima && Number(ultima.nota) < 10 ? 3 : 0);

    const wrap = document.createElement("div");
    wrap.innerHTML = `<div class="modal fade" tabindex="-1"><div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"><div class="modal-content" style="border-radius:16px">
      <div class="modal-header border-0 pb-0"><h5 class="modal-title titulo"><i class="bi bi-arrow-repeat me-1"></i> Solicitar 2.ª via — ${esc(TIPOS[tipo].curto)}</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
      <div class="modal-body">
        <p class="small mb-3">O pedido é registado na plataforma e enviado ao administrador pelo WhatsApp com a mensagem-padrão abaixo. Quando for aprovado, o botão para iniciar o teste volta a aparecer no seu painel. <b>Será informado via WhatsApp após a aprovação do pedido.</b></p>
        <label class="form-label" for="svWhats"><i class="bi bi-whatsapp text-success me-1"></i>O seu número de WhatsApp</label>
        <div class="input-group mb-3"><span class="input-group-text">+244</span>
          <input class="form-control" id="svWhats" inputmode="tel" maxlength="16" placeholder="9xx xxx xxx" value="${esc(fmtWhats(perfil.contacto || ""))}"></div>
        <div class="aviso-whats mb-3">${AVISO_WHATS}</div>
        <label class="form-label" for="svMotivo">Motivo</label>
        <select class="form-select mb-2" id="svMotivo">${MOTIVOS_2VIA.map((m, k) => `<option value="${k}" ${k === motivoSugerido ? "selected" : ""}>${esc(m)}</option>`).join("")}</select>
        <input class="form-control mb-3" id="svDetalhe" maxlength="200" placeholder="Pormenor (opcional)">
        <label class="form-label mb-1">Mensagem que será enviada</label>
        <pre class="previa-msg" id="svPrevia"></pre>
      </div>
      <div class="modal-footer border-0 pt-0"><button class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
        <button class="btn btn-whats" data-ok><i class="bi bi-whatsapp me-1"></i> Enviar pedido pelo WhatsApp</button></div>
    </div></div></div>`;
    const el = wrap.firstElementChild;
    document.body.appendChild(el);
    const m = new bootstrap.Modal(el);
    el.addEventListener("hidden.bs.modal", () => el.remove());

    const dados = () => {
      const whats = normalizarWhats(el.querySelector("#svWhats").value);
      const motivo = MOTIVOS_2VIA[Number(el.querySelector("#svMotivo").value)];
      const detalhe = el.querySelector("#svDetalhe").value.trim();
      return { whats, motivo, detalhe, texto: mensagemSegundaVia({ perfil, tipo, whats: whats || el.querySelector("#svWhats").value, ultima, feitos, motivo, detalhe }) };
    };
    const atualizar = () => { el.querySelector("#svPrevia").textContent = dados().texto; };
    ["input", "change"].forEach(ev => el.querySelectorAll("input, select").forEach(c => c.addEventListener(ev, atualizar)));
    atualizar();

    el.querySelector("[data-ok]").addEventListener("click", () => {
      const d = dados();
      if (!d.whats) { toast("Indique um número de WhatsApp válido (9 dígitos).", "aviso"); return; }
      if (d.motivo === "Outro motivo" && !d.detalhe) { toast("Descreva o motivo no campo de pormenor.", "aviso"); return; }
      // abrir o WhatsApp no próprio clique, para não ser bloqueado pelo navegador
      window.open(linkWhatsAppApoio(d.texto), "_blank", "noopener");
      m.hide();
      const registo = `WhatsApp: +244 ${fmtWhats(d.whats)} | Motivo: ${d.motivo}${d.detalhe ? " — " + d.detalhe : ""}` +
        (ultima ? ` | Última nota: ${fmtNota(ultima.nota)}${ultima.anulado ? " (anulado)" : ""}` : "") + ` | Tentativas: ${feitos}`;
      sb.rpc("pedir_repeticao", { p_tipo: tipo, p_motivo: registo }).then(({ error }) => {
        if (error && !/pendente/i.test(error.message)) toast(erroMsg(error), "erro");
        else toast(error ? "O seu pedido já estava registado. Mensagem enviada pelo WhatsApp." : "Pedido registado. Conclua o envio da mensagem no WhatsApp.", "ok");
        if (aoConcluir) aoConcluir();
      });
    });
    m.show();
  }

  // ------------------------------------------------------------------
  //  Popup no fim do exame: mensagem segundo a nota + partilha
  // ------------------------------------------------------------------
  function mostrarResultado({ t, perfil }) {
    const nota = Number(t.nota);
    const n = fmtNota(t.nota);
    let nivel;
    if (t.anulado) nivel = { cor: "#8a0b20", fundo: "#fde8eb", icone: "bi-x-octagon-fill", titulo: "Exame anulado", texto: `O exame foi encerrado automaticamente porque atingiu ${(t.incidentes || []).length} incidentes de segurança (sair do ecrã inteiro, mudar de aba, etc.). Pode pedir a 2.ª via e, na próxima tentativa, manter-se no ecrã do exame até ao fim.` };
    else if (nota >= 18) nivel = { cor: "#1d6b2e", fundo: "#e6f6ea", icone: "bi-trophy-fill", titulo: "Excelente!", texto: `Obteve ${n} valores. Desempenho de topo — está muito bem preparado(a). Continue a treinar para manter o nível.` };
    else if (nota >= 14) nivel = { cor: "#1d6b2e", fundo: "#e6f6ea", icone: "bi-stars", titulo: "Muito bom!", texto: `Obteve ${n} valores. Está no bom caminho; reveja as áreas com menos acertos para chegar ao topo.` };
    else if (nota >= 10) nivel = { cor: "#0f5f86", fundo: "#e3f4fb", icone: "bi-patch-check-fill", titulo: "Aprovado!", texto: `Obteve ${n} valores e passou a fasquia dos 10.` + (t.tipo === "psico" ? " Já pode avançar para a Aferição de Conhecimentos." : t.tipo === "minint" ? " Bom sinal para a prova escrita do MININT — continue a rever a legislação e a deontologia." : " Reforce as áreas mais fracas para subir na classificação.") };
    else nivel = { cor: "#8a0b20", fundo: "#fde8eb", icone: "bi-emoji-frown-fill", titulo: "Não desista!", texto: `Obteve ${n} valores, abaixo dos 10. Veja o desempenho por área, estude os pontos fracos e peça a 2.ª via do teste para tentar de novo.` };

    const texto = nota >= 10 && !t.anulado
      ? `Tirei ${n} valores ${TIPOS[t.tipo].em} ${TIPOS[t.tipo].nome} da ${cfg.NOME_PLATAFORMA}! 📚 Treina também, de graça, para os concursos públicos (ENAPP, MININT e outros):`
      : `Estou a treinar para os concursos públicos (ENAPP, MININT e outros) na ${cfg.NOME_PLATAFORMA}. Testes cronometrados e grátis — treina também:`;
    const meu = perfil && t.user_id === perfil.id;

    const wrap = document.createElement("div");
    wrap.innerHTML = `<div class="modal fade" tabindex="-1"><div class="modal-dialog modal-dialog-centered"><div class="modal-content" style="border-radius:18px;overflow:hidden">
      <div class="text-center p-4" style="background:${nivel.fundo};color:${nivel.cor}">
        <i class="bi ${nivel.icone}" style="font-size:3rem"></i>
        <h3 class="titulo upper mt-1 mb-1" style="color:${nivel.cor}">${nivel.titulo}</h3>
        <div class="nota-grande">${n} <small style="font-size:1rem">valores</small></div>
        <div class="small mt-1">${t.acertos} de ${t.n_questoes} certas · ${TIPOS[t.tipo].nome}</div>
      </div>
      <div class="modal-body p-4">
        <p class="mb-3">${nivel.texto}</p>
        ${meu && (nota < 10 || t.anulado) ? `<button class="btn btn-whats w-100 mb-2" data-segunda><i class="bi bi-whatsapp me-1"></i> Solicitar 2.ª via do teste</button>` : ""}
        ${meu ? `<button class="btn btn-cyan w-100 mb-3" data-res><i class="bi bi-file-earmark-image me-1"></i> Partilhar o meu relatório com a nota</button>` : ""}
        <h6 class="titulo upper mb-2"><i class="bi bi-share me-1"></i> Partilhe a plataforma com os amigos</h6>
        ${botoesPartilha(texto)}
      </div>
      <div class="modal-footer border-0 pt-0"><button class="btn btn-navy w-100" data-bs-dismiss="modal">Ver relatório completo</button></div>
    </div></div></div>`;
    const el = wrap.firstElementChild;
    document.body.appendChild(el);
    const m = new bootstrap.Modal(el);
    ligarPartilha(el, texto);
    const bt = el.querySelector("[data-segunda]");
    if (bt) bt.addEventListener("click", () => { m.hide(); pedirSegundaVia({ perfil, tipo: t.tipo }); });
    const br = el.querySelector("[data-res]");
    if (br) br.addEventListener("click", () => { m.hide(); partilharRelatorio({ t, perfil, categoria: t.categorias?.nome || "" }); });
    el.addEventListener("hidden.bs.modal", () => el.remove());
    m.show();
  }

  // ------------------------------------------------------------------
  //  Partilhar o relatório com a nota obtida (imagem + texto)
  // ------------------------------------------------------------------
  function imagemRelatorio({ t, perfil, categoria }) {
    const W = 1080, H = 1350, c = document.createElement("canvas");
    c.width = W; c.height = H;
    const g = c.getContext("2d");
    const NAVY = "#0e2350", CYAN = "#18b2e5", F = "Barlow, 'Segoe UI', Arial, sans-serif", FC = "'Barlow Condensed', 'Arial Narrow', Arial, sans-serif";
    const nota = Number(t.nota), apto = nota >= 10 && !t.anulado;
    g.fillStyle = NAVY; g.fillRect(0, 0, W, H);
    g.fillStyle = "#13306b"; g.beginPath(); g.arc(W - 60, 120, 330, 0, 7); g.fill();
    // faixa vermelho / preto / amarelo
    [["#c8102e", 0], ["#111111", 1], ["#f2c10f", 2]].forEach(([cor, k]) => { g.fillStyle = cor; g.fillRect(0, k * 12, W, 12); });
    g.textAlign = "left"; g.fillStyle = CYAN; g.font = `700 44px ${FC}`; g.fillText((cfg.NOME_PLATAFORMA || "PrepConcurso AO").toUpperCase(), 80, 120);
    g.fillStyle = "#c9d6ee"; g.font = `500 28px ${F}`; g.fillText("Relatório de exame · simulação", 80, 162);
    // cartão branco
    const x = 60, y = 220, w = W - 120, h = 900;
    g.fillStyle = "#ffffff"; g.beginPath(); g.roundRect ? g.roundRect(x, y, w, h, 36) : g.rect(x, y, w, h); g.fill();
    g.textAlign = "center";
    g.fillStyle = "#5d6b86"; g.font = `600 30px ${F}`; g.fillText(TIPOS[t.tipo].nome.toUpperCase(), W / 2, y + 80);
    g.fillStyle = NAVY; g.font = `700 46px ${FC}`;
    const nome = (perfil?.nome || "").length > 34 ? perfil.nome.slice(0, 33) + "…" : (perfil?.nome || "");
    g.fillText(nome.toUpperCase(), W / 2, y + 145);
    g.fillStyle = "#5d6b86"; g.font = `500 26px ${F}`; g.fillText(`${perfil?.codigo || ""}${categoria ? "  ·  " + categoria : ""}`.slice(0, 70), W / 2, y + 190);
    // nota
    g.fillStyle = apto ? "#1d6b2e" : "#b0102a"; g.font = `700 230px ${FC}`; g.fillText(fmtNota(t.nota), W / 2, y + 450);
    g.fillStyle = "#5d6b86"; g.font = `600 36px ${F}`; g.fillText("valores (escala 0–20)", W / 2, y + 545);
    const sel = t.anulado ? "EXAME ANULADO" : t.tipo === "psico" ? (apto ? "APTO" : "NÃO APTO") : (apto ? "APROVADO" : "NÃO APROVADO");
    g.font = `700 40px ${FC}`; const lw = g.measureText(sel).width + 80;
    g.fillStyle = apto ? "#e6f6ea" : "#fde8eb"; g.beginPath(); g.roundRect ? g.roundRect(W / 2 - lw / 2, y + 580, lw, 70, 35) : g.rect(W / 2 - lw / 2, y + 580, lw, 70); g.fill();
    g.fillStyle = apto ? "#1d6b2e" : "#b0102a"; g.fillText(sel, W / 2, y + 630);
    // estatísticas
    const est = [["Certas", `${t.acertos}/${t.n_questoes}`], ["Respondidas", `${t.respondidas}`], ["Tempo", fmtHMS(t.tempo_seg)]];
    est.forEach(([r, v], k) => {
      const cx = x + w / 6 + k * w / 3;
      g.fillStyle = NAVY; g.font = `700 54px ${FC}`; g.fillText(v, cx, y + 745);
      g.fillStyle = "#5d6b86"; g.font = `500 26px ${F}`; g.fillText(r, cx, y + 785);
    });
    g.fillStyle = "#8a96ad"; g.font = `500 24px ${F}`; g.fillText(`Submetido em ${fmtData(t.submetido_em)}`, W / 2, y + 860);
    // rodapé
    g.fillStyle = "#ffffff"; g.font = `700 40px ${FC}`; g.fillText("TREINE TAMBÉM, É GRÁTIS:", W / 2, 1200);
    g.fillStyle = CYAN; g.font = `700 46px ${F}`; g.fillText(URL_SITE().replace(/^https?:\/\//, "").replace(/\/$/, ""), W / 2, 1262);
    return c;
  }

  async function partilharRelatorio({ t, perfil, categoria = "" }) {
    try { await document.fonts.ready; } catch {}
    const canvas = imagemRelatorio({ t, perfil, categoria: categoria || perfil?.categorias?.nome || "" });
    const blob = await new Promise(r => canvas.toBlob(r, "image/png"));
    const nomeFich = `resultado-${(TIPOS[t.tipo].curto || "teste").toLowerCase()}-${perfil?.codigo || ""}.png`;
    const ficheiro = new File([blob], nomeFich, { type: "image/png" });
    const urlImg = URL.createObjectURL(blob);
    const sel = t.anulado ? "exame anulado" : Number(t.nota) >= 10 ? (t.tipo === "psico" ? "APTO" : "APROVADO") : "a melhorar";
    const texto = `📊 O meu resultado ${TIPOS[t.tipo].em} ${TIPOS[t.tipo].nome} da ${cfg.NOME_PLATAFORMA}: ${fmtNota(t.nota)} valores (${t.acertos}/${t.n_questoes} certas · ${sel}). Treina também, de graça, para os concursos públicos (ENAPP, MININT e outros):`;
    const podeFich = !!(navigator.canShare && navigator.canShare({ files: [ficheiro] }));

    const wrap = document.createElement("div");
    wrap.innerHTML = `<div class="modal fade" tabindex="-1"><div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"><div class="modal-content" style="border-radius:16px">
      <div class="modal-header border-0 pb-0"><h5 class="modal-title titulo"><i class="bi bi-share me-1"></i> Partilhar o meu relatório</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
      <div class="modal-body">
        <img src="${urlImg}" alt="Resultado: ${fmtNota(t.nota)} valores" class="img-fluid rounded-3 border mb-3 d-block mx-auto" style="max-height:340px">
        <div class="d-grid gap-2 mb-3">
          ${podeFich ? `<button class="btn btn-cyan" data-img-partilhar><i class="bi bi-image me-1"></i> Partilhar imagem do resultado</button>` : ""}
          <a class="btn btn-outline-navy" href="${urlImg}" download="${nomeFich}"><i class="bi bi-download me-1"></i> Descarregar imagem</a>
        </div>
        <p class="small text-muted-2 mb-2">Ou partilhe o texto com a sua nota (no Instagram, publique a imagem descarregada):</p>
        ${botoesPartilha(texto)}
      </div></div></div></div>`;
    const el = wrap.firstElementChild;
    document.body.appendChild(el);
    const m = new bootstrap.Modal(el);
    ligarPartilha(el, texto);
    const bi = el.querySelector("[data-img-partilhar]");
    if (bi) bi.addEventListener("click", async () => {
      try { await navigator.share({ files: [ficheiro], title: cfg.NOME_PLATAFORMA, text: texto + " " + URL_SITE() }); } catch {}
    });
    el.addEventListener("hidden.bs.modal", () => { el.remove(); URL.revokeObjectURL(urlImg); });
    m.show();
  }

  // ------------------------------------------------------------------
  //  Primeiro acesso: o candidato indica o nome e a categoria
  // ------------------------------------------------------------------
  const perfilIncompleto = p => !p.is_admin && (!p.categoria_id || !p.nome || p.nome === "Candidato");

  async function completarPerfil(perfil) {
    const { data: cats } = await sb.from("categorias").select("id, nome").eq("ativo", true).order("nome");
    return new Promise(resolve => {
      const wrap = document.createElement("div");
      wrap.innerHTML = `<div class="modal fade" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"><div class="modal-dialog modal-dialog-centered"><form class="modal-content" style="border-radius:16px">
        <div class="modal-header border-0 pb-0"><h5 class="modal-title titulo"><i class="bi bi-person-check me-1"></i> Complete o seu perfil</h5></div>
        <div class="modal-body">
          <p class="small text-muted-2">Falta só isto para começar. O nome aparece no relatório do exame e a categoria define as questões da aferição de conhecimentos.</p>
          <label class="form-label" for="cpNome">Nome completo</label>
          <input class="form-control mb-3" id="cpNome" autocomplete="name" maxlength="120" value="${perfil.nome && perfil.nome !== "Candidato" ? esc(perfil.nome) : ""}" placeholder="Nome e apelido">
          <label class="form-label" for="cpCat">Categoria / área do concurso</label>
          <select class="form-select" id="cpCat"><option value="">Escolha a categoria…</option>
            ${(cats || []).map(c => `<option value="${c.id}" ${c.id === perfil.categoria_id ? "selected" : ""}>${esc(c.nome)}</option>`).join("")}</select>
        </div>
        <div class="modal-footer border-0 pt-0"><button class="btn btn-navy w-100" type="submit"><i class="bi bi-check2 me-1"></i> Guardar e continuar</button></div>
      </form></div></div>`;
      const el = wrap.firstElementChild;
      document.body.appendChild(el);
      const m = new bootstrap.Modal(el);
      el.querySelector("form").addEventListener("submit", async ev => {
        ev.preventDefault();
        const nome = el.querySelector("#cpNome").value.trim().replace(/\s+/g, " ");
        const cat = Number(el.querySelector("#cpCat").value);
        if (nome.split(" ").length < 2) return toast("Indique o nome completo (nome e apelido).", "aviso");
        if (!cat) return toast("Escolha a categoria.", "aviso");
        const b = el.querySelector("button[type=submit]"); b.disabled = true;
        const { error } = await sb.rpc("completar_perfil", { p_nome: nome, p_categoria: cat });
        b.disabled = false;
        if (error) return toast(erroMsg(error), "erro");
        m.hide(); el.addEventListener("hidden.bs.modal", () => { el.remove(); resolve(); }, { once: true });
      });
      m.show();
    });
  }

  window.App = {
    sb, cfg, configurado, TIPOS, AREAS_PSICO, LOGO,
    esc, loginParaEmail, fmtHMS, fmtData, fmtNota, erroMsg, toast, confirmar,
    perfilAtual, exigirSessao, sair, renderTopo, renderRodape, renderAvisoConfig,
    normalizarWhats, fmtWhats, linkWhatsAppApoio, perfilIncompleto, completarPerfil, botoesPartilha, ligarPartilha, pedirSegundaVia, mostrarResultado, partilharRelatorio, AVISO_WHATS
  };
})();
