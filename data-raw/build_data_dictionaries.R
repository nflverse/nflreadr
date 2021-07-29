setwd(here::here())
dictionary_pbp <- read.csv("data-raw/dictionary_pbp.csv")
usethis::use_data(dictionary_pbp, overwrite = TRUE)

dictionary_player_stats <- read.csv("data-raw/dictionary_playerstats.csv") %>%
  dplyr::mutate_all(stringr::str_squish)

usethis::use_data(dictionary_player_stats, overwrite = TRUE)

dictionary_ff_playerids <- read.csv("data-raw/dictionary_ff_playerids.csv")
usethis::use_data(dictionary_ff_playerids, overwrite = TRUE)
