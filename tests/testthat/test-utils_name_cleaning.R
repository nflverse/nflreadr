test_that("cleaning team abbreviations", {

  o <- options(nflreadr.verbose = TRUE)

  expected_warning <- "Abbreviations not found in `nflreadr::team_abbr_mapping`: PIE"

  x <- c("PIE","LAR","PIT","CRD", "OAK", "CLV")
  expect_warning(new_abbr <- clean_team_abbrs(x),regexp = expected_warning)
  expect_warning(old_abbr <- clean_team_abbrs(x, current_location = FALSE), regexp = expected_warning)
  expect_warning(new_abbr_drop <- clean_team_abbrs(x, keep_non_matches = FALSE),regexp = expected_warning)

  expect_equal(new_abbr,      c("PIE", "LA","PIT","ARI","LV","CLE"))
  expect_equal(new_abbr_drop, c(NA, "LA","PIT","ARI","LV","CLE"))
  expect_equal(old_abbr,      c("PIE", "LA","PIT","ARI","OAK","CLE"))
  options(o)
})

test_that("cleaning player names", {

  p <- c("Trubisky,      Mitch", "Atwell, Chatarius", "Elliott, Zeke", "Elijah Moore", "A.J. Green", "Odell Beckham Jr.   ")

  lower <- clean_player_names(p,lowercase = TRUE, use_name_database = TRUE, convert_lastfirst = TRUE)

  expect_equal(
    lower,
    c("mitchell trubisky", "tutu atwell","ezekiel elliott", "elijah moore", "aj green", "odell beckham"))

  otc <- c("Willie Gay, Jr.", "Jerry Rice, Jr.")

  otc_clean <- clean_player_names(otc, convert_lastfirst = FALSE)

  expect_equal(
    otc_clean,
    c("Willie Gay", "Jerry Rice")
  )

})

test_that("all caps names with suffix are cleaned correctly", {

  p <- c("LENO JR., CHARLES")

  lower <- clean_player_names(p, lowercase = TRUE, use_name_database = TRUE, convert_lastfirst = TRUE)
  allcaps <- clean_player_names(p, lowercase = FALSE, use_name_database = TRUE, convert_lastfirst = TRUE)

  expect_equal(lower, c("charles leno"))
  expect_equal(allcaps, c("CHARLES LENO"))

})

test_that("cleaning home and away columns",{

  s <- load_schedules(2020)
  c <- clean_homeaway(s, invert = c("result","spread_line"))

  expect_equal(nrow(c),nrow(s)*2)
  expect(all(!grepl(x = names(c),pattern = "^home_")),"Error: `home_` was found in `names(c)`")

})
