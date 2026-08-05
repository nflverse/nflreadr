# Load Team Level Stats

Load Team Level Stats

## Usage

``` r
load_team_stats(
  seasons = most_recent_season(),
  ...,
  summary_level = c("week", "reg", "post", "reg+post"),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  a numeric vector of seasons to return, defaults to most recent season.
  If set to `TRUE`, returns all available data.

- ...:

  These dots are for future extensions and must be empty.

- summary_level:

  choice: one of week (default), "reg" for regular season, "post" for
  postseason, "reg+post" for combined regular + post season stats

- file_type:

  choice: one of `c("rds", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

A tibble of team statistics that aims to match NFL official box scores
and season summaries

## See also

<https://nflreadr.nflverse.com/articles/dictionary_team_stats.html> for
a web version of the data dictionary

[`dictionary_team_stats`](https://nflreadr.nflverse.com/reference/dictionary_team_stats.md)
for the data dictionary

## Examples

``` r
# \donttest{
try({
  load_team_stats()
})
#> ── nflverse team stats: week level ─────────────────────────────────────────────
#> ℹ Data updated: 2026-07-10 06:51:53 UTC
#> # A tibble: 570 × 133
#>    season  week team  season_type game_id     opponent_team completions attempts
#>     <int> <int> <chr> <chr>       <chr>       <chr>               <int>    <int>
#>  1   2025     1 ARI   REG         2025_01_AR… NO                     21       29
#>  2   2025     1 ATL   REG         2025_01_TB… TB                     27       42
#>  3   2025     1 BAL   REG         2025_01_BA… BUF                    14       19
#>  4   2025     1 BUF   REG         2025_01_BA… BAL                    33       46
#>  5   2025     1 CAR   REG         2025_01_CA… JAX                    18       35
#>  6   2025     1 CHI   REG         2025_01_MI… MIN                    21       35
#>  7   2025     1 CIN   REG         2025_01_CI… CLE                    14       23
#>  8   2025     1 CLE   REG         2025_01_CI… CIN                    31       45
#>  9   2025     1 DAL   REG         2025_01_DA… PHI                    21       34
#> 10   2025     1 DEN   REG         2025_01_TE… TEN                    25       40
#> # ℹ 560 more rows
#> # ℹ 125 more variables: passing_yards <int>, passing_tds <int>,
#> #   passing_interceptions <int>, sacks_suffered <int>, sack_yards_lost <int>,
#> #   sack_fumbles <int>, sack_fumbles_lost <int>, passing_air_yards <int>,
#> #   passing_yards_after_catch <int>, passing_first_downs <int>,
#> #   passing_epa <dbl>, passing_cpoe <dbl>, passing_2pt_conversions <int>,
#> #   passing_10 <int>, passing_16 <int>, passing_20 <int>, passing_40 <int>, …
# }
```
