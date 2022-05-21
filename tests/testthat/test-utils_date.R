test_that("latest week methods are equivalent", {
  skip_on_cran()
  skip_if_offline("github.com")

  expect_equal(
    get_current_week(use_date = TRUE),
    get_current_week(use_date = FALSE)
  )

})
