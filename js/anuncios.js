// =====================================================================
//  PrepConcurso AO — banner de publicidade rotativo
//  Mostra os anúncios ativos (tabela "anuncios") e, no fim, o anúncio
//  da casa «Anuncie aqui». Basta ter <section id="publicidade"></section>.
// =====================================================================
(function () {
  async function montar() {
    const el = document.getElementById("publicidade");
    if (!el || !window.App) return;
    const { cfg, esc, sb } = App;
    if (cfg.PUBLICIDADE_ATIVA === false) { el.remove(); return; }

    const tel = cfg.TELEFONE_APOIO || "";
    const telDigitos = tel.replace(/\D/g, "");
    const wa = `https://wa.me/${cfg.WHATSAPP_INDICATIVO || "244"}${telDigitos}?text=${encodeURIComponent("Olá! Quero anunciar na plataforma " + (cfg.NOME_PLATAFORMA || "") + ".")}`;
    const mail = `mailto:${cfg.CONTACTO_SUPORTE}?subject=${encodeURIComponent("Publicidade na plataforma " + (cfg.NOME_PLATAFORMA || ""))}`;

    let anuncios = [];
    try {
      const { data, error } = await sb.from("anuncios").select("id, titulo, texto, imagem_url, link, ordem").order("ordem").order("id");
      if (!error && data) anuncios = data;
    } catch (e) { /* sem anúncios: mostra só o da casa */ }

    const contactos = `
      <div class="pub-contactos">
        <a class="pub-btn pub-btn-wa" href="${wa}" target="_blank" rel="noopener"><i class="bi bi-whatsapp"></i> ${esc(tel)}</a>
        <a class="pub-btn" href="tel:+${cfg.WHATSAPP_INDICATIVO || "244"}${telDigitos}"><i class="bi bi-telephone"></i> Ligar</a>
        <a class="pub-btn" href="${mail}"><i class="bi bi-envelope"></i> ${esc(cfg.CONTACTO_SUPORTE)}</a>
      </div>`;

    const casa = [
      `<div class="pub-flyer pub-casa">
         <div class="pub-texto">
           <span class="pub-kicker">Espaço publicitário disponível</span>
           <h3>Anuncie aqui o seu <span>serviço ou produto</span></h3>
           <p>Chegue a milhares de candidatos a concursos públicos em todo o país.</p>
           ${contactos}
         </div>
         <div class="pub-selo"><i class="bi bi-megaphone-fill"></i></div>
       </div>`,
      `<div class="pub-flyer pub-casa pub-casa-2">
         <div class="pub-texto">
           <span class="pub-kicker">Escolas · Centros de formação · Explicações · Papelarias</span>
           <h3>O seu anúncio <span>passa aqui</span></h3>
           <p>Banner rotativo visto por candidatos todos os dias. Fale connosco por WhatsApp ou e-mail.</p>
           ${contactos}
         </div>
         <div class="pub-selo"><i class="bi bi-badge-ad-fill"></i></div>
       </div>`
    ];

    const slides = anuncios.map(a => {
      const abre = a.link ? `<a href="${esc(a.link)}" target="_blank" rel="noopener sponsored" class="pub-link">` : `<div class="pub-link">`;
      const fecha = a.link ? `</a>` : `</div>`;
      if (a.imagem_url) {
        return `${abre}<div class="pub-flyer pub-imagem">
            <img src="${esc(a.imagem_url)}" alt="${esc(a.titulo)}" loading="lazy">
            ${a.texto ? `<div class="pub-legenda"><b>${esc(a.titulo)}</b> · ${esc(a.texto)}</div>` : ""}
          </div>${fecha}`;
      }
      return `${abre}<div class="pub-flyer pub-anunciante"><div class="pub-texto">
          <span class="pub-kicker">Patrocinado</span><h3>${esc(a.titulo)}</h3>
          ${a.texto ? `<p>${esc(a.texto)}</p>` : ""}${a.link ? `<span class="pub-btn">Saber mais <i class="bi bi-arrow-right"></i></span>` : ""}
        </div></div>${fecha}`;
    }).concat(casa);

    const id = "carrosselPub";
    el.className = "container my-4 publicidade";
    el.setAttribute("aria-label", "Publicidade");
    el.innerHTML = `
      <div class="pub-etiqueta">Publicidade</div>
      <div id="${id}" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="${(cfg.PUBLICIDADE_SEGUNDOS || 6) * 1000}">
        <div class="carousel-indicators">${slides.map((_, i) => `<button type="button" data-bs-target="#${id}" data-bs-slide-to="${i}" ${i === 0 ? 'class="active" aria-current="true"' : ""} aria-label="Anúncio ${i + 1}"></button>`).join("")}</div>
        <div class="carousel-inner">${slides.map((s, i) => `<div class="carousel-item ${i === 0 ? "active" : ""}">${s}</div>`).join("")}</div>
        <button class="carousel-control-prev" type="button" data-bs-target="#${id}" data-bs-slide="prev"><span class="carousel-control-prev-icon"></span><span class="visually-hidden">Anterior</span></button>
        <button class="carousel-control-next" type="button" data-bs-target="#${id}" data-bs-slide="next"><span class="carousel-control-next-icon"></span><span class="visually-hidden">Seguinte</span></button>
      </div>`;
    bootstrap.Carousel.getOrCreateInstance(document.getElementById(id), { interval: (cfg.PUBLICIDADE_SEGUNDOS || 6) * 1000, ride: "carousel", pause: "hover" });
  }

  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", montar);
  else montar();
})();
