df <- nflfastR::teams_colors_logos

a <- nflseedR::divisions

teams_colors_logos <- df |>
  dplyr::left_join(a, by = c("team_abbr" = "team")) |>
  dplyr::mutate(
    team_logo_wikipedia = ifelse(team_abbr == "TEN", "https://github.com/nflverse/nflfastR-data/raw/master/titans.png", team_logo_wikipedia),
    team_wordmark = glue::glue("https://github.com/nflverse/nflfastR-data/raw/master/wordmarks/{team_abbr}.png"),
    team_conference_logo = glue::glue("https://github.com/nflverse/nflfastR-data/raw/master/{conf}.png")
  ) |>
  dplyr::select(team_abbr:team_nick, team_conf = conf, team_divison = division, dplyr::everything(), -sdiv)

usethis::use_data(teams_colors_logos, overwrite = TRUE)
