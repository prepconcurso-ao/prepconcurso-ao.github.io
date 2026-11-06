# -*- coding: utf-8 -*-
"""Gera supabase/02_seed_questoes.sql a partir das listas de questões.
Uso:  python3 tools/gerar_seed.py"""
import json, random, os, sys
sys.path.insert(0, os.path.dirname(__file__))
from questoes_psico import MANUAIS, gerar
from questoes_conhecimento import CONHECIMENTO

rng = random.Random(2026)


def sql_txt(s):
    return "'" + str(s).replace("'", "''") + "'"


def linha(tipo, area, cat_nome, enunciado, correta, distratores):
    opcoes = [correta] + list(distratores)
    rng.shuffle(opcoes)
    idx = opcoes.index(correta)
    cat = "null" if cat_nome is None else f"(select id from public.categorias where nome = {sql_txt(cat_nome)})"
    return (f"({sql_txt(tipo)}, {sql_txt(area)}, {cat}, {sql_txt(enunciado)}, "
            f"{sql_txt(json.dumps(opcoes, ensure_ascii=False))}::jsonb, {idx})")


psico = list(MANUAIS) + gerar(rng)
linhas = [linha("psico", a, None, e, c, d) for a, e, c, d in psico]
for cat, lista in CONHECIMENTO.items():
    linhas += [linha("conhecimento", a, cat, e, c, d) for a, e, c, d in lista]

saida = os.path.join(os.path.dirname(__file__), "..", "supabase", "02_seed_questoes.sql")
with open(saida, "w", encoding="utf-8") as f:
    f.write("-- Banco de questões inicial (gerado por tools/gerar_seed.py)\n")
    f.write("-- Executar DEPOIS de 01_schema.sql\n\n")
    f.write("insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta) values\n")
    f.write(",\n".join(linhas) + ";\n")

from collections import Counter
print("Psicotécnico:", len(psico), dict(Counter(a for a, *_ in psico)))
print("Conhecimentos:", {k: len(v) for k, v in CONHECIMENTO.items()})
