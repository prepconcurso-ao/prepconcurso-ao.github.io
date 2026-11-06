# -*- coding: utf-8 -*-
"""Questões psicotécnicas: escritas à mão + geradas por regras.
Formato: (area, enunciado, resposta_correta, [distratores])"""
import random, string

RL = "Raciocínio Lógico"
AV = "Aptidão Verbal"
AN = "Aptidão Numérica"
AC = "Atenção e Concentração"
ML = "Matemática Lógica"

MANUAIS = [
    # ---------------- Raciocínio Lógico ----------------
    (RL, "Todos os técnicos são funcionários. Alguns funcionários são formadores. Logo:",
     "Nada se pode concluir com certeza sobre técnicos serem formadores",
     ["Todos os técnicos são formadores", "Nenhum técnico é formador", "Todos os formadores são técnicos"]),
    (RL, "Se chove, a estrada fica molhada. A estrada não está molhada. Logo:",
     "Não choveu", ["Choveu", "Pode ter chovido", "A estrada secou depois da chuva"]),
    (RL, "Ana é mais alta que Bela. Bela é mais alta que Carla. Quem é a mais baixa?",
     "Carla", ["Ana", "Bela", "Não é possível saber"]),
    (RL, "Pedro chegou antes de João e depois de Maria. Quem chegou primeiro?",
     "Maria", ["Pedro", "João", "Chegaram juntos"]),
    (RL, "Nenhum peixe é mamífero. A baleia é mamífero. Logo:",
     "A baleia não é peixe", ["A baleia é peixe", "Alguns mamíferos são peixes", "Nenhum mamífero vive no mar"]),
    (RL, "Médico está para hospital assim como professor está para:",
     "Escola", ["Livro", "Aluno", "Quadro"]),
    (RL, "Pé está para sapato assim como mão está para:",
     "Luva", ["Dedo", "Anel", "Braço"]),
    (RL, "Qual das palavras NÃO pertence ao grupo? Luanda, Benguela, Huambo, Lisboa",
     "Lisboa", ["Luanda", "Benguela", "Huambo"]),
    (RL, "Qual dos elementos NÃO pertence ao grupo? Quadrado, Triângulo, Círculo, Cubo",
     "Cubo", ["Quadrado", "Triângulo", "Círculo"]),
    (RL, "Se hoje é quarta-feira, que dia da semana será daqui a 10 dias?",
     "Sábado", ["Sexta-feira", "Domingo", "Quinta-feira"]),
    (RL, "Se ontem foi domingo, que dia será depois de amanhã?",
     "Quarta-feira", ["Terça-feira", "Segunda-feira", "Quinta-feira"]),
    (RL, "Num grupo, todos os que falam inglês também falam francês. O Carlos não fala francês. Então o Carlos:",
     "Não fala inglês", ["Fala inglês", "Fala apenas português", "Pode falar inglês"]),
    (RL, "Uma afirmação equivalente a «Se estudo, então passo» é:",
     "Se não passo, então não estudei", ["Se passo, então estudei", "Se não estudo, não passo", "Estudo e não passo"]),
    (RL, "A negação de «Todos os candidatos foram aprovados» é:",
     "Pelo menos um candidato não foi aprovado", ["Nenhum candidato foi aprovado",
      "Todos os candidatos foram reprovados", "Alguns candidatos foram aprovados"]),
    (RL, "Cinco amigos sentam-se em fila. O Rui está no meio. A Sara está à esquerda do Rui, encostada a ele. Quantas pessoas estão à direita da Sara?",
     "3", ["2", "1", "4"]),
    (RL, "Um relógio marca 3h15. Qual o menor ângulo entre os ponteiros?",
     "7,5°", ["0°", "15°", "30°"]),
    (RL, "Se A > B, B > C e C > D, qual afirmação é necessariamente verdadeira?",
     "A > D", ["D > B", "C > A", "B = C"]),
    (RL, "Livro está para ler assim como faca está para:",
     "Cortar", ["Cozinha", "Garfo", "Metal"]),

    # ---------------- Aptidão Verbal ----------------
    (AV, "Qual é o sinónimo de «célere»?", "Rápido", ["Lento", "Famoso", "Pesado"]),
    (AV, "Qual é o sinónimo de «exíguo»?", "Escasso", ["Abundante", "Exigente", "Enorme"]),
    (AV, "Qual é o sinónimo de «íntegro»?", "Honesto", ["Inteiro de tamanho", "Inteligente", "Interno"]),
    (AV, "Qual é o sinónimo de «efémero»?", "Passageiro", ["Eterno", "Eficaz", "Feminino"]),
    (AV, "Qual é o sinónimo de «perspicaz»?", "Sagaz", ["Distraído", "Persistente", "Preguiçoso"]),
    (AV, "Qual é o antónimo de «escasso»?", "Abundante", ["Raro", "Pouco", "Limitado"]),
    (AV, "Qual é o antónimo de «ascender»?", "Descer", ["Subir", "Acender", "Elevar"]),
    (AV, "Qual é o antónimo de «prolixo»?", "Conciso", ["Extenso", "Confuso", "Prolongado"]),
    (AV, "Qual é o antónimo de «benévolo»?", "Malévolo", ["Bondoso", "Generoso", "Amável"]),
    (AV, "Indique a palavra escrita corretamente:", "Exceção", ["Excessão", "Exeção", "Esceção"]),
    (AV, "Indique a palavra escrita corretamente:", "Privilégio", ["Previlégio", "Privilégeo", "Previlégeo"]),
    (AV, "Indique a palavra escrita corretamente:", "Paralisar", ["Paralizar", "Paralisár", "Paraliçar"]),
    (AV, "Indique a frase correta:", "Houve muitos problemas na reunião.",
     ["Houveram muitos problemas na reunião.", "Ouve muitos problemas na reunião.", "Houveram muito problemas na reunião."]),
    (AV, "Indique a frase correta:", "Fazem dois anos que o concurso abriu? Não: faz dois anos que o concurso abriu.",
     ["Fazem dois anos que o concurso abriu.", "Fazem-se dois anos que o concurso abriu.", "Fizeram dois anos que o concurso abriu."]),
    (AV, "Na frase «O candidato entregou os documentos», o sujeito é:",
     "O candidato", ["entregou", "os documentos", "Sujeito indeterminado"]),
    (AV, "Qual destas palavras é um verbo?", "Avaliar", ["Avaliação", "Avaliador", "Avaliativo"]),
    (AV, "O plural de «cidadão» é:", "Cidadãos", ["Cidadões", "Cidadães", "Cidadãoes"]),
    (AV, "O plural de «pão» é:", "Pães", ["Pãos", "Pões", "Pãoes"]),
    (AV, "Qual palavra NÃO pertence ao grupo? Alegre, Contente, Feliz, Triste",
     "Triste", ["Alegre", "Contente", "Feliz"]),
    (AV, "Complete: «Os funcionários ____ à reunião às 9h.»", "chegaram", ["chegou", "chegarão-se", "chegaste"]),
    (AV, "«Ratificar» significa:", "Confirmar", ["Corrigir", "Anular", "Rasurar"]),
    (AV, "«Retificar» significa:", "Corrigir", ["Confirmar", "Repetir", "Retirar"]),
    (AV, "«Eminente» significa:", "Ilustre, notável", ["Que está para acontecer", "Que emigrou", "Escondido"]),
    (AV, "«Iminente» significa:", "Que está prestes a acontecer", ["Ilustre", "Imune", "Imóvel"]),
    (AV, "Qual destas palavras é acentuada como palavra esdrúxula (proparoxítona)?",
     "Público", ["Café", "Saúde", "Também"]),

    # ---------------- Aptidão Numérica (manuais) ----------------
    (AN, "Um artigo custava 40 000 Kz e passou a custar 46 000 Kz. Qual foi o aumento percentual?",
     "15%", ["6%", "12%", "20%"]),
    (AN, "Um salário de 150 000 Kz sofre um desconto de 3%. Qual é o valor do desconto?",
     "4 500 Kz", ["3 000 Kz", "4 000 Kz", "5 000 Kz"]),
    (AN, "Qual é a média de 12, 15, 18 e 23?", "17", ["16", "18", "17,5"]),
    (AN, "Quanto é 3/4 de 240?", "180", ["160", "200", "120"]),
    (AN, "Quanto é 0,25 × 0,4?", "0,1", ["1", "0,01", "0,65"]),

    # ---------------- Atenção e Concentração (manuais) ----------------
    (AC, "Quantas vezes aparece a letra «i» na palavra «administração»?",
     "2", ["1", "3", "4"]),
    (AC, "Qual das sequências é DIFERENTE das outras? ",
     "AB-123-CD", ["AB-132-CD", "AB-132-CD", "AB-132-CD"]),  # substituída abaixo por geração

    # ---------------- Matemática Lógica ----------------
    (ML, "Se 3 técnicos fazem um trabalho em 6 dias, quantos dias levam 6 técnicos, ao mesmo ritmo?",
     "3 dias", ["12 dias", "2 dias", "4 dias"]),
    (ML, "O pai tem o triplo da idade do filho. Juntos têm 48 anos. Qual a idade do filho?",
     "12 anos", ["16 anos", "10 anos", "14 anos"]),
    (ML, "Numa sala há 30 candidatos; 18 são mulheres. Que percentagem são homens?",
     "40%", ["60%", "12%", "45%"]),
    (ML, "Se 2x + 5 = 21, quanto vale x?", "8", ["13", "16", "7"]),
    (ML, "Um comboio percorre 240 km em 3 horas. Qual a velocidade média?",
     "80 km/h", ["60 km/h", "72 km/h", "90 km/h"]),
    (ML, "Uma torneira enche um tanque em 4 h e outra em 12 h. Abertas juntas, em quanto tempo enchem o tanque?",
     "3 h", ["8 h", "6 h", "2 h"]),
    (ML, "Quantos apertos de mão acontecem quando 6 pessoas se cumprimentam todas uma única vez?",
     "15", ["12", "30", "36"]),
    (ML, "Numa gaveta há 5 meias pretas e 5 brancas. Às escuras, quantas tem de tirar para garantir um par da mesma cor?",
     "3", ["2", "6", "5"]),
    (ML, "O dobro de um número mais o seu triplo dá 75. Que número é?", "15", ["25", "10", "18"]),
    (ML, "Um preço sobe 10% e depois desce 10%. Em relação ao preço inicial, o preço final é:",
     "1% menor", ["Igual", "1% maior", "10% menor"]),
    (ML, "Quantos números inteiros existem de 15 a 40, inclusive?", "26", ["25", "24", "27"]),
    (ML, "Uma corda de 36 m é cortada em pedaços de 4 m. Quantos cortes são necessários?",
     "8", ["9", "10", "7"]),
    (ML, "Qual a probabilidade de sair um número par num dado de 6 faces?",
     "1/2", ["1/3", "1/6", "2/3"]),
    (ML, "Se 5 canetas custam 750 Kz, quanto custam 8 canetas?", "1 200 Kz", ["1 000 Kz", "1 350 Kz", "1 150 Kz"]),
    (ML, "A soma de três números consecutivos é 63. Qual é o maior?", "22", ["21", "20", "23"]),
]

# remove itens de exemplo substituídos por geração
MANUAIS = [m for m in MANUAIS if not m[1].startswith("Qual das sequências é DIFERENTE")]
MANUAIS = [m for m in MANUAIS if not m[2].startswith("Fazem dois anos")]


def fmt(n):
    """Formata número em estilo angolano/português (vírgula decimal)."""
    if isinstance(n, float) and not n.is_integer():
        return f"{n:.2f}".rstrip("0").rstrip(".").replace(".", ",")
    return str(int(n))


def distratores_num(rng, correta, k=3, passo=None):
    passo = passo or max(1, abs(int(correta)) // 10 or 1)
    vistos, out = {correta}, []
    cand = [correta + d * passo for d in (-3, -2, -1, 1, 2, 3, 4)]
    rng.shuffle(cand)
    for c in cand:
        if c not in vistos and c >= 0:
            vistos.add(c); out.append(c)
        if len(out) == k: break
    return out


def gerar(rng):
    q = []
    # --- Sequências numéricas (Aptidão Numérica) ---
    for _ in range(10):
        a, r = rng.randint(2, 20), rng.randint(3, 12)
        seq = [a + i * r for i in range(5)]
        q.append((AN, f"Complete a sequência: {', '.join(map(str, seq))}, ?", seq[-1] + r,
                  distratores_num(rng, seq[-1] + r, passo=rng.choice([1, 2, r // 2 or 1]))))
    for _ in range(5):
        a, r = rng.randint(1, 5), rng.choice([2, 3])
        seq = [a * r ** i for i in range(5)]
        q.append((AN, f"Complete a sequência: {', '.join(map(str, seq))}, ?", seq[-1] * r,
                  distratores_num(rng, seq[-1] * r, passo=seq[-1] // 2)))
    for _ in range(4):
        s = rng.randint(1, 6)
        seq = [(s + i) ** 2 for i in range(5)]
        nxt = (s + 5) ** 2
        q.append((AN, f"Complete a sequência: {', '.join(map(str, seq))}, ?", nxt, distratores_num(rng, nxt, passo=3)))
    for _ in range(4):
        a, b = rng.randint(1, 5), rng.randint(1, 6)
        seq = [a, b]
        while len(seq) < 7: seq.append(seq[-1] + seq[-2])
        q.append((AN, f"Complete a sequência: {', '.join(map(str, seq[:6]))}, ?", seq[6], distratores_num(rng, seq[6], passo=2)))
    for _ in range(4):  # alternada: +x, -y
        a, x, y = rng.randint(10, 30), rng.randint(4, 9), rng.randint(1, 3)
        seq = [a]
        for i in range(6): seq.append(seq[-1] + (x if i % 2 == 0 else -y))
        q.append((AN, f"Complete a sequência: {', '.join(map(str, seq[:6]))}, ?", seq[6], distratores_num(rng, seq[6], passo=1)))
    # --- Percentagens e regra de três (Aptidão Numérica) ---
    for _ in range(5):
        base = rng.choice([200, 400, 800, 1200, 2500, 5000, 12000])
        p = rng.choice([5, 10, 15, 20, 25, 30, 40])
        c = base * p // 100
        q.append((AN, f"Quanto é {p}% de {base}?", c, distratores_num(rng, c, passo=max(1, c // 5))))

    # --- Matemática lógica: operações e equações ---
    for _ in range(6):
        x = rng.randint(3, 15); a = rng.randint(2, 7); b = rng.randint(1, 20)
        c = a * x + b
        q.append((ML, f"Se {a}x + {b} = {c}, qual é o valor de x?", x, distratores_num(rng, x, passo=1)))
    for _ in range(4):
        a, b, c = rng.randint(2, 9), rng.randint(2, 9), rng.randint(2, 9)
        r = a + b * c
        q.append((ML, f"Qual o resultado de {a} + {b} × {c}?", r, [(a + b) * c if (a + b) * c != r else r + 7, r + 1, r - 2]))

    # --- Raciocínio lógico: sequências de letras ---
    alf = string.ascii_uppercase
    for _ in range(8):
        s, p = rng.randint(0, 6), rng.randint(2, 4)
        seq = [alf[s + i * p] for i in range(4)]
        corr = alf[s + 4 * p]
        dis = sorted({alf[min(25, s + 4 * p + d)] for d in (-1, 1, 2)} - {corr})[:3]
        while len(dis) < 3: dis.append(alf[(s + 4 * p + 3 + len(dis)) % 26])
        q.append((RL, f"Qual letra continua a sequência: {', '.join(seq)}, ?", corr, dis))

    # --- Atenção e Concentração ---
    for _ in range(8):  # código diferente
        base = "".join(rng.choice("ABCDEFGHJKLMNPRSTUVXZ23456789") for _ in range(7))
        i = rng.randint(1, 6)
        troca = rng.choice([c for c in "ABCDEFGHJKLMNPRSTUVXZ23456789" if c != base[i]])
        dif = base[:i] + troca + base[i + 1:]
        q.append((AC, "Qual dos códigos é DIFERENTE dos restantes?", dif, [base, base + " ", " " + base]))
    for _ in range(8):  # contar símbolo
        alvo = rng.choice("★●▲■")
        outros = [s for s in "★●▲■" if s != alvo]
        n = rng.randint(4, 9)
        lst = [alvo] * n + [rng.choice(outros) for _ in range(rng.randint(10, 16))]
        rng.shuffle(lst)
        q.append((AC, f"Quantas vezes aparece o símbolo {alvo} na linha?  {' '.join(lst)}", n,
                  distratores_num(rng, n, passo=1)))
    for _ in range(6):  # contar letra numa frase
        frase = rng.choice([
            "a administração pública serve o cidadão",
            "o candidato apresentou a candidatura a tempo",
            "formação profissional para o emprego jovem",
            "o orçamento geral do estado foi aprovado",
            "a avaliação de desempenho é anual",
            "concurso público de ingresso na carreira",
        ])
        letra = rng.choice([c for c in "aeoirs" if frase.count(c) >= 3])
        n = frase.count(letra)
        q.append((AC, f"Quantas vezes aparece a letra «{letra}» na frase: «{frase}»?", n, distratores_num(rng, n, passo=1)))
    for _ in range(6):  # números em ordem / maior número
        nums = rng.sample(range(1000, 9999), 4)
        q.append((AC, f"Qual é o MAIOR número? {'  '.join(map(str, nums))}", max(nums),
                  [n for n in nums if n != max(nums)]))

    # converter respostas numéricas em texto e eliminar distratores repetidos
    final = []
    for area, en, cor, dis in q:
        cor_t = cor if isinstance(cor, str) else fmt(cor)
        dis_t = []
        for d in dis:
            t = d if isinstance(d, str) else fmt(d)
            if t != cor_t and t not in dis_t: dis_t.append(t)
        k = 1
        while len(dis_t) < 3 and not isinstance(cor, str):
            t = fmt(cor + 10 * k); k += 1
            if t not in dis_t and t != cor_t: dis_t.append(t)
        if len(dis_t) < 3: continue
        final.append((area, en, cor_t, dis_t[:3]))
    return final
