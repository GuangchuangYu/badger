##' badge of bioconductor release version
##'
##'
##' @title badge_bioc_release
##' @param pkg package
##' @param color badge color
##' @return badge in markdown syntax
##' @export
##' @author Guangchuang Yu
##' @importFrom rvcheck check_bioc
badge_bioc_release <- function(pkg, color) {
    p1 <- "[![releaseVersion](https://img.shields.io/badge/release%20version-"
    v <- check_bioc(pkg)$latest_version
    url <- paste0("https://bioconductor.org/packages/", pkg)
    p2 <- ".svg?style=flat)]("
    badge <- paste0(p1, v, "-", color, p2, url, ")")
    return(badge)
}


##' badge of devel version
##'
##'
##' @title badge_github_version
##' @param pkg package
##' @param color badge color
##' @return badge in markdown syntax
##' @export
##' @author Guangchuang Yu
badge_github_version <- function(pkg, color) {
    p1 <- "[![develVersion](https://img.shields.io/badge/devel%20version-"
    v <- ver_devel(pkg)
    p2 <- ".svg?style=flat)]("
    url <- paste0("https://github.com/", pkg)
    badge <- paste0(p1, v, "-", color, p2, url, ")")
    return(badge)
}

##' badge of devel version
##'
##'
##' @title badge_devel
##' @inheritParams badge_github_version
##' @export
##' @return badge in markdown syntax
badge_devel <- badge_github_version

##' get devel version number of specific package
##'
##'
##' @title ver_devel
##' @param pkg package name
##' @return devel version
##' @author Guangchuang
##' @importFrom rvcheck check_github
##' @export
ver_devel <- function (pkg) {
    flag <- FALSE
    if (file.exists("DESCRIPTION")) {
        x <- readLines("DESCRIPTION")
        flag <- TRUE
    } else if (file.exists("../DESCRIPTION")) {
        x <- readLines("../DESCRIPTION")
        flag <- TRUE
    }
    if (flag) {
        y <- x[grep("^Version", x)]
        v <- sub("Version: ", "", y)
        if ((as.numeric(gsub("\\d+\\.(\\d+)\\.\\d+", "\\1", v))%%2) ==
            1) {
            return(v)
        }
    }

    return(check_github(pkg)$latest_version)
}

##' badge of bioconductor download number
##'
##'
##' @title badge_bioc_download
##' @param pkg package
##' @param by one of total or month
##' @param color badge color
##' @param type one of distinct and total
##' @return badge in markdown syntax
##' @export
##' @author Guangchuang Yu
##' @importFrom dlstats bioc_stats
badge_bioc_download <- function(pkg, by, color, type="distinct") {
    type <- match.arg(type, c("distinct", "total"))
    dl <- "Nb_of_downloads"
    if (type == "distinct")
        dl <- "Nb_of_distinct_IPs"

    nb <- tryCatch(bioc_stats(pkg)[, dl], error=function(e) NULL)

    if (is.null(nb)) {
        res <- "NA"
    } else if (by == "total") {
        res <- sum(nb)
    } else if (by == "month") {
        res <- nb[length(nb) -1]
    }

    url <- paste0("https://bioconductor.org/packages/stats/bioc/", pkg)

    p1 <- paste0("[![", by, "](https://img.shields.io/badge/downloads-")
    p2 <- paste0(res, "/", by, "-", color, ".svg?style=flat)](", url, ")")
    badge <- paste0(p1, p2)
    return(badge)
}

##' official Bioconductor download badge
##'
##'
##' @title badge_download_bioc
##' @param pkg package
##' @return bioc download badge
##' @export
##' @author guangchuang yu
badge_download_bioc <- function(pkg) {
    paste0("[![download](http://www.bioconductor.org/shields/downloads/",
           pkg, ".svg)](https://bioconductor.org/packages/stats/bioc/", pkg, ")")

}


##' doi badge
##'
##'
##' @title badge_doi
##' @param doi doi
##' @param color color
##' @return badge
##' @author Guangchuang
##' @export
badge_doi <- function(doi, color) {
    url <- paste0("http://dx.doi.org/",doi)
    p1 <- "[![doi](https://img.shields.io/badge/doi-"
    p2 <- ".svg?style=flat)]("

    doi <- gsub('-', '--', doi)
    badge <- paste0(p1, doi, "-", color, p2, url, ")")
    return(badge)
}

##' custom badge
##'
##'
##' @title badge_custom
##' @param x field 1
##' @param y field 2
##' @param color color
##' @param url optional url
##' @return customize badge
##' @author Guangchuang Yu
##' @export
badge_custom <- function(x, y, color, url=NULL) {
    x <- gsub(" ", "%20", x)
    y <- gsub(" ", "%20", y)
    badge <- paste0("![](https://img.shields.io/badge/", x, "-", y, "-", color, ".svg?style=flat)")
    if (is.null(url))
        return(badge)

    paste("[", badge, "](", url, ")")
}

##' altmetric badge
##'
##'
##' @title badge_altmetric
##' @param id altmetric id
##' @param color color of badge
##' @return badge in markdown syntax
##' @author Guangchuang
##' @export
badge_altmetric <- function(id, color) {
    ## [![Altmetric](https://img.shields.io/badge/Altmetric-`r x <- readLines("https://www.altmetric.com/details/2788597"); gsub("^.*score=(\\d+)\\D+.*$", '\\1', x[grep("style=donut&score=", x)])`-blue.svg?style=flat)](https://www.altmetric.com/details/2788597)
    url <- paste0("https://www.altmetric.com/details/", id)
    p1 <- "[![Altmetric](https://img.shields.io/badge/Altmetric-"
    x <- readLines(url)
    score <- gsub("^.*score=(\\d+)\\D+.*$", '\\1', x[grep("style=donut&score=", x)])
    p2 <- paste0("-", color, ".svg?style=flat)](")
    badge <- paste0(p1, score, p2, url, ")")
    return(badge)
}
