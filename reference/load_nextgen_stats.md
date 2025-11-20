# Load Player Level Weekly NFL Next Gen Stats

Loads player level weekly stats provided by NFL Next Gen Stats starting
with the 2016 season. Three different stat types are available and the
current season's data updates every night. NGS will only provide data
for players above a minimum number of pass/rush/rec attempts.

## Usage

``` r
load_nextgen_stats(
  seasons = TRUE,
  stat_type = c("passing", "receiving", "rushing"),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  a numeric vector specifying what seasons to return, if `TRUE` returns
  all available data

- stat_type:

  one of `"passing"`, `"receiving"`, or `"rushing"`

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

A tibble of week-level player statistics provided by NFL Next Gen Stats.
Regular season summary is given for `week == 0`.

## See also

<https://nextgenstats.nfl.com/stats/passing> for `stat_type = "passing"`

<https://nextgenstats.nfl.com/stats/receiving> for
`stat_type = "receiving"`

<https://nextgenstats.nfl.com/stats/rushing> for `stat_type = "rushing"`

<https://nflreadr.nflverse.com/articles/dictionary_nextgen_stats.html>
for a web version of the data dictionary

[`dictionary_nextgen_stats`](https://nflreadr.nflverse.com/reference/dictionary_nextgen_stats.md)
for the data dictionary as bundled within the package

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-data>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_nextgen_stats(stat_type = "passing")
  load_nextgen_stats(stat_type = "receiving")
  load_nextgen_stats(stat_type = "rushing")
})
#> ── nflverse Next Gen Stats weekly rushing data ─────────────────────────────────
#> ℹ Data updated: 2025-11-20 07:17:44 UTC
#> # A tibble: 5,736 × 22
#>    season season_type  week player_display_name player_position team_abbr
#>     <int> <chr>       <int> <chr>               <chr>           <chr>    
#>  1   2016 REG             0 David Johnson       RB              ARI      
#>  2   2016 REG             0 Latavius Murray     RB              LV       
#>  3   2016 REG             0 Jonathan Stewart    RB              CAR      
#>  4   2016 REG             0 LeSean McCoy        RB              BUF      
#>  5   2016 REG             0 Doug Martin         RB              TB       
#>  6   2016 REG             0 Paul Perkins        RB              NYG      
#>  7   2016 REG             0 C.J. Anderson       RB              DEN      
#>  8   2016 REG             0 Tim Hightower       RB              NO       
#>  9   2016 REG             0 Matt Asiata         RB              MIN      
#> 10   2016 REG             0 Jay Ajayi           RB              MIA      
#> # ℹ 5,726 more rows
#> # ℹ 16 more variables: efficiency <dbl>,
#> #   percent_attempts_gte_eight_defenders <dbl>, avg_time_to_los <dbl>,
#> #   rush_attempts <int>, rush_yards <int>, avg_rush_yards <dbl>,
#> #   rush_touchdowns <int>, player_gsis_id <chr>, player_first_name <chr>,
#> #   player_last_name <chr>, player_jersey_number <int>,
#> #   player_short_name <chr>, expected_rush_yards <dbl>, …
# }
```
