context("Basic badge output")

test_that("GitHub badges output as expected", {
  expect_error(badge_github_version())
  expect_match(
    badge_github_version("GuangchuangYu/badger", color="blue"),
    "img.shields.io/badge/devel%20version-\\d"
  )
  expect_equal(
    badge_github_actions("GuangchuangYu/badger"),
    assembleBadgeOutput(
      "github.com/GuangchuangYu/badger/workflows/R-CMD-check/badge.svg",
      "github.com/GuangchuangYu/badger/actions", "R build status"
    )
  )
})

if (R.Version()$status == "") {
  test_that("Bioconductor badges work as expected", {
    expect_match(
      badge_bioc_release("BiocGenerics", color="green"),
      "img.shields.io/badge/release%20version-\\d",
    )
    ## expect_equal(
    ##   badge_bioc_download("BiocGenerics", "total", "pink"),
    ##   assembleBadgeOutput(
    ##     "img.shields.io/badge/download-2541477/total-pink.svg", #not static value
    ##     "bioconductor.org/packages/stats/bioc/BiocGenerics"
    ##   )
    ## )
    expect_equal(
      badge_bioc_download_rank("BiocGenerics"),
      assembleBadgeOutput(
        "www.bioconductor.org/shields/downloads/release/BiocGenerics.svg",
        "bioconductor.org/packages/stats/bioc/BiocGenerics",
        "download",
        https=FALSE
      )
    )
  })
}

test_that("CRAN badges output as expected", {
  expect_equal(
    badge_cran_release("badger", color="brown"),
    assembleBadgeOutput(
      "www.r-pkg.org/badges/version/badger?color=brown",
      "cran.r-project.org/package=badger"
    )
  )
  expect_equal(
    badge_cran_download("badger"),
    assembleBadgeOutput(
      "cranlogs.r-pkg.org/badges/last-month/badger",
      "cran.r-project.org/package=badger",
      https=FALSE
    )
  )
  expect_equal(
    badge_cran_checks("badger"),
    assembleBadgeOutput(
      "cranchecks.info/badges/summary/badger",
      "cran.r-project.org/web/checks/check_results_badger.html",
      "CRAN checks"
    )
  )
})

test_that("Other badges output as expected", {
  expect_is(ver_devel("GuangchuangYu/badger"), "character")
  expect_equal(
    badge_doi("10.1111/2041-210X.12628", "green"),
    assembleBadgeOutput(
      "img.shields.io/badge/doi-10.1111/2041--210X.12628-green.svg",
      "doi.org/10.1111/2041-210X.12628"
    )
  )
  expect_equal(
    badge_custom("a", "b", "red"),
    "![](https://img.shields.io/badge/a-b-red.svg)"
  )
#  expect_equal(
#    badge_altmetric("2788597", "blue"),
#    assembleBadgeOutput(
#      "img.shields.io/badge/Altmetric-30-blue.svg",
#      "www.altmetric.com/details/2788597"
#    )
#  )
  #TODO: create example for badge_sci_citation
  expect_equal(
    badge_sci_citation(
      "https://mjl.clarivate.com:/search-results?issn=1548-7660&hide_exact_match_fl=true&utm_source=mjl&utm_medium=share-by-link&utm_campaign=journal-profile-share-this-journal",
      "blue"
    ),
    assembleBadgeOutput(
      "img.shields.io/badge/cited%20in%20Web%20of%20Science%20Core%20Collection--blue.svg",
      "mjl.clarivate.com:/search-results?issn=1548-7660&hide_exact_match_fl=true&utm_source=mjl&utm_medium=share-by-link&utm_campaign=journal-profile-share-this-journal"
    )
  )
  expect_equal(
    badge_lifecycle(),
    assembleBadgeOutput(
      "img.shields.io/badge/lifecycle-experimental-orange.svg",
      "lifecycle.r-lib.org/articles/stages.html#experimental"
    )
  )

  expect_equal(
    badge_repostatus("concept"),
    "[![Project Status: Concept - Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)"
  )
  expect_equal(
    badge_repostatus("wip"),
    "[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)"
  )
  expect_equal(
    badge_repostatus("suspended"),
    "[![Project Status: Suspended - Initial development has started, but there has not yet been a stable, usable release; work has been stopped for the time being but the author(s) intend on resuming work.](https://www.repostatus.org/badges/latest/suspended.svg)](https://www.repostatus.org/#suspended)"
  )
  expect_equal(
    badge_repostatus("abandoned"),
    "[![Project Status: Abandoned - Initial development has started, but there has not yet been a stable, usable release; the project has been abandoned and the author(s) do not intend on continuing development.](https://www.repostatus.org/badges/latest/abandoned.svg)](https://www.repostatus.org/#abandoned)"
  )
  expect_equal(
    badge_repostatus("active"),
    "[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)"
  )
  expect_equal(
    badge_repostatus("inactive"),
    "[![Project Status: Inactive - The project has reached a stable, usable state but is no longer being actively developed; support/maintenance will be provided as time allows.](https://www.repostatus.org/badges/latest/inactive.svg)](https://www.repostatus.org/#inactive)"
  )
  expect_equal(
    badge_repostatus("unsupported"),
    "[![Project Status: Unsupported - The project has reached a stable, usable state but the author(s) have ceased all work on it. A new maintainer may be desired.](https://www.repostatus.org/badges/latest/unsupported.svg)](https://www.repostatus.org/#unsupported)"
  )
  expect_equal(
    suppressWarnings(badge_repostatus("moved")),
    "[![Project Status: Moved to http://example.com - The project has been moved to a new location, and the version at that location should be considered authoritative.](https://www.repostatus.org/badges/latest/moved.svg)](https://www.repostatus.org/#moved) to [http://example.com](http://example.com)"
  )
  expect_warning(badge_repostatus("moved")
  )
  expect_equal(
    badge_last_commit("GuangchuangYu/badger", "master"),
    assembleBadgeOutput(
      "img.shields.io/github/last-commit/GuangchuangYu/badger.svg",
      "github.com/GuangchuangYu/badger/commits/master"
    )
  )
  expect_equal(
    badge_travis("tmatta/lsasim", branch="master"),
    assembleBadgeOutput(
      "travis-ci.org/tmatta/lsasim.svg?branch=master",
      "travis-ci.org/tmatta/lsasim"
    )
  )
  expect_equal(
    badge_code_size("GuangchuangYu/badger"),
    assembleBadgeOutput(
      "img.shields.io/github/languages/code-size/GuangchuangYu/badger.svg",
      "github.com/GuangchuangYu/badger"
    )
  )
  expect_equal(
    badge_coveralls("GuangchuangYu/badger", "master"),
    assembleBadgeOutput(
      "coveralls.io/repos/github/GuangchuangYu/badger/badge.svg?branch=master",
      "coveralls.io/github/GuangchuangYu/badger"
    )
  )
  expect_equal(
    badge_codecov("GuangchuangYu/badger", branch="master"),
    assembleBadgeOutput(
      "app.codecov.io/gh/GuangchuangYu/badger/branch/master/graph/badge.svg",
      "app.codecov.io/gh/GuangchuangYu/badger"
    )
  )
  expect_equal(
    badge_dependencies("GuangchuangYu/badger"),
    assembleBadgeOutput(
      "tinyverse.netlify.com/badge/GuangchuangYu/badger",
      "cran.r-project.org/package=GuangchuangYu/badger",
      "Dependencies"
    )
  )
  expect_equal(
    badge_license("GuangchuangYu/badger"),
    assembleBadgeOutput(
      "img.shields.io/badge/license-GuangchuangYu/badger-blue.svg",
      "cran.r-project.org/web/licenses/GuangchuangYu/badger",
      "License: GuangchuangYu/badger"
    )
  )
  expect_equal(
    badge_codefactor("GuangchuangYu/badger"),
    assembleBadgeOutput(
      "www.codefactor.io/repository/github/GuangchuangYu/badger/badge",
      "www.codefactor.io/repository/github/GuangchuangYu/badger",
      "CodeFactor",
    )
  )
})
