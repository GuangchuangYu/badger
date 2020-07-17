##' badge of bioconductor release version
##'
##'
##' @title badge_bioc_release
##' @param pkg package. If \code{NULL} (the default) the package
##'   is determined via the DESCRIPTION file.
##' @param color badge color
##' @return badge in markdown syntax
##' @export
##' @author Guangchuang Yu
##' @importFrom rvcheck check_bioc
badge_bioc_release <- function(pkg = NULL, color) {
    pkg <- currentPackageName(pkg)
    v <- check_bioc(pkg)$latest_version
    url <- paste0("https://www.bioconductor.org/packages/", pkg)
    badge_custom("release version", v, color, url)
}


##' badge of devel version
##'
##'
##' @title badge_github_version
##' @param pkg package. If \code{NULL} (the default) the package
##'   is determined via the DESCRIPTION file.
##' @param color badge color
##' @return badge in markdown syntax
##' @export
##' @author Guangchuang Yu
badge_github_version <- function(pkg = NULL, color) {
    pkg <- currentGitHubRef(pkg)
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
##' @param pkg package. If \code{NULL} (the default) the package
##'   is determined via the DESCRIPTION file.
##' @return devel version
##' @author Guangchuang
##' @importFrom rvcheck check_github
##' @export
ver_devel <- function (pkg = NULL) {
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
    pkg <- currentGitHubRef(pkg)
    ver <- tryCatch(desc::desc_get_field("Version"), error = function(e) NULL)
    if (is.null(ver ))
        ver <- check_github(pkg)$latest_version
    return(ver)
}

##' badge of bioconductor download number
##'
##'
##' @title badge_bioc_download
##' @param pkg package. If \code{NULL} (the default) the package
##'   is determined via the DESCRIPTION file.
##' @param by one of total or month
##' @param color badge color
##' @param type one of distinct and total
##' @return badge in markdown syntax
##' @export
##' @author Guangchuang Yu
##' @importFrom dlstats bioc_stats
badge_bioc_download <- function(pkg = NULL, by, color, type="distinct") {
    pkg <- currentPackageName(pkg)
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

##' official Bioconductor download badge (download ranking)
##'
##'
##' @title badge_bioc_download_rank
##' @rdname biocRanking
##' @param pkg package. If \code{NULL} (the default) the package
##'   is determined via the DESCRIPTION file.
##' @return bioc download ranking badge
##' @export
##' @author guangchuang yu
badge_bioc_download_rank <- function(pkg = NULL) {
    pkg <- currentPackageName(pkg)
    paste0("[![download](http://www.bioconductor.org/shields/downloads/release/",
           pkg, ".svg)](https://bioconductor.org/packages/stats/bioc/", pkg, ")")

}

##' @rdname biocRanking
##' @export
badge_download_bioc <- badge_bioc_download_rank

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
    url <- paste0("https://doi.org/",doi)
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
    badge <- paste0("![](https://img.shields.io/badge/", x, "-", y, "-", color, ".svg)")
    if (is.null(url))
        return(badge)

    paste0("[", badge, "](", url, ")")
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

##' SCI citation badge
##'
##'
##' @title badge_sci_citation
##' @param url Web of Science url
##' @param color color of badge
##' @return badge in markdown syntax
##' @author Guangchuang
##' @export
badge_sci_citation <- function(url, color) {
    x <- suppressWarnings(readLines(url))
    cites <- sub("\\D+(\\d+)\\D+", "\\1", x[grep("Times Cited$", x)])
    badge_custom("cited in Web of Science Core Collection", cites, color, url)
}

##' lifecycle badge
##'
##'
##' @title badge_lifcycle
##' @param stage lifecycle stage See \href{https://www.tidyverse.org/lifecycle/}{https://www.tidyverse.org/lifecycle/}
##' @param color color of the badge. If missing, the color is determined by the stage.
##' @return badge in markdown syntax
##' @export
##' @author Gregor de Cillia
badge_lifecycle <- function(stage = "experimental", color = NULL) {
  url <- paste0("https://www.tidyverse.org/lifecycle/#", stage)
  if (is.null(color))
    color <- switch(stage, experimental = "orange", maturing = "blue", stable = "brightgreen",
                    retired = "orange", archived = "red", dormant = "blue", questioning = "blue",
                    stop("invalid stage: ", stage))
  badge_custom("lifecycle", stage, color, url)
}

##' last commit badge
##'
##'
##' @title badge_last_commit
##' @param ref Reference for a GitHub repository. If \code{NULL}
##'   (the default), the reference is determined by the URL
##'   field in the DESCRIPTION file.
##' @return badge in markdown syntax
##' @export
##' @author Gregor de Cillia
badge_last_commit <- function(ref = NULL) {
  ref <- currentGitHubRef(ref)
  url <- paste0("https://github.com/", ref, "/commits/master")
  svg <- paste0("https://img.shields.io/github/last-commit/", ref, ".svg")
  paste0("[![](", svg, ")](", url, ")")
}

##' reavis-ci badge
##'
##'
##' @title badge_travis
##' @param ref Reference for a GitHub repository. If \code{NULL}
##'   (the default), the reference is determined by the URL
##'   field in the DESCRIPTION file.
##' @param is_commercial Flad to indicate whether or not to use
##'   https://travis-ci.com
##' @return badge in markdown syntax
##' @export
##' @author Gregor de Cillia
badge_travis <- function(ref = NULL, is_commercial = FALSE) {
  ref <- currentGitHubRef(ref)
  ext <- ifelse(is_commercial, "com/", "org/")
  svg <- paste0("https://travis-ci.", ext, ref, ".svg?branch=master")
  url <- paste0("https://travis-ci.", ext, ref)
  paste0("[![](", svg, ")](", url, ")")
}

##' badge of GitHub code size
##'
##'
##' @title badge_code_size
##' @param ref Reference for a GitHub repository. If \code{NULL}
##'   (the default), the reference is determined by the URL
##'   field in the DESCRIPTION file.
##' @return badge in markdown syntax
##' @export
##' @author Gregor de Cillia
badge_code_size <- function(ref = NULL) {
  ref <- currentGitHubRef(ref)
  svg <- paste0("https://img.shields.io/github/languages/code-size/",
                ref, ".svg")
  url <- paste0("https://github.com/", ref)
  placeholder <- "GitHub code size in bytes"
  paste0("[![](", svg, ")](", url, ")")
}

##' badge of CRAN version
##'
##'
##' @title badge_cran_release
##' @param pkg package. If \code{NULL} (the default) the package
##'   is determined via the DESCRIPTION file.
##' @param color color of badge
##' @return badge in markdown syntax
##' @export
##' @author Gregor de Cillia
badge_cran_release <- function(pkg = NULL, color) {
  pkg <- currentPackageName(pkg)
  svg <- paste0("https://www.r-pkg.org/badges/version/", pkg, "?color=", color)
  url <- paste0("https://cran.r-project.org/package=", pkg)
  placeholder <- "CRAN link"
  paste0("[![](", svg, ")](", url, ")")
}

##' badge of coveralls code coverage
##'
##'
##' @title badge_coveralls
##' @param ref Reference for a GitHub repository. If \code{NULL}
##'   (the default), the reference is determined by the URL
##'   field in the DESCRIPTION file.
##' @return badge in markdown syntax
##' @export
##' @author Gregor de Cillia
badge_coveralls <- function(ref = NULL) {
  ref <- currentGitHubRef(ref)
  svg = paste0("https://coveralls.io/repos/github/", ref, "/badge.svg?branch=master")
  url <- paste0("https://coveralls.io/github/", ref)
  paste0("[![](", svg, ")](", url, ")")
}

##' badge of codecov code coverage
##'
##'
##' @title badge_codecov
##' @param ref Reference for a GitHub repository. If \code{NULL}
##'   (the default), the reference is determined by the URL
##'   field in the DESCRIPTION file.
##' @return badge in markdown syntax
##' @export
##' @author Gregor de Cillia
badge_codecov <- function(ref = NULL) {
  ref <- currentGitHubRef(ref)
  svg = paste0("https://codecov.io/gh/", ref, "/branch/master/graph/badge.svg")
  url <- paste0("https://codecov.io/gh/", ref)
  paste0("[![](", svg, ")](", url, ")")
}

##' badge of CRAN downloads
##'
##'
##' @title badge_cran_download
##' @param pkg package. If \code{NULL} (the default) the package
##'   is determined via the DESCRIPTION file.
##' @param type type of stats. \code{last-month}, \code{last-week} or \code{"grand-total"}
##' @param color color of badge
##' @return badge in markdown syntax
##' @export
##' @author Gregor de Cillia
badge_cran_download <- function(pkg = NULL, type = c("last-month", "last-week", "grand-total"),
                                color = "green") {
  pkg <- currentPackageName(pkg)
	type <- match.arg(type)
  svg <- paste0("http://cranlogs.r-pkg.org/badges/", type, "/", pkg, "?color=", color)
  url <- paste0("https://cran.r-project.org/package=", pkg)
  placeholder <- "CRAN link"
  paste0("[![](", svg, ")](", url, ")")
}

##' dependency badge
##'
##' @title badge_depedencies
##' @param pkg package. If \code{NULL} (the default) the package
##'   is determined via the DESCRIPTION file.
##' @return badge in markdown syntax
##' @export
##' @author Dirk Eddelbuettel
badge_dependencies <- function(pkg = NULL) {
    pkg <- currentPackageName(pkg)
    badge <- paste0("https://tinyverse.netlify.com/badge/", pkg)
    url <- paste0("https://cran.r-project.org/package=", pkg)
    placeholder <- "Dependencies"
    paste0("[![", placeholder, "](", badge, ")](", url, ")")
}

##' CRAN checks badge
##'
##' @title badge_cran_checks
##' @param pkg package. If \code{NULL} (the default) the package
##'   is determined via the DESCRIPTION file.
##' @return badge in Markdown syntax
##' @export
##' @author Scott Chamberlain (badges API), Maëlle Salmon (function)
badge_cran_checks <- function(pkg = NULL) {
  pkg <- currentPackageName(pkg)
  badge <- paste0("https://cranchecks.info/badges/summary/", pkg)
  url <- paste0("https://cran.r-project.org/web/checks/check_results_",
                pkg, ".html")
  placeholder <- "CRAN checks"
  paste0("[![", placeholder, "](", badge, ")](", url, ")")
}

#' License badge
#'
#' @param license The license to use. If \code{NULL} (the default), the license
#'   is determined via the DESCRIPTION file.
#' @param color badge color
#' @param url The URL of the LICENSE text. If \code{NULL} (the default), links
#'   to the CRAN Package License page. This leads to a broken link if package
#'   uses a non-CRAN compatible license.
#'
#' @return badge in markdown syntax
#' @export
#' @author Alexander Rossell Hayes
badge_license <- function(license = NULL, color, url = NULL) {
  if (is.null(license)) {
    license <- gsub(" \\+.*", "", desc::desc_get_field("License"))
  }
  badge <- paste0("https://img.shields.io/badge/license-",
                  license, "-", color, ".svg")
  if (is.null(url)) {
    url <- paste0("https://cran.r-project.org/web/licenses/", license)
  }
  placeholder <- paste("License:", license)
  paste0("[![", placeholder, "](", badge, ")](", url, ")")
}


##' GitHub Actions badge
##'
##' @param ref Reference for a GitHub repository. If \code{NULL} (the default),
##'   the reference is determined by the URL field in the DESCRIPTION file.
##' @param action The name of the GitHub actions workflow. Defaults to
##'   \code{"R-CMD-CHECK"}.
##'
##' @return badge in markdown syntax
##' @export
##' @author Alexander Rossell Hayes
badge_github_actions <- function(ref = NULL, action = "R-CMD-CHECK") {
  ref <- currentGitHubRef(ref)
  svg <- paste0("https://github.com/", ref, "/workflows/", action, "/badge.svg")
  url <- paste0("https://github.com/", ref, "/actions")
  paste0("[![R build status](", svg, ")](", url, ")")
}

