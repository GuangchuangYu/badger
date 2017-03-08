##' git award rank
##'
##'
##' @title gitaward
##' @param user user
##' @param lang language
##' @return rank
##' @author Guangchuang Yu
##' @export
gitaward <- function(user="guangchuangyu", lang) {
    url <- paste0("http://git-awards.com/users/", user)
    x <- readLines(url)
    language <- paste0("language=", lang, "\\W")
    y <- x[grepl(language, x) & grepl("Worldwide", x)]
    rank <- gsub(".*<strong>(\\d+)</strong>.*", "\\1", y)
    total <- gsub(".*<strong>\\d+</strong>\\s/\\s([[:digit:][:space:]]+)<.*", "\\1", y)
    total <- gsub("\\s", "", total)
    res <- paste0(rank, "/", total)
    return(res)
}
