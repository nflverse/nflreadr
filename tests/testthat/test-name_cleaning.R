test_that("cleaning team abbreviations", {

  x <- c("PIE","LAR","PIT","CRD", "OAK", "CLV")
  expect_warning(new_abbr <- clean_team_abbrs(x),regexp = "PIE not found")
  expect_warning(old_abbr <- clean_team_abbrs(x, current_location = FALSE), regexp = "PIE not found")

  expect_equal(new_abbr, c(NA, "LA","PIT","ARI","LV","CLE"))
  expect_equal(old_abbr, c(NA, "LA","PIT","ARI","OAK","CLE"))
})

test_that("cleaning player names", {

  p <- c("Trubisky,      Mitch", "Atwell, Chatarius", "Elliott, Zeke", "Elijah Moore", "A.J. Green", "Odell Beckham Jr.")

  lower <- clean_player_names(p,lowercase = TRUE, use_name_database = TRUE, convert_lastfirst = TRUE)

  expect_equal(
    lower,
    c("mitchell trubisky", "tutu atwell","ezekiel elliott", "elijah moore", "aj green", "odell beckham"))

})
