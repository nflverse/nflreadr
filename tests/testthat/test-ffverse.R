test_that("load_ff_rankings", {

  skip_if_offline("github.com")
  skip_on_cran()

  player_ids <- load_ff_playerids()

  expect_s3_class(player_ids, "tbl_df")

  expect_gt(nrow(player_ids), 6000)
})

test_that("load_ff_rankings", {

  skip_if_offline("github.com")
  skip_on_cran()

  rankings_draft <- load_ff_rankings(type = "draft")
  rankings_week <- load_ff_rankings(type = "week")

  expect_s3_class(rankings_draft, "tbl_df")
  expect_gt(nrow(rankings_draft), 2000)
  expect_s3_class(rankings_week, "tbl_df")
  expect_gt(nrow(rankings_week), 500)
})

test_that("load_ff_opportunity", {

  skip_if_offline("github.com")
  skip_on_cran()

  ff_opps_week <- load_ff_opportunity(seasons = TRUE)
  ff_opps_pbp <- load_ff_opportunity(seasons = 2021, stat_type = "pbp_pass", model_version = "v1.0.0")

  expect_s3_class(ff_opps_week, "tbl_df")
  expect_gt(nrow(ff_opps_week), 80000)
  expect_s3_class(ff_opps_pbp, "tbl_df")
  expect_gt(nrow(ff_opps_pbp), 19000)
})
