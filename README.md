<!-- README.md is generated from README.Rmd. Please edit that file -->
badger: Badge for R Package
===========================

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/badger?color=green)](https://cran.r-project.org/package=badger) ![](http://cranlogs.r-pkg.org/badges/grand-total/badger?color=green) ![](http://cranlogs.r-pkg.org/badges/badger?color=green) ![](http://cranlogs.r-pkg.org/badges/last-week/badger?color=green)

Query information and generate badge for using in README and GitHub Pages.

Author
------

Guangchuang YU <https://guangchuangyu.github.io>

School of Public Health, The University of Hong Kong

Installation
------------

Get the released version from CRAN:

``` r
install.packages("badger")
```

Or the development version from github:

``` r
## install.packages("devtools")
devtools::install_github("GuangchuangYu/badger")
```

------------------------------------------------------------------------

Examples
--------

### Package Version

-   release version
    -   syntax: `` `r badge_bioc_release("ggtree", "green")` ``
    -   badge: [![releaseVersion](https://img.shields.io/badge/release%20version-1.6.10-green.svg?style=flat)](https://bioconductor.org/packages/ggtree)
-   devel version
    -   syntax: `` `r badge_devel("guangchuangyu/ggtree", "blue")` ``
    -   badge: [![develVersion](https://img.shields.io/badge/devel%20version-1.7.9-blue.svg?style=flat)](https://github.com/guangchuangyu/ggtree)

### Download stats

-   Total of total :)
    -   syntax: `` `r badge_bioc_download("clusterProfiler", "total", "blue", "total")` ``
    -   badge: [![total](https://img.shields.io/badge/downloads-69341/total-blue.svg?style=flat)](https://bioconductor.org/packages/stats/bioc/clusterProfiler)
-   Total of distinct IPs
    -   syntax: `` `r badge_bioc_download("clusterProfiler", "total", "blue")` ``
    -   badge: [![total](https://img.shields.io/badge/downloads-34261/total-blue.svg?style=flat)](https://bioconductor.org/packages/stats/bioc/clusterProfiler)
-   Monthly download of distinct IPs
    -   syntax: `` `r badge_bioc_download("clusterProfiler", "month", "green")` ``
    -   badge: [![month](https://img.shields.io/badge/downloads-1401/month-green.svg?style=flat)](https://bioconductor.org/packages/stats/bioc/clusterProfiler)

### Impact

-   Altmetric score
    -   syntax: `` `r badge_altmetric("10533079", "green")` ``
    -   badge: [![Altmetric](https://img.shields.io/badge/Altmetric-352-green.svg?style=flat)](https://www.altmetric.com/details/10533079)

### Academic

-   DOI
    -   syntax: `` `r badge_doi("10.1111/2041-210X.12628", "green")` ``
    -   badge: [![doi](https://img.shields.io/badge/doi-10.1111/2041--210X.12628-green.svg?style=flat)](http://dx.doi.org/10.1111/2041-210X.12628)

### Customize badge

-   syntax: `` `r badge_custom("2nd most cited paper", "in OMICS", "blue",   "http://online.liebertpub.com/action/showMostCitedArticles?journalCode=omi")` ``
-   badge: [![](https://img.shields.io/badge/2nd%20most%20cited%20paper-in%20OMICS-blue.svg?style=flat)](http://online.liebertpub.com/action/showMostCitedArticles?journalCode=omi)
