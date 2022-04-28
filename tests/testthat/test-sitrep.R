test_that("sitrep works", {
  expect_output(.sitrep("nflreadr"), regexp = "System Info|R version |Running under|nflreadr \\(|Dependencies")
  expect_output(.sitrep("nflreadr", recursive = FALSE), regexp = "System Info|R version |Running under|nflreadr \\(")
  expect_output(.sitrep("nflreadr", recursive = FALSE, header = "nflverse "), regexp = "System Info|R version |Running under|nflverse Packages|nflreadr \\(")
})
