setwd(here::here())

dictionary_pbp <- read.csv("data-raw/dictionary_pbp.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_pbp, overwrite = TRUE)

dictionary_player_stats <- read.csv("data-raw/dictionary_playerstats.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_player_stats, overwrite = TRUE)

dictionary_player_stats_def <- read.csv("data-raw/dictionary_playerstats_def.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_player_stats_def, overwrite = TRUE)

dictionary_ff_playerids <- read.csv("data-raw/dictionary_ff_playerids.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_ff_playerids, overwrite = TRUE)

dictionary_ff_rankings <- read.csv("data-raw/dictionary_ff_rankings.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_ff_rankings, overwrite = TRUE)

dictionary_ff_opportunity <- read.csv("data-raw/dictionary_ffopps.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_ff_opportunity, overwrite = TRUE)

dictionary_ftn_charting <- read.csv("data-raw/dictionary_ftn_charting.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_ftn_charting, overwrite = TRUE)

dictionary_rosters <- read.csv("data-raw/dictionary_rosters.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_rosters, overwrite = TRUE)

dictionary_schedules <- read.csv("data-raw/dictionary_schedules.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_schedules, overwrite = TRUE)

dictionary_nextgen_stats <- read.csv2("data-raw/dictionary_nextgenstats.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_nextgen_stats, overwrite = TRUE)

dictionary_snap_counts <- read.csv("data-raw/dictionary_snap_counts.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_snap_counts, overwrite = TRUE)

dictionary_pfr_passing <- read.csv("data-raw/dictionary_pfr_passing.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_pfr_passing, overwrite = TRUE)

dictionary_draft_picks <- read.csv("data-raw/dictionary_draft_picks.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_draft_picks, overwrite = TRUE)

dictionary_espn_qbr <- read.csv("data-raw/dictionary_espn_qbr.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_espn_qbr, overwrite = TRUE)

dictionary_combine <- read.csv("data-raw/dictionary_combine.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_combine, overwrite = TRUE)

dictionary_injuries <- read.csv("data-raw/dictionary_injuries.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_injuries, overwrite = TRUE)

dictionary_depth_charts <- read.csv("data-raw/dictionary_depth_charts.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_depth_charts, overwrite = TRUE)

dictionary_trades <- read.csv("data-raw/dictionary_trades.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_trades, overwrite = TRUE)

dictionary_contracts <- read.csv("data-raw/dictionary_contracts.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_contracts, overwrite = TRUE)

dictionary_participation <- read.csv("data-raw/dictionary_participation.csv") |>
  dplyr::mutate_all(stringr::str_squish)
usethis::use_data(dictionary_participation, overwrite = TRUE)

