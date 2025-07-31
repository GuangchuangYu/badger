context("Auxiliary functions")

test_that("Output is as expected", {
  expect_equal(badger:::currentGitHubRef("GuangchuangYu/badger"), "GuangchuangYu/badger")
  expect_equal(badger:::assembleBadgeOutput("X", "Y", "Z"), "[![Z](https://X)](https://Y)")
})
