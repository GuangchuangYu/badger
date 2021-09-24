context("Auxiliary functions")

test_that("Output is as expected", {
  expect_equal(currentGitHubRef("GuangchuangYu/badger"), "GuangchuangYu/badger")
  expect_equal(assembleBadgeOutput("X", "Y", "Z"), "[![Z](https://X)](https://Y)")
})
