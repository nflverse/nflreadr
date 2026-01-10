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

  choice: one of `c("rds", "qs", "csv", "parquet")`. Can also be set
  globally with `options(nflreadr.prefer)`

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
#> ℹ Data updated: 2026-01-10 09:32:55 UTC
#> # A tibble: 544 × 102
#>    season  week team  season_type opponent_team completions attempts
#>     <int> <int> <chr> <chr>       <chr>               <int>    <int>
#>  1   2025     1 ARI   REG         NO                     21       29
#>  2   2025     1 ATL   REG         TB                     27       42
#>  3   2025     1 BAL   REG         BUF                    14       19
#>  4   2025     1 BUF   REG         BAL                    33       46
#>  5   2025     1 CAR   REG         JAX                    18       35
#>  6   2025     1 CHI   REG         MIN                    21       35
#>  7   2025     1 CIN   REG         CLE                    14       23
#>  8   2025     1 CLE   REG         CIN                    31       45
#>  9   2025     1 DAL   REG         PHI                    21       34
#> 10   2025     1 DEN   REG         TEN                    25       40
#> # ℹ 534 more rows
#> # ℹ 95 more variables: passing_yards <int>, passing_tds <int>,
#> #   passing_interceptions <int>, sacks_suffered <int>, sack_yards_lost <int>,
#> #   sack_fumbles <int>, sack_fumbles_lost <int>, passing_air_yards <int>,
#> #   passing_yards_after_catch <int>, passing_first_downs <int>,
#> #   passing_epa <dbl>, passing_cpoe <dbl>, passing_2pt_conversions <int>,
#> #   carries <int>, rushing_yards <int>, rushing_tds <int>, …
# }
```
