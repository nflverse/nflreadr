test_that("from_url fails nicely", {

  skip_on_cran()
  skip_if_offline("github.com")

  expect_warning(
    rds_from_url("https://github.com/nflverse/nfldata/blob/master/data/games.rds"),
    regexp = "Failed to readRDS"
  )
  expect_warning(
    qs_from_url("https://github.com/nflverse/nfldata/raw/master/data/games.rds"),
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

  skip_on_cran()
  skip_if_offline("github.com")

  # enable progress updates in batch mode for testing the progress updates
  old <- options(progressr.enable = TRUE)

  urls <- rep("https://github.com/nflverse/nflfastR-data/raw/master/teams_colors_logos.rds", 3)

  expect_condition({
    load <- progressr::with_progress({
      p <- progressr::progressor(along = urls)
      lapply(urls, progressively(raw_from_url, p = p))
    })
  }, class = "progression")

  expect_null({
    capture_condition({
      load <- progressr::without_progress({
        p <- progressr::progressor(along = urls)
        lapply(urls, progressively(raw_from_url, p = p))
      })
    })
  })

  expect_true(is.list(load))
  expect_true(is.raw(unlist(load)))
  options(old)
})

test_that("download_local downloads files",{

  skip_on_cran()
  skip_if_offline("github.com")

  temp_dir <- tempdir(check = TRUE)

  expect_error(
    expect_warning(
      download_nflverse("asdf", folder_path = temp_dir),
      "Could not find"
    ),
    "No matching releases"
  )

  expect_warning(
    download_nflverse(
      combine, "contracts",
      folder_path = temp_dir,
      file_type = "qs"
    ),
    regexp = "Could not find file"
  )

  download_nflverse(
    combine, "contracts",
    folder_path = temp_dir,
    file_type = "parquet")

  expect_true(
    length(list.files(temp_dir,recursive = TRUE)) >= 2
  )

})
