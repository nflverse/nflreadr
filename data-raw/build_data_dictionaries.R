dictionary_pbp <- read.csv("data-raw/dictionary_pbp.csv")

usethis::use_data(dictionary_pbp, overwrite = TRUE)

dictionary_player_stats <- read.csv2("data-raw/player_stats.txt") %>%
  dplyr::mutate_all(stringr::str_squish)

usethis::use_data(dictionary_player_stats, overwrite = TRUE)

