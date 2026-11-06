# PrepConcurso AO

Plataforma web para preparação de candidatos a concursos públicos, com **Teste Psicotécnico** e **Aferição de Conhecimentos** cronometrados, relatório imprimível no fim de cada etapa e painel de administração.

- **Site (frontend):** HTML5, CSS3, JavaScript, Bootstrap 5 — publicado no **GitHub Pages**
- **Base de dados, autenticação e regras do exame:** **Supabase** (PostgreSQL + Auth)

> **Sobre o PHP:** o GitHub Pages só aloja ficheiros estáticos e **não executa PHP**. Por isso, toda a lógica de servidor (sortear questões, controlar o tempo, corrigir e calcular a nota, limitar tentativas) está em funções SQL no Supabase (`supabase/01_schema.sql`). As respostas corretas nunca chegam ao navegador do candidato.

---

## Como funciona

| Regra | Implementação |
|---|---|
| Cadastro com nome, senha, e-mail **ou** telefone e categoria | `index.html` + gatilho `criar_perfil_novo_utilizador` |
| Cada candidato só faz **um** teste de cada etapa | `iniciar_exame` verifica as tentativas usadas |
| Mais tentativas só com **aprovação do administrador** | Candidato pede em `painel.html`; admin aprova em `admin.html` |
| Escolha de **25 a 50 questões**, **1 minuto por questão** | Barra deslizante no painel; tempo controlado pelo servidor |
| Psicotécnico ≥ **10 valores** desbloqueia a Aferição de Conhecimentos | `_estado_candidato` (usa a melhor nota psicotécnica) |
| Nota < 10 → solicitar repetição do psicotécnico | Botão «Solicitar repetição» |
| Psicotécnico: raciocínio lógico, aptidão verbal e numérica, atenção e concentração, matemática lógica | Sorteio equilibrado entre as 5 áreas |
| Conhecimentos de acordo com a categoria do cadastro | Questões filtradas pela categoria do candidato |
| Relatório no fim de cada etapa (como o comprovativo oficial) | `relatorio.html` — código, candidato, categoria, nota, total de questões, duração, tempo de submissão, gráfico respondidas/não respondidas, data, desempenho por área |

Outros pormenores: o exame é **submetido automaticamente** quando o tempo acaba; as respostas são guardadas a cada alteração (se a página fechar, o candidato retoma com o tempo a contar); exames abandonados são fechados automaticamente com as respostas guardadas.

---

## Instalação passo a passo

### 1. Criar o projeto no Supabase
1. Crie uma conta em <https://supabase.com> e um **New project**.
2. Abra **SQL Editor → New query**, cole o conteúdo de `supabase/01_schema.sql` e clique **Run**.
3. Numa nova query, cole `supabase/02_seed_questoes.sql` e clique **Run** (carrega 141 questões psicotécnicas e 155 de conhecimentos em 6 categorias).
4. Em **Authentication → Sign In / Providers → Email**:
   - desative **Confirm email** (obrigatório para o cadastro por telefone funcionar; com e-mail de confirmação ativo, só o cadastro por e-mail funcionaria);
   - mantenha **Email** ativo.
5. Em **Authentication → URL Configuration**, coloque em **Site URL** o endereço do seu site no GitHub Pages (passo 3).

### 2. Ligar o site ao Supabase
Em **Project Settings → API** copie o **Project URL** e a **anon public key** e cole-os em `js/config.js`:

```js
SUPABASE_URL: "https://abcdxyz.supabase.co",
SUPABASE_ANON_KEY: "eyJhbGciOi...",
```

A chave *anon* pode ficar pública — a segurança é feita pelas regras RLS e pelas funções no Supabase. **Nunca** coloque a `service_role key` no site.

### 3. Publicar no GitHub Pages
1. Crie um repositório no GitHub (ex.: `prepconcurso`).
2. Envie todos os ficheiros desta pasta (botão **Add file → Upload files**, ou `git push`).
3. Em **Settings → Pages**, escolha **Deploy from a branch**, branch `main`, pasta `/ (root)` e guarde.
4. Após 1–2 minutos o site fica em `https://SEU-UTILIZADOR.github.io/prepconcurso/`.

### 4. Criar o primeiro administrador
1. No site, crie a sua conta normalmente.
2. No Supabase, **SQL Editor**, execute (com o seu e-mail):

```sql
update public.perfis set is_admin = true
 where id = (select id from auth.users where email = 'seu.email@exemplo.com');
```

Se se registou com telefone, o e-mail técnico é `<números>@tel.prepconcurso.app` (ex.: `923000000@tel.prepconcurso.app`).
Depois disso aparece o menu **Administração**, onde pode tornar outros utilizadores administradores.

---

## Painel do administrador (`admin.html`)

- **Resumo** — candidatos, exames, aptos, médias, pedidos pendentes, número de questões.
- **Pedidos** — aprovar ou rejeitar pedidos de repetição.
- **Candidatos** — pesquisar, conceder nova tentativa diretamente, alterar categoria, bloquear conta, gerir administradores.
- **Resultados** — todas as notas, com exportação **CSV** (abre no Excel).
- **Questões** — criar, editar, desativar, apagar e **importar CSV** (modelo em `modelo_questoes.csv`).
- **Categorias** — criar, renomear e ativar/desativar categorias (indica as que têm poucas questões).

> Para permitir testes de 50 questões numa categoria, essa categoria precisa de pelo menos 50 questões ativas. Se tiver menos, o teste usa todas as disponíveis (e o tempo ajusta-se: 1 minuto por questão).

---

## Estrutura

```
index.html          Página inicial: entrar / cadastro
painel.html         Painel do candidato (etapas, histórico, pedidos de repetição)
exame.html          Exame cronometrado (navegação, rever depois, autosave, submissão automática)
relatorio.html      Relatório/comprovativo do exame (imprimir ou guardar em PDF)
admin.html          Administração
css/estilo.css      Identidade visual (azul-marinho, ciano, faixa vermelho/preto/amarelo)
js/config.js        Configuração (Supabase, nome da plataforma, nota mínima)
js/app.js           Funções partilhadas
js/admin.js         Lógica do painel de administração
supabase/01_schema.sql         Tabelas, segurança (RLS) e funções do exame
supabase/02_seed_questoes.sql  Banco de questões inicial
tools/              Scripts Python que geram o banco de questões (opcional)
modelo_questoes.csv Modelo para importar questões
```

## Problemas comuns
- **«E-mail ou telefone inválido» ao registar com telefone:** algumas configurações do Supabase recusam domínios de e-mail que não existem. Em `js/config.js`, mude `DOMINIO_TELEFONE` para um domínio seu (ex.: `tel.minhaempresa.ao`). Faça isto antes de haver candidatos registados por telefone.
- **«Confirme o seu e-mail»:** a opção *Confirm email* continua ativa no Supabase (ver passo 1.4).
- **Aviso amarelo «Plataforma por configurar»:** falta preencher `js/config.js`.
- **Muitos registos de uma vez:** o Supabase limita a criação de contas por hora; ajuste em *Authentication → Rate Limits*.

## Personalizar
- **Nome, subtítulo, contacto, nota mínima:** `js/config.js`
- **Cores:** variáveis no início de `css/estilo.css`
- **Gerar de novo o banco inicial:** edite `tools/questoes_*.py` e execute `python3 tools/gerar_seed.py`

## Nota
Esta é uma plataforma de treino independente. Não use logótipos ou insígnias oficiais (ENAPP, MAPTSS, República de Angola) sem autorização.
