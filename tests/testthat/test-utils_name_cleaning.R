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

  s <- data.frame(
    game_id = c("2020_20_TB_GB", "2020_20_BUF_KC", "2020_21_KC_TB"), 
    game_type = c("CON", "CON", "SB"), 
    home_team = c("GB", "KC", "TB"), 
    home_score = c(26L, 38L, 31L),
    team_id_home = c("001","002","003"), 
    away_team = c("TB", "BUF", "KC"), 
    away_score = c(31L, 24L, 9L), 
    team_id_away = c("003","004","002"),
    location = c("Home", "Home", "Neutral"), 
    result = c(-5L, 14L, 22L), 
    spread_line = c(3, 3, -3)
  )
  c <- clean_homeaway(s, invert = c("result","spread_line"))

  expect_equal(nrow(c),nrow(s)*2)
  expect(all(!grepl(x = names(c),pattern = "^home_")),"Error: `home_` was found in `names(c)`")
  expect(all(!grepl(x = names(c),pattern = "_home$")),"Error: `_home` was found in `names(c)`")
  expect_true("neutral" %in% c$location)
  expect_identical(class(c), class(s))
})
