library(nflreadr)
library(tidyverse)
library(usethis)

player_name_mapping <- read.csv("data-raw/clean_player_names.csv") |>
  dplyr::select(alt_name, correct_name) %>%
  dplyr::distinct(alt_name, .keep_all = TRUE) %>%
  tibble::deframe()

usethis::use_data(player_name_mapping, overwrite = TRUE)

teams <- csv_from_url("https://github.com/nflverse/nfldata/raw/master/data/teams.csv") %>%
  select(team,nfl,espn,pfr,pfflabel,fo) %>%
  pivot_longer(-team,names_to = NULL, values_to = "alternate") %>%
  distinct() %>%
  filter(alternate!="") %>%
  bind_rows(
    tribble(~team,~alternate,
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
            "NFC", "NFC"
            )
  ) %>%
  arrange(alternate)

team_abbr_mapping <- teams %>%
  filter(!team %in% c("OAK","STL","SD")) %>%
  select(alternate,team) %>%
  deframe()

team_abbr_mapping_norelocate <- teams %>%
  filter(
    !(team == "LV"  & alternate %in% c("OAK")),
    !(team == "LAC" & alternate %in% c("SD","SDG","SDC")),
    !(team == "LA" & alternate %in% c("STL","SL")),

    !(team == "STL" & alternate %in% c("LA","RAM")),
    !(team == "OAK" & alternate %in% c("LV","LVR","RAI")),
    !(team == "SD" & alternate %in% c("LAC","LACH"))
  ) %>%
  arrange(alternate) %>%
  select(alternate,team) %>%
  deframe()

use_data(team_abbr_mapping, overwrite = TRUE)
use_data(team_abbr_mapping_norelocate, overwrite = TRUE)

