library(skimr)
library(tidyverse)
library(janitor)
devtools::load_all()

pbp_rush <- load_ff_opportunity(2021,"pbp_rush") |> skimr::skim()
pbp_pass <- load_ff_opportunity(2021,"pbp_pass") |> skimr::skim()
week <- load_ff_opportunity(2021) |> skimr::skim()

pbp_names <- dictionary_pbp |> select(Field,Description) |> deframe()
roster_names <- dictionary_rosters |> select(Field=field,Description=description) |> deframe()
schedule_names <- dictionary_schedules |> select(Field = field, Description = description) |> deframe()

autonamer <- function(name){

  case_when(
    str_detect(name, "_exp_team") ~ paste("Team-level total expected",str_remove(name,"_team"), "for a game, summed across all plays & players for that team."),
    str_detect(name, "_diff_team")~ paste("Team-level difference between actual and expected number of",str_remove(name,"_team"), "for a game, summed across all plays/players for that team. Often interpreted as team-level efficiency."),
    str_detect(name, "_exp") ~ paste("Expected number of",str_remove(name,"_exp"),"in this game (weekly) or on this play (pbp_rush/pbp_pass) given situation"),
    str_detect(name, "_diff") ~ paste("Difference between actual and expected number of",str_remove(name,"_diff"),"- often interpreted as efficiency for a given play/game"),
    str_detect(name, "_team") ~ paste("Team-level total",str_remove(name,"_team"), "for a game, summed across all plays/players for that team."),
    TRUE ~ NA_character_
  )
}

dictionary <- dplyr::bind_rows(pbp_rush = pbp_rush, pbp_pass=pbp_pass, weekly = week,.id = "stat_type") |>
  mutate(order = row_number()) |>
  group_by(skim_variable, skim_type) |>
  summarise(stat_type = paste(stat_type, collapse = ", "),
            order = min(order)) |>
  ungroup() |>
  arrange(order) |>
  select(Field = skim_variable,
         Type = skim_type,
         Dataframe = stat_type) |>
  mutate(
    pbp_desc = pbp_names[Field],
    roster_desc = roster_names[Field],
    schedule_desc = schedule_names[Field],
    auto_desc = autonamer(Field),
    Description = coalesce(pbp_desc, roster_desc, schedule_desc, auto_desc)
  ) |>
  select(Field, Type, Dataframe, Description) |>
  mutate_all(str_squish)

write_csv2(dictionary, "data-raw/dictionary_ffopps.csv", quote = c("all"))
