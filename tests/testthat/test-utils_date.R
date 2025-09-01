test_that("latest week methods are equivalent", {
  skip_if(
    packageVersion('nflreadr') == '1.3.2',
    "Skip date check for v1.3.2 because of 2022 Bengals/Bills game problems."
  )

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
