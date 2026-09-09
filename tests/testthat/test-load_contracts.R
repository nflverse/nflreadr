test_that("contract draft fields are filled from player data by OTC ID", {
  contracts <- data.frame(
    player = c("Kevin Kolb", "Existing Draft", "No Player Match"),
    otc_id = c(2117L, 1L, 2L),
    draft_year = c(NA_integer_, 2020L, NA_integer_),
    draft_round = c(NA_integer_, 3L, NA_integer_),
    draft_overall = c(NA_integer_, 70L, NA_integer_),
    draft_team = c(NA_character_, "OLD", NA_character_)
  )

  contracts <- as.nflverse_data(
    contracts,
    nflverse_type = "Historical Contract Data from OverTheCap.com"
  )

  players <- data.frame(
    display_name = c("Kevin Kolb", "Existing Draft", "Bad ID"),
    otc_id = c("2117", "1", "not-an-id"),
    draft_year = c(2007L, 2021L, 2000L),
    draft_round = c(2L, 1L, 4L),
    draft_pick = c(36L, 1L, 100L),
    draft_team = c("PHI", "NEW", "BAD")
  )

  out <- nflreadr:::fill_contract_draft_info(contracts, players)

  expect_s3_class(out, "nflverse_data")
  expect_equal(out$draft_year, c(2007L, 2020L, NA_integer_))
  expect_equal(out$draft_round, c(2L, 3L, NA_integer_))
  expect_equal(out$draft_overall, c(36L, 70L, NA_integer_))
  expect_equal(out$draft_team, c("PHI", "OLD", NA_character_))
})

test_that("contract draft filling is a no-op without player draft fields", {
  contracts <- as.nflverse_data(
    data.frame(
      otc_id = 1L,
      draft_year = NA_integer_,
      draft_round = NA_integer_,
      draft_overall = NA_integer_,
      draft_team = NA_character_
    ),
    nflverse_type = "Historical Contract Data from OverTheCap.com"
  )

  out <- nflreadr:::fill_contract_draft_info(contracts, data.frame())

  expect_s3_class(out, "nflverse_data")
  expect_equal(out$draft_year, NA_integer_)
})
