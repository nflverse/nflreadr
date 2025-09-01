test_that("mode works", {
  # I am sure cran will break my seed somehow
  skip_on_cran()
  # need to set a seed for sampling
  set.seed(20230928)

  # test numerical values
  vector_numeric <- sample(1:5, 15, TRUE)
  mode_numeric <- stat_mode(vector_numeric)
  expect_identical(mode_numeric, 3L)

  # test numerical values with NA
  vector_numeric_na <- c(1, 3, 3, NA, NA, NA)
  mode_numeric_na <- stat_mode(vector_numeric_na)
  mode_numeric_na_removed <- stat_mode(vector_numeric_na, na.rm = TRUE)
  expect_identical(mode_numeric_na, NA_real_)
  expect_identical(mode_numeric_na_removed, 3)

  # test character values
  vector_character <- sample(LETTERS[1:5], 15, TRUE)
  mode_character <- stat_mode(vector_character)
  expect_identical(mode_character, "D")

  # test Dates
  vector_dates <- as.Date(c(
    "2023-09-28",
    "2023-09-29",
    "2023-09-29",
    "2023-09-28",
    "2023-09-28"
  ))
  mode_date <- stat_mode(vector_dates)
  expect_identical(mode_date, as.Date("2023-09-28"))
})
