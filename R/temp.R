####
# temporary script to download and treat 2026 data already
###

# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/769a663e-12c5-489e-a9c8-04633c2d57a3
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/pesquisa_eleitoral_2026.zip
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/5675d403-63ce-4a39-bd00-fc110ef999a7
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/pesquisa_contratante_2026.zip
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/32fc58de-8369-4b9f-9c97-1647f8de49cb
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/pesquisa_pagante_2026.zip
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/7d83679f-c252-493b-98ad-e532c7fa7252
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/nota_fiscal_2026.zip
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/e2520f5b-c7c9-453f-9f4a-2a96214570a0
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/questionario_pesquisa_2026.zip
#
# https://dadosabertos.tse.jus.br/dataset/pesquisas-eleitorais-2026/resource/fc6b7e48-540d-4f94-a412-8829d5f022d3
# https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/bairro_municipio_2026.zip

# baixa todo mundo ----
## ZIPs de CSV ----
download.file("https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/pesquisa_eleitoral_2026.zip", destfile = "data/pesquisa_eleitoral_2026.zip", method = "curl")
download.file("https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/pesquisa_contratante_2026.zip", destfile = "data/pesquisa_contratante_2026.zip", method = "curl")
download.file("https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/pesquisa_pagante_2026.zip", destfile = "data/pesquisa_pagante_2026.zip", method = "curl")
## ZIPs de PDF (mais pesados) ----
download.file("https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/nota_fiscal_2026.zip", destfile = "data/nota_fiscal_2026.zip", method = "curl")
download.file("https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/questionario_pesquisa_2026.zip", destfile = "data/questionario_pesquisa_2026.zip", method = "curl")
download.file("https://cdn.tse.jus.br/estatistica/sead/odsele/pesquisa_eleitoral/bairro_municipio_2026.zip", destfile = "data/bairro_municipio_2026.zip", method = "curl")

