utils::globalVariables(".")

currentPackageName <- function(pkg) {
    if (!is.null(pkg))
        return(pkg)
    desc::desc_get_field("Package")
}

currentGitHubRef <- function(ref) {
	if (!is.null(ref))
		return(ref)
	url <- desc::desc_get_field("URL")
	if (!grepl("giTHub", url, ignore.case = TRUE))
		stop("reference could not be determined by the DESCRIPTION' url")
	ref <- gsub("https://github.com/", "", url)
	ref
}
