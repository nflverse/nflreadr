test_that("sitrep works", {
  skip_on_cran()
  expect_output(.sitrep("nflreadr", recursive = FALSE), regexp = "System Info|R version |Running under|nflreadr \\(")
  expect_output(.sitrep("xyz", recursive = FALSE), regexp = "System Info|R version |Running under")
  expect_output(nflverse_sitrep(pkg = "nflreadr"), regexp = "System Info|R version |Running under|nflverse Packages|nflreadr \\(|nflverse Dependencies")
})
