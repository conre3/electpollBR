
<!-- README.md is generated from README.Rmd. Please edit that file -->

# electpollBR

<!-- badges: start -->

<!-- badges: end -->

The goal of electpollBR is to

- download and tidy up data from Brazilian Electoral Justice on
  registered electoral polls (not only results, but mainly registration
  data, like the company that conducted the poll, when and where it was
  conducted, technical responsible, contractor, payer, invoice,
  questionnaire, and coverage)
- list availability of data by year
- check whether or not the previously downloaded data file is still
  up-to-date, avoiding downloading it again needlessly

## Installation

You can install the development version of `{electpollBR}` from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("conre3/electpollBR")
```

## Package Design

Funcionalidades a implementar

- função de setup do diretório de download
  - para lidar com interrupção e continuação de dowload parcial
  - parâmetros
    - keep.download=TRUE
    - download.path=“./data/electpollBR/raw/”
    - save.path=“./data/electpollBR/”
    - save.copy.on.base=TRUE
  - criar os diretório
    - “./data/” (se não existir)
    - “./data/electpollBR/”
    - “./data/electpollBR/raw/” (diretório de dados brutos)
  - criar o arquivo
    - “./data/.gitignore” (com “electpollBR/)
- função para listar as pesquisas
- função para baixar o arquivo de dados de registro das pesquisas
  segundo ano e opcionalmente estado
  - verifica
  - função de definição das URIs dos arquivos a baixar
  - função para verificar se a versão do arquivos de dados no site é
    mais recente do que a versão já baixada
  - função de download da URI em diretório de dados brutos
  - função de descompactação do arquivo baixado
  - função de importação do arquivo descompatado
  - função de faxina dos dados importados
  - função de gravação em diretório de dados limpos
- dúvida: precisaria de:
  - função de exportação dos dados limpos
  - função de busca por ano

Reminder to self:

- incluir arquivos .R com a função `use_r("nome_função")`
  - a função `use_r("nome_função")`
    - cria `./R/nome_função.R` se não existir
    - abre e põe como arquivo ativo se existir
  - a função `use_r()` mostra qual é o arquivo ativo
- criar arquivo de teste com a função `use_test()`
  - a função `use_test()`
    - cria `./tests/testthat/test_nome_função.R` se `./R/nome_função.R`
      for o arquivo ativo
    - abre o script `./tests/testthat/test_nome_função.R` se ele existir
- para renomear .R e seu script de teste de uma só vez, usar
  `rename_files("nome_velho", "nome_novo")`
