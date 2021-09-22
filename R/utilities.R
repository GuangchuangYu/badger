utils::globalVariables(".")

currentPackageName <- function(pkg) {
    if (!is.null(pkg))
        return(pkg)
    desc::desc_get_field("Package")
}

currentGitHubRef <- function(ref) {
  if (!is.null(ref)) {return(ref)}

  url <- desc::desc_get_field("URL")
  if (!grepl("gitHub", url, ignore.case = TRUE)) {
    stop("reference could not be determined by the DESCRIPTION' url")
  }

  url <- unlist(strsplit(url, ",\\s*"))
  url <- url[grepl("github", url, ignore.case = TRUE)][[1]]

  ref <- gsub("https://github.com/", "", url)

  # Removes eventual trailing slash on URL to fix svg filename
  if (substring(ref, nchar(ref)) == "/") {
    ref <- gsub(".$", "", ref)
  }

  ref
}

defaultBranch <- function(branch) {
  if (!is.null(branch)) {return(branch)}
  usethis::git_branch_default()
}
