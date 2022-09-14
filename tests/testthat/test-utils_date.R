test_that("latest week methods are equivalent", {
  skip_on_cran()
  skip_if_offline("github.com")

  # This test fails during the season on Tuesdays and Wednesdays
  # Blame Tan and Ben smh
  skip_if(as.POSIXlt(Sys.Date())$wday %in% 2:3)

  expect_equal(
    get_current_week(use_date = TRUE),
    get_current_week(use_date = FALSE)
  )

})
