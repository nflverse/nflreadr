# data dictionary checking
devtools::load_all()
library(tidyverse)

dict_check <- function(df,dict){
  actual_vars <- df |>
    skimr::skim() |>
    dplyr::pull(skim_variable) |>
    sort()
  dictionary_vars <- dict |>
    dplyr::pull(1) |>
    sort()

  waldo::compare(actual_vars,dictionary_vars)
}

load_pbp() |>
  dict_check(dictionary_pbp)

load_rosters() |>
  dict_check(dictionary_rosters)

load_player_stats(stat_type = "offense") |>
  dict_check(dictionary_player_stats)

load_schedules() |>
  dict_check(dictionary_schedules)

load_snap_counts() |>
  dict_check(dictionary_snap_counts)

load_ff_playerids() |>
  dict_check(dictionary_ff_playerids)

load_ff_rankings() |>
  dict_check(dictionary_ff_rankings)

lapply(c("weekly","pbp_pass","pbp_rush"), \(.x) load_ff_opportunity(stat_type = .x)) |>
  data.table::rbindlist(use.names = TRUE, fill = T) |>
  dict_check(dictionary_ff_opportunity)

lapply(c("passing","rushing","receiving"), \(.x) load_nextgen_stats(stat_type = .x)) |>
  data.table::rbindlist(use.names = TRUE, fill = T) |>
  dict_check(dictionary_nextgen_stats)

load_espn_qbr() |>
  dict_check(dictionary_espn_qbr)

load_combine() |>
  dict_check(dictionary_combine)

load_draft_picks() |>
  dict_check(dictionary_draft_picks)

load_injuries() |>
  dict_check(dictionary_injuries)

load_depth_charts() |>
  dict_check(dictionary_depth_charts)

load_trades() |>
  dict_check(dictionary_trades)
