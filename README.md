<!-- README.md is generated from README.Rmd. Please edit that file -->

# badger: Badge for R Package

[![](https://www.r-pkg.org/badges/version/badger?color=green)](https://cran.r-project.org/package=badger)
[![](http://cranlogs.r-pkg.org/badges/grand-total/badger?color=green)](https://cran.r-project.org/package=badger)
[![](http://cranlogs.r-pkg.org/badges/last-month/badger?color=green)](https://cran.r-project.org/package=badger)
[![](http://cranlogs.r-pkg.org/badges/last-week/badger?color=green)](https://cran.r-project.org/package=badger)

Query information and generate badge for using in README and GitHub
Pages.

## Author

Guangchuang YU <https://guangchuangyu.github.io>

School of Basic Medical Sciences, Southern Medical
University

[![saythanks](https://img.shields.io/badge/say-thanks-ff69b4.svg)](https://saythanks.io/to/GuangchuangYu)
[![](https://img.shields.io/badge/follow%20me%20on-微信-green.svg)](https://guangchuangyu.github.io/blog_images/biobabble.jpg)
[![](https://img.shields.io/badge/打赏-支付宝/微信-green.svg)](https://guangchuangyu.github.io/blog_images/pay_qrcode.png)

## Installation

Get the released version from CRAN:

``` r
install.packages("badger")
```

Or the development version from github:

``` r
## install.packages("devtools")
devtools::install_github("GuangchuangYu/badger")
```

-----

## Examples

### Package Version

  - release version (bioconductor)
      - syntax: `` `r badge_bioc_release("ggtree", "green")` ``
      - badge:
        [![](https://img.shields.io/badge/release%20version--green.svg)](https://www.bioconductor.org/packages/ggtree)
  - release version (CRAN)
      - syntax: `` `r badge_cran("badger", "orange")` ``
      - badge:
        [![](https://www.r-pkg.org/badges/version/badger?color=orange)](https://cran.r-project.org/package=badger)
  - devel version
      - syntax: `` `r badge_devel("guangchuangyu/ggtree", "blue")` ``
      - badge:
        [![](https://img.shields.io/badge/devel%20version-1.15.6-blue.svg)](https://github.com/guangchuangyu/ggtree)

### Download stats for bioconductor

  - Total of total :)
      - syntax: `` `r badge_bioc_download("clusterProfiler", "total",
        "blue", "total")` ``
      - badge:
        [![](https://img.shields.io/badge/download-225730/total-blue.svg)](https://bioconductor.org/packages/stats/bioc/clusterProfiler)
  - Total of distinct IPs
      - syntax: `` `r badge_bioc_download("clusterProfiler", "total",
        "yellow")` ``
      - badge:
        [![](https://img.shields.io/badge/download-113444/total-yellow.svg)](https://bioconductor.org/packages/stats/bioc/clusterProfiler)
  - Monthly download of distinct IPs
      - syntax: `` `r badge_bioc_download("clusterProfiler", "month",
        "green")` ``
      - badge:
        [![](https://img.shields.io/badge/download-5002/month-green.svg)](https://bioconductor.org/packages/stats/bioc/clusterProfiler)

### Download stats for CRAN

  - Total downloads
      - syntax: `` `r badge_cran_download("badger", "grand-total",
        "blue")` ``
      - badge:
        [![](http://cranlogs.r-pkg.org/badges/grand-total/badger?color=blue)](https://cran.r-project.org/package=badger)
  - Monthly Downloads
      - syntax: `` `r badge_cran_download("badger", "last-month",
        "green")` ``
      - badge:
        [![](http://cranlogs.r-pkg.org/badges/last-month/badger?color=green)](https://cran.r-project.org/package=badger)
  - Weekly Downloads
      - syntax: `` `r badge_cran_download("badger", "last-week",
        "yellow")` ``
      - badge:
        [![](http://cranlogs.r-pkg.org/badges/last-week/badger?color=yellow)](https://cran.r-project.org/package=badger)

### Impact

  - Altmetric score
      - syntax: `` `r badge_altmetric("10533079", "green")` ``
      - badge:
        [![](https://img.shields.io/badge/Altmetric-309-green.svg)](https://www.altmetric.com/details/10533079)

### Academic

  - DOI
      - syntax: `` `r badge_doi("10.1111/2041-210X.12628", "yellow")` ``
      - badge:
        [![](https://img.shields.io/badge/doi-10.1111/2041--210X.12628-yellow.svg)](https://doi.org/10.1111/2041-210X.12628)

### Customize badge

  - syntax: `` `r badge_custom("1st most cited paper", "in OMICS",
    "blue",
    "http://online.liebertpub.com/action/showMostCitedArticles?journalCode=omi")` ``
  - badge:
    [![](https://img.shields.io/badge/1st%20most%20cited%20paper-in%20OMICS-blue.svg)](http://online.liebertpub.com/action/showMostCitedArticles?journalCode=omi)

### Development

  - Lifecycle
      - syntax: `` `r badge_lifecycle("maturing", "blue")` ``
      - badge:
        [![](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
  - travis build-status
      - syntax: `` `r badge_travis("rstudio/rmarkdown")` ``
      - badge:
        [![](https://travis-ci.org/rstudio/rmarkdown.svg?branch=master)](https://travis-ci.org/rstudio/rmarkdown)
  - coveralls code coverage
      - syntax: `` `r badge_coveralls("google/benchmark")` ``
      - badge:
        [![](https://coveralls.io/repos/github/google/benchmark/badge.svg?branch=master)](https://coveralls.io/repos/github/google/benchmark)
  - code size
      - syntax: `` `r badge_code_size("GuangchuangYu/badger")` ``
      - badge:
        [![](https://img.shields.io/github/languages/code-size/GuangchuangYu/badger.svg)](https://github.com/GuangchuangYu/badger)
  - last commit date
      - syntax: `` `r badge_last_commit("GuangchuangYu/badger")` ``
      - badge:
        [![](https://img.shields.io/github/last-commit/GuangchuangYu/badger.svg)](https://github.com/GuangchuangYu/badger/commits/master)
  - direct and recursive dependencies (for CRAN pkgs)
      - syntax: `` `r badge_dependencies("badger")` ``
      - badge:
        [![Dependencies](https://tinyverse.netlify.com/badge/badger)](https://cran.r-project.org/package=badger)
  - CRAN checks results
      - syntax: `` `r badge_cran_checks("badger")` ``
      - badge: [![CRAN
        checks](https://cranchecks.info/badges/summary/badger)](https://cran.r-project.org/web/checks/check_results_badger.html)

## Related Tools

  - [hexSticker](https://github.com/GuangchuangYu/hexSticker): create
    hexagon sticker in R
