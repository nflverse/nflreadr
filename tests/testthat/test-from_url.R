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

test_that("progress updates in raw_from_url work", {

  skip_if_offline("github.com")

  urls <- rep("https://github.com/nflverse/nflfastR-data/raw/master/teams_colors_logos.rds", 3)

  expect_condition({
    load <- progressr::with_progress({
      p <- progressr::progressor(along = urls)
      purrr::map(urls, raw_from_url, p = p)
    })
  }, class = "progression")

  expect_null({
    capture_condition({
      load <- progressr::without_progress({
        p <- progressr::progressor(along = urls)
        purrr::map(urls, raw_from_url, p = p)
      })
    })
  })

  expect_true(is.list(load))
  expect_true(is.raw(unlist(load)))
})
