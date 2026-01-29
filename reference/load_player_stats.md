# Load Player Level Stats

Load Player Level Stats

## Usage

``` r
load_player_stats(
  seasons = most_recent_season(),
  ...,
  summary_level = c("week", "reg", "post", "reg+post"),
  file_type = getOption("nflreadr.prefer", default = "rds"),
  stat_type = lifecycle::deprecated()
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
  postseason, "reg+post" for combined regular season + postseason stats

- file_type:

  choice: one of `c("rds", "qs", "csv", "parquet")`. Can also be set
  globally with `options(nflreadr.prefer)`

- stat_type:

  **\[deprecated\]** - now returns all stat types by default

## Value

A tibble of player statistics that aims to match NFL official box scores
and season summaries

## See also

<https://nflreadr.nflverse.com/articles/dictionary_player_stats.html>
for a web version of the data dictionary

[`dictionary_player_stats`](https://nflreadr.nflverse.com/reference/dictionary_player_stats.md)
for the data dictionary

## Examples

``` r
# \donttest{
try({
  load_player_stats()
})
#> ── nflverse player stats: week level ───────────────────────────────────────────
#> ℹ Data updated: 2026-01-29 09:54:52 UTC
#> # A tibble: 19,354 × 114
#>    player_id  player_name player_display_name position position_group
#>    <chr>      <chr>       <chr>               <chr>    <chr>         
#>  1 00-0023459 A.Rodgers   Aaron Rodgers       QB       QB            
#>  2 00-0023853 M.Prater    Matt Prater         K        SPEC          
#>  3 00-0025565 N.Folk      Nick Folk           K        SPEC          
#>  4 00-0026158 J.Flacco    Joe Flacco          QB       QB            
#>  5 00-0026190 C.Campbell  Calais Campbell     DE       DL            
#>  6 00-0026498 M.Stafford  Matthew Stafford    QB       QB            
#>  7 00-0026858 G.Gano      Graham Gano         K        SPEC          
#>  8 00-0027114 T.Morstead  Thomas Morstead     P        SPEC          
#>  9 00-0027857 T.Williams  Trent Williams      OT       OL            
#> 10 00-0027940 V.Miller    Von Miller          OLB      LB            
#> # ℹ 19,344 more rows
#> # ℹ 109 more variables: headshot_url <chr>, season <int>, week <int>,
#> #   season_type <chr>, team <chr>, opponent_team <chr>, completions <int>,
#> #   attempts <int>, passing_yards <int>, passing_tds <int>,
#> #   passing_interceptions <int>, sacks_suffered <int>, sack_yards_lost <int>,
#> #   sack_fumbles <int>, sack_fumbles_lost <int>, passing_air_yards <int>,
#> #   passing_yards_after_catch <int>, passing_first_downs <int>, …
# }
```
