-- Mais questões e novas categorias (gerado por tools/gerar_extra.py)
-- Executar DEPOIS de 01 e 02. Pode ser executado de novo sem duplicar questões.

insert into public.categorias (nome, descricao) values ('Ciências Biológicas e Químicas', 'Biologia, Química, Engenharia Química e Ciências Físicas e Biológicas (CCL e outros)') on conflict (nome) do nothing;
insert into public.categorias (nome, descricao) values ('Física, Matemática e Geociências', 'Física, Física Nuclear, Matemática, Geologia e Engenharia de Minas') on conflict (nome) do nothing;
insert into public.categorias (nome, descricao) values ('Eletrónica, Telecomunicações e Eletricidade', 'Eletrónica, Telecomunicações, Mecatrónica, Eletricidade e Automação') on conflict (nome) do nothing;
insert into public.categorias (nome, descricao) values ('Comunicação Social e Jornalismo', 'Comunicação Social, Jornalismo e Comunicação de Ciência') on conflict (nome) do nothing;
insert into public.categorias (nome, descricao) values ('Economia, Gestão e Marketing', 'Economia, Gestão de Empresas, Gestão e Marketing, Estudos Empresariais') on conflict (nome) do nothing;
insert into public.categorias (nome, descricao) values ('Pedagogia, Antropologia e Divulgação Científica', 'Pedagogia, Antropologia, museus e centros de ciência') on conflict (nome) do nothing;
insert into public.categorias (nome, descricao) values ('Motorista', 'Motoristas de ligeiros e de pesados') on conflict (nome) do nothing;

insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Biologia Celular', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'A unidade estrutural e funcional dos seres vivos é:', '["O órgão", "O átomo", "A célula", "O tecido"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A unidade estrutural e funcional dos seres vivos é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Biologia Celular', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'O organelo responsável pela respiração celular é:', '["Mitocôndria", "Complexo de Golgi", "Lisossoma", "Ribossoma"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O organelo responsável pela respiração celular é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Biologia Celular', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'A fotossíntese ocorre principalmente nos:', '["Núcleos", "Centríolos", "Vacúolos", "Cloroplastos"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A fotossíntese ocorre principalmente nos:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Biologia Celular', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'As células procarióticas caracterizam-se por:', '["Serem sempre multicelulares", "Terem vários núcleos", "Terem cloroplastos", "Não terem núcleo delimitado por membrana"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As células procarióticas caracterizam-se por:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Genética', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'O ADN encontra-se sobretudo no:', '["Membrana celular", "Parede celular", "Citoplasma apenas", "Núcleo da célula"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O ADN encontra-se sobretudo no:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Genética', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Qual destas bases azotadas NÃO existe no ADN?', '["Timina", "Uracilo", "Citosina", "Adenina"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Qual destas bases azotadas NÃO existe no ADN?' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Genética', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'O ser humano tem normalmente quantos cromossomas nas células somáticas?', '["46", "48", "23", "44"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O ser humano tem normalmente quantos cromossomas nas células somáticas?' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Ecologia', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Num ecossistema, os produtores são:', '["Os carnívoros", "Os seres que fazem fotossíntese", "Os herbívoros", "Os decompositores"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num ecossistema, os produtores são:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Ecologia', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'A sequência correta de uma cadeia alimentar é:', '["Capim → gafanhoto → rã → cobra", "Gafanhoto → capim → rã → cobra", "Rã → capim → cobra → gafanhoto", "Cobra → rã → gafanhoto → capim"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A sequência correta de uma cadeia alimentar é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Ecologia', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'A palanca-negra-gigante, símbolo nacional, é endémica de:', '["Namíbia", "Angola", "Moçambique", "Quénia"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A palanca-negra-gigante, símbolo nacional, é endémica de:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Saúde', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'A malária é transmitida pela picada do mosquito:', '["Aedes (macho)", "Anopheles (fêmea)", "Culex (macho)", "Mosca tsé-tsé"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A malária é transmitida pela picada do mosquito:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Saúde', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'As vacinas atuam principalmente:', '["Baixando a febre", "Substituindo os glóbulos vermelhos", "Matando diretamente as bactérias", "Estimulando o sistema imunitário a produzir defesas"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As vacinas atuam principalmente:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Química Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'O número atómico de um elemento indica o número de:', '["Moléculas", "Ligações", "Protões", "Neutrões"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O número atómico de um elemento indica o número de:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Química Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'A fórmula química da água é:', '["OH", "H₂O", "H₂O₂", "HO₂"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A fórmula química da água é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Química Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Uma solução com pH 3 é:', '["Básica", "Neutra", "Salina por definição", "Ácida"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma solução com pH 3 é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Química Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'O gás mais abundante na atmosfera terrestre é:', '["Dióxido de carbono (CO₂)", "Azoto (N₂)", "Oxigénio (O₂)", "Árgon"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O gás mais abundante na atmosfera terrestre é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Química Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Na reação de combustão completa do metano formam-se:', '["Monóxido de carbono e hidrogénio", "Dióxido de carbono e água", "Carbono e ozono", "Oxigénio e azoto"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Na reação de combustão completa do metano formam-se:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Química Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'O símbolo químico do sódio é:', '["Na", "Sd", "S", "So"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O símbolo químico do sódio é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Química Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Uma mole de qualquer substância contém aproximadamente:', '["6,02 × 10²³ partículas", "1,6 × 10⁻¹⁹ partículas", "9,8 × 10²³ partículas", "3,14 × 10²³ partículas"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma mole de qualquer substância contém aproximadamente:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Química Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Na tabela periódica, os gases nobres pertencem ao grupo:', '["18", "2", "1", "17"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Na tabela periódica, os gases nobres pertencem ao grupo:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Laboratório', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Antes de manusear ácidos concentrados no laboratório deve-se:', '["Trabalhar sem ventilação", "Usar bata, luvas e óculos de proteção", "Misturar água no ácido de uma só vez", "Provar a substância"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Antes de manusear ácidos concentrados no laboratório deve-se:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Laboratório', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Para diluir um ácido concentrado deve-se:', '["Juntar a água ao ácido rapidamente", "Juntar o ácido lentamente à água", "Aquecer o ácido primeiro", "Misturar com base forte"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Para diluir um ácido concentrado deve-se:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Laboratório', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'O instrumento usado para medir volumes rigorosos de líquidos é:', '["Funil", "Almofariz", "Pipeta volumétrica", "Copo de precipitação"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O instrumento usado para medir volumes rigorosos de líquidos é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Engenharia Química', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'A destilação separa componentes de uma mistura com base em diferentes:', '["Cores", "Pontos de ebulição", "Formas dos cristais", "Massas atómicas apenas"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A destilação separa componentes de uma mistura com base em diferentes:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Engenharia Química', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Um catalisador:', '["Diminui sempre a temperatura", "Muda o produto final", "Aumenta a velocidade de uma reação sem ser consumido", "É sempre consumido na reação"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um catalisador:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Mecânica', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A unidade de força no Sistema Internacional é:', '["Pascal (Pa)", "Joule (J)", "Watt (W)", "Newton (N)"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A unidade de força no Sistema Internacional é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Mecânica', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Um carro percorre 150 km em 2 horas. A sua velocidade média é:', '["300 km/h", "75 km/h", "152 km/h", "50 km/h"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um carro percorre 150 km em 2 horas. A sua velocidade média é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Mecânica', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Segundo a 2.ª lei de Newton, F = m × a. Uma massa de 10 kg com aceleração de 2 m/s² sofre uma força de:', '["12 N", "20 N", "5 N", "8 N"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Segundo a 2.ª lei de Newton, F = m × a. Uma massa de 10 kg com aceleração de 2 m/s² sofre uma força de:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Mecânica', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A aceleração da gravidade à superfície da Terra é aproximadamente:', '["9,8 m/s²", "1,6 m/s²", "3,0 m/s²", "98 m/s²"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A aceleração da gravidade à superfície da Terra é aproximadamente:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Energia', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A energia que um corpo possui devido ao seu movimento chama-se:', '["Energia potencial", "Energia química", "Energia nuclear", "Energia cinética"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A energia que um corpo possui devido ao seu movimento chama-se:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Energia', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A unidade de energia no SI é:', '["Hertz", "Joule", "Newton", "Volt"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A unidade de energia no SI é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Física Moderna', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A velocidade da luz no vácuo é aproximadamente:', '["30 000 km/s", "3 000 km/s", "300 000 km/s", "300 km/s"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A velocidade da luz no vácuo é aproximadamente:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Física Nuclear', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Num átomo, os neutrões encontram-se:', '["No núcleo", "Nas ligações químicas", "Fora do átomo", "Na nuvem eletrónica"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num átomo, os neutrões encontram-se:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Física Nuclear', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A fissão nuclear consiste em:', '["Perder eletrões", "Juntar dois núcleos leves", "Formar moléculas", "Dividir um núcleo pesado em núcleos mais leves"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A fissão nuclear consiste em:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Física Nuclear', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A radiação mais penetrante entre as seguintes é a radiação:', '["Gama (γ)", "Alfa (α)", "Visível", "Beta (β)"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A radiação mais penetrante entre as seguintes é a radiação:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Física Nuclear', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'O tempo necessário para que metade dos núcleos de uma amostra radioativa se desintegre chama-se:', '["Tempo de reação", "Período orbital", "Período de semidesintegração (meia-vida)", "Constante de Planck"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O tempo necessário para que metade dos núcleos de uma amostra radioativa se desintegre chama-se:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Ondas', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A frequência mede-se em:', '["Coulomb", "Decibéis por metro", "Hertz (Hz)", "Metros"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A frequência mede-se em:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Matemática', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A derivada de f(x) = x² é:', '["2x", "x³/3", "2", "x"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A derivada de f(x) = x² é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Matemática', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A solução de x² − 9 = 0 é:', '["x = 81", "Apenas x = 3", "x = 3 ou x = −3", "x = 9"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A solução de x² − 9 = 0 é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Matemática', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Num triângulo retângulo com catetos 3 e 4, a hipotenusa mede:', '["6", "5", "7", "12"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num triângulo retângulo com catetos 3 e 4, a hipotenusa mede:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Matemática', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'log₁₀(1000) é igual a:', '["3", "10", "30", "100"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'log₁₀(1000) é igual a:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Estatística', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A mediana de 2, 5, 7, 9, 20 é:', '["9", "8,6", "7", "5"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A mediana de 2, 5, 7, 9, 20 é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Estatística', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A probabilidade de obter duas caras em dois lançamentos de uma moeda é:', '["1/4", "3/4", "1/2", "1/3"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A probabilidade de obter duas caras em dois lançamentos de uma moeda é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Geologia', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'As rochas formadas pelo arrefecimento do magma chamam-se:', '["Metamórficas", "Ígneas (magmáticas)", "Orgânicas", "Sedimentares"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As rochas formadas pelo arrefecimento do magma chamam-se:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Geologia', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'O mármore é uma rocha:', '["Vulcânica", "Ígnea", "Sedimentar detrítica", "Metamórfica"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O mármore é uma rocha:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Geologia', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Na escala de Mohs, o mineral mais duro é:', '["Diamante", "Quartzo", "Calcite", "Talco"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Na escala de Mohs, o mineral mais duro é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Geologia', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Angola é conhecida mundialmente pela exploração de:', '["Prata e estanho", "Gás natural apenas", "Carvão e urânio apenas", "Petróleo e diamantes"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Angola é conhecida mundialmente pela exploração de:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Engenharia de Minas', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'O método de exploração mineira feito à superfície chama-se:', '["Lixiviação in situ", "Exploração a céu aberto", "Exploração subterrânea", "Dragagem marinha"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O método de exploração mineira feito à superfície chama-se:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Engenharia de Minas', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Os depósitos de diamantes em leitos de rios chamam-se:', '["Depósitos vulcânicos ativos", "Depósitos aluvionares", "Depósitos kimberlíticos primários", "Depósitos salinos"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Os depósitos de diamantes em leitos de rios chamam-se:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Engenharia de Minas', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A rocha-mãe primária dos diamantes é o:', '["Granito", "Calcário", "Basalto", "Kimberlito"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A rocha-mãe primária dos diamantes é o:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Eletricidade', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'A Lei de Ohm estabelece que:', '["P = R × I", "R = U × I", "U = I / R", "U = R × I"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A Lei de Ohm estabelece que:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Eletricidade', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Uma resistência de 10 Ω percorrida por 2 A tem nos seus terminais uma tensão de:', '["20 V", "12 V", "5 V", "0,2 V"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma resistência de 10 Ω percorrida por 2 A tem nos seus terminais uma tensão de:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Eletricidade', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'A potência elétrica calcula-se por:', '["P = R / I", "P = U / I", "P = U × I", "P = I / U"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A potência elétrica calcula-se por:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Eletricidade', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'A unidade de resistência elétrica é:', '["Farad (F)", "Ampere (A)", "Ohm (Ω)", "Volt (V)"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A unidade de resistência elétrica é:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Eletricidade', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Duas resistências de 6 Ω ligadas em paralelo equivalem a:', '["3 Ω", "12 Ω", "36 Ω", "6 Ω"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Duas resistências de 6 Ω ligadas em paralelo equivalem a:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Eletricidade', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'A frequência da rede elétrica em Angola é de:', '["50 Hz", "100 Hz", "25 Hz", "60 Hz"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A frequência da rede elétrica em Angola é de:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Instalações Elétricas', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'O dispositivo que protege pessoas contra choques elétricos por corrente de fuga é o:', '["Contador", "Transformador", "Interruptor diferencial", "Fusível comum"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O dispositivo que protege pessoas contra choques elétricos por corrente de fuga é o:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Instalações Elétricas', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'O condutor de proteção (terra) é identificado pela cor:', '["Verde e amarelo", "Castanho", "Preto", "Azul"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O condutor de proteção (terra) é identificado pela cor:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Instalações Elétricas', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Antes de intervir num circuito elétrico deve-se:', '["Tocar nos condutores para testar", "Retirar o disjuntor geral com o circuito em carga", "Desligar e verificar a ausência de tensão", "Trabalhar com as mãos molhadas"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Antes de intervir num circuito elétrico deve-se:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Eletrónica', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'O díodo permite a passagem da corrente:', '["Nunca", "Num só sentido", "Apenas em corrente alternada", "Nos dois sentidos igualmente"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O díodo permite a passagem da corrente:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Eletrónica', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'O transístor é usado principalmente como:', '["Fonte de energia", "Antena", "Resistência fixa", "Amplificador ou interruptor"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O transístor é usado principalmente como:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Eletrónica', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'O condensador armazena energia sob a forma de:', '["Campo magnético", "Calor", "Energia química", "Campo elétrico"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O condensador armazena energia sob a forma de:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Eletrónica Digital', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Na lógica booleana, a porta AND dá saída 1 quando:', '["Todas as entradas são 0", "As entradas são diferentes", "Pelo menos uma entrada é 1", "Todas as entradas são 1"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Na lógica booleana, a porta AND dá saída 1 quando:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Eletrónica Digital', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'O número binário 1010 corresponde em decimal a:', '["5", "10", "12", "8"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O número binário 1010 corresponde em decimal a:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Automação', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Um PLC (autómato programável) serve para:', '["Controlar processos industriais automaticamente", "Armazenar combustível", "Transmitir rádio FM", "Medir a temperatura corporal"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um PLC (autómato programável) serve para:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Telecomunicações', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'A fibra ótica transmite informação através de:', '["Luz", "Ondas de água", "Corrente contínua", "Som"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A fibra ótica transmite informação através de:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Telecomunicações', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'O satélite angolano de comunicações lançado em 2022 chama-se:', '["ANGOLASAT-1", "LUANDASAT", "KWANZASAT", "ANGOSAT-2"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O satélite angolano de comunicações lançado em 2022 chama-se:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Telecomunicações', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'A modulação AM varia a:', '["Amplitude da onda portadora", "Velocidade da luz", "Frequência da portadora", "Fase da portadora apenas"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A modulação AM varia a:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Telecomunicações', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'A sigla 4G/LTE refere-se a:', '["Um satélite", "Um tipo de cabo coaxial", "Uma geração de redes móveis", "Um protocolo de impressão"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A sigla 4G/LTE refere-se a:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Telecomunicações', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Um decibel (dB) exprime:', '["A velocidade de transmissão", "Uma unidade de frequência", "Uma relação logarítmica entre duas potências ou intensidades", "Uma unidade de carga elétrica"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um decibel (dB) exprime:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Mecatrónica', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'A mecatrónica combina:', '["Direito e economia", "Agricultura e pesca", "Mecânica, eletrónica e informática", "Medicina e química"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A mecatrónica combina:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Mecatrónica', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Um sensor serve para:', '["Produzir energia elétrica em grande escala", "Isolar condutores", "Detetar uma grandeza física e convertê-la num sinal", "Armazenar dados"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um sensor serve para:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Jornalismo', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'A pirâmide invertida organiza a notícia:', '["Do mais importante para o menos importante", "Apenas com opinião", "Por ordem cronológica obrigatória", "Do menos importante para o mais importante"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A pirâmide invertida organiza a notícia:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Jornalismo', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'O lead de uma notícia deve responder às perguntas:', '["Nenhuma pergunta", "Quem, o quê, quando, onde, como e porquê", "Apenas quem e quando", "Só porquê"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O lead de uma notícia deve responder às perguntas:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Jornalismo', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Uma das regras deontológicas do jornalista é:', '["Receber dinheiro das fontes", "Publicar boatos para ganhar audiência", "Inventar citações", "Confirmar os factos junto de fontes credíveis"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma das regras deontológicas do jornalista é:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Jornalismo', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'A reportagem distingue-se da notícia por:', '["Aprofundar o tema com contexto, testemunhos e investigação", "Não ter fontes", "Ser só opinião", "Ser sempre mais curta"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A reportagem distingue-se da notícia por:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Jornalismo', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'O editorial exprime:', '["A opinião de um leitor", "Um anúncio publicitário", "Uma notícia factual", "A opinião do órgão de comunicação"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O editorial exprime:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Jornalismo', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'O direito de resposta permite:', '["Ao governo censurar a notícia", "Ao jornalista apagar a notícia", "A quem foi visado numa notícia apresentar a sua versão", "Ao leitor escrever a notícia"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O direito de resposta permite:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comunicação', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Os elementos básicos do processo de comunicação são:', '["Título, lead e corpo", "Jornal, rádio e televisão", "Emissor, mensagem, canal e recetor", "Apenas emissor e canal"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Os elementos básicos do processo de comunicação são:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comunicação', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Ruído, em comunicação, é:', '["Qualquer interferência que dificulta a compreensão da mensagem", "O tema da mensagem", "Apenas som alto", "O emissor"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ruído, em comunicação, é:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comunicação Institucional', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Um comunicado de imprensa deve ser:', '["Longo e com linguagem técnica", "Anónimo", "Claro, objetivo e com os contactos para mais informação", "Sem data"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um comunicado de imprensa deve ser:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comunicação Institucional', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Numa crise de imagem, a instituição deve:', '["Ficar em silêncio sempre", "Comunicar com rapidez, transparência e coerência", "Negar sem verificar", "Culpar os jornalistas"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Numa crise de imagem, a instituição deve:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Redes Sociais', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Antes de partilhar uma informação nas redes sociais deve-se:', '["Apagar os créditos", "Verificar a fonte e a veracidade", "Mudar o título", "Partilhar logo para ser o primeiro"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Antes de partilhar uma informação nas redes sociais deve-se:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Redes Sociais', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Fake news são:', '["Notícias antigas", "Notícias de desporto", "Notícias internacionais", "Notícias falsas apresentadas como verdadeiras"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Fake news são:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comunicação de Ciência', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Ao comunicar ciência ao grande público deve-se:', '["Usar só termos técnicos", "Evitar exemplos do quotidiano", "Usar linguagem acessível sem distorcer o rigor", "Exagerar os resultados"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao comunicar ciência ao grande público deve-se:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comunicação de Ciência', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Uma boa forma de despertar o interesse do público num centro de ciência é:', '["Experiências interativas e participativas", "Visitas sem guia nem explicação", "Textos longos nas paredes", "Proibir perguntas"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma boa forma de despertar o interesse do público num centro de ciência é:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Meios', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'A agência noticiosa oficial de Angola é a:', '["TPA", "ANGOP", "LUSA", "RNA"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A agência noticiosa oficial de Angola é a:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Meios', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'A Rádio Nacional de Angola é conhecida pela sigla:', '["RNA", "TPA", "ANR", "RTA"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A Rádio Nacional de Angola é conhecida pela sigla:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Meios', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'A TPA é a:', '["Agência de publicidade", "Transmissão Provincial Automática", "Televisão Pública de Angola", "Televisão Privada Angolana"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A TPA é a:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Linguagem', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Na escrita jornalística deve-se preferir:', '["Adjetivos opinativos em excesso", "Frases longas e ambíguas", "Gíria e abreviaturas", "Frases curtas e voz ativa"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Na escrita jornalística deve-se preferir:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Fotojornalismo', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Uma legenda de fotografia deve:', '["Repetir o título", "Identificar o que, quem, onde e quando", "Estar sempre em branco", "Ser em língua estrangeira"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma legenda de fotografia deve:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Ética', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Plágio é:', '["Citar a fonte corretamente", "Fazer uma entrevista", "Apresentar como seu o trabalho de outra pessoa", "Traduzir com autorização"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Plágio é:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Economia', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'O PIB mede:', '["A taxa de desemprego", "O valor dos bens e serviços finais produzidos num país num período", "O número de empresas", "A dívida pública"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O PIB mede:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Economia', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Quando a procura de um bem aumenta e a oferta se mantém, o preço tende a:', '["Subir", "Desaparecer", "Descer", "Manter-se sempre"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Quando a procura de um bem aumenta e a oferta se mantém, o preço tende a:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Economia', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'O banco central de Angola é o:', '["Banco Mundial", "Banco de Poupança e Crédito", "Banco Económico", "Banco Nacional de Angola (BNA)"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O banco central de Angola é o:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Economia', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'A política monetária é conduzida principalmente pelo:', '["Ministério da Saúde", "Tribunal de Contas", "Banco central", "Bancos comerciais"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A política monetária é conduzida principalmente pelo:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Economia', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Diversificação da economia significa:', '["Fechar empresas", "Aumentar só a produção de petróleo", "Importar mais bens", "Reduzir a dependência de um único setor, como o petróleo"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Diversificação da economia significa:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Economia', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Custo de oportunidade é:', '["O valor da melhor alternativa de que se abdica ao fazer uma escolha", "O lucro obtido", "Um imposto", "O preço de compra"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Custo de oportunidade é:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'A análise SWOT avalia:', '["Forças, fraquezas, oportunidades e ameaças", "Apenas concorrentes", "Vendas e stocks", "Salários, horários e férias"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A análise SWOT avalia:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Um objetivo SMART deve ser:', '["Simples, moderno, alto, rápido e total", "Sem prazo", "Específico, mensurável, atingível, relevante e temporal", "Vago"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um objetivo SMART deve ser:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'O organigrama funcional agrupa as pessoas por:', '["Idade", "Local de residência", "Ordem alfabética", "Funções ou especialidades"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O organigrama funcional agrupa as pessoas por:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Liderança democrática caracteriza-se por:', '["Envolver a equipa nas decisões", "Decidir sempre sozinho", "Não dar orientações", "Punir os erros em público"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Liderança democrática caracteriza-se por:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão Financeira', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Liquidez é a capacidade de:', '["Aumentar as vendas", "Contratar pessoal", "Cumprir as obrigações de curto prazo", "Obter lucro a longo prazo"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Liquidez é a capacidade de:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão Financeira', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'O ponto de equilíbrio (break-even) é atingido quando:', '["As receitas igualam os custos totais", "As vendas duplicam", "O lucro é máximo", "Não há custos fixos"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O ponto de equilíbrio (break-even) é atingido quando:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão Financeira', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Rentabilidade = lucro ÷ investimento. Lucro de 50 000 Kz para investimento de 500 000 Kz dá:', '["25%", "1%", "5%", "10%"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Rentabilidade = lucro ÷ investimento. Lucro de 50 000 Kz para investimento de 500 000 Kz dá:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Marketing', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Os 4 P do marketing-mix são:', '["Produto, preço, praça (distribuição) e promoção", "Plano, projeto, programa e processo", "Produção, pessoal, poder e política", "Pessoas, papel, prazo e pagamento"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Os 4 P do marketing-mix são:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Marketing', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Segmentação de mercado é:', '["Vender a todos da mesma forma", "Baixar os preços", "Fechar lojas", "Dividir o mercado em grupos de clientes com características semelhantes"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Segmentação de mercado é:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Marketing', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'O público-alvo é:', '["Os acionistas apenas", "Os fornecedores", "O grupo de pessoas a quem se dirige um produto ou campanha", "A concorrência"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O público-alvo é:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Marketing', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Marketing digital inclui, por exemplo:', '["Anúncios em redes sociais e motores de pesquisa", "Apenas jornais impressos", "Apenas rádio", "Apenas cartazes de rua"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Marketing digital inclui, por exemplo:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Empreendedorismo', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Um plano de negócio serve para:', '["Contratar advogados", "Registar marcas", "Pagar impostos", "Descrever a ideia, o mercado, a estratégia e as finanças do negócio"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um plano de negócio serve para:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Empreendedorismo', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Microcrédito destina-se sobretudo a:', '["Grandes multinacionais", "Pequenos empreendedores com pouco acesso ao crédito bancário", "O Estado", "Bancos centrais"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Microcrédito destina-se sobretudo a:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Contabilidade de Gestão', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Custos fixos são aqueles que:', '["Só existem uma vez", "São pagos pelo cliente", "Variam sempre com a produção", "Não variam com o volume de produção"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Custos fixos são aqueles que:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Pedagogia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'A avaliação diagnóstica realiza-se:', '["No início de um processo de aprendizagem", "Apenas no fim do ano", "Nunca", "Só depois do exame final"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A avaliação diagnóstica realiza-se:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Pedagogia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'A avaliação formativa tem como objetivo principal:', '["Atribuir a nota final", "Punir os alunos", "Selecionar os melhores", "Acompanhar e melhorar a aprendizagem ao longo do processo"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A avaliação formativa tem como objetivo principal:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Pedagogia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Na teoria de Piaget, a aprendizagem resulta sobretudo:', '["Apenas da herança genética", "Da construção ativa do conhecimento pelo próprio sujeito", "Da punição", "Da memorização passiva"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Na teoria de Piaget, a aprendizagem resulta sobretudo:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Pedagogia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Para Vygotsky, a zona de desenvolvimento proximal é:', '["A sala de aula", "A idade escolar", "O conteúdo do manual", "A distância entre o que o aluno faz sozinho e o que faz com ajuda"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Para Vygotsky, a zona de desenvolvimento proximal é:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Pedagogia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Uma metodologia ativa de ensino é, por exemplo:', '["Aprendizagem baseada em projetos", "Ditado de apontamentos", "Leitura silenciosa obrigatória", "Cópia do quadro"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma metodologia ativa de ensino é, por exemplo:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Pedagogia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Paulo Freire defendia uma educação:', '["Dialógica e crítica, contra a educação bancária", "Baseada só na memorização", "Sem participação do aluno", "Exclusiva das elites"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Paulo Freire defendia uma educação:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Antropologia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'A antropologia estuda:', '["O ser humano nas suas dimensões culturais, sociais e biológicas", "Apenas as rochas", "Apenas a economia", "Apenas os animais"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A antropologia estuda:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Antropologia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'O trabalho de campo com observação participante é típico da:', '["Etnografia", "Engenharia", "Astronomia", "Contabilidade"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O trabalho de campo com observação participante é típico da:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Antropologia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Etnocentrismo é:', '["Respeitar todas as culturas por igual", "Estudar as plantas", "Viajar muito", "Julgar outras culturas a partir dos valores da própria cultura"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Etnocentrismo é:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Antropologia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Os povos Bantu são o grupo etnolinguístico maioritário em:', '["Angola", "Tunísia", "Egito", "Marrocos"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Os povos Bantu são o grupo etnolinguístico maioritário em:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Património', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'O sítio angolano inscrito como Património Mundial da UNESCO em 2017 é:', '["Ilha de Luanda", "Quedas de Kalandula", "Fortaleza de São Miguel", "Mbanza Kongo"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O sítio angolano inscrito como Património Mundial da UNESCO em 2017 é:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Museologia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'A principal missão de um museu ou centro de ciência inclui:', '["Guardar objetos sem os mostrar", "Conservar, investigar, comunicar e educar", "Apenas vender bilhetes", "Organizar festas"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A principal missão de um museu ou centro de ciência inclui:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Museologia', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Uma exposição interativa (hands-on) permite ao visitante:', '["Ouvir uma palestra obrigatória", "Apenas olhar de longe", "Ler textos longos", "Manipular e experimentar para aprender"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma exposição interativa (hands-on) permite ao visitante:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Divulgação Científica', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'O método científico começa geralmente por:', '["Escolher a resposta antes de testar", "Ignorar os dados", "Observação e formulação de uma pergunta ou problema", "Publicar a conclusão"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O método científico começa geralmente por:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Divulgação Científica', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Uma hipótese científica deve ser:', '["Impossível de verificar", "Sempre verdadeira", "Testável e refutável", "Uma opinião pessoal"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma hipótese científica deve ser:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Divulgação Científica', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Ao explicar um tema controverso de ciência ao público, o mediador deve:', '["Evitar perguntas", "Apresentar as evidências e promover o pensamento crítico", "Impor a sua opinião", "Apresentar só um lado sem dados"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao explicar um tema controverso de ciência ao público, o mediador deve:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Divulgação Científica', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Um exemplo de tema de ciência controverso para debate é:', '["Organismos geneticamente modificados", "O alfabeto", "As cores do arco-íris", "A tabuada"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um exemplo de tema de ciência controverso para debate é:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Divulgação Científica', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'STEM refere-se às áreas de:', '["Desporto e lazer", "Saúde, turismo, economia e música", "Sociologia, teatro, ética e moda", "Ciência, tecnologia, engenharia e matemática"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'STEM refere-se às áreas de:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Divulgação Científica', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Para públicos escolares, a visita a um centro de ciência deve ser:', '["Sem atividades práticas", "Igual para todas as idades", "Sem objetivos", "Adaptada à idade e ligada ao currículo"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Para públicos escolares, a visita a um centro de ciência deve ser:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Inclusão', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Uma exposição acessível a pessoas com deficiência visual pode incluir:', '["Peças táteis, áudio-descrição e braille", "Luzes intermitentes", "Apenas vídeos sem som", "Apenas textos pequenos"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma exposição acessível a pessoas com deficiência visual pode incluir:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Segurança Rodoviária', (select id from public.categorias where nome = 'Motorista'), 'O uso do cinto de segurança é obrigatório para:', '["Só os passageiros de trás", "Só em autoestrada", "Só o condutor", "O condutor e todos os passageiros"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O uso do cinto de segurança é obrigatório para:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Segurança Rodoviária', (select id from public.categorias where nome = 'Motorista'), 'Conduzir sob efeito de álcool:', '["Não tem efeito", "Reduz os reflexos e aumenta o risco de acidente", "É permitido à noite", "Melhora a concentração"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Conduzir sob efeito de álcool:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Segurança Rodoviária', (select id from public.categorias where nome = 'Motorista'), 'A distância de segurança serve para:', '["Poupar combustível apenas", "Evitar multas de estacionamento", "Ultrapassar mais depressa", "Ter tempo de travar se o veículo da frente parar"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A distância de segurança serve para:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Segurança Rodoviária', (select id from public.categorias where nome = 'Motorista'), 'Com chuva intensa, o condutor deve:', '["Acelerar para sair da chuva", "Desligar as luzes", "Reduzir a velocidade e aumentar a distância de segurança", "Travar a fundo nas curvas"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Com chuva intensa, o condutor deve:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Segurança Rodoviária', (select id from public.categorias where nome = 'Motorista'), 'Usar o telemóvel ao volante sem sistema mãos-livres:', '["É permitido em ruas largas", "Só é proibido à noite", "É proibido e perigoso", "É obrigatório"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Usar o telemóvel ao volante sem sistema mãos-livres:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Sinalização', (select id from public.categorias where nome = 'Motorista'), 'O sinal triangular com bordo vermelho indica:', '["Obrigação", "Informação turística", "Perigo", "Fim de proibição"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O sinal triangular com bordo vermelho indica:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Sinalização', (select id from public.categorias where nome = 'Motorista'), 'O sinal octogonal vermelho STOP obriga a:', '["Parar e ceder a passagem", "Buzinar", "Abrandar sem parar", "Acelerar"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O sinal octogonal vermelho STOP obriga a:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Sinalização', (select id from public.categorias where nome = 'Motorista'), 'O sinal circular com fundo azul indica:', '["Proibição", "Estacionamento proibido", "Perigo", "Obrigação"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O sinal circular com fundo azul indica:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Sinalização', (select id from public.categorias where nome = 'Motorista'), 'No semáforo, a luz amarela fixa significa:', '["Avançar sempre", "Acelerar", "Parar, salvo se já não for possível fazê-lo em segurança", "Estacionar"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'No semáforo, a luz amarela fixa significa:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Circulação', (select id from public.categorias where nome = 'Motorista'), 'Em Angola circula-se:', '["Pelo centro", "Pela esquerda", "Pela direita", "Indiferentemente"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Em Angola circula-se:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Circulação', (select id from public.categorias where nome = 'Motorista'), 'Ultrapassar numa curva sem visibilidade:', '["É permitido de dia", "É obrigatório para pesados", "É permitido se for rápido", "É proibido"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ultrapassar numa curva sem visibilidade:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Mecânica Básica', (select id from public.categorias where nome = 'Motorista'), 'A luz do óleo acesa no painel durante a marcha indica:', '["Que os faróis estão ligados", "Que o carro está em ponto morto", "Falta de pressão do óleo; deve-se parar o motor", "Que o depósito está cheio"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A luz do óleo acesa no painel durante a marcha indica:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Mecânica Básica', (select id from public.categorias where nome = 'Motorista'), 'A pressão dos pneus deve ser verificada:', '["Com os pneus muito quentes", "Regularmente e com os pneus frios", "Só quando furam", "Nunca"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A pressão dos pneus deve ser verificada:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Mecânica Básica', (select id from public.categorias where nome = 'Motorista'), 'O líquido de arrefecimento serve para:', '["Limpar o vidro", "Aumentar a potência", "Lubrificar os travões", "Evitar o sobreaquecimento do motor"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O líquido de arrefecimento serve para:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Mecânica Básica', (select id from public.categorias where nome = 'Motorista'), 'Se os travões ficarem ''esponjosos'' (pedal mole), o mais provável é:', '["Excesso de combustível", "Bateria carregada", "Pneus novos", "Ar ou falta de líquido no circuito de travões"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Se os travões ficarem ''esponjosos'' (pedal mole), o mais provável é:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Pesados', (select id from public.categorias where nome = 'Motorista'), 'Num veículo pesado, o tacógrafo regista:', '["Velocidade, tempo de condução e de pausa", "A temperatura da carga", "O peso do condutor", "O nível de óleo"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num veículo pesado, o tacógrafo regista:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Pesados', (select id from public.categorias where nome = 'Motorista'), 'A carga de um camião deve estar:', '["Bem distribuída e devidamente amarrada", "Acima da altura permitida", "Solta para descarregar mais rápido", "Toda num só lado"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A carga de um camião deve estar:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Primeiros Socorros', (select id from public.categorias where nome = 'Motorista'), 'Num acidente, a primeira coisa a fazer é:', '["Abandonar o local", "Dar água às vítimas inconscientes", "Retirar logo as vítimas dos carros", "Sinalizar o local e garantir a segurança"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num acidente, a primeira coisa a fazer é:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Atendimento', (select id from public.categorias where nome = 'Motorista'), 'Um motorista de serviço público deve:', '["Transportar pessoas sem autorização", "Conduzir sem documentos", "Ser pontual, cortês e zelar pelo veículo do Estado", "Usar a viatura para fins pessoais"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um motorista de serviço público deve:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Redes', (select id from public.categorias where nome = 'Informática'), 'O endereço de rede 192.168.1.0/24 permite quantos endereços de hosts utilizáveis?', '["256", "255", "254", "24"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O endereço de rede 192.168.1.0/24 permite quantos endereços de hosts utilizáveis?' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Redes', (select id from public.categorias where nome = 'Informática'), 'O modelo OSI tem quantas camadas?', '["5", "7", "9", "4"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O modelo OSI tem quantas camadas?' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Redes', (select id from public.categorias where nome = 'Informática'), 'O protocolo usado para enviar e-mails entre servidores é o:', '["DHCP", "SNMP", "SMTP", "HTTP"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O protocolo usado para enviar e-mails entre servidores é o:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Redes', (select id from public.categorias where nome = 'Informática'), 'O comando ping serve para:', '["Abrir o browser", "Formatar o disco", "Apagar ficheiros", "Testar a conectividade com outro dispositivo"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O comando ping serve para:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Segurança', (select id from public.categorias where nome = 'Informática'), 'Ransomware é um software malicioso que:', '["Faz cópias de segurança", "Atualiza o antivírus", "Acelera o computador", "Cifra os ficheiros e exige pagamento de resgate"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ransomware é um software malicioso que:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Segurança', (select id from public.categorias where nome = 'Informática'), 'O princípio do menor privilégio significa:', '["Não usar palavras-passe", "Dar a cada utilizador apenas as permissões necessárias", "Dar acesso total a todos", "Partilhar contas"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O princípio do menor privilégio significa:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Bases de Dados', (select id from public.categorias where nome = 'Informática'), 'Em SQL, a cláusula que filtra linhas é:', '["GROUP", "ORDER BY", "FROM", "WHERE"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Em SQL, a cláusula que filtra linhas é:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Bases de Dados', (select id from public.categorias where nome = 'Informática'), 'A normalização de bases de dados visa:', '["Reduzir redundância e anomalias", "Cifrar dados", "Aumentar a duplicação de dados", "Apagar tabelas"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A normalização de bases de dados visa:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Programação/Web', (select id from public.categorias where nome = 'Informática'), 'Em programação, uma variável é:', '["Uma rede", "Um tipo de monitor", "Um erro do programa", "Um espaço com nome para guardar um valor"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Em programação, uma variável é:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Programação/Web', (select id from public.categorias where nome = 'Informática'), 'JavaScript é executado principalmente:', '["No navegador (browser)", "No teclado", "No router apenas", "Na impressora"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'JavaScript é executado principalmente:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Sistemas Operativos', (select id from public.categorias where nome = 'Informática'), 'No Windows, o gestor que mostra processos em execução é o:', '["Bloco de Notas", "Gestor de Tarefas", "Painel de Pintura", "Explorador de Rede"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'No Windows, o gestor que mostra processos em execução é o:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Hardware', (select id from public.categorias where nome = 'Informática'), 'A BIOS/UEFI é responsável por:', '["Imprimir", "Iniciar o hardware antes de carregar o sistema operativo", "Navegar na Internet", "Editar documentos"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A BIOS/UEFI é responsável por:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Constituição', (select id from public.categorias where nome = 'Administração Pública'), 'Angola está atualmente dividida em quantas províncias, após a nova divisão político-administrativa de 2024?', '["24", "21", "18", "20"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Angola está atualmente dividida em quantas províncias, após a nova divisão político-administrativa de 2024?' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Constituição', (select id from public.categorias where nome = 'Administração Pública'), 'O Vice-Presidente da República é eleito:', '["Por nomeação do Governador", "Pelo Tribunal Constitucional", "Pela Assembleia Nacional em separado", "Na mesma lista e eleição do Presidente da República"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Vice-Presidente da República é eleito:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Constituição', (select id from public.categorias where nome = 'Administração Pública'), 'Os Ministros de Estado e Ministros são nomeados pelo:', '["Governador do BNA", "Presidente da República", "Presidente da Assembleia Nacional", "Juiz Presidente do Tribunal Supremo"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Os Ministros de Estado e Ministros são nomeados pelo:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Organização', (select id from public.categorias where nome = 'Administração Pública'), 'O Governador Provincial representa:', '["Os tribunais", "Os partidos políticos", "A Administração Central do Estado na província", "As empresas privadas"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Governador Provincial representa:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão Pública', (select id from public.categorias where nome = 'Administração Pública'), 'A modernização administrativa através do SEPE visa:', '["Fechar serviços", "Eliminar concursos", "Prestar serviços públicos por meios eletrónicos", "Aumentar papel"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A modernização administrativa através do SEPE visa:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão Pública', (select id from public.categorias where nome = 'Administração Pública'), 'A ENAPP é a:', '["Empresa Nacional de Águas", "Escola Nacional de Arte", "Escola Nacional de Administração e Políticas Públicas", "Entidade Nacional de Petróleo"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A ENAPP é a:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão Pública', (select id from public.categorias where nome = 'Administração Pública'), 'O concurso público de ingresso visa:', '["Vender bens do Estado", "Promover funcionários antigos sem avaliação", "Recrutar trabalhadores para a Função Pública com base no mérito", "Eleger dirigentes"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O concurso público de ingresso visa:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Ética', (select id from public.categorias where nome = 'Administração Pública'), 'O funcionário público deve abster-se de intervir num processo quando:', '["O processo é complexo", "Tem interesse pessoal ou familiar no assunto", "O chefe está ausente", "O utente é estrangeiro"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O funcionário público deve abster-se de intervir num processo quando:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão de Pessoas', (select id from public.categorias where nome = 'Recursos Humanos'), 'A rotatividade (turnover) mede:', '["As entradas e saídas de trabalhadores num período", "A produtividade por hora", "O número de reuniões", "O salário médio"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A rotatividade (turnover) mede:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão de Pessoas', (select id from public.categorias where nome = 'Recursos Humanos'), 'O onboarding (acolhimento) serve para:', '["Integrar o novo trabalhador na organização", "Despedir trabalhadores", "Encerrar processos", "Calcular impostos"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O onboarding (acolhimento) serve para:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Gestão de Pessoas', (select id from public.categorias where nome = 'Recursos Humanos'), 'Avaliação de desempenho 360 graus inclui opiniões de:', '["Apenas clientes", "Apenas o departamento financeiro", "Chefias, colegas, subordinados e o próprio", "Apenas o chefe direto"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Avaliação de desempenho 360 graus inclui opiniões de:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Formação', (select id from public.categorias where nome = 'Recursos Humanos'), 'Formação on-the-job é aquela realizada:', '["Apenas no estrangeiro", "No próprio posto de trabalho", "Antes do nascimento", "Apenas online"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Formação on-the-job é aquela realizada:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Recrutamento', (select id from public.categorias where nome = 'Recursos Humanos'), 'Uma prova de seleção é válida quando:', '["Não tem critérios", "É sempre oral", "É muito difícil", "Mede aquilo que pretende medir"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma prova de seleção é válida quando:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Trabalho', (select id from public.categorias where nome = 'Recursos Humanos'), 'A remuneração base é:', '["Um prémio ocasional", "A parte fixa da retribuição paga pelo trabalho", "Uma multa", "O subsídio de férias apenas"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A remuneração base é:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Instituições', (select id from public.categorias where nome = 'Recursos Humanos'), 'O Programa de Ação para o Emprego e a formação profissional em Angola estão ligados sobretudo ao:', '["MAPTSS e INEFOP", "Ministério das Pescas", "Ministério da Cultura", "Banco Nacional de Angola"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Programa de Ação para o Emprego e a formação profissional em Angola estão ligados sobretudo ao:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comunicação', (select id from public.categorias where nome = 'Recursos Humanos'), 'Escuta ativa significa:', '["Falar mais alto", "Prestar atenção total e confirmar que se compreendeu o interlocutor", "Ouvir sem prestar atenção", "Interromper para dar a solução"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Escuta ativa significa:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Contabilidade Geral', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'O princípio da especialização dos exercícios determina que:', '["Tudo se regista quando é pago", "Os custos não se registam", "Proveitos e custos são reconhecidos no período a que respeitam", "Só se regista no fim do ano"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O princípio da especialização dos exercícios determina que:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Contabilidade Geral', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Uma fatura de compra a crédito aumenta:', '["O capital social", "Os proveitos", "O dinheiro em caixa", "As existências (ou custos) e as dívidas a fornecedores"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Uma fatura de compra a crédito aumenta:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Contabilidade Geral', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'A demonstração de resultados mostra:', '["Os proveitos, os custos e o resultado de um período", "Apenas o ativo", "Os nomes dos funcionários", "O orçamento do Estado"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A demonstração de resultados mostra:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Contabilidade Geral', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'O balanço apresenta:', '["A posição financeira (ativo, passivo e capital próprio) numa data", "Apenas as vendas do mês", "Os impostos a pagar no futuro", "O fluxo de caixa diário"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O balanço apresenta:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Finanças Públicas', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'O princípio orçamental da universalidade significa que:', '["Só inclui despesas", "É aprovado pelo povo", "O orçamento inclui todas as receitas e despesas", "É igual todos os anos"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O princípio orçamental da universalidade significa que:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Finanças Públicas', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'A conta geral do Estado é apreciada pelo:', '["Ministério da Cultura", "Tribunal de Contas e pela Assembleia Nacional", "Banco Comercial", "Governo Provincial apenas"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A conta geral do Estado é apreciada pelo:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Matemática Financeira', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Um capital de 200 000 Kz a 10% ao ano em juros compostos, ao fim de 2 anos, vale:', '["220 000 Kz", "400 000 Kz", "240 000 Kz", "242 000 Kz"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um capital de 200 000 Kz a 10% ao ano em juros compostos, ao fim de 2 anos, vale:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Fiscalidade', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'O NIF é:', '["Um imposto sobre imóveis", "O Número de Identificação Fiscal", "Um tipo de fatura", "O Número Interno de Funcionário"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O NIF é:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Correspondência', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'O registo de saída de correspondência deve indicar:', '["Apenas o peso", "Número, data, destinatário e assunto", "O nome do estafeta apenas", "Nada"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O registo de saída de correspondência deve indicar:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Arquivo', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'O arquivo definitivo (histórico) conserva documentos:', '["De valor permanente", "De uso diário", "Apenas rascunhos", "Para eliminação imediata"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O arquivo definitivo (histórico) conserva documentos:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Arquivo', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'A classificação documental serve para:', '["Aumentar o papel", "Decorar o escritório", "Organizar os documentos segundo um plano lógico", "Destruir documentos"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A classificação documental serve para:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Agenda', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Ao preparar uma reunião, o secretário deve:', '["Esperar que todos se lembrem", "Marcar sem ordem de trabalhos", "Não informar a hora", "Enviar a convocatória, preparar a sala e os documentos"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao preparar uma reunião, o secretário deve:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Atendimento', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Para transferir uma chamada corretamente deve-se:', '["Informar o interlocutor e anunciar a chamada a quem a recebe", "Dar o número pessoal do chefe", "Desligar sem avisar", "Pôr em espera indefinidamente"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Para transferir uma chamada corretamente deve-se:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Informática', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Para criar uma ata rapidamente com formatação uniforme deve-se usar:', '["O bloco de notas sem formatação", "Um modelo (template) de documento", "Um ficheiro de imagem", "Uma folha de cálculo vazia"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Para criar uma ata rapidamente com formatação uniforme deve-se usar:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Língua Portuguesa', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Escolha a frase escrita corretamente:', '["Envio em anecho os documentos.", "Enviu em anexo os documentos.", "Envio em anexo os documentos.", "Envio em anexos os documento."]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Escolha a frase escrita corretamente:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Protocolo', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Num jantar oficial, o lugar de honra fica normalmente:', '["Na ponta da mesa longe do anfitrião", "À direita do anfitrião", "À esquerda do convidado mais novo", "Junto à porta"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num jantar oficial, o lugar de honra fica normalmente:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Constitucional', (select id from public.categorias where nome = 'Direito'), 'A revisão da Constituição de Angola de 2021 foi aprovada pela:', '["Comissão Nacional Eleitoral", "Tribunal Constitucional", "Presidência apenas por decreto", "Assembleia Nacional"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A revisão da Constituição de Angola de 2021 foi aprovada pela:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Administrativo', (select id from public.categorias where nome = 'Direito'), 'O prazo, a forma e o órgão competente são requisitos de:', '["Constituição de sociedades", "Validade do ato administrativo", "Registo predial", "Celebração de casamento"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O prazo, a forma e o órgão competente são requisitos de:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Administrativo', (select id from public.categorias where nome = 'Direito'), 'A revogação de um ato administrativo consiste em:', '["Fazer cessar os seus efeitos por decisão da Administração", "Assiná-lo", "Traduzi-lo", "Publicá-lo"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A revogação de um ato administrativo consiste em:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Civil', (select id from public.categorias where nome = 'Direito'), 'A capacidade de exercício plena adquire-se, em regra, com:', '["A maioridade", "O casamento dos pais", "O nascimento", "O primeiro emprego"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capacidade de exercício plena adquire-se, em regra, com:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Penal', (select id from public.categorias where nome = 'Direito'), 'Legítima defesa é:', '["Fazer justiça pelas próprias mãos", "Atacar primeiro por precaução", "Reagir para afastar uma agressão atual e ilícita, com meios necessários", "Vingar-se de uma ofensa antiga"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Legítima defesa é:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Penal', (select id from public.categorias where nome = 'Direito'), 'Corrupção passiva é praticada por quem:', '["Paga impostos", "Denuncia um crime", "Recusa um suborno", "Solicita ou aceita vantagem indevida no exercício de funções"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Corrupção passiva é praticada por quem:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Trabalho', (select id from public.categorias where nome = 'Direito'), 'O contrato de trabalho por tempo determinado tem:', '["Um termo (prazo) definido", "Nenhum salário", "Duração ilimitada sempre", "Apenas trabalho voluntário"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O contrato de trabalho por tempo determinado tem:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Processo', (select id from public.categorias where nome = 'Direito'), 'Habeas data é uma garantia que permite:', '["Pagar multas", "Libertar presos", "Aceder e corrigir os próprios dados pessoais em registos", "Votar"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Habeas data é uma garantia que permite:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Fazer queixa sem falar com ele", "Ignorar e deixar o problema crescer", "Expor o colega em público", "Conversar em privado e ajudar a corrigir o erro"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Priorizar com a chefia e comunicar prazos realistas", "Recusar ambas", "Fazer as duas mal e à pressa", "Escolher a mais fácil sem avisar"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Manter a calma, ouvir e procurar uma solução", "Responder no mesmo tom", "Mandar o utente embora", "Fingir que não ouve"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'Trabalho em equipa eficaz implica:', '["Partilhar informação e respeitar as opiniões dos outros", "Competir com os colegas a qualquer custo", "Guardar a informação para si", "Fazer tudo sozinho"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Divulgar nas redes sociais", "Cumprir sem questionar", "Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Faltar ao trabalho"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'Proatividade no trabalho significa:', '["Fazer apenas o mínimo", "Antecipar problemas e propor soluções", "Esperar sempre por ordens", "Reclamar de tudo"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ouvir, refletir e procurar melhorar", "Responder com outra crítica", "Ignorar", "Ficar ofendido"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'Pontualidade e assiduidade demonstram:', '["Apenas medo do chefe", "Excesso de zelo inútil", "Falta de iniciativa", "Responsabilidade e respeito pelo serviço e pelos colegas"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Recusar e tratar o processo de forma igual aos outros", "Pedir um presente maior", "Aceitar e não acelerar", "Aceitar e acelerar"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Escolher logo um culpado", "Promover o diálogo para compreender as duas partes", "Separar a equipa para sempre", "Levar o caso diretamente a tribunal"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'Confidencialidade no serviço público significa:', '["Não divulgar informação reservada a que se tem acesso pelo cargo", "Publicar processos online", "Contar tudo à família", "Partilhar palavras-passe"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Informática'), 'A gestão do tempo melhora quando:', '["Se ignoram prazos", "Se faz tudo ao mesmo tempo", "Se planeia o dia e se definem prioridades", "Se adiam as tarefas difíceis sempre"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Informática'), 'A capital de Angola é:', '["Lubango", "Benguela", "Huambo", "Luanda"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Informática'), 'O hino nacional de Angola é:', '["Hino da Liberdade", "Kwanza Livre", "Angola Avante", "Ó Pátria"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Informática'), 'O maior rio inteiramente angolano é o:', '["Rio Nilo", "Rio Kwanza", "Rio Congo", "Rio Zambeze"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Informática'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["4 de Fevereiro", "11 de Novembro", "17 de Setembro", "4 de Abril"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Informática'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["4 de Abril", "4 de Fevereiro", "1 de Maio", "25 de Maio"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Informática'), 'As cores da bandeira de Angola são:', '["Vermelho, preto e amarelo", "Azul, branco e vermelho", "Vermelho, branco e verde", "Verde, amarelo e azul"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Informática'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Conversar em privado e ajudar a corrigir o erro", "Fazer queixa sem falar com ele", "Expor o colega em público", "Ignorar e deixar o problema crescer"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Escolher a mais fácil sem avisar", "Recusar ambas", "Fazer as duas mal e à pressa", "Priorizar com a chefia e comunicar prazos realistas"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Responder no mesmo tom", "Fingir que não ouve", "Manter a calma, ouvir e procurar uma solução", "Mandar o utente embora"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'Trabalho em equipa eficaz implica:', '["Competir com os colegas a qualquer custo", "Partilhar informação e respeitar as opiniões dos outros", "Fazer tudo sozinho", "Guardar a informação para si"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Divulgar nas redes sociais", "Cumprir sem questionar", "Faltar ao trabalho"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'Proatividade no trabalho significa:', '["Esperar sempre por ordens", "Reclamar de tudo", "Antecipar problemas e propor soluções", "Fazer apenas o mínimo"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ficar ofendido", "Ouvir, refletir e procurar melhorar", "Ignorar", "Responder com outra crítica"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'Pontualidade e assiduidade demonstram:', '["Responsabilidade e respeito pelo serviço e pelos colegas", "Excesso de zelo inútil", "Falta de iniciativa", "Apenas medo do chefe"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Aceitar e não acelerar", "Pedir um presente maior", "Aceitar e acelerar", "Recusar e tratar o processo de forma igual aos outros"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Escolher logo um culpado", "Promover o diálogo para compreender as duas partes", "Separar a equipa para sempre", "Levar o caso diretamente a tribunal"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'Confidencialidade no serviço público significa:', '["Contar tudo à família", "Não divulgar informação reservada a que se tem acesso pelo cargo", "Publicar processos online", "Partilhar palavras-passe"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Administração Pública'), 'A gestão do tempo melhora quando:', '["Se adiam as tarefas difíceis sempre", "Se faz tudo ao mesmo tempo", "Se planeia o dia e se definem prioridades", "Se ignoram prazos"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Administração Pública'), 'A capital de Angola é:', '["Benguela", "Huambo", "Luanda", "Lubango"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Administração Pública'), 'O hino nacional de Angola é:', '["Ó Pátria", "Hino da Liberdade", "Kwanza Livre", "Angola Avante"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Administração Pública'), 'O maior rio inteiramente angolano é o:', '["Rio Nilo", "Rio Kwanza", "Rio Congo", "Rio Zambeze"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Administração Pública'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["17 de Setembro", "4 de Fevereiro", "4 de Abril", "11 de Novembro"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Administração Pública'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["1 de Maio", "4 de Fevereiro", "4 de Abril", "25 de Maio"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Administração Pública'), 'As cores da bandeira de Angola são:', '["Vermelho, branco e verde", "Verde, amarelo e azul", "Vermelho, preto e amarelo", "Azul, branco e vermelho"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Administração Pública'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Conversar em privado e ajudar a corrigir o erro", "Fazer queixa sem falar com ele", "Expor o colega em público", "Ignorar e deixar o problema crescer"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Recusar ambas", "Escolher a mais fácil sem avisar", "Priorizar com a chefia e comunicar prazos realistas", "Fazer as duas mal e à pressa"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Responder no mesmo tom", "Fingir que não ouve", "Mandar o utente embora", "Manter a calma, ouvir e procurar uma solução"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'Trabalho em equipa eficaz implica:', '["Partilhar informação e respeitar as opiniões dos outros", "Competir com os colegas a qualquer custo", "Fazer tudo sozinho", "Guardar a informação para si"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Cumprir sem questionar", "Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Faltar ao trabalho", "Divulgar nas redes sociais"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'Proatividade no trabalho significa:', '["Fazer apenas o mínimo", "Reclamar de tudo", "Antecipar problemas e propor soluções", "Esperar sempre por ordens"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ficar ofendido", "Ignorar", "Responder com outra crítica", "Ouvir, refletir e procurar melhorar"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'Pontualidade e assiduidade demonstram:', '["Excesso de zelo inútil", "Apenas medo do chefe", "Responsabilidade e respeito pelo serviço e pelos colegas", "Falta de iniciativa"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Recusar e tratar o processo de forma igual aos outros", "Pedir um presente maior", "Aceitar e acelerar", "Aceitar e não acelerar"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Promover o diálogo para compreender as duas partes", "Separar a equipa para sempre", "Levar o caso diretamente a tribunal", "Escolher logo um culpado"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'Confidencialidade no serviço público significa:', '["Não divulgar informação reservada a que se tem acesso pelo cargo", "Partilhar palavras-passe", "Contar tudo à família", "Publicar processos online"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Recursos Humanos'), 'A gestão do tempo melhora quando:', '["Se faz tudo ao mesmo tempo", "Se adiam as tarefas difíceis sempre", "Se planeia o dia e se definem prioridades", "Se ignoram prazos"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Recursos Humanos'), 'A capital de Angola é:', '["Luanda", "Benguela", "Huambo", "Lubango"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Recursos Humanos'), 'O hino nacional de Angola é:', '["Hino da Liberdade", "Kwanza Livre", "Ó Pátria", "Angola Avante"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Recursos Humanos'), 'O maior rio inteiramente angolano é o:', '["Rio Zambeze", "Rio Kwanza", "Rio Congo", "Rio Nilo"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Recursos Humanos'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["4 de Abril", "11 de Novembro", "17 de Setembro", "4 de Fevereiro"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Recursos Humanos'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["4 de Fevereiro", "4 de Abril", "1 de Maio", "25 de Maio"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Recursos Humanos'), 'As cores da bandeira de Angola são:', '["Verde, amarelo e azul", "Vermelho, preto e amarelo", "Vermelho, branco e verde", "Azul, branco e vermelho"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Recursos Humanos'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Ignorar e deixar o problema crescer", "Fazer queixa sem falar com ele", "Conversar em privado e ajudar a corrigir o erro", "Expor o colega em público"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Recusar ambas", "Priorizar com a chefia e comunicar prazos realistas", "Escolher a mais fácil sem avisar", "Fazer as duas mal e à pressa"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Fingir que não ouve", "Mandar o utente embora", "Manter a calma, ouvir e procurar uma solução", "Responder no mesmo tom"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Trabalho em equipa eficaz implica:', '["Competir com os colegas a qualquer custo", "Guardar a informação para si", "Fazer tudo sozinho", "Partilhar informação e respeitar as opiniões dos outros"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Divulgar nas redes sociais", "Faltar ao trabalho", "Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Cumprir sem questionar"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Proatividade no trabalho significa:', '["Reclamar de tudo", "Fazer apenas o mínimo", "Esperar sempre por ordens", "Antecipar problemas e propor soluções"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ficar ofendido", "Ignorar", "Ouvir, refletir e procurar melhorar", "Responder com outra crítica"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Pontualidade e assiduidade demonstram:', '["Responsabilidade e respeito pelo serviço e pelos colegas", "Apenas medo do chefe", "Excesso de zelo inútil", "Falta de iniciativa"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Aceitar e não acelerar", "Pedir um presente maior", "Recusar e tratar o processo de forma igual aos outros", "Aceitar e acelerar"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Separar a equipa para sempre", "Levar o caso diretamente a tribunal", "Escolher logo um culpado", "Promover o diálogo para compreender as duas partes"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'Confidencialidade no serviço público significa:', '["Contar tudo à família", "Não divulgar informação reservada a que se tem acesso pelo cargo", "Publicar processos online", "Partilhar palavras-passe"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'A gestão do tempo melhora quando:', '["Se planeia o dia e se definem prioridades", "Se faz tudo ao mesmo tempo", "Se ignoram prazos", "Se adiam as tarefas difíceis sempre"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'A capital de Angola é:', '["Luanda", "Benguela", "Lubango", "Huambo"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'O hino nacional de Angola é:', '["Angola Avante", "Hino da Liberdade", "Ó Pátria", "Kwanza Livre"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'O maior rio inteiramente angolano é o:', '["Rio Zambeze", "Rio Nilo", "Rio Congo", "Rio Kwanza"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["17 de Setembro", "11 de Novembro", "4 de Abril", "4 de Fevereiro"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["25 de Maio", "4 de Abril", "1 de Maio", "4 de Fevereiro"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Contabilidade e Finanças'), 'As cores da bandeira de Angola são:', '["Vermelho, preto e amarelo", "Vermelho, branco e verde", "Verde, amarelo e azul", "Azul, branco e vermelho"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Contabilidade e Finanças'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Conversar em privado e ajudar a corrigir o erro", "Fazer queixa sem falar com ele", "Ignorar e deixar o problema crescer", "Expor o colega em público"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Escolher a mais fácil sem avisar", "Recusar ambas", "Fazer as duas mal e à pressa", "Priorizar com a chefia e comunicar prazos realistas"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Fingir que não ouve", "Mandar o utente embora", "Manter a calma, ouvir e procurar uma solução", "Responder no mesmo tom"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Trabalho em equipa eficaz implica:', '["Guardar a informação para si", "Partilhar informação e respeitar as opiniões dos outros", "Fazer tudo sozinho", "Competir com os colegas a qualquer custo"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Divulgar nas redes sociais", "Cumprir sem questionar", "Faltar ao trabalho"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Proatividade no trabalho significa:', '["Antecipar problemas e propor soluções", "Reclamar de tudo", "Fazer apenas o mínimo", "Esperar sempre por ordens"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ficar ofendido", "Responder com outra crítica", "Ignorar", "Ouvir, refletir e procurar melhorar"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Pontualidade e assiduidade demonstram:', '["Apenas medo do chefe", "Responsabilidade e respeito pelo serviço e pelos colegas", "Excesso de zelo inútil", "Falta de iniciativa"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Aceitar e acelerar", "Aceitar e não acelerar", "Recusar e tratar o processo de forma igual aos outros", "Pedir um presente maior"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Promover o diálogo para compreender as duas partes", "Escolher logo um culpado", "Separar a equipa para sempre", "Levar o caso diretamente a tribunal"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'Confidencialidade no serviço público significa:', '["Contar tudo à família", "Publicar processos online", "Partilhar palavras-passe", "Não divulgar informação reservada a que se tem acesso pelo cargo"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'A gestão do tempo melhora quando:', '["Se faz tudo ao mesmo tempo", "Se adiam as tarefas difíceis sempre", "Se ignoram prazos", "Se planeia o dia e se definem prioridades"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'A capital de Angola é:', '["Benguela", "Lubango", "Huambo", "Luanda"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'O hino nacional de Angola é:', '["Hino da Liberdade", "Angola Avante", "Ó Pátria", "Kwanza Livre"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'O maior rio inteiramente angolano é o:', '["Rio Kwanza", "Rio Zambeze", "Rio Nilo", "Rio Congo"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["17 de Setembro", "4 de Abril", "4 de Fevereiro", "11 de Novembro"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["25 de Maio", "1 de Maio", "4 de Fevereiro", "4 de Abril"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'), 'As cores da bandeira de Angola são:', '["Azul, branco e vermelho", "Verde, amarelo e azul", "Vermelho, preto e amarelo", "Vermelho, branco e verde"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Secretariado e Assistência Administrativa'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Conversar em privado e ajudar a corrigir o erro", "Ignorar e deixar o problema crescer", "Expor o colega em público", "Fazer queixa sem falar com ele"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Priorizar com a chefia e comunicar prazos realistas", "Recusar ambas", "Fazer as duas mal e à pressa", "Escolher a mais fácil sem avisar"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Manter a calma, ouvir e procurar uma solução", "Fingir que não ouve", "Mandar o utente embora", "Responder no mesmo tom"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'Trabalho em equipa eficaz implica:', '["Guardar a informação para si", "Partilhar informação e respeitar as opiniões dos outros", "Competir com os colegas a qualquer custo", "Fazer tudo sozinho"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Divulgar nas redes sociais", "Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Faltar ao trabalho", "Cumprir sem questionar"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'Proatividade no trabalho significa:', '["Reclamar de tudo", "Esperar sempre por ordens", "Fazer apenas o mínimo", "Antecipar problemas e propor soluções"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ouvir, refletir e procurar melhorar", "Ficar ofendido", "Responder com outra crítica", "Ignorar"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'Pontualidade e assiduidade demonstram:', '["Falta de iniciativa", "Excesso de zelo inútil", "Apenas medo do chefe", "Responsabilidade e respeito pelo serviço e pelos colegas"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Aceitar e não acelerar", "Pedir um presente maior", "Aceitar e acelerar", "Recusar e tratar o processo de forma igual aos outros"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Escolher logo um culpado", "Levar o caso diretamente a tribunal", "Separar a equipa para sempre", "Promover o diálogo para compreender as duas partes"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'Confidencialidade no serviço público significa:', '["Não divulgar informação reservada a que se tem acesso pelo cargo", "Contar tudo à família", "Partilhar palavras-passe", "Publicar processos online"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Direito'), 'A gestão do tempo melhora quando:', '["Se faz tudo ao mesmo tempo", "Se ignoram prazos", "Se adiam as tarefas difíceis sempre", "Se planeia o dia e se definem prioridades"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Direito'), 'A capital de Angola é:', '["Huambo", "Benguela", "Luanda", "Lubango"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Direito'), 'O hino nacional de Angola é:', '["Hino da Liberdade", "Angola Avante", "Kwanza Livre", "Ó Pátria"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Direito'), 'O maior rio inteiramente angolano é o:', '["Rio Kwanza", "Rio Zambeze", "Rio Nilo", "Rio Congo"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Direito'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["4 de Abril", "4 de Fevereiro", "17 de Setembro", "11 de Novembro"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Direito'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["4 de Fevereiro", "25 de Maio", "4 de Abril", "1 de Maio"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Direito'), 'As cores da bandeira de Angola são:', '["Azul, branco e vermelho", "Vermelho, branco e verde", "Vermelho, preto e amarelo", "Verde, amarelo e azul"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Direito'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Conversar em privado e ajudar a corrigir o erro", "Ignorar e deixar o problema crescer", "Expor o colega em público", "Fazer queixa sem falar com ele"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Recusar ambas", "Escolher a mais fácil sem avisar", "Fazer as duas mal e à pressa", "Priorizar com a chefia e comunicar prazos realistas"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Mandar o utente embora", "Responder no mesmo tom", "Manter a calma, ouvir e procurar uma solução", "Fingir que não ouve"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Trabalho em equipa eficaz implica:', '["Competir com os colegas a qualquer custo", "Partilhar informação e respeitar as opiniões dos outros", "Guardar a informação para si", "Fazer tudo sozinho"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Faltar ao trabalho", "Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Divulgar nas redes sociais", "Cumprir sem questionar"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Proatividade no trabalho significa:', '["Antecipar problemas e propor soluções", "Reclamar de tudo", "Fazer apenas o mínimo", "Esperar sempre por ordens"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ouvir, refletir e procurar melhorar", "Ignorar", "Ficar ofendido", "Responder com outra crítica"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Pontualidade e assiduidade demonstram:', '["Responsabilidade e respeito pelo serviço e pelos colegas", "Excesso de zelo inútil", "Apenas medo do chefe", "Falta de iniciativa"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Pedir um presente maior", "Aceitar e acelerar", "Aceitar e não acelerar", "Recusar e tratar o processo de forma igual aos outros"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Promover o diálogo para compreender as duas partes", "Escolher logo um culpado", "Levar o caso diretamente a tribunal", "Separar a equipa para sempre"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'Confidencialidade no serviço público significa:', '["Partilhar palavras-passe", "Publicar processos online", "Não divulgar informação reservada a que se tem acesso pelo cargo", "Contar tudo à família"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'A gestão do tempo melhora quando:', '["Se ignoram prazos", "Se faz tudo ao mesmo tempo", "Se planeia o dia e se definem prioridades", "Se adiam as tarefas difíceis sempre"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'A capital de Angola é:', '["Huambo", "Benguela", "Lubango", "Luanda"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'O hino nacional de Angola é:', '["Ó Pátria", "Angola Avante", "Hino da Liberdade", "Kwanza Livre"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'O maior rio inteiramente angolano é o:', '["Rio Congo", "Rio Kwanza", "Rio Zambeze", "Rio Nilo"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["17 de Setembro", "4 de Abril", "4 de Fevereiro", "11 de Novembro"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["25 de Maio", "1 de Maio", "4 de Fevereiro", "4 de Abril"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'), 'As cores da bandeira de Angola são:', '["Azul, branco e vermelho", "Vermelho, branco e verde", "Vermelho, preto e amarelo", "Verde, amarelo e azul"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Ciências Biológicas e Químicas'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Expor o colega em público", "Ignorar e deixar o problema crescer", "Fazer queixa sem falar com ele", "Conversar em privado e ajudar a corrigir o erro"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Recusar ambas", "Fazer as duas mal e à pressa", "Priorizar com a chefia e comunicar prazos realistas", "Escolher a mais fácil sem avisar"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Responder no mesmo tom", "Manter a calma, ouvir e procurar uma solução", "Fingir que não ouve", "Mandar o utente embora"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Trabalho em equipa eficaz implica:', '["Competir com os colegas a qualquer custo", "Guardar a informação para si", "Partilhar informação e respeitar as opiniões dos outros", "Fazer tudo sozinho"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Faltar ao trabalho", "Cumprir sem questionar", "Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Divulgar nas redes sociais"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Proatividade no trabalho significa:', '["Esperar sempre por ordens", "Antecipar problemas e propor soluções", "Fazer apenas o mínimo", "Reclamar de tudo"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Responder com outra crítica", "Ignorar", "Ficar ofendido", "Ouvir, refletir e procurar melhorar"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Pontualidade e assiduidade demonstram:', '["Falta de iniciativa", "Excesso de zelo inútil", "Responsabilidade e respeito pelo serviço e pelos colegas", "Apenas medo do chefe"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Aceitar e não acelerar", "Pedir um presente maior", "Aceitar e acelerar", "Recusar e tratar o processo de forma igual aos outros"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Promover o diálogo para compreender as duas partes", "Escolher logo um culpado", "Separar a equipa para sempre", "Levar o caso diretamente a tribunal"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'Confidencialidade no serviço público significa:', '["Publicar processos online", "Não divulgar informação reservada a que se tem acesso pelo cargo", "Partilhar palavras-passe", "Contar tudo à família"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A gestão do tempo melhora quando:', '["Se planeia o dia e se definem prioridades", "Se adiam as tarefas difíceis sempre", "Se faz tudo ao mesmo tempo", "Se ignoram prazos"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'A capital de Angola é:', '["Huambo", "Benguela", "Lubango", "Luanda"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'O hino nacional de Angola é:', '["Hino da Liberdade", "Ó Pátria", "Kwanza Livre", "Angola Avante"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'O maior rio inteiramente angolano é o:', '["Rio Nilo", "Rio Congo", "Rio Zambeze", "Rio Kwanza"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["17 de Setembro", "4 de Abril", "11 de Novembro", "4 de Fevereiro"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["4 de Fevereiro", "4 de Abril", "25 de Maio", "1 de Maio"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Física, Matemática e Geociências'), 'As cores da bandeira de Angola são:', '["Verde, amarelo e azul", "Vermelho, branco e verde", "Azul, branco e vermelho", "Vermelho, preto e amarelo"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Física, Matemática e Geociências'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Fazer queixa sem falar com ele", "Conversar em privado e ajudar a corrigir o erro", "Expor o colega em público", "Ignorar e deixar o problema crescer"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Priorizar com a chefia e comunicar prazos realistas", "Escolher a mais fácil sem avisar", "Recusar ambas", "Fazer as duas mal e à pressa"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Responder no mesmo tom", "Mandar o utente embora", "Manter a calma, ouvir e procurar uma solução", "Fingir que não ouve"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Trabalho em equipa eficaz implica:', '["Competir com os colegas a qualquer custo", "Partilhar informação e respeitar as opiniões dos outros", "Guardar a informação para si", "Fazer tudo sozinho"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Cumprir sem questionar", "Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Faltar ao trabalho", "Divulgar nas redes sociais"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Proatividade no trabalho significa:', '["Reclamar de tudo", "Fazer apenas o mínimo", "Esperar sempre por ordens", "Antecipar problemas e propor soluções"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ignorar", "Ficar ofendido", "Responder com outra crítica", "Ouvir, refletir e procurar melhorar"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Pontualidade e assiduidade demonstram:', '["Apenas medo do chefe", "Excesso de zelo inútil", "Falta de iniciativa", "Responsabilidade e respeito pelo serviço e pelos colegas"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Pedir um presente maior", "Recusar e tratar o processo de forma igual aos outros", "Aceitar e acelerar", "Aceitar e não acelerar"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Separar a equipa para sempre", "Levar o caso diretamente a tribunal", "Promover o diálogo para compreender as duas partes", "Escolher logo um culpado"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'Confidencialidade no serviço público significa:', '["Publicar processos online", "Não divulgar informação reservada a que se tem acesso pelo cargo", "Contar tudo à família", "Partilhar palavras-passe"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'A gestão do tempo melhora quando:', '["Se planeia o dia e se definem prioridades", "Se faz tudo ao mesmo tempo", "Se ignoram prazos", "Se adiam as tarefas difíceis sempre"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'A capital de Angola é:', '["Benguela", "Luanda", "Lubango", "Huambo"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'O hino nacional de Angola é:', '["Angola Avante", "Hino da Liberdade", "Kwanza Livre", "Ó Pátria"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'O maior rio inteiramente angolano é o:', '["Rio Congo", "Rio Kwanza", "Rio Zambeze", "Rio Nilo"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["4 de Fevereiro", "4 de Abril", "17 de Setembro", "11 de Novembro"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["4 de Fevereiro", "25 de Maio", "4 de Abril", "1 de Maio"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'), 'As cores da bandeira de Angola são:', '["Verde, amarelo e azul", "Vermelho, branco e verde", "Vermelho, preto e amarelo", "Azul, branco e vermelho"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Eletrónica, Telecomunicações e Eletricidade'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Conversar em privado e ajudar a corrigir o erro", "Expor o colega em público", "Ignorar e deixar o problema crescer", "Fazer queixa sem falar com ele"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Fazer as duas mal e à pressa", "Escolher a mais fácil sem avisar", "Priorizar com a chefia e comunicar prazos realistas", "Recusar ambas"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Responder no mesmo tom", "Mandar o utente embora", "Fingir que não ouve", "Manter a calma, ouvir e procurar uma solução"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Trabalho em equipa eficaz implica:', '["Competir com os colegas a qualquer custo", "Fazer tudo sozinho", "Guardar a informação para si", "Partilhar informação e respeitar as opiniões dos outros"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Faltar ao trabalho", "Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Cumprir sem questionar", "Divulgar nas redes sociais"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Proatividade no trabalho significa:', '["Antecipar problemas e propor soluções", "Reclamar de tudo", "Fazer apenas o mínimo", "Esperar sempre por ordens"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ficar ofendido", "Responder com outra crítica", "Ouvir, refletir e procurar melhorar", "Ignorar"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Pontualidade e assiduidade demonstram:', '["Excesso de zelo inútil", "Apenas medo do chefe", "Responsabilidade e respeito pelo serviço e pelos colegas", "Falta de iniciativa"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Recusar e tratar o processo de forma igual aos outros", "Aceitar e não acelerar", "Pedir um presente maior", "Aceitar e acelerar"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Promover o diálogo para compreender as duas partes", "Escolher logo um culpado", "Levar o caso diretamente a tribunal", "Separar a equipa para sempre"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'Confidencialidade no serviço público significa:', '["Contar tudo à família", "Partilhar palavras-passe", "Não divulgar informação reservada a que se tem acesso pelo cargo", "Publicar processos online"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'A gestão do tempo melhora quando:', '["Se planeia o dia e se definem prioridades", "Se ignoram prazos", "Se faz tudo ao mesmo tempo", "Se adiam as tarefas difíceis sempre"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'A capital de Angola é:', '["Luanda", "Lubango", "Benguela", "Huambo"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'O hino nacional de Angola é:', '["Kwanza Livre", "Ó Pátria", "Angola Avante", "Hino da Liberdade"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'O maior rio inteiramente angolano é o:', '["Rio Nilo", "Rio Congo", "Rio Zambeze", "Rio Kwanza"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["11 de Novembro", "17 de Setembro", "4 de Abril", "4 de Fevereiro"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["25 de Maio", "4 de Fevereiro", "4 de Abril", "1 de Maio"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'), 'As cores da bandeira de Angola são:', '["Azul, branco e vermelho", "Verde, amarelo e azul", "Vermelho, branco e verde", "Vermelho, preto e amarelo"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Comunicação Social e Jornalismo'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Fazer queixa sem falar com ele", "Expor o colega em público", "Conversar em privado e ajudar a corrigir o erro", "Ignorar e deixar o problema crescer"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Priorizar com a chefia e comunicar prazos realistas", "Recusar ambas", "Escolher a mais fácil sem avisar", "Fazer as duas mal e à pressa"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Responder no mesmo tom", "Fingir que não ouve", "Mandar o utente embora", "Manter a calma, ouvir e procurar uma solução"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Trabalho em equipa eficaz implica:', '["Competir com os colegas a qualquer custo", "Guardar a informação para si", "Fazer tudo sozinho", "Partilhar informação e respeitar as opiniões dos outros"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Faltar ao trabalho", "Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Cumprir sem questionar", "Divulgar nas redes sociais"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Proatividade no trabalho significa:', '["Fazer apenas o mínimo", "Esperar sempre por ordens", "Reclamar de tudo", "Antecipar problemas e propor soluções"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ignorar", "Ficar ofendido", "Ouvir, refletir e procurar melhorar", "Responder com outra crítica"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Pontualidade e assiduidade demonstram:', '["Falta de iniciativa", "Apenas medo do chefe", "Responsabilidade e respeito pelo serviço e pelos colegas", "Excesso de zelo inútil"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Aceitar e acelerar", "Recusar e tratar o processo de forma igual aos outros", "Pedir um presente maior", "Aceitar e não acelerar"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Levar o caso diretamente a tribunal", "Separar a equipa para sempre", "Promover o diálogo para compreender as duas partes", "Escolher logo um culpado"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'Confidencialidade no serviço público significa:', '["Partilhar palavras-passe", "Publicar processos online", "Contar tudo à família", "Não divulgar informação reservada a que se tem acesso pelo cargo"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'A gestão do tempo melhora quando:', '["Se ignoram prazos", "Se adiam as tarefas difíceis sempre", "Se planeia o dia e se definem prioridades", "Se faz tudo ao mesmo tempo"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'A capital de Angola é:', '["Huambo", "Benguela", "Lubango", "Luanda"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'O hino nacional de Angola é:', '["Hino da Liberdade", "Kwanza Livre", "Angola Avante", "Ó Pátria"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'O maior rio inteiramente angolano é o:', '["Rio Nilo", "Rio Zambeze", "Rio Kwanza", "Rio Congo"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["4 de Fevereiro", "17 de Setembro", "4 de Abril", "11 de Novembro"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["4 de Fevereiro", "25 de Maio", "4 de Abril", "1 de Maio"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Economia, Gestão e Marketing'), 'As cores da bandeira de Angola são:', '["Verde, amarelo e azul", "Vermelho, preto e amarelo", "Vermelho, branco e verde", "Azul, branco e vermelho"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Economia, Gestão e Marketing'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Fazer queixa sem falar com ele", "Ignorar e deixar o problema crescer", "Conversar em privado e ajudar a corrigir o erro", "Expor o colega em público"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Escolher a mais fácil sem avisar", "Fazer as duas mal e à pressa", "Priorizar com a chefia e comunicar prazos realistas", "Recusar ambas"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Manter a calma, ouvir e procurar uma solução", "Responder no mesmo tom", "Fingir que não ouve", "Mandar o utente embora"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Trabalho em equipa eficaz implica:', '["Fazer tudo sozinho", "Competir com os colegas a qualquer custo", "Guardar a informação para si", "Partilhar informação e respeitar as opiniões dos outros"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Cumprir sem questionar", "Recusar com respeito e, se necessário, comunicar pelos canais próprios", "Divulgar nas redes sociais", "Faltar ao trabalho"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Proatividade no trabalho significa:', '["Fazer apenas o mínimo", "Reclamar de tudo", "Antecipar problemas e propor soluções", "Esperar sempre por ordens"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ignorar", "Ficar ofendido", "Ouvir, refletir e procurar melhorar", "Responder com outra crítica"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Pontualidade e assiduidade demonstram:', '["Apenas medo do chefe", "Responsabilidade e respeito pelo serviço e pelos colegas", "Falta de iniciativa", "Excesso de zelo inútil"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Pedir um presente maior", "Aceitar e acelerar", "Recusar e tratar o processo de forma igual aos outros", "Aceitar e não acelerar"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Escolher logo um culpado", "Separar a equipa para sempre", "Promover o diálogo para compreender as duas partes", "Levar o caso diretamente a tribunal"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'Confidencialidade no serviço público significa:', '["Não divulgar informação reservada a que se tem acesso pelo cargo", "Contar tudo à família", "Publicar processos online", "Partilhar palavras-passe"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'A gestão do tempo melhora quando:', '["Se planeia o dia e se definem prioridades", "Se adiam as tarefas difíceis sempre", "Se faz tudo ao mesmo tempo", "Se ignoram prazos"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'A capital de Angola é:', '["Benguela", "Lubango", "Huambo", "Luanda"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'O hino nacional de Angola é:', '["Ó Pátria", "Hino da Liberdade", "Kwanza Livre", "Angola Avante"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'O maior rio inteiramente angolano é o:', '["Rio Nilo", "Rio Congo", "Rio Zambeze", "Rio Kwanza"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["4 de Abril", "17 de Setembro", "11 de Novembro", "4 de Fevereiro"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["25 de Maio", "4 de Fevereiro", "1 de Maio", "4 de Abril"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'), 'As cores da bandeira de Angola são:', '["Vermelho, branco e verde", "Verde, amarelo e azul", "Vermelho, preto e amarelo", "Azul, branco e vermelho"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Pedagogia, Antropologia e Divulgação Científica'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:', '["Ignorar e deixar o problema crescer", "Conversar em privado e ajudar a corrigir o erro", "Expor o colega em público", "Fazer queixa sem falar com ele"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um colega comete um erro que prejudica a equipa. A melhor atitude é:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:', '["Priorizar com a chefia e comunicar prazos realistas", "Recusar ambas", "Escolher a mais fácil sem avisar", "Fazer as duas mal e à pressa"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Recebe duas tarefas urgentes ao mesmo tempo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'Um utente fica irritado no atendimento. O mais adequado é:', '["Fingir que não ouve", "Responder no mesmo tom", "Mandar o utente embora", "Manter a calma, ouvir e procurar uma solução"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente fica irritado no atendimento. O mais adequado é:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'Trabalho em equipa eficaz implica:', '["Fazer tudo sozinho", "Competir com os colegas a qualquer custo", "Partilhar informação e respeitar as opiniões dos outros", "Guardar a informação para si"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Trabalho em equipa eficaz implica:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'Um superior pede-lhe algo contrário à lei. Deve:', '["Faltar ao trabalho", "Divulgar nas redes sociais", "Cumprir sem questionar", "Recusar com respeito e, se necessário, comunicar pelos canais próprios"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um superior pede-lhe algo contrário à lei. Deve:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'Proatividade no trabalho significa:', '["Reclamar de tudo", "Antecipar problemas e propor soluções", "Esperar sempre por ordens", "Fazer apenas o mínimo"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Proatividade no trabalho significa:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'Ao receber uma crítica construtiva, a atitude certa é:', '["Ignorar", "Ficar ofendido", "Responder com outra crítica", "Ouvir, refletir e procurar melhorar"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Ao receber uma crítica construtiva, a atitude certa é:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'Pontualidade e assiduidade demonstram:', '["Apenas medo do chefe", "Excesso de zelo inútil", "Responsabilidade e respeito pelo serviço e pelos colegas", "Falta de iniciativa"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Pontualidade e assiduidade demonstram:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:', '["Aceitar e não acelerar", "Aceitar e acelerar", "Recusar e tratar o processo de forma igual aos outros", "Pedir um presente maior"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Um utente oferece-lhe um presente para acelerar o seu processo. Deve:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'Num conflito entre colegas, o primeiro passo recomendado é:', '["Levar o caso diretamente a tribunal", "Escolher logo um culpado", "Separar a equipa para sempre", "Promover o diálogo para compreender as duas partes"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Num conflito entre colegas, o primeiro passo recomendado é:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'Confidencialidade no serviço público significa:', '["Partilhar palavras-passe", "Publicar processos online", "Contar tudo à família", "Não divulgar informação reservada a que se tem acesso pelo cargo"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'Confidencialidade no serviço público significa:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Comportamental', (select id from public.categorias where nome = 'Motorista'), 'A gestão do tempo melhora quando:', '["Se faz tudo ao mesmo tempo", "Se adiam as tarefas difíceis sempre", "Se ignoram prazos", "Se planeia o dia e se definem prioridades"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A gestão do tempo melhora quando:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Motorista'), 'A capital de Angola é:', '["Benguela", "Luanda", "Huambo", "Lubango"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'A capital de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Motorista'), 'O hino nacional de Angola é:', '["Kwanza Livre", "Hino da Liberdade", "Angola Avante", "Ó Pátria"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O hino nacional de Angola é:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Motorista'), 'O maior rio inteiramente angolano é o:', '["Rio Nilo", "Rio Congo", "Rio Kwanza", "Rio Zambeze"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O maior rio inteiramente angolano é o:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Motorista'), 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:', '["4 de Abril", "17 de Setembro", "11 de Novembro", "4 de Fevereiro"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia da Paz e da Reconciliação Nacional em Angola celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Motorista'), 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:', '["25 de Maio", "4 de Abril", "4 de Fevereiro", "1 de Maio"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'O Dia do Início da Luta Armada de Libertação Nacional celebra-se a:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'conhecimento', 'Cultura Geral', (select id from public.categorias where nome = 'Motorista'), 'As cores da bandeira de Angola são:', '["Azul, branco e vermelho", "Vermelho, preto e amarelo", "Verde, amarelo e azul", "Vermelho, branco e verde"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'conhecimento' and enunciado = 'As cores da bandeira de Angola são:' and categoria_id = (select id from public.categorias where nome = 'Motorista'));
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Verbal', null, 'Qual é o sinónimo de «diligente»?', '["Preguiçoso", "Atrasado", "Distraído", "Esforçado"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Qual é o sinónimo de «diligente»?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Verbal', null, 'Qual é o sinónimo de «exequível»?', '["Executado", "Impossível", "Excessivo", "Realizável"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Qual é o sinónimo de «exequível»?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Verbal', null, 'Qual é o sinónimo de «ímpeto»?', '["Impedimento", "Calma", "Impulso", "Imposto"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Qual é o sinónimo de «ímpeto»?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Verbal', null, 'Qual é o antónimo de «efémero»?', '["Duradouro", "Breve", "Momentâneo", "Passageiro"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Qual é o antónimo de «efémero»?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Verbal', null, 'Qual é o antónimo de «rudimentar»?', '["Primitivo", "Básico", "Simples", "Sofisticado"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Qual é o antónimo de «rudimentar»?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Verbal', null, 'Escolha a grafia correta:', '["Beneficente", "Beneficiente", "Benefecente", "Beneficênte"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Escolha a grafia correta:' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Verbal', null, 'Selecione a palavra com a grafia correta:', '["Cidadánia", "Cidadania", "Sidadania", "Cidadanía"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Selecione a palavra com a grafia correta:' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Verbal', null, 'Completa a analogia: Livro está para biblioteca assim como quadro está para:', '["Pincel", "Parede", "Pintor", "Museu"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Completa a analogia: Livro está para biblioteca assim como quadro está para:' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Verbal', null, 'Completa a analogia: Frio está para quente assim como alto está para:', '["Comprido", "Largo", "Baixo", "Grande"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Completa a analogia: Frio está para quente assim como alto está para:' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Verbal', null, 'Qual palavra NÃO pertence ao grupo? Mesa, Cadeira, Armário, Martelo', '["Mesa", "Armário", "Cadeira", "Martelo"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Qual palavra NÃO pertence ao grupo? Mesa, Cadeira, Armário, Martelo' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Raciocínio Lógico', null, 'Se todos os A são B e nenhum B é C, então:', '["Todos os B são A", "Alguns A são C", "Nenhum A é C", "Todos os C são A"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Se todos os A são B e nenhum B é C, então:' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Raciocínio Lógico', null, 'Maria é mais velha que Joana e mais nova que Teresa. Quem é a mais velha?', '["Teresa", "Joana", "Maria", "Não é possível saber"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Maria é mais velha que Joana e mais nova que Teresa. Quem é a mais velha?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Raciocínio Lógico', null, 'Se o dia depois de amanhã é sexta-feira, que dia foi anteontem?', '["Domingo", "Segunda-feira", "Terça-feira", "Quarta-feira"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Se o dia depois de amanhã é sexta-feira, que dia foi anteontem?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Raciocínio Lógico', null, 'Quatro amigos sentam-se à volta de uma mesa quadrada. A está em frente a C. B está à direita de A. Quem está à esquerda de A?', '["B", "Ninguém", "C", "D"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Quatro amigos sentam-se à volta de uma mesa quadrada. A está em frente a C. B está à direita de A. Quem está à esquerda de A?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Raciocínio Lógico', null, 'Um cubo pintado de azul é cortado em 27 cubinhos iguais. Quantos cubinhos não têm nenhuma face pintada?', '["0", "8", "1", "6"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Um cubo pintado de azul é cortado em 27 cubinhos iguais. Quantos cubinhos não têm nenhuma face pintada?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Raciocínio Lógico', null, 'Num código, CASA escreve-se DBTB. Como se escreve MESA?', '["NFTB", "NETB", "NFSB", "LDRZ"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Num código, CASA escreve-se DBTB. Como se escreve MESA?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Matemática Lógica', null, 'Um trabalhador ganha 120 000 Kz e recebe um aumento de 15%. Qual é o novo salário?', '["150 000 Kz", "132 000 Kz", "135 000 Kz", "138 000 Kz"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Um trabalhador ganha 120 000 Kz e recebe um aumento de 15%. Qual é o novo salário?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Matemática Lógica', null, 'Num concurso há 61 vagas e 6 100 candidatos. Quantos candidatos há por vaga?', '["61", "100", "1 000", "10"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Num concurso há 61 vagas e 6 100 candidatos. Quantos candidatos há por vaga?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Matemática Lógica', null, 'Um teste tem 40 questões e o candidato acertou 30. Qual a nota na escala de 0 a 20?', '["30", "16", "12", "15"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Um teste tem 40 questões e o candidato acertou 30. Qual a nota na escala de 0 a 20?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Matemática Lógica', null, 'Se 4 impressoras imprimem 400 páginas em 10 minutos, quantas páginas imprimem 2 impressoras em 20 minutos?', '["800", "200", "100", "400"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Se 4 impressoras imprimem 400 páginas em 10 minutos, quantas páginas imprimem 2 impressoras em 20 minutos?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Matemática Lógica', null, 'Uma sala tem 8 filas com 12 cadeiras cada. Estão ocupadas 3/4. Quantas cadeiras estão livres?', '["32", "20", "72", "24"]'::jsonb, 3
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Uma sala tem 8 filas com 12 cadeiras cada. Estão ocupadas 3/4. Quantas cadeiras estão livres?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Numérica', null, 'Quanto é 25% de 25% de 1 600?', '["100", "200", "400", "50"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Quanto é 25% de 25% de 1 600?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Numérica', null, 'Quanto é 1/2 + 1/3?', '["2/3", "1/6", "5/6", "2/5"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Quanto é 1/2 + 1/3?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Numérica', null, 'Qual é o próximo número? 2, 6, 12, 20, 30, ?', '["36", "42", "44", "40"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Qual é o próximo número? 2, 6, 12, 20, 30, ?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Numérica', null, 'Qual é o próximo número? 1, 4, 9, 16, 25, ?', '["36", "49", "35", "30"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Qual é o próximo número? 1, 4, 9, 16, 25, ?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Aptidão Numérica', null, 'Qual é o próximo número? 100, 50, 25, 12,5, ?', '["6,25", "10", "6", "7,5"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Qual é o próximo número? 100, 50, 25, 12,5, ?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Atenção e Concentração', null, 'Quantos números pares existem na sequência: 3 8 5 2 9 4 7 6 1 0?', '["6", "5", "4", "3"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Quantos números pares existem na sequência: 3 8 5 2 9 4 7 6 1 0?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Atenção e Concentração', null, 'Quantas vezes aparece o algarismo 7 em: 1774 7071 3777 2071?', '["9", "7", "8", "6"]'::jsonb, 2
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Quantas vezes aparece o algarismo 7 em: 1774 7071 3777 2071?' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Atenção e Concentração', null, 'Qual das datas é DIFERENTE? 11/11/1975 · 11/11/1975 · 11/11/1957 · 11/11/1975', '["11/11/1957", "11/11/1975", "Nenhuma", "Todas iguais"]'::jsonb, 0
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Qual das datas é DIFERENTE? 11/11/1975 · 11/11/1975 · 11/11/1957 · 11/11/1975' and categoria_id is null);
insert into public.questoes (tipo, area, categoria_id, enunciado, opcoes, correta)
select 'psico', 'Atenção e Concentração', null, 'Quantas palavras com a letra «r» há na frase: «o treino regular prepara para o concurso»?', '["6", "5", "4", "3"]'::jsonb, 1
where not exists (select 1 from public.questoes where tipo = 'psico' and enunciado = 'Quantas palavras com a letra «r» há na frase: «o treino regular prepara para o concurso»?' and categoria_id is null);
