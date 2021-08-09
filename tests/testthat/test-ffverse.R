test_that("load_ff_rankings", {

  skip_if_offline("github.com")
  skip_on_cran()

  player_ids <- load_ff_playerids()

  expect_s3_class(player_ids, "tbl_df")

  expect_gt(nrow(player_ids), 6000)
})

test_that("load_schedules", {

  skip_if_offline("github.com")
  skip_on_cran()

  rankings <- load_ff_rankings()

  expect_s3_class(rankings, "tbl_df")

  expect_gt(nrow(rankings), 2000)
})
