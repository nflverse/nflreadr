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
#> ℹ Data updated: 2026-09-17 09:04:18 UTC
#> # A tibble: 32 × 138
#>    season  week team  season_type game_id     opponent_team completions attempts
#>     <int> <int> <chr> <chr>       <chr>       <chr>               <int>    <int>
#>  1   2026     1 ARI   REG         2026_01_AR… LAC                    27       37
#>  2   2026     1 ATL   REG         2026_01_AT… PIT                    12       22
#>  3   2026     1 BAL   REG         2026_01_BA… IND                    17       25
#>  4   2026     1 BUF   REG         2026_01_BU… HOU                    20       29
#>  5   2026     1 CAR   REG         2026_01_CH… CHI                    23       38
#>  6   2026     1 CHI   REG         2026_01_CH… CAR                    21       29
#>  7   2026     1 CIN   REG         2026_01_TB… TB                     25       35
#>  8   2026     1 CLE   REG         2026_01_CL… JAX                    16       22
#>  9   2026     1 DAL   REG         2026_01_DA… NYG                    22       34
#> 10   2026     1 DEN   REG         2026_01_DE… KC                     17       28
#> # ℹ 22 more rows
#> # ℹ 130 more variables: passing_yards <int>, passing_tds <int>,
#> #   passing_interceptions <int>, sacks_suffered <int>, sack_yards_lost <int>,
#> #   sack_fumbles <int>, sack_fumbles_lost <int>, passing_air_yards <int>,
#> #   passing_yards_after_catch <int>, passing_first_downs <int>,
#> #   passing_epa <dbl>, passing_cpoe <dbl>, passing_2pt_conversions <int>,
#> #   passing_10 <int>, passing_16 <int>, passing_20 <int>, passing_40 <int>, …
# }
```
