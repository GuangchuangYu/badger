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

test_that("Bioconductor badges work as expected", {
  expect_match(
    badge_bioc_release("BiocGenerics", color="green"),
    "img.shields.io/badge/release%20version-\\d",
  )
  expect_equal(
    badge_bioc_download("BiocGenerics", "total", "pink"),
    assembleBadgeOutput(
      "img.shields.io/badge/download-2541477/total-pink.svg",
      "bioconductor.org/packages/stats/bioc/BiocGenerics"
    )
  )
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
  expect_equal(
    badge_altmetric("2788597", "blue"),
    assembleBadgeOutput(
      "img.shields.io/badge/Altmetric-30-blue.svg",
      "www.altmetric.com/details/2788597"
    )
  )
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
      "codecov.io/gh/GuangchuangYu/badger/branch/master/graph/badge.svg",
      "codecov.io/gh/GuangchuangYu/badger"
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