test_that("sitrep works", {
  skip_on_cran()
  nflreadr_sitrep <- .sitrep(c("nflreadr","data.table"), recursive = FALSE)
  expect_named(
    nflreadr_sitrep,
    c("system_info", "installed", "dependencies", "package_options",
      "not_installed", "packages", "timestamp")
  )

  xyz_sitrep <- .sitrep("xyz", recursive = FALSE)

  expect_true(
    all(lengths(xyz_sitrep[c("installed", "dependencies", "package_options")]) == 0)
  )

  expect_output(
    print(nflreadr_sitrep),
    regexp = "System Info|R version |Running under|Packages|nflreadr \\("
  )
})
