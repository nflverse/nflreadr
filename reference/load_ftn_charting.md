# Load FTN Charting Data

FTN Data manually charts plays and has graciously provided a subset of
their charting data to be published via the nflverse. Data is available
from the 2022 season onwards and is charted within 48 hours following
each game. This data is released under the [CC-BY-SA
4.0](https://creativecommons.org/licenses/by-sa/4.0/) Creative Commons
license and attribution must be made to **FTN Data via nflverse**

## Usage

``` r
load_ftn_charting(
  seasons = most_recent_season(),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Source

FTNData.com

## Arguments

- seasons:

  a numeric vector of seasons to return, defaults to most recent season.
  If set to `TRUE`, returns all available data. Data available from 2022
  onwards.

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

Play-level manual charting data from FTN Data

## See also

<https://ftnfantasy.com/stats/sports-data>

`vignette("Data Dictionary - FTN Charting")`

<https://nflreadr.nflverse.com/articles/dictionary_ftn_charting.html>
for the web data dictionary

Other ftn_charting:
[`dictionary_ftn_charting`](https://nflreadr.nflverse.com/reference/dictionary_ftn_charting.md)

## Author

FTN Data

## Examples

``` r
# \donttest{
  try({ # prevents cran errors
  load_ftn_charting()
  })
#> ── nflverse FTN Charting Data - please attribute to 'ftndata.com via nflverse' ─
#> ℹ Data updated: 2026-01-06 12:40:29 UTC
#> # A tibble: 45,064 × 29
#>    ftn_game_id nflverse_game_id season  week ftn_play_id nflverse_play_id
#>  *       <int> <chr>             <int> <int>       <int>            <int>
#>  1        6734 2025_01_DAL_PHI    2025     1     1106026               40
#>  2        6734 2025_01_DAL_PHI    2025     1     1106027               71
#>  3        6734 2025_01_DAL_PHI    2025     1     1106028              112
#>  4        6734 2025_01_DAL_PHI    2025     1     1106029              141
#>  5        6734 2025_01_DAL_PHI    2025     1     1106030              166
#>  6        6734 2025_01_DAL_PHI    2025     1     1106031              188
#>  7        6734 2025_01_DAL_PHI    2025     1     1106032              213
#>  8        6734 2025_01_DAL_PHI    2025     1     1106033              247
#>  9        6734 2025_01_DAL_PHI    2025     1     1106034              270
#> 10        6734 2025_01_DAL_PHI    2025     1     1106035              285
#> # ℹ 45,054 more rows
#> # ℹ 23 more variables: starting_hash <chr>, qb_location <chr>,
#> #   n_offense_backfield <int>, n_defense_box <int>, is_no_huddle <lgl>,
#> #   is_motion <lgl>, is_play_action <lgl>, is_screen_pass <lgl>, is_rpo <lgl>,
#> #   is_trick_play <lgl>, is_qb_out_of_pocket <lgl>,
#> #   is_interception_worthy <lgl>, is_throw_away <lgl>, read_thrown <chr>,
#> #   is_catchable_ball <lgl>, is_contested_ball <lgl>, …
# }
```
