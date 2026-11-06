# -*- coding: utf-8 -*-
"""Gera supabase/04_mais_questoes.sql (pode ser executado mais do que uma vez: não duplica)."""
import json, random, os, sys
sys.path.insert(0, os.path.dirname(__file__))
from questoes_extra import NOVAS_CATEGORIAS, EXTRA, COMPORTAMENTAL, CULTURA_GERAL, PSICO_EXTRA
from questoes_conhecimento import CONHECIMENTO

rng = random.Random(1111)
q = lambda s: "'" + str(s).replace("'", "''") + "'"

def ins(tipo, area, cat, enun, cor, dis):
    ops = [cor] + list(dis); rng.shuffle(ops)
    catsql = "null" if cat is None else f"(select id from public.categorias where nome = {q(cat)})"
    cond = "categoria_id is null" if cat is None else f"categoria_id = {catsql}"
    return (f"insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)\n"
            f"select {q(tipo)}, {q(area)}, {catsql}, {q(enun)}, {q(json.dumps(ops, ensure_ascii=False))}::jsonb, {ops.index(cor)}\n"
            f"where not exists (select 1 from public.questoes where tipo = {q(tipo)} and enunciado = {q(enun)} and {cond});")

out = ["-- Mais questões e novas categorias (gerado por tools/gerar_extra.py)",
       "-- Executar DEPOIS de 01 e 02. Pode ser executado de novo sem duplicar questões.", ""]
for nome, desc in NOVAS_CATEGORIAS.items():
    out.append(f"insert into public.categorias (nome, descricao) values ({q(nome)}, {q(desc)}) on conflict (nome) do nothing;")
out.append("")
todas = list(CONHECIMENTO.keys()) + list(NOVAS_CATEGORIAS.keys())
n = 0
for cat, lista in EXTRA.items():
    for a, e, c, d in lista: out.append(ins("conhecimento", a, cat, e, c, d)); n += 1
for cat in todas:
    for a, e, c, d in COMPORTAMENTAL + CULTURA_GERAL: out.append(ins("conhecimento", a, cat, e, c, d)); n += 1
for a, e, c, d in PSICO_EXTRA: out.append(ins("psico", a, None, e, c, d)); n += 1
dest = os.path.join(os.path.dirname(__file__), "..", "supabase", "04_mais_questoes.sql")
open(dest, "w", encoding="utf-8").write("\n".join(out) + "\n")
tot = {c: len(CONHECIMENTO.get(c, [])) + len(EXTRA.get(c, [])) + len(COMPORTAMENTAL) + len(CULTURA_GERAL) for c in todas}
print("instruções:", n); print("questões por categoria após 04:", tot); print("psico extra:", len(PSICO_EXTRA))
