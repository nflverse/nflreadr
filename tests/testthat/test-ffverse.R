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

  rankings_draft <- load_ff_rankings(type = "draft")
  rankings_week <- load_ff_rankings(type = "week")

  expect_s3_class(rankings_draft, "tbl_df")
  expect_gt(nrow(rankings_draft), 2000)
  expect_s3_class(rankings_week, "tbl_df")
  expect_gt(nrow(rankings_week), 500)
})
