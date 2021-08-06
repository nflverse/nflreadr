setwd(here::here())
dictionary_pbp <- read.csv("data-raw/dictionary_pbp.csv")
usethis::use_data(dictionary_pbp, overwrite = TRUE)

dictionary_player_stats <- read.csv("data-raw/dictionary_playerstats.csv") %>%
  dplyr::mutate_all(stringr::str_squish)

usethis::use_data(dictionary_player_stats, overwrite = TRUE)

dictionary_ff_playerids <- read.csv("data-raw/dictionary_ff_playerids.csv")
usethis::use_data(dictionary_ff_playerids, overwrite = TRUE)

dictionary_rosters <- read.csv("data-raw/dictionary_rosters.csv")
usethis::use_data(dictionary_rosters, overwrite = TRUE)

dictionary_schedules <- read.csv2("data-raw/dictionary_schedules.csv")
usethis::use_data(dictionary_schedules, overwrite = TRUE)

dictionary_nextgen_stats <- read.csv("data-raw/dictionary_nextgenstats.csv")
usethis::use_data(dictionary_nextgen_stats, overwrite = TRUE)
