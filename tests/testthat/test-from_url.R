test_that("from_url fails nicely", {

  expect_warning(
    rds_from_url("https://github.com/nflverse/nfldata/blob/master/data/games.rds"),
    regexp = "Failed to readRDS"
  )
  expect_warning(
    qs_from_url("https://github.com/nflverse/nfldata/blob/master/data/games.rds"),
    regexp = "Failed to parse file"
  )

  expect_warning(
    qs_from_url("https://asfdjklasfsadffasd.com"),
    regexp = "Failed to retrieve data"
  )

  expect_warning(
    raw_from_url("https://github.com/nflverse/nfl/blob/master/data/games.rd"),
    regexp = "HTTP error"
  )

})
