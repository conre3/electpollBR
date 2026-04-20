
<!-- README.md is generated from README.Rmd. Please edit that file -->

# electpollBR

<!-- badges: start -->

<!-- badges: end -->

The goal of electpollBR is to …

- funcionalidades a implementar
  - função para setar o diretório de download (para lidar com
    interrupção e continuação de dowload parcial)
  - função para baixar o arquivo de dados de registro das pesquisas
    segundo ano e opcionalmente estado
    - função de definição das URIs dos arquivos a baixar
    - função de download da URI em diretório de dados brutos
    - função de descompactação do arquivo baixado
    - função de importação do arquivo descompatado
    - função de faxina dos dados importados
    - função de gravação em diretório de dados limpos
  - dúvida: precisaria de:
    - função de exportação dos dados limpos
    - função para listar as pesquisas
    - função de busca por

## Installation

You can install the development version of `{electpollBR}` from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("conre3/electpollBR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
#library(electpollBR)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" alt="" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
