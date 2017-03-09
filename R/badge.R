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
    v <- check_bioc(pkg)$latest_version
    url <- paste0("https://bioconductor.org/packages/", pkg)
    badge_custom("release version", v, color, url)
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
    v <- ver_devel(pkg)
    url <- paste0("https://github.com/", pkg)
    badge_custom("devel version", v, color, url)
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
    ## flag <- FALSE
    ## if (file.exists("DESCRIPTION")) {
    ##     x <- readLines("DESCRIPTION")
    ##     flag <- TRUE
    ## } else if (file.exists("../DESCRIPTION")) {
    ##     x <- readLines("../DESCRIPTION")
    ##     flag <- TRUE
    ## }
    ## if (flag) {
    ##     y <- x[grep("^Version", x)]
    ##     v <- sub("Version: ", "", y)
    ##     if ((as.numeric(gsub("\\d+\\.(\\d+)\\.\\d+", "\\1", v))%%2) == 1) {
    ##         return(v)
    ##     }
    ## }

    check_github(pkg)$latest_version
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
    res <- paste0(res, "/", by)

    url <- paste0("https://bioconductor.org/packages/stats/bioc/", pkg)
    badge_custom("download", res, color, url)
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
##' @examples
##' badge_doi("10.1111/2041-210X.12628", "green")
badge_doi <- function(doi, color) {
    url <- paste0("http://dx.doi.org/",doi)
    badge_custom("doi", doi, color, url)
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
    x <- gsub('-', '--', x)
    y <- gsub('-', '--', y)
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
##' @examples
##' badge_altmetric("2788597", "blue")
##' @export
badge_altmetric <- function(id, color) {
    url <- paste0("https://www.altmetric.com/details/", id)
    x <- readLines(url)
    score <- gsub("^.*score=(\\d+)\\D+.*$", '\\1', x[grep("style=donut&score=", x)])
    badge_custom("Altmetric", score, color, url)
}

