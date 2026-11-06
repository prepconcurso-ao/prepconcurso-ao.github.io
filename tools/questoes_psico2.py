# -*- coding: utf-8 -*-
"""Terceira vaga de questões psicotécnicas (geradas por regras + verbais manuais)."""
import random, string

RL, AV, AN, AC, ML = "Raciocínio Lógico", "Aptidão Verbal", "Aptidão Numérica", "Atenção e Concentração", "Matemática Lógica"
DIAS = ["segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado", "domingo"]

VERBAIS = [
    ("sinónimo", "abolir", "Suprimir", ["Aumentar", "Admitir", "Aplaudir"]),
    ("sinónimo", "anuência", "Consentimento", ["Recusa", "Ausência", "Anúncio"]),
    ("sinónimo", "astuto", "Esperto", ["Ingénuo", "Lento", "Assustado"]),
    ("sinónimo", "cauteloso", "Prudente", ["Imprudente", "Apressado", "Distraído"]),
    ("sinónimo", "conciso", "Breve", ["Prolixo", "Confuso", "Extenso"]),
    ("sinónimo", "dádiva", "Oferta", ["Dívida", "Cobrança", "Castigo"]),
    ("sinónimo", "êxito", "Sucesso", ["Saída", "Fracasso", "Excesso"]),
    ("sinónimo", "fidedigno", "Confiável", ["Falso", "Duvidoso", "Fiel ao chefe"]),
    ("sinónimo", "inerente", "Próprio", ["Exterior", "Inerte", "Alheio"]),
    ("sinónimo", "lacónico", "Sucinto", ["Falador", "Lento", "Lamentoso"]),
    ("sinónimo", "magnânimo", "Generoso", ["Mesquinho", "Enorme", "Magoado"]),
    ("sinónimo", "nocivo", "Prejudicial", ["Benéfico", "Novo", "Noturno"]),
    ("sinónimo", "obsoleto", "Ultrapassado", ["Moderno", "Obrigatório", "Observado"]),
    ("sinónimo", "pernicioso", "Danoso", ["Útil", "Pequeno", "Perigoso de cair"]),
    ("sinónimo", "ratificar", "Confirmar", ["Corrigir", "Anular", "Riscar"]),
    ("sinónimo", "sensato", "Ponderado", ["Insensato", "Sensível", "Sentado"]),
    ("sinónimo", "tácito", "Implícito", ["Expresso", "Tático", "Barulhento"]),
    ("sinónimo", "volátil", "Instável", ["Firme", "Voador", "Pesado"]),
    ("sinónimo", "zelo", "Cuidado", ["Descuido", "Inveja", "Zanga"]),
    ("antónimo", "abundância", "Escassez", ["Fartura", "Riqueza", "Excesso"]),
    ("antónimo", "ativo", "Passivo", ["Dinâmico", "Enérgico", "Rápido"]),
    ("antónimo", "bonança", "Tempestade", ["Calmaria", "Paz", "Sossego"]),
    ("antónimo", "cético", "Crédulo", ["Desconfiado", "Duvidoso", "Céptico"]),
    ("antónimo", "dócil", "Rebelde", ["Manso", "Obediente", "Meigo"]),
    ("antónimo", "explícito", "Implícito", ["Claro", "Evidente", "Expresso"]),
    ("antónimo", "frugal", "Esbanjador", ["Moderado", "Simples", "Comedido"]),
    ("antónimo", "honesto", "Desonesto", ["Íntegro", "Sincero", "Leal"]),
    ("antónimo", "incluir", "Excluir", ["Inserir", "Abranger", "Juntar"]),
    ("antónimo", "lícito", "Ilícito", ["Legal", "Permitido", "Válido"]),
    ("antónimo", "progresso", "Retrocesso", ["Avanço", "Evolução", "Desenvolvimento"]),
    ("antónimo", "sóbrio", "Embriagado", ["Moderado", "Sério", "Simples"]),
    ("antónimo", "transparente", "Opaco", ["Claro", "Límpido", "Translúcido"]),
    ("antónimo", "unir", "Separar", ["Juntar", "Ligar", "Agregar"]),
    ("antónimo", "vulnerável", "Invulnerável", ["Frágil", "Exposto", "Fraco"]),
]

ANALOGIAS = [
    ("Pássaro está para ninho assim como abelha está para:", "Colmeia", ["Flor", "Mel", "Ferrão"]),
    ("Juiz está para tribunal assim como professor está para:", "Escola", ["Aluno", "Giz", "Exame"]),
    ("Água está para sede assim como comida está para:", "Fome", ["Prato", "Cozinha", "Sal"]),
    ("Olho está para ver assim como ouvido está para:", "Ouvir", ["Falar", "Cheirar", "Música"]),
    ("Semana está para dia assim como ano está para:", "Mês", ["Século", "Hora", "Calendário"]),
    ("Kwanza está para Angola assim como Rand está para:", "África do Sul", ["Namíbia", "Moçambique", "Zâmbia"]),
    ("Luanda está para Angola assim como Maputo está para:", "Moçambique", ["Cabo Verde", "Zâmbia", "Tanzânia"]),
    ("Escritor está para livro assim como compositor está para:", "Música", ["Piano", "Palco", "Plateia"]),
    ("Termómetro está para temperatura assim como balança está para:", "Peso", ["Altura", "Tempo", "Volume"]),
    ("Médico está para diagnóstico assim como engenheiro está para:", "Projeto", ["Hospital", "Paciente", "Receita"]),
    ("Pé está para perna assim como mão está para:", "Braço", ["Dedo", "Luva", "Unha"]),
    ("Leão está para juba assim como elefante está para:", "Tromba", ["Savana", "Marfim no chão", "Cauda curta"]),
]

FRASES = [
    "o funcionário publico deve servir o cidadao com zelo",
    "a avaliacao psicotecnica mede o raciocinio e a atencao",
    "o centro de ciencia de luanda abriu concurso publico",
    "preparar com tempo aumenta a confianca no exame",
    "a escola nacional de administracao forma quadros",
    "os candidatos devem ler cada pergunta com cuidado",
]


def fmt(n):
    if isinstance(n, float) and not n.is_integer():
        return f"{n:.2f}".rstrip("0").rstrip(".").replace(".", ",")
    return str(int(n))


def dn(rng, c, passo=1, k=3):
    out, seen = [], {c}
    cand = [c + passo * d for d in (-3, -2, -1, 1, 2, 3, 4)]
    rng.shuffle(cand)
    for x in cand:
        if x not in seen and x >= 0:
            seen.add(x); out.append(x)
        if len(out) == k: break
    return out


def gerar(rng):
    q = []
    # ---- Verbais
    for tipo, pal, cor, dis in VERBAIS:
        q.append((AV, f"Qual é o {tipo} de «{pal}»?", cor, dis))
    for en, cor, dis in ANALOGIAS:
        q.append((AV, en, cor, dis))

    # ---- Séries numéricas variadas (Aptidão Numérica)
    for _ in range(8):  # diferenças crescentes
        a, d0 = rng.randint(1, 10), rng.randint(1, 4)
        s = [a]
        for i in range(5): s.append(s[-1] + d0 + i)
        nxt = s[-1] + d0 + 5
        q.append((AN, f"Qual é o próximo número? {', '.join(map(str, s))}, ?", nxt, dn(rng, nxt)))
    for _ in range(6):  # duas sequências intercaladas
        a, b, x, y = rng.randint(1, 9), rng.randint(20, 40), rng.randint(2, 5), rng.randint(1, 3)
        s = []
        for i in range(4): s += [a + i * x, b - i * y]
        nxt = a + 4 * x
        q.append((AN, f"Qual é o próximo número? {', '.join(map(str, s))}, ?", nxt, dn(rng, nxt) [:2] + [b - 4 * y]))
    for _ in range(6):  # ×k + c
        a, k, c = rng.randint(1, 4), rng.choice([2, 3]), rng.randint(1, 3)
        s = [a]
        for i in range(4): s.append(s[-1] * k + c)
        nxt = s[-1] * k + c
        q.append((AN, f"Qual é o próximo número? {', '.join(map(str, s))}, ?", nxt, dn(rng, nxt, passo=c + 1)))
    primos = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43]
    for i in range(3):
        s = primos[i:i + 5]; nxt = primos[i + 5]
        q.append((AN, f"Qual é o próximo número? {', '.join(map(str, s))}, ?", nxt, [nxt + 1, nxt + 2, nxt - 1]))
    for _ in range(4):  # cubos
        st = rng.randint(1, 4); s = [(st + i) ** 3 for i in range(4)]; nxt = (st + 4) ** 3
        q.append((AN, f"Qual é o próximo número? {', '.join(map(str, s))}, ?", nxt, dn(rng, nxt, passo=7)))
    for _ in range(6):  # número diferente
        k = rng.choice([3, 4, 6, 7, 9]); mult = rng.sample(range(2, 15), 4)
        nums = [k * m for m in mult]; intruso = k * rng.randint(3, 12) + rng.randint(1, k - 1)
        todos = nums[:3] + [intruso]; rng.shuffle(todos)
        q.append((AN, f"Qual dos números NÃO é múltiplo de {k}? {', '.join(map(str, todos))}", intruso,
                  [n for n in todos if n != intruso]))
    for _ in range(6):  # analogia numérica
        f = rng.choice([("quadrado", lambda x: x * x), ("dobro mais um", lambda x: 2 * x + 1), ("triplo", lambda x: 3 * x)])
        xs = rng.sample(range(2, 9), 3)
        cor = f[1](xs[2])
        q.append((RL, f"Se {xs[0]} → {f[1](xs[0])} e {xs[1]} → {f[1](xs[1])}, então {xs[2]} → ?", cor, dn(rng, cor, passo=2)))

    # ---- Matemática lógica (problemas)
    for _ in range(6):  # desconto
        p = rng.choice([8000, 12000, 15000, 24000, 30000, 45000]); d = rng.choice([10, 15, 20, 25, 30])
        cor = p * (100 - d) // 100
        q.append((ML, f"Um artigo custa {fmt(p)} Kz e tem {d}% de desconto. Quanto se paga?", f"{fmt(cor)} Kz",
                  [f"{fmt(x)} Kz" for x in (p * d // 100, cor - 1000, cor + 500)]))
    for _ in range(5):  # média em falta
        n = 4; alvo = rng.randint(12, 16); notas = [rng.randint(10, 18) for _ in range(n - 1)]
        falta = alvo * n - sum(notas)
        if not 0 <= falta <= 20: continue
        q.append((ML, f"Um candidato teve {', '.join(map(str, notas))} em três provas. Quanto precisa na quarta para ficar com média {alvo}?",
                  falta, dn(rng, falta)))
    for _ in range(5):  # idades
        f = rng.randint(5, 15); k = rng.choice([2, 3, 4]); p = f * k; soma = f + p
        q.append((ML, f"O pai tem {k} vezes a idade do filho e a soma das idades é {soma}. Que idade tem o filho?", f, dn(rng, f)))
    for _ in range(5):  # horas
        h, m = rng.randint(7, 15), rng.choice([0, 15, 20, 30, 40, 45]); dh, dm = rng.randint(0, 3), rng.choice([10, 25, 35, 50])
        tot = h * 60 + m + dh * 60 + dm
        cor = f"{tot // 60}h{tot % 60:02d}"
        alt = [f"{(tot + d) // 60}h{(tot + d) % 60:02d}" for d in (-10, 10, 60)]
        q.append((ML, f"Uma reunião começa às {h}h{m:02d} e dura {dh}h{dm:02d}. A que horas termina?", cor, alt))
    for _ in range(5):  # calendário
        hoje = rng.randrange(7); n = rng.randint(9, 40)
        cor = DIAS[(hoje + n) % 7].capitalize()
        dis = [DIAS[(hoje + n + d) % 7].capitalize() for d in (1, -1, 2)]
        q.append((RL, f"Hoje é {DIAS[hoje]}. Que dia da semana será daqui a {n} dias?", cor, dis))
    for _ in range(4):  # proporção
        a, b = rng.randint(2, 6), rng.randint(2, 6); tot = (a + b) * rng.randint(5, 20)
        cor = tot * a // (a + b)
        q.append((ML, f"Dividir {tot} Kz entre duas pessoas na razão {a}:{b}. Quanto recebe a primeira?", f"{cor} Kz",
                  [f"{x} Kz" for x in (tot * b // (a + b), cor + (a + b), cor - (a + b), tot // 2 + 7)]))

    # ---- Raciocínio lógico: letras e códigos
    alf = string.ascii_uppercase
    for _ in range(6):  # código por deslocamento
        k = rng.choice([1, 2, 3]); w1, w2 = rng.sample(["CASA", "MESA", "LIVRO", "PORTA", "ALUNO", "TESTE", "PROVA", "NOTA", "MAPA"], 2)
        enc = lambda w: "".join(alf[(alf.index(ch) + k) % 26] for ch in w)
        cor = enc(w2)
        alt = ["".join(alf[(alf.index(ch) + k + d) % 26] for ch in w2) for d in (1, -1)] + [enc(w2)[::-1] if enc(w2)[::-1] != cor else w2]
        q.append((RL, f"Num código, {w1} escreve-se {enc(w1)}. Como se escreve {w2}?", cor, alt))
    for _ in range(5):  # letras alternadas
        s0, p1 = rng.randint(0, 5), rng.randint(2, 3)
        seq = [alf[s0 + i * p1] + str(i + 1) for i in range(4)]
        cor = alf[s0 + 4 * p1] + "5"
        q.append((RL, f"Complete: {', '.join(seq)}, ?", cor, [alf[s0 + 4 * p1 + 1] + "5", alf[s0 + 4 * p1] + "6", alf[s0 + 3 * p1] + "5"]))

    # ---- Atenção e concentração
    for _ in range(8):  # contar letra numa cadeia
        alvo = rng.choice("BDPQ"); outros = [c for c in "BDPQRO" if c != alvo]
        n = rng.randint(4, 9); lst = [alvo] * n + [rng.choice(outros) for _ in range(rng.randint(12, 18))]
        rng.shuffle(lst)
        q.append((AC, f"Quantas vezes aparece a letra {alvo}? {' '.join(lst)}", n, dn(rng, n)))
    for _ in range(6):  # pares iguais
        pares, iguais = [], 0
        for _ in range(5):
            a = "".join(rng.choice("0123456789") for _ in range(6))
            if rng.random() < 0.5:
                b = a; iguais += 1
            else:
                i = rng.randrange(6); b = a[:i] + rng.choice([d for d in "0123456789" if d != a[i]]) + a[i + 1:]
            pares.append(f"{a}–{b}")
        q.append((AC, f"Quantos pares são exatamente iguais? {' · '.join(pares)}", iguais, dn(rng, iguais)))
    for _ in range(6):  # contar vogais numa frase
        fr = rng.choice(FRASES); v = rng.choice("aeo"); n = fr.count(v)
        q.append((AC, f"Quantas vezes aparece a letra «{v}» no texto (escrito sem acentos): «{fr}»?", n, dn(rng, n)))
    for _ in range(5):  # menor número
        nums = rng.sample(range(10000, 99999), 4)
        q.append((AC, f"Qual é o MENOR número? {'  '.join(map(str, nums))}", min(nums), [x for x in nums if x != min(nums)]))
    for _ in range(5):  # ordem alfabética
        nomes = rng.sample(["Mateus", "Manuel", "Marta", "Mário", "Marcos", "Mafalda", "Miguel", "Moisés", "Mbala", "Madalena"], 4)
        cor = sorted(nomes, key=lambda s: s.lower().replace("á", "a").replace("é", "e"))[0]
        q.append((AC, f"Qual nome vem primeiro por ordem alfabética? {', '.join(nomes)}", cor, [n for n in nomes if n != cor]))

    final = []
    for area, en, cor, dis in q:
        ct = cor if isinstance(cor, str) else fmt(cor)
        dt = []
        for d in dis:
            t = d if isinstance(d, str) else fmt(d)
            if t != ct and t not in dt: dt.append(t)
        k = 1
        while len(dt) < 3 and not isinstance(cor, str):
            t = fmt(cor + 5 * k); k += 1
            if t != ct and t not in dt: dt.append(t)
        if len(dt) >= 3: final.append((area, en, ct, dt[:3]))
    return final
