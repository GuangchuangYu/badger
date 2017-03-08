<!-- README.md is generated from README.Rmd. Please edit that file -->
badger: generate badge to be embeded in README or GitHub pages for R repo
=========================================================================

Package Version
---------------

-   release version
    -   syntax: `badge_bioc_release("ggtree", "green")`
    -   badge: [![releaseVersion](https://img.shields.io/badge/release%20version-1.6.10-green.svg?style=flat)](https://bioconductor.org/packages/ggtree)
-   devel version
    -   syntax: `badge_devel("guangchuangyu/ggtree", "blue")`
    -   badge: [![develVersion](https://img.shields.io/badge/devel%20version-1.7.9-blue.svg?style=flat)](https://github.com/guangchuangyu/ggtree)

Download stats
--------------

-   Total of total :)
    -   syntax: `badge_bioc_download("clusterProfiler", "total", "blue","total")`
    -   badge: [![total](https://img.shields.io/badge/downloads-69341/total-blue.svg?style=flat)](https://bioconductor.org/packages/stats/bioc/clusterProfiler)
-   Total of distinct IPs
    -   syntax: `badge_bioc_download("clusterProfiler", "total", "blue")`
    -   badge: [![total](https://img.shields.io/badge/downloads-34261/total-blue.svg?style=flat)](https://bioconductor.org/packages/stats/bioc/clusterProfiler)
-   Monthly download of distinct IPs
    -   syntax: `badge_bioc_download("clusterProfiler", "month", "green")`
    -   badge: [![month](https://img.shields.io/badge/downloads-1401/month-green.svg?style=flat)](https://bioconductor.org/packages/stats/bioc/clusterProfiler)

Impact
------

-   Altmetric score
    -   syntax: `badge_altmetric("10533079", "green")`
    -   badge: [![Altmetric](https://img.shields.io/badge/Altmetric-352-green.svg?style=flat)](https://www.altmetric.com/details/10533079)

Academic
--------

-   DOI
    -   syntax: `badge_doi("10.1111/2041-210X.12628", "green")`
    -   badge: [![doi](https://img.shields.io/badge/doi-10.1111/2041--210X.12628-green.svg?style=flat)](http://dx.doi.org/10.1111/2041-210X.12628)

Customize badge
---------------

-   syntax: `badge_custom("2nd most cited paper", "in OMICS", "blue",       "http://online.liebertpub.com/action/showMostCitedArticles?journalCode=omi")`
-   badge: [![](https://img.shields.io/badge/2nd%20most%20cited%20paper-in%20OMICS-blue.svg?style=flat)](http://online.liebertpub.com/action/showMostCitedArticles?journalCode=omi)
