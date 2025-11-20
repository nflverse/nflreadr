# Load Participation Data

Loads participation data from the [nflverse-data
repository](https://github.com/nflverse/nflverse-data)

Participation data prior to 2023 is from NFL NGS. Participation data
from 2023 onwards is courtesy of FTN and is provided after all
post-season games are completed. This data is released under the
[CC-BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) Creative
Commons license and attribution must be made to **FTN Data via
nflverse** (from 2023 onwards) or **NFL NextGenStats via nflverse** (for
2022 and earlier)

## Usage

``` r
load_participation(
  seasons = most_recent_season(),
  include_pbp = FALSE,
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  A numeric vector of 4-digit years associated with given NFL seasons -
  defaults to latest season. If set to `TRUE`, returns all available
  data since 2016.

- include_pbp:

  a logical: download and join pbp to this data?

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

A dataframe of participation data, optionally merged with play by play

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_participation(seasons = 2020, include_pbp = TRUE)
})
#> ── nflverse play-by-play participation ─────────────────────────────────────────
#> ℹ Data updated: 2023-12-19 06:19:07 UTC
#> # A tibble: 47,704 × 389
#>    nflverse_game_id play_id possession_team offense_formation offense_personnel
#>    <chr>              <int> <chr>           <chr>             <chr>            
#>  1 2020_01_ARI_SF         1 ""              NA                NA               
#>  2 2020_01_ARI_SF        39 "ARI"           NA                NA               
#>  3 2020_01_ARI_SF        54 "SF"            SHOTGUN           2 RB, 1 TE, 2 WR 
#>  4 2020_01_ARI_SF        93 "SF"            SHOTGUN           2 RB, 1 TE, 2 WR 
#>  5 2020_01_ARI_SF       118 "SF"            SINGLEBACK        2 RB, 1 TE, 2 WR 
#>  6 2020_01_ARI_SF       143 "SF"            SHOTGUN           2 RB, 1 TE, 2 WR 
#>  7 2020_01_ARI_SF       165 "SF"            SHOTGUN           1 RB, 1 TE, 3 WR 
#>  8 2020_01_ARI_SF       197 "SF"            NA                NA               
#>  9 2020_01_ARI_SF       226 "SF"            NA                NA               
#> 10 2020_01_ARI_SF       245 "ARI"           SHOTGUN           1 RB, 1 TE, 3 WR 
#> # ℹ 47,694 more rows
#> # ℹ 384 more variables: defenders_in_box <int>, defense_personnel <chr>,
#> #   number_of_pass_rushers <int>, players_on_play <chr>, offense_players <chr>,
#> #   defense_players <chr>, n_offense <int>, n_defense <int>,
#> #   ngs_air_yards <dbl>, time_to_throw <dbl>, was_pressure <lgl>, route <chr>,
#> #   defense_man_zone_type <chr>, defense_coverage_type <chr>,
#> #   old_game_id <chr>, home_team <chr>, away_team <chr>, season_type <chr>, …
# }
```
