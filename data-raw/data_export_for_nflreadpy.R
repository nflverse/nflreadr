# RUN THIS TO UPDATE PACKAGE DATA IN nflreadpy

# nflreadpy uses package data to apply team_abbr and player name cleaning
# we use nflreadr's data and save it in a columnar format with parquet

team_abbr_mapping <- nflreadr::team_abbr_mapping |>
  tibble::enframe()

team_abbr_mapping_norelocate <- nflreadr::team_abbr_mapping_norelocate |>
  tibble::enframe()

player_name_mapping <- nflreadr::player_name_mapping |>
  tibble::enframe()

arrow::write_parquet(
  team_abbr_mapping,
  "~/nflreadpy/src/nflreadpy/data/team_abbr_mapping.parquet"
)
arrow::write_parquet(
  team_abbr_mapping_norelocate,
  "~/nflreadpy/src/nflreadpy/data/team_abbr_mapping_norelocate.parquet"
)
arrow::write_parquet(
  player_name_mapping,
  "~/nflreadpy/src/nflreadpy/data/player_name_mapping.parquet"
)
