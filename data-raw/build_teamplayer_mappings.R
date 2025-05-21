devtools::load_all()
library(dplyr)
library(tidyr)
library(usethis)

player_name_mapping <- read.csv("data-raw/clean_player_names.csv") |>
  dplyr::select(alt_name, correct_name) %>%
  dplyr::distinct(alt_name, .keep_all = TRUE) %>%
  dplyr::mutate_all(stringr::str_squish) |>
  tibble::deframe()

usethis::use_data(player_name_mapping, overwrite = TRUE)

teams <- nflreadr::csv_from_url("https://github.com/nflverse/nfldata/raw/master/data/teams.csv") %>%
  dplyr::select(team,nfl, espn, pfr, pfflabel, fo, full, nickname) %>%
  tidyr::pivot_longer(-team, names_to = NULL, values_to = "alternate") %>%
  dplyr::distinct() %>%
  dplyr::filter(alternate!="") %>%
  dplyr::bind_rows(
    tibble::tribble(
      ~team,~alternate,
      "GB","GBP",
      "KC","KCC",
      "LV","LVR",
      "NE","NEP",
      "NO","NOS",
      "LAC","SDC",
      "TB","TBB",
      "WAS","WFT",
      "LV","OAK",
      "LA","STL",
      "LA","SL",
      "STL","SL",
      "LAC","SD",
      "SD","SDC",
      "AFC", "AFC",
      "NFC", "NFC",
      "NFL", "NFL",
      "ARI", "PHO",
      "SF", "Niners",
      "LAC", "San Diego Chargers",
      "LV", "Oakland Raiders",
      "LA", "St Louis Rams"
    )
  ) %>%
  dplyr::mutate(
    # clean_team_abbrs calls toupper on its input
    alternate = toupper(alternate)
  ) |>
  dplyr::arrange(alternate)

team_abbr_mapping <- teams %>%
  dplyr::filter(!team %in% c("OAK","STL","SD")) %>%
  dplyr::select(alternate,team) %>%
  tibble::deframe()

team_abbr_mapping_norelocate <- teams %>%
  dplyr::filter(
    !(team == "LV"  & alternate %in% c("OAK")),
    !(team == "LAC" & alternate %in% c("SD","SDG","SDC")),
    !(team == "LA" & alternate %in% c("STL","SL")),

    !(team == "STL" & alternate %in% c("LA","RAM")),
    !(team == "OAK" & alternate %in% c("LV","LVR","RAI")),
    !(team == "SD" & alternate %in% c("LAC","LACH"))
  ) %>%
  dplyr::arrange(alternate) %>%
  dplyr::select(alternate,team) %>%
  tibble::deframe()

usethis::use_data(team_abbr_mapping, overwrite = TRUE)
usethis::use_data(team_abbr_mapping_norelocate, overwrite = TRUE)

