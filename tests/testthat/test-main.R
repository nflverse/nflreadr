test_that("load_pbp", {

  skip_if_offline("github.com")

  pbp <- load_pbp(2019:2020)
  pbp_rds <- load_pbp(2019:2020, file_type = "rds")

  expect_s3_class(pbp, "tbl_df")
  expect_s3_class(pbp_rds, "tbl_df")

  expect_gt(nrow(pbp), 90000)
  expect_gt(nrow(pbp_rds), 90000)
})

test_that("load_player_stats", {

  skip_if_offline("github.com")

  ps <- load_player_stats()
  ps_rds <- load_player_stats(file_type = "rds")

  expect_s3_class(ps, "tbl_df")
  expect_s3_class(ps_rds, "tbl_df")

  expect_gt(nrow(ps), 110000)
  expect_gt(nrow(ps_rds), 110000)
})

test_that("load_schedules", {

  skip_if_offline("github.com")

  schedules <- load_schedules()

  expect_s3_class(schedules, "tbl_df")

  expect_gt(nrow(schedules), 6000)
})

test_that("load_rosters", {

  skip_if_offline("github.com")

  rosters <- load_rosters(seasons = 2019:2020)

  expect_s3_class(rosters, "tbl_df")
  expect_gt(nrow(rosters), 7000)
})

test_that("load_ngs", {

  skip_if_offline("github.com")

  ngs_passing <- load_nextgen_stats(stat_type = "passing")
  ngs_receiving <- load_nextgen_stats(stat_type = "receiving", file_type = "rds")
  ngs_rushing <- load_nextgen_stats(stat_type = "rushing")

  expect_s3_class(ngs_passing, "tbl_df")
  expect_s3_class(ngs_receiving, "tbl_df")
  expect_s3_class(ngs_rushing, "tbl_df")

  expect_gt(nrow(ngs_passing), 2500)
  expect_gt(nrow(ngs_receiving), 7000)
  expect_gt(nrow(ngs_rushing), 2500)
})
