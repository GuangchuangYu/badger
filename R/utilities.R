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

assembleBadgeOutput <- function(img_link, target_link, alt_text="", https=TRUE) {
  # Adds common elements to badge output
  protocol <- ifelse(https, "https", "http")
  image_url <- paste0(
    "[![", alt_text, "](", protocol, "://", img_link, ")]"
  )
  link_url <- paste0("(https://", target_link, ")")
  return(paste0(image_url, link_url))
}
