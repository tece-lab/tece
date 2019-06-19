context("test-load_package")

test_that("use", {
  testthat::expect_silent(
    load_package(package_names = c("devtools", "base"))
  )
})

test_that("abuse", {
  testthat::expect_error(
    load_package(package_names = c("devtools", "pippo"))
  )
})
