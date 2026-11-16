# -*- coding: utf-8 -*-
"""MININT — reforço dos tópicos pedidos pelos candidatos (Nov. 2026):
SIC, Organização do MININT, Organização Política e Administrativa,
Noções gerais de Administração Pública, História de Angola e Patriotismo.
Formato: (area, enunciado, correta, [distratores])"""

CATEGORIA = "Ministério do Interior (MININT) — Prova Escrita"

SIC, MI, OP, NAP, H, PA = ("Serviço de Investigação Criminal (SIC)", "Ministério do Interior",
                           "Organização Política e Administrativa", "Noções Gerais de Administração Pública",
                           "História de Angola", "Patriotismo e Símbolos Nacionais")

QUESTOES = [
    # ---------------- SIC ----------------
    (SIC, "O Serviço de Investigação Criminal (SIC) foi oficializado em:", "2015", ["1975", "2002", "2010"]),
    (SIC, "O SIC resultou da fusão de quais organismos?", "Direcção Nacional de Investigação Criminal (DNIC) e Polícia Económica", ["Polícia de Trânsito e Polícia Fiscal", "SME e Serviço Penitenciário", "Polícia de Intervenção Rápida e Bombeiros"]),
    (SIC, "Com a sua criação, o SIC deixou de depender do Comando-Geral da Polícia Nacional e passou a depender directamente:", "Do Ministério do Interior", ["Do Ministério da Justiça", "Da Assembleia Nacional", "Do Tribunal Supremo"]),
    (SIC, "O primeiro Director-Geral do SIC, empossado em 2015, foi:", "Eugénio Pedro Alexandre", ["Ângelo da Veiga Tavares", "Manuel Homem", "Eugénio Laborinho"]),
    (SIC, "A missão principal do SIC é:", "A prevenção, investigação e combate à criminalidade", ["A emissão de passaportes e vistos", "O combate a incêndios", "A custódia de reclusos"]),
    (SIC, "Qual destes crimes está entre as prioridades de investigação do SIC?", "Branqueamento de capitais", ["Estacionamento em local proibido", "Atraso no pagamento da renda", "Falta de uso do cinto de segurança"]),
    (SIC, "O tráfico de seres humanos e de órgãos é um crime cuja investigação compete principalmente ao:", "SIC", ["Serviço de Protecção Civil e Bombeiros", "Serviço Penitenciário", "Ministério da Cultura"]),
    (SIC, "Na fase de instrução preparatória do processo penal, os órgãos de polícia criminal, como o SIC, actuam sob a direcção:", "Do Ministério Público", ["Do Governador Provincial", "Do advogado do arguido", "Do Administrador Municipal"]),
    (SIC, "O SIC é classificado como:", "Órgão de polícia criminal", ["Órgão de soberania", "Tribunal", "Autarquia local"]),
    (SIC, "Ao chegar ao local de um crime, o primeiro cuidado do agente de investigação deve ser:", "Isolar e preservar o local, sem mexer nos vestígios", ["Limpar o local para facilitar a passagem", "Recolher objectos sem registar", "Permitir a entrada de curiosos"]),
    (SIC, "A «cadeia de custódia» da prova consiste em:", "Documentar e garantir a integridade dos vestígios desde a recolha até ao tribunal", ["Prender o suspeito numa cela", "Guardar as provas em casa do agente", "Destruir as provas depois do julgamento"]),
    (SIC, "O agente do SIC que divulga nas redes sociais informações de um processo em investigação viola:", "O segredo de justiça", ["O direito de reunião", "O dever de assiduidade", "A liberdade religiosa"]),
    (SIC, "Considera-se em flagrante delito quem:", "Está a cometer o crime ou acabou de o cometer", ["Foi denunciado há um ano", "Tem antecedentes criminais", "Mora perto do local do crime"]),
    (SIC, "Segundo a lei angolana, o detido deve ser apresentado à autoridade judiciária competente no prazo máximo de:", "48 horas", ["7 dias", "30 dias", "6 meses"]),
    (SIC, "A investigação de crimes económico-financeiros, antes a cargo da Polícia Económica, passou a ser feita pelo:", "SIC", ["SME", "Serviço Penitenciário", "Ministério das Finanças"]),

    # ---------------- Organização do MININT ----------------
    (MI, "Desde Novembro de 2024, o Ministro do Interior de Angola é:", "Manuel Homem", ["Eugénio Laborinho", "Ângelo da Veiga Tavares", "Sebastião Martins"]),
    (MI, "Antes de assumir o Ministério do Interior, Manuel Homem era:", "Governador da Província de Luanda", ["Comandante-Geral da Polícia Nacional", "Director do SIC", "Presidente da Assembleia Nacional"]),
    (MI, "Manuel Homem substituiu no cargo de Ministro do Interior:", "Eugénio Laborinho", ["Ângelo da Veiga Tavares", "João Lourenço", "Fernando Garcia Miala"]),
    (MI, "Os órgãos executivos centrais do MININT são, além da Polícia Nacional:", "SIC, SME, Serviço Penitenciário e Serviço de Protecção Civil e Bombeiros", ["FAA, SINSE, PGR e AGT", "BNA, INE, ENAPP e INSS", "Tribunal Supremo e Tribunal de Contas"]),
    (MI, "A emissão de passaportes ordinários e a concessão de vistos competem ao:", "Serviço de Migração e Estrangeiros (SME)", ["SIC", "Serviço Penitenciário", "Ministério da Saúde"]),
    (MI, "A emissão do Bilhete de Identidade de cidadão nacional é da responsabilidade:", "Do Ministério da Justiça e dos Direitos Humanos", ["Do Serviço Penitenciário", "Do Serviço de Protecção Civil e Bombeiros", "Do Ministério do Turismo"]),
    (MI, "Segundo a Constituição, a Polícia Nacional é uma instituição:", "Permanente, regular e apartidária, organizada com base na hierarquia e na disciplina", ["Temporária e partidária", "Privada e lucrativa", "Dependente dos governos provinciais"]),
    (MI, "O mais alto cargo de comando da Polícia Nacional de Angola é o de:", "Comandante-Geral", ["Ministro do Interior", "Director-Geral do SIC", "Chefe do Estado-Maior General"]),
    (MI, "O efectivo do MININT, perante uma ordem manifestamente ilegal que implique a prática de um crime, deve:", "Recusar o seu cumprimento", ["Cumpri-la sem questionar", "Divulgá-la nas redes sociais", "Abandonar o serviço"]),
    (MI, "A relação entre um agente e o seu comandante assenta principalmente no princípio:", "Da hierarquia e disciplina", ["Da livre negociação", "Da igualdade de comando", "Da eleição dos chefes"]),
    (MI, "A gestão das cadeias e a execução das penas de prisão competem ao:", "Serviço Penitenciário", ["SIC", "SME", "Tribunal Constitucional"]),

    # ---------------- Organização Política e Administrativa ----------------
    (OP, "Com a Lei da Divisão Político-Administrativa (Lei n.º 14/24), Angola passou a ter:", "21 províncias, 326 municípios e 378 comunas", ["18 províncias, 164 municípios e 518 comunas", "20 províncias, 300 municípios e 400 comunas", "25 províncias, 250 municípios e 350 comunas"]),
    (OP, "Antes da nova divisão político-administrativa de 2024, Angola tinha:", "18 províncias", ["15 províncias", "21 províncias", "25 províncias"]),
    (OP, "A província de Icolo e Bengo foi criada a partir da divisão da província de:", "Luanda", ["Bengo", "Cuanza Norte", "Malanje"]),
    (OP, "As províncias do Cuando e do Cubango resultaram da divisão da antiga província de:", "Cuando Cubango", ["Moxico", "Huíla", "Cunene"]),
    (OP, "Segundo a Constituição, o titular do Poder Executivo é:", "O Presidente da República", ["O Presidente da Assembleia Nacional", "O Ministro de Estado e Chefe da Casa Civil", "O Tribunal Constitucional"]),
    (OP, "Os Ministros de Estado e os Ministros são, segundo a Constituição:", "Órgãos auxiliares do Presidente da República", ["Órgãos de soberania independentes", "Eleitos directamente pelos cidadãos", "Juízes do Tribunal Supremo"]),
    (OP, "O mandato do Presidente da República e dos Deputados à Assembleia Nacional é de:", "5 anos", ["4 anos", "6 anos", "7 anos"]),
    (OP, "Apreciar a constitucionalidade das leis compete ao:", "Tribunal Constitucional", ["Tribunal de Contas", "Ministério do Interior", "Governo Provincial"]),
    (OP, "O órgão público independente que defende os direitos dos cidadãos perante a Administração Pública é o:", "Provedor de Justiça", ["Comandante-Geral da Polícia", "Governador do BNA", "Director do SIC"]),
    (OP, "Exercer a acção penal e defender a legalidade democrática compete, em especial, à:", "Procuradoria-Geral da República", ["Assembleia Nacional", "Polícia Nacional", "Administração Municipal"]),
    (OP, "O Orçamento Geral do Estado (OGE) é aprovado:", "Pela Assembleia Nacional, sob proposta do Executivo", ["Pelo Tribunal Supremo", "Pelos Governadores Provinciais", "Pelo Banco Nacional de Angola sem intervenção do Parlamento"]),
    (OP, "Na estrutura da administração local do Estado, o município é dirigido por um:", "Administrador Municipal", ["Governador Provincial", "Ministro", "Juiz de Direito"]),

    # ---------------- Noções Gerais de Administração Pública ----------------
    (NAP, "A finalidade da Administração Pública é:", "A prossecução do interesse público, no respeito pelos direitos dos cidadãos", ["O lucro do Estado", "A defesa dos interesses dos funcionários", "A promoção de partidos políticos"]),
    (NAP, "Segundo o princípio da legalidade, a Administração Pública:", "Só pode agir com base na lei e dentro dos limites da lei", ["Pode fazer tudo o que a lei não proíbe", "Está acima da lei", "Só obedece ao chefe directo"]),
    (NAP, "O princípio da imparcialidade obriga a Administração a:", "Tratar todos os interessados com isenção, sem favoritismos", ["Favorecer familiares e amigos", "Decidir sempre a favor do Estado", "Não ouvir os cidadãos"]),
    (NAP, "O princípio da proporcionalidade exige que as decisões administrativas:", "Sejam adequadas, necessárias e não excessivas face ao fim pretendido", ["Sejam sempre as mais severas", "Sejam tomadas por sorteio", "Beneficiem a maioria política"]),
    (NAP, "O princípio da igualdade proíbe a Administração de:", "Privilegiar ou prejudicar alguém em razão da raça, sexo, religião, origem ou opinião política", ["Cobrar impostos", "Aplicar a lei", "Atender os cidadãos por ordem de chegada"]),
    (NAP, "A desconcentração administrativa consiste em:", "Distribuir competências por órgãos subordinados dentro da mesma pessoa colectiva", ["Transferir poderes para entidades privadas", "Extinguir serviços públicos", "Concentrar todas as decisões no Presidente"]),
    (NAP, "A descentralização administrativa consiste em:", "Transferir atribuições do Estado para outras pessoas colectivas públicas, como as autarquias locais", ["Mudar a capital do país", "Distribuir funções entre secções do mesmo ministério", "Privatizar empresas públicas"]),
    (NAP, "Os ministérios e os seus serviços centrais integram a:", "Administração directa do Estado", ["Administração autónoma", "Administração indirecta", "Actividade privada"]),
    (NAP, "Os institutos públicos, com personalidade jurídica própria, integram a:", "Administração indirecta do Estado", ["Administração directa do Estado", "Função legislativa", "Função jurisdicional"]),
    (NAP, "As autarquias locais integram a:", "Administração autónoma", ["Administração directa do Estado", "Função jurisdicional", "Administração militar"]),
    (NAP, "O acto administrativo é:", "Uma decisão de um órgão da Administração que produz efeitos jurídicos num caso concreto", ["Uma lei aprovada pela Assembleia Nacional", "Uma sentença de um tribunal", "Um contrato entre particulares"]),
    (NAP, "Quando o cidadão contesta uma decisão junto do próprio autor do acto, apresenta uma:", "Reclamação", ["Recurso hierárquico", "Queixa-crime", "Petição de habeas corpus"]),
    (NAP, "Quando o cidadão contesta uma decisão junto do superior hierárquico de quem a tomou, apresenta um:", "Recurso hierárquico", ["Reclamação", "Requerimento de férias", "Recurso de revista"]),
    (NAP, "Um serviço público orientado para o cidadão deve, acima de tudo:", "Atender com cortesia, rapidez e transparência", ["Exigir gratificações para acelerar processos", "Atender primeiro os conhecidos", "Esconder informação"]),

    # ---------------- História de Angola ----------------
    (H, "O dia 4 de Fevereiro de 1961 assinala:", "O início da luta armada de libertação nacional", ["A proclamação da independência", "A assinatura dos Acordos de Alvor", "O fim da guerra civil"]),
    (H, "O MPLA foi fundado, segundo a data oficial, em:", "1956", ["1961", "1966", "1975"]),
    (H, "A UNITA foi fundada em:", "1966", ["1956", "1975", "1991"]),
    (H, "A profetisa do Reino do Kongo que liderou o movimento antoniano e foi executada em 1706 foi:", "Kimpa Vita (D. Beatriz)", ["Njinga Mbandi", "Lueji", "Deolinda Rodrigues"]),
    (H, "O nome «Angola» tem origem no título dos reis do Ndongo, que era:", "Ngola", ["Mani", "Soba", "Mwata"]),
    (H, "A batalha de Mbwila (Ambuíla), em que o Reino do Kongo foi derrotado pelos portugueses, ocorreu em:", "1665", ["1482", "1885", "1961"]),
    (H, "O dia 1 de Agosto celebra:", "O Dia das Forças Armadas (criação das FAPLA, em 1974)", ["O Dia da Independência", "O Dia da Paz", "O Dia do Herói Nacional"]),
    (H, "Angola foi admitida como membro da Organização das Nações Unidas (ONU) em:", "1976", ["1961", "1975", "1992"]),
    (H, "O Dia da Mulher Angolana celebra-se a:", "2 de Março", ["8 de Março", "4 de Abril", "11 de Novembro"]),
    (H, "O dia 4 de Abril é feriado nacional dedicado à:", "Paz e Reconciliação Nacional", ["Independência Nacional", "Mulher Angolana", "Polícia Nacional"]),

    # ---------------- Patriotismo ----------------
    (PA, "Segundo a Constituição, a defesa da Pátria é:", "Direito e dever fundamental de todos os angolanos", ["Tarefa exclusiva dos militares estrangeiros", "Opcional para os cidadãos", "Obrigação apenas dos políticos"]),
    (PA, "Na Insígnia da República de Angola, o livro aberto simboliza:", "A educação e a cultura", ["A Constituição apenas", "A religião", "O comércio"]),
    (PA, "O hino nacional de Angola chama-se:", "«Angola Avante»", ["«Angola Unida»", "«Pátria Amada»", "«Hino da Liberdade»"]),
    (PA, "Qual destas atitudes revela patriotismo de um agente do MININT?", "Servir o cidadão com honestidade e recusar a corrupção", ["Aceitar «gasosas» para facilitar processos", "Usar a farda para benefício pessoal", "Faltar ao serviço sem justificação"]),
    (PA, "Participar nas eleições e cumprir as obrigações fiscais são exemplos de:", "Cidadania e patriotismo", ["Actos de rebeldia", "Deveres apenas dos funcionários públicos", "Actividades proibidas"]),
    (PA, "A unidade nacional significa:", "A união de todos os angolanos, acima das diferenças de origem, língua, etnia ou religião", ["A separação das províncias", "A existência de um único partido", "A superioridade de uma região sobre as outras"]),
]
