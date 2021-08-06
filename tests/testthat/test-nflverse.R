test_that("load_pbp", {

  skip_if_offline("github.com")

  pbp <- load_pbp()
  pbp_years <- load_pbp(2019:2020)
  pbp_rds <- load_pbp(2019:2020, file_type = "rds")

  expect_s3_class(pbp, "tbl_df")
  expect_s3_class(pbp_rds, "tbl_df")
  expect_s3_class(pbp_years, "tbl_df")

  expect_gt(nrow(pbp_years), 90000)
  expect_gt(nrow(pbp_rds), 90000)
})

test_that("load_player_stats", {

  skip_if_offline("github.com")

  ps <- load_player_stats()
  ps_2020 <- load_player_stats(2020)
  ps_rds <- load_player_stats(2020, file_type = "rds")

  expect_s3_class(ps, "tbl_df")
  expect_s3_class(ps_2020, "tbl_df")
  expect_s3_class(ps_rds, "tbl_df")

  expect_gt(nrow(ps_2020), 5000)
  expect_gt(nrow(ps_rds), 5000)
})

test_that("load_schedules", {

  skip_if_offline("github.com")

  schedules <- load_schedules()

  expect_s3_class(schedules, "tbl_df")

  expect_gt(nrow(schedules), 6000)
})

test_that("load_rosters", {

  skip_if_offline("github.com")

  rosters <- load_rosters()
  rosters_years <- load_rosters(seasons = 2019:2020)

  expect_s3_class(rosters, "tbl_df")
  expect_s3_class(rosters_years, "tbl_df")
  expect_gt(nrow(rosters_years), 7000)
})

test_that("load_ngs", {

  skip_if_offline("github.com")

  ngs_passing <- load_nextgen_stats()
  ngs_receiving <- load_nextgen_stats(seasons = 2019:2020, stat_type = "receiving", file_type = "rds")
  ngs_rushing <- load_nextgen_stats(seasons = 2020, stat_type = "rushing")

  expect_s3_class(ngs_passing, "tbl_df")
  expect_s3_class(ngs_receiving, "tbl_df")
  expect_s3_class(ngs_rushing, "tbl_df")

  expect_gt(nrow(ngs_receiving), 1500)
  expect_gt(nrow(ngs_rushing), 500)
})

test_that("load_teams", {

  skip_if_offline("github.com")

  team_graphics <- load_teams()

  expect_s3_class(team_graphics, "tbl_df")

  expect_gte(nrow(team_graphics), 32)
})

test_that("Cache clearing works",{

  skip_if_offline("github.com")

  expect(memoise::has_cache(load_player_stats)(), "Function was not memoised")

  expect_message(.clear_cache(), "nflreadr function cache cleared")

  expect(!memoise::has_cache(load_player_stats)(), "Cache was not cleared!")
})

test_that("load_depth_charts", {

  skip_if_offline("github.com")

  depth_charts <- load_depth_charts()
  depth_charts_years <- load_depth_charts(seasons = 2019:2020)

  expect_s3_class(depth_charts, "tbl_df")
  expect_s3_class(depth_charts_years, "tbl_df")
  expect_gt(nrow(depth_charts_years), 60000)
  })

test_that("load_injuries", {

  skip_if_offline("github.com")

  injuries <- load_injuries()
  injuries_years <- load_injuries(seasons = 2019:2020)

  expect_s3_class(injuries, "tbl_df")
  expect_s3_class(injuries_years, "tbl_df")
  expect_gt(nrow(injuries_years), 8000)
})

test_that("load_trades", {

  skip_if_offline("github.com")

  trades <- load_trades()

  expect_s3_class(trades, "tbl_df")

  expect_gt(nrow(trades), 3000)
})

