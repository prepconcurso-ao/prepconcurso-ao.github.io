// =====================================================================
//  PrepConcurso AO — painel do administrador
// =====================================================================
(async () => {
  const { sb, esc, toast, erroMsg, fmtNota, fmtData, fmtHMS, TIPOS, AREAS_PSICO } = App;
  const perfil = await App.exigirSessao({ admin: true });
  App.renderTopo(perfil, "admin");
  App.renderRodape();

  const $ = id => document.getElementById(id);
  const LETRAS = "ABCDEF";
  let categorias = [], candidatos = [], resultados = [], questoes = [], limiteQ = 50;

  const falha = e => { console.error(e); toast(erroMsg(e), "erro"); };

  // ------------------------------------------------------------------ RESUMO
  async function carregarResumo() {
    const { data, error } = await sb.rpc("admin_estatisticas");
    if (error) return falha(error);
    const t = (v, l, i) => `<div class="col-6 col-md-3"><div class="tile"><i class="bi ${i} text-cyan fs-4"></i><div class="v">${v ?? "—"}</div><div class="l">${l}</div></div></div>`;
    $("tiles").innerHTML =
      t(data.candidatos, "Candidatos", "bi-people") +
      t(data.exames, "Exames submetidos", "bi-journal-check") +
      t(data.aprovados_psico, "Aptos no psicotécnico", "bi-patch-check") +
      t(data.pedidos_pendentes, "Pedidos pendentes", "bi-hourglass-split") +
      t(fmtNota(data.media_psico), "Média psicotécnico", "bi-lightbulb") +
      t(fmtNota(data.media_conhecimento), "Média conhecimentos", "bi-mortarboard") +
      t(data.questoes_psico, "Questões psicotécnicas", "bi-collection") +
      t(data.questoes_conhecimento, "Questões de conhecimentos", "bi-collection");
    const b = $("bPend");
    b.textContent = data.pedidos_pendentes;
    b.classList.toggle("d-none", !data.pedidos_pendentes);
  }

  // ------------------------------------------------------------------ PEDIDOS
  // Mensagem ao candidato quando o pedido de 2.ª via é aprovado
  function linkAviso(p) {
    const primeiro = (p.perfis?.nome || "").split(" ")[0];
    const txt = `Olá ${primeiro}! O seu pedido de 2.ª via do *${TIPOS[p.tipo].nome}* na ${App.cfg.NOME_PLATAFORMA} foi *aprovado* ✅\n` +
      `Já pode entrar no painel e iniciar o teste: ${App.cfg.URL_PLATAFORMA || location.origin + "/"}\n` +
      `Lembre-se: o exame decorre em ecrã inteiro — não saia da página até submeter. Boa sorte!`;
    return `https://wa.me/${App.cfg.WHATSAPP_INDICATIVO || "244"}${p.perfis.contacto}?text=${encodeURIComponent(txt)}`;
  }
  async function carregarPedidos() {
    let q = sb.from("pedidos_repeticao").select("*, perfis!pedidos_repeticao_user_id_fkey(nome, codigo, contacto)").order("criado_em", { ascending: false }).limit(300);
    if ($("fPedidos").value) q = q.eq("estado", $("fPedidos").value);
    const { data, error } = await q;
    if (error) return falha(error);
    const chip = { pendente: "chip-warn", aprovado: "chip-ok", concedido: "chip-info", rejeitado: "chip-bad" };
    $("lPedidos").innerHTML = data.length ? data.map(p => `<tr>
        <td class="small">${fmtData(p.criado_em)}</td>
        <td><b>${esc(p.perfis?.nome)}</b><div class="small text-muted-2">${esc(p.perfis?.codigo)}</div></td>
        <td>${TIPOS[p.tipo].curto}</td>
        <td class="small" style="max-width:280px">${esc(p.motivo || "—")}</td>
        <td><span class="chip ${chip[p.estado]}">${p.estado}</span></td>
        <td class="text-end text-nowrap">${p.estado === "pendente" ? `
          <button class="btn btn-sm btn-success" data-decidir="${p.id}" data-ok="1"><i class="bi bi-check-lg"></i> Aprovar</button>
          <button class="btn btn-sm btn-outline-danger" data-decidir="${p.id}" data-ok="0"><i class="bi bi-x-lg"></i></button>`
          : p.estado === "aprovado" && p.perfis?.contacto ? `<a class="btn btn-sm btn-whats" target="_blank" rel="noopener" href="${linkAviso(p)}"><i class="bi bi-whatsapp me-1"></i> Avisar candidato</a>` : ""}</td>
      </tr>`).join("") : `<tr><td colspan="6" class="text-muted-2 text-center py-4">Sem pedidos.</td></tr>`;
  }
  $("fPedidos").onchange = carregarPedidos;
  $("lPedidos").addEventListener("click", async e => {
    const b = e.target.closest("[data-decidir]"); if (!b) return;
    b.disabled = true;
    const { error } = await sb.rpc("admin_decidir_pedido", { p_pedido: Number(b.dataset.decidir), p_aprovar: b.dataset.ok === "1" });
    if (error) return falha(error);
    toast(b.dataset.ok === "1" ? "Pedido aprovado. Use «Avisar candidato» para o informar pelo WhatsApp." : "Pedido rejeitado.", "ok");
    carregarPedidos(); carregarResumo(); carregarCandidatos();
  });

  // ------------------------------------------------------------------ CANDIDATOS
  function resumoEtapa(s, tipo) {
    if (tipo === "conhecimento" && !s.desbloqueado) return `<span class="chip chip-mute"><i class="bi bi-lock"></i> Bloqueado</span>`;
    const nota = s.ultima_nota !== null ? `<span class="chip ${s.ultima_nota >= 10 ? "chip-ok" : "chip-bad"}">${fmtNota(s.ultima_nota)}</span>` : `<span class="chip chip-mute">—</span>`;
    const extra = s.em_curso ? ` <span class="chip chip-warn">em curso</span>` : s.ultimo_pedido === "pendente" ? ` <span class="chip chip-warn">pedido</span>` : "";
    return `${nota}<div class="small text-muted-2">${s.feitos}/${s.permitidos} tentativas${extra}</div>`;
  }

  function renderCandidatos() {
    const f = $("fCand").value.trim().toLowerCase();
    const lista = candidatos.filter(c => !f || [c.nome, c.codigo, c.email, c.contacto, c.categoria].join(" ").toLowerCase().includes(f));
    $("lCand").innerHTML = lista.length ? lista.map(c => `<tr class="${c.bloqueado ? "table-danger" : ""}">
        <td><b>${esc(c.nome)}</b> ${c.is_admin ? `<span class="chip chip-info">admin</span>` : ""}<div class="small text-muted-2">${esc(c.codigo)} · ${fmtData(c.criado_em, false)}</div></td>
        <td class="small">${esc(c.email || c.contacto || "—")}</td>
        <td class="small">${esc(c.categoria || "—")}</td>
        <td>${resumoEtapa(c.estado.psico, "psico")}</td>
        <td>${resumoEtapa(c.estado.conhecimento, "conhecimento")}</td>
        <td>${c.estado.minint ? resumoEtapa(c.estado.minint, "minint") : "—"}</td>
        <td class="text-end"><div class="dropdown">
          <button class="btn btn-sm btn-light border dropdown-toggle" data-bs-toggle="dropdown" data-bs-popper-config='{"strategy":"fixed"}' aria-expanded="false">Ações</button>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="#" data-acao="conceder" data-tipo="psico" data-id="${c.id}"><i class="bi bi-arrow-repeat me-1"></i> Conceder nova tentativa — Psicotécnico</a></li>
            <li><a class="dropdown-item" href="#" data-acao="conceder" data-tipo="conhecimento" data-id="${c.id}"><i class="bi bi-arrow-repeat me-1"></i> Conceder nova tentativa — Conhecimentos</a></li>
            <li><a class="dropdown-item" href="#" data-acao="conceder" data-tipo="minint" data-id="${c.id}"><i class="bi bi-arrow-repeat me-1"></i> Conceder nova tentativa — MININT</a></li>
            <li><a class="dropdown-item" href="#" data-acao="categoria" data-id="${c.id}"><i class="bi bi-tag me-1"></i> Alterar categoria</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#" data-acao="bloquear" data-id="${c.id}"><i class="bi ${c.bloqueado ? "bi-unlock" : "bi-slash-circle"} me-1"></i> ${c.bloqueado ? "Desbloquear" : "Bloquear"} conta</a></li>
            ${c.id !== perfil.id ? `<li><a class="dropdown-item" href="#" data-acao="admin" data-id="${c.id}"><i class="bi bi-shield me-1"></i> ${c.is_admin ? "Remover administrador" : "Tornar administrador"}</a></li>` : ""}
          </ul></div></td>
      </tr>`).join("") : `<tr><td colspan="7" class="text-muted-2 text-center py-4">Nenhum candidato encontrado.</td></tr>`;
  }

  async function carregarCandidatos() {
    const { data, error } = await sb.rpc("admin_candidatos");
    if (error) return falha(error);
    candidatos = data;
    renderCandidatos();
  }
  $("fCand").oninput = renderCandidatos;
  $("lCand").addEventListener("click", async e => {
    const a = e.target.closest("[data-acao]"); if (!a) return;
    e.preventDefault();
    const c = candidatos.find(x => x.id === a.dataset.id);
    let error;
    if (a.dataset.acao === "conceder") {
      ({ error } = await sb.rpc("admin_conceder_tentativa", { p_user: c.id, p_tipo: a.dataset.tipo }));
      if (!error) toast(`Nova tentativa concedida a ${c.nome}.`, "ok");
    } else if (a.dataset.acao === "bloquear") {
      ({ error } = await sb.from("perfis").update({ bloqueado: !c.bloqueado }).eq("id", c.id));
    } else if (a.dataset.acao === "admin") {
      if (!await App.confirmar("Alterar permissões", `<p>${c.is_admin ? "Remover" : "Dar"} acesso de administrador a <b>${esc(c.nome)}</b>?</p>`)) return;
      ({ error } = await sb.from("perfis").update({ is_admin: !c.is_admin }).eq("id", c.id));
    } else if (a.dataset.acao === "categoria") {
      const el = await App.confirmar("Alterar categoria", `<label class="form-label">Categoria de ${esc(c.nome)}</label>
        <select class="form-select" id="novaCat">${categorias.map(k => `<option value="${k.id}" ${k.id === c.categoria_id ? "selected" : ""}>${esc(k.nome)}</option>`).join("")}</select>`);
      if (!el) return;
      ({ error } = await sb.from("perfis").update({ categoria_id: Number(el.querySelector("#novaCat").value) }).eq("id", c.id));
    }
    if (error) return falha(error);
    carregarCandidatos(); carregarPedidos(); carregarResumo();
  });

  // ------------------------------------------------------------------ RESULTADOS
  async function carregarResultados() {
    let q = sb.from("tentativas").select("id, tipo, n_questoes, acertos, respondidas, nota, tempo_seg, submetido_em, anulado, incidentes, perfis(nome, codigo, contacto, email, categorias(nome)), categorias(nome)")
      .eq("estado", "submetido").order("submetido_em", { ascending: false }).limit(1000);
    if ($("fRes").value) q = q.eq("tipo", $("fRes").value);
    const { data, error } = await q;
    if (error) return falha(error);
    resultados = data;
    $("lRes").innerHTML = data.length ? data.map(t => `<tr>
        <td class="small">${fmtData(t.submetido_em)}</td>
        <td><b>${esc(t.perfis?.nome)}</b><div class="small text-muted-2">${esc(t.perfis?.codigo)}</div></td>
        <td>${TIPOS[t.tipo].curto}</td>
        <td class="small">${esc(t.categorias?.nome || t.perfis?.categorias?.nome || "—")}</td>
        <td>${t.acertos}/${t.n_questoes}</td><td>${fmtHMS(t.tempo_seg)}</td>
        <td><span class="chip ${t.nota >= 10 ? "chip-ok" : "chip-bad"}">${fmtNota(t.nota)}</span>
          ${t.anulado ? `<div><span class="chip chip-bad mt-1">anulado</span></div>` : (t.incidentes || []).length ? `<div class="small text-warning mt-1"><i class="bi bi-shield-exclamation"></i> ${t.incidentes.length} incidente(s)</div>` : ""}</td>
        <td class="text-end"><a class="btn btn-sm btn-light border" href="relatorio.html?id=${t.id}" target="_blank">Relatório</a></td>
      </tr>`).join("") : `<tr><td colspan="8" class="text-muted-2 text-center py-4">Sem resultados.</td></tr>`;
  }
  $("fRes").onchange = carregarResultados;
  $("btnCsv").onclick = () => {
    const linhas = [["data", "codigo", "candidato", "contacto", "teste", "categoria", "questoes", "respondidas", "acertos", "tempo", "nota", "incidentes", "anulado"]];
    resultados.forEach(t => linhas.push([fmtData(t.submetido_em), t.perfis?.codigo, t.perfis?.nome, t.perfis?.email || t.perfis?.contacto,
      TIPOS[t.tipo].nome, t.categorias?.nome || t.perfis?.categorias?.nome || "", t.n_questoes, t.respondidas, t.acertos, fmtHMS(t.tempo_seg), fmtNota(t.nota), (t.incidentes || []).length, t.anulado ? "sim" : "não"]));
    const csv = "﻿" + linhas.map(l => l.map(v => `"${String(v ?? "").replace(/"/g, '""')}"`).join(";")).join("\r\n");
    const a = document.createElement("a");
    a.href = URL.createObjectURL(new Blob([csv], { type: "text/csv;charset=utf-8" }));
    a.download = `resultados_${new Date().toISOString().slice(0, 10)}.csv`;
    a.click();
  };

  // ------------------------------------------------------------------ CATEGORIAS
  async function carregarCategorias() {
    const cats = await sb.from("categorias").select("*").order("nome");
    if (cats.error) return falha(cats.error);
    categorias = cats.data;
    const contagens = await Promise.all(categorias.map(c => Promise.all([
      sb.from("questoes").select("id", { count: "exact", head: true }).eq("tipo", "conhecimento").eq("ativo", true).eq("categoria_id", c.id),
      sb.from("perfis").select("id", { count: "exact", head: true }).eq("categoria_id", c.id)
    ])));
    $("lCat").innerHTML = categorias.map((c, i) => {
      const nq = contagens[i][0].count ?? 0, np = contagens[i][1].count ?? 0;
      return `<tr>
        <td><b>${esc(c.nome)}</b><div class="small text-muted-2">${esc(c.descricao || "")}</div></td>
        <td>${nq} ${nq < 25 ? `<span class="chip chip-warn" title="Recomenda-se pelo menos 50 questões para permitir testes de 50">poucas</span>` : ""}</td>
        <td>${np}</td>
        <td><div class="form-check form-switch"><input class="form-check-input" type="checkbox" data-cat-ativo="${c.id}" ${c.ativo ? "checked" : ""}></div></td>
        <td class="text-end"><button class="btn btn-sm btn-light border" data-cat-editar="${c.id}"><i class="bi bi-pencil"></i></button></td>
      </tr>`;
    }).join("");
    const opts = categorias.map(c => `<option value="${c.id}">${esc(c.nome)}</option>`).join("");
    $("fqCat").innerHTML = `<option value="">Todas as categorias</option>${opts}`;
    $("qCat").innerHTML = opts;
  }
  $("formCat").onsubmit = async e => {
    e.preventDefault();
    const { error } = await sb.from("categorias").insert({ nome: $("catNome").value.trim(), descricao: $("catDesc").value.trim() || null });
    if (error) return falha(error);
    e.target.reset(); toast("Categoria adicionada.", "ok"); carregarCategorias();
  };
  $("lCat").addEventListener("change", async e => {
    const id = e.target.dataset.catAtivo; if (!id) return;
    const { error } = await sb.from("categorias").update({ ativo: e.target.checked }).eq("id", id);
    if (error) falha(error);
  });
  $("lCat").addEventListener("click", async e => {
    const b = e.target.closest("[data-cat-editar]"); if (!b) return;
    const c = categorias.find(x => x.id === Number(b.dataset.catEditar));
    const el = await App.confirmar("Editar categoria", `
      <label class="form-label">Nome</label><input class="form-control mb-2" id="eCatNome" value="${esc(c.nome)}">
      <label class="form-label">Descrição</label><input class="form-control" id="eCatDesc" value="${esc(c.descricao || "")}">`, "Guardar");
    if (!el) return;
    const { error } = await sb.from("categorias").update({ nome: el.querySelector("#eCatNome").value.trim(), descricao: el.querySelector("#eCatDesc").value.trim() || null }).eq("id", c.id);
    if (error) return falha(error);
    carregarCategorias();
  });

  // ------------------------------------------------------------------ QUESTÕES
  async function carregarQuestoes() {
    // o Supabase devolve no máximo 1000 linhas por pedido: carregar por páginas
    let data = [];
    for (let de = 0; ; de += 1000) {
      const r = await sb.from("questoes").select("*, categorias(nome)").order("id", { ascending: false }).range(de, de + 999);
      if (r.error) return falha(r.error);
      data = data.concat(r.data);
      if (r.data.length < 1000) break;
    }
    questoes = data;
    const areas = [...new Set([...AREAS_PSICO, ...data.map(q => q.area)])].sort();
    $("listaAreas").innerHTML = areas.map(a => `<option value="${esc(a)}">`).join("");
    renderQuestoes();
  }

  function renderQuestoes() {
    const tipo = $("fqTipo").value, cat = $("fqCat").value, txt = $("fqTexto").value.trim().toLowerCase();
    const lista = questoes.filter(q => (!tipo || q.tipo === tipo) && (!cat || String(q.categoria_id) === cat) &&
      (!txt || (q.enunciado + " " + q.area).toLowerCase().includes(txt)));
    $("qTotal").textContent = `(${lista.length} de ${questoes.length})`;
    $("lQuest").innerHTML = lista.slice(0, limiteQ).map(q => `<tr class="${q.ativo ? "" : "text-muted"}">
        <td class="small">${q.id}</td>
        <td style="max-width:420px"><div class="text-truncate" title="${esc(q.enunciado)}">${esc(q.enunciado)}</div></td>
        <td class="small">${TIPOS[q.tipo].curto}<div class="text-muted-2">${esc(q.categorias?.nome ? q.categorias.nome + " · " : "")}${esc(q.area)}</div></td>
        <td class="small"><b>${LETRAS[q.correta]})</b> ${esc(String(q.opcoes[q.correta]).slice(0, 40))}</td>
        <td><div class="form-check form-switch"><input class="form-check-input" type="checkbox" data-q-ativo="${q.id}" ${q.ativo ? "checked" : ""}></div></td>
        <td class="text-end text-nowrap"><button class="btn btn-sm btn-light border" data-q-editar="${q.id}"><i class="bi bi-pencil"></i></button>
          <button class="btn btn-sm btn-outline-danger" data-q-apagar="${q.id}"><i class="bi bi-trash"></i></button></td>
      </tr>`).join("") || `<tr><td colspan="6" class="text-muted-2 text-center py-4">Nenhuma questão.</td></tr>`;
    $("btnMaisQ").classList.toggle("d-none", lista.length <= limiteQ);
  }
  ["fqTipo", "fqCat"].forEach(i => $(i).onchange = () => { limiteQ = 50; renderQuestoes(); });
  $("fqTexto").oninput = () => { limiteQ = 50; renderQuestoes(); };
  $("btnMaisQ").onclick = () => { limiteQ += 50; renderQuestoes(); };

  // Modal questão
  const mQ = new bootstrap.Modal($("mQuestao"));
  let editarId = null;
  function linhaOpcao(texto = "", correta = false) {
    const d = document.createElement("div");
    d.className = "input-group mb-2 linha-op";
    d.innerHTML = `<span class="input-group-text"><input class="form-check-input mt-0" type="radio" name="qCorreta" ${correta ? "checked" : ""}></span>
      <span class="input-group-text letra-op"></span><input class="form-control" value="${esc(texto)}" required>
      <button type="button" class="btn btn-light border" title="Remover"><i class="bi bi-x"></i></button>`;
    d.querySelector("button").onclick = () => { if ($("qOpcoes").children.length > 2) { d.remove(); letrasOp(); } };
    $("qOpcoes").appendChild(d); letrasOp();
  }
  function letrasOp() { [...$("qOpcoes").children].forEach((d, i) => d.querySelector(".letra-op").textContent = LETRAS[i]); }
  $("qMaisOp").onclick = () => { if ($("qOpcoes").children.length < 6) linhaOpcao(); };
  $("qTipo").onchange = () => $("qCatWrap").classList.toggle("d-none", $("qTipo").value === "psico");

  function abrirQuestao(q) {
    editarId = q ? q.id : null;
    $("mqTitulo").textContent = q ? `Editar questão #${q.id}` : "Nova questão";
    $("qTipo").value = q ? q.tipo : ($("fqTipo").value || "psico");
    if (q?.categoria_id) $("qCat").value = q.categoria_id; else if ($("fqCat").value) $("qCat").value = $("fqCat").value;
    $("qArea").value = q ? q.area : "";
    $("qEnun").value = q ? q.enunciado : "";
    $("qAtivo").checked = q ? q.ativo : true;
    $("qOpcoes").innerHTML = "";
    (q ? q.opcoes : ["", "", "", ""]).forEach((o, i) => linhaOpcao(o, q ? i === q.correta : i === 0));
    $("qTipo").onchange();
    mQ.show();
  }
  $("btnNovaQ").onclick = () => abrirQuestao(null);
  $("formQ").onsubmit = async e => {
    e.preventDefault();
    const linhas = [...$("qOpcoes").children];
    const opcoes = linhas.map(d => d.querySelector(".form-control").value.trim());
    const correta = linhas.findIndex(d => d.querySelector("[type=radio]").checked);
    if (opcoes.some(o => !o)) return toast("Preencha todas as opções.", "aviso");
    if (correta < 0) return toast("Marque a opção correta.", "aviso");
    const tipo = $("qTipo").value;
    const reg = { tipo, area: $("qArea").value.trim(), enunciado: $("qEnun").value.trim(), opcoes, correta,
                  ativo: $("qAtivo").checked, categoria_id: tipo === "conhecimento" ? Number($("qCat").value) : null };
    const { error } = editarId ? await sb.from("questoes").update(reg).eq("id", editarId) : await sb.from("questoes").insert(reg);
    if (error) return falha(error);
    mQ.hide(); toast("Questão guardada.", "ok"); carregarQuestoes(); carregarResumo();
  };
  $("lQuest").addEventListener("click", async e => {
    const ed = e.target.closest("[data-q-editar]");
    if (ed) return abrirQuestao(questoes.find(q => q.id === Number(ed.dataset.qEditar)));
    const ap = e.target.closest("[data-q-apagar]");
    if (ap) {
      if (!await App.confirmar("Apagar questão", `<p>Apagar definitivamente a questão #${ap.dataset.qApagar}? Se já foi usada em exames, prefira desativá-la.</p>`, "Apagar", "btn-danger")) return;
      const { error } = await sb.from("questoes").delete().eq("id", ap.dataset.qApagar);
      if (error) return falha(error);
      carregarQuestoes(); carregarResumo();
    }
  });
  $("lQuest").addEventListener("change", async e => {
    const id = e.target.dataset.qAtivo; if (!id) return;
    const { error } = await sb.from("questoes").update({ ativo: e.target.checked }).eq("id", id);
    if (error) return falha(error);
    const q = questoes.find(x => x.id === Number(id)); if (q) q.ativo = e.target.checked;
  });

  // Importar CSV
  const mImp = new bootstrap.Modal($("mImportar"));
  let paraImportar = [];
  $("btnImportar").onclick = () => { $("csvFicheiro").value = ""; $("csvPrevia").innerHTML = ""; $("btnConfirmarImport").disabled = true; mImp.show(); };

  function lerCSV(texto) {
    texto = texto.replace(/^﻿/, "");
    const prim = texto.split(/\r?\n/)[0];
    const sep = (prim.match(/;/g) || []).length >= (prim.match(/,/g) || []).length ? ";" : ",";
    const linhas = []; let campo = "", linha = [], aspas = false;
    for (let i = 0; i < texto.length; i++) {
      const ch = texto[i];
      if (aspas) {
        if (ch === '"' && texto[i + 1] === '"') { campo += '"'; i++; }
        else if (ch === '"') aspas = false;
        else campo += ch;
      } else if (ch === '"') aspas = true;
      else if (ch === sep) { linha.push(campo); campo = ""; }
      else if (ch === "\n" || ch === "\r") {
        if (ch === "\r" && texto[i + 1] === "\n") i++;
        linha.push(campo); linhas.push(linha); linha = []; campo = "";
      } else campo += ch;
    }
    if (campo || linha.length) { linha.push(campo); linhas.push(linha); }
    return linhas.filter(l => l.some(c => c.trim()));
  }

  $("csvFicheiro").onchange = async e => {
    const f = e.target.files[0]; if (!f) return;
    const linhas = lerCSV(await f.text());
    const cab = linhas.shift().map(c => c.trim().toLowerCase());
    const col = n => cab.indexOf(n);
    const erros = []; paraImportar = [];
    linhas.forEach((l, i) => {
      const v = n => (col(n) >= 0 ? (l[col(n)] || "").trim() : "");
      const tipo = v("tipo").toLowerCase().startsWith("conh") ? "conhecimento" : v("tipo").toLowerCase().startsWith("psico") ? "psico" : "";
      const opcoes = ["opcao_a", "opcao_b", "opcao_c", "opcao_d", "opcao_e", "opcao_f"].map(v).filter(Boolean);
      const correta = LETRAS.indexOf(v("correta").toUpperCase());
      const cat = categorias.find(c => c.nome.toLowerCase() === v("categoria").toLowerCase());
      const ln = i + 2;
      if (!tipo) return erros.push(`Linha ${ln}: tipo inválido`);
      if (!v("enunciado")) return erros.push(`Linha ${ln}: enunciado vazio`);
      if (opcoes.length < 2) return erros.push(`Linha ${ln}: precisa de pelo menos 2 opções`);
      if (correta < 0 || correta >= opcoes.length) return erros.push(`Linha ${ln}: letra da resposta correta inválida`);
      if (tipo === "conhecimento" && !cat) return erros.push(`Linha ${ln}: categoria «${v("categoria")}» não existe`);
      paraImportar.push({ tipo, area: v("area") || "Geral", enunciado: v("enunciado"), opcoes, correta,
        categoria_id: tipo === "conhecimento" ? cat.id : null });
    });
    $("csvPrevia").innerHTML = `<div class="alert ${erros.length ? "alert-warning" : "alert-success"} mb-0">
      <b>${paraImportar.length}</b> questões prontas a importar.${erros.length ? `<br><b>${erros.length}</b> linhas com problemas:<ul class="mb-0">${erros.slice(0, 15).map(x => `<li>${esc(x)}</li>`).join("")}</ul>` : ""}</div>`;
    $("btnConfirmarImport").disabled = !paraImportar.length;
  };
  $("btnConfirmarImport").onclick = async () => {
    $("btnConfirmarImport").disabled = true;
    for (let i = 0; i < paraImportar.length; i += 200) {
      const { error } = await sb.from("questoes").insert(paraImportar.slice(i, i + 200));
      if (error) { $("btnConfirmarImport").disabled = false; return falha(error); }
    }
    toast(`${paraImportar.length} questões importadas.`, "ok");
    mImp.hide(); carregarQuestoes(); carregarCategorias(); carregarResumo();
  };

  // ------------------------------------------------------------------ PUBLICIDADE
  let anuncios = [], anEditar = null;
  const mAn = new bootstrap.Modal($("mAnuncio"));
  async function carregarAnuncios() {
    const { data, error } = await sb.from("anuncios").select("*").order("ordem").order("id");
    if (error) { $("lAn").innerHTML = `<tr><td colspan="6" class="text-danger small">${esc(erroMsg(error))} — execute supabase/03_anuncios.sql no Supabase.</td></tr>`; return; }
    anuncios = data;
    $("lAn").innerHTML = data.length ? data.map(a => `<tr>
        <td>${a.imagem_url ? `<img src="${esc(a.imagem_url)}" style="height:48px;max-width:140px;object-fit:cover" class="rounded">` : `<span class="chip chip-mute">só texto</span>`}</td>
        <td><b>${esc(a.titulo)}</b><div class="small text-muted-2 text-truncate" style="max-width:320px">${esc(a.texto || "")}${a.link ? ` · ${esc(a.link)}` : ""}</div></td>
        <td class="small">${a.inicio || a.fim ? `${a.inicio ? fmtData(a.inicio, false) : "…"} → ${a.fim ? fmtData(a.fim, false) : "…"}` : "Sempre"}</td>
        <td>${a.ordem}</td>
        <td><div class="form-check form-switch"><input class="form-check-input" type="checkbox" data-an-ativo="${a.id}" ${a.ativo ? "checked" : ""}></div></td>
        <td class="text-end text-nowrap"><button class="btn btn-sm btn-light border" data-an-editar="${a.id}"><i class="bi bi-pencil"></i></button>
          <button class="btn btn-sm btn-outline-danger" data-an-apagar="${a.id}"><i class="bi bi-trash"></i></button></td>
      </tr>`).join("") : `<tr><td colspan="6" class="text-muted-2 text-center py-4">Ainda não há anúncios pagos. O banner mostra o anúncio «Anuncie aqui».</td></tr>`;
  }
  function abrirAnuncio(a) {
    anEditar = a ? a.id : null;
    $("maTitulo").textContent = a ? "Editar anúncio" : "Novo anúncio";
    $("anTitulo").value = a?.titulo || ""; $("anTexto").value = a?.texto || ""; $("anImagem").value = a?.imagem_url || "";
    $("anLink").value = a?.link || ""; $("anOrdem").value = a?.ordem ?? 0; $("anAtivo").checked = a ? a.ativo : true;
    $("anInicio").value = a?.inicio || ""; $("anFim").value = a?.fim || ""; $("anFicheiro").value = "";
    $("anPrevia").src = a?.imagem_url || ""; $("anPrevia").classList.toggle("d-none", !a?.imagem_url);
    mAn.show();
  }
  $("btnNovoAn").onclick = () => abrirAnuncio(null);
  $("anFicheiro").onchange = e => {
    const f = e.target.files[0]; if (!f) return;
    if (f.size > 3 * 1024 * 1024) { e.target.value = ""; return toast("A imagem tem mais de 3 MB.", "aviso"); }
    $("anPrevia").src = URL.createObjectURL(f); $("anPrevia").classList.remove("d-none");
  };
  $("formAn").onsubmit = async e => {
    e.preventDefault();
    const btn = e.target.querySelector("button.btn-navy"); btn.disabled = true;
    try {
      let imagem = $("anImagem").value.trim() || null;
      const f = $("anFicheiro").files[0];
      if (f) {
        const caminho = `${Date.now()}-${f.name.toLowerCase().replace(/[^a-z0-9.]+/g, "-")}`;
        const up = await sb.storage.from("anuncios").upload(caminho, f, { contentType: f.type, upsert: false });
        if (up.error) throw up.error;
        imagem = sb.storage.from("anuncios").getPublicUrl(caminho).data.publicUrl;
      }
      const reg = { titulo: $("anTitulo").value.trim(), texto: $("anTexto").value.trim() || null, imagem_url: imagem,
        link: $("anLink").value.trim() || null, ordem: Number($("anOrdem").value) || 0, ativo: $("anAtivo").checked,
        inicio: $("anInicio").value || null, fim: $("anFim").value || null };
      const { error } = anEditar ? await sb.from("anuncios").update(reg).eq("id", anEditar) : await sb.from("anuncios").insert(reg);
      if (error) throw error;
      mAn.hide(); toast("Anúncio guardado.", "ok"); carregarAnuncios();
    } catch (err) { falha(err); }
    finally { btn.disabled = false; }
  };
  $("lAn").addEventListener("click", async e => {
    const ed = e.target.closest("[data-an-editar]");
    if (ed) return abrirAnuncio(anuncios.find(a => a.id === Number(ed.dataset.anEditar)));
    const ap = e.target.closest("[data-an-apagar]");
    if (ap && await App.confirmar("Apagar anúncio", "<p>Apagar este anúncio do banner?</p>", "Apagar", "btn-danger")) {
      const { error } = await sb.from("anuncios").delete().eq("id", ap.dataset.anApagar);
      if (error) return falha(error);
      carregarAnuncios();
    }
  });
  $("lAn").addEventListener("change", async e => {
    const id = e.target.dataset.anAtivo; if (!id) return;
    const { error } = await sb.from("anuncios").update({ ativo: e.target.checked }).eq("id", id);
    if (error) falha(error);
  });

  // ------------------------------------------------------------------ INÍCIO
  async function tudo() {
    await carregarCategorias();
    await Promise.all([carregarResumo(), carregarPedidos(), carregarCandidatos(), carregarResultados(), carregarQuestoes(), carregarAnuncios()]);
  }
  $("btnRecarregar").onclick = tudo;
  tudo();
})();
