# Load Weekly Depth Charts

Loads depth charts for each NFL team for each week back to 2001.

## Usage

``` r
load_depth_charts(
  seasons = most_recent_season(roster = TRUE),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  a numeric vector specifying what seasons to return, if `TRUE` returns
  all available data. Defaults to latest season with available rosters.

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

A tibble of week-level depth charts for each team.

## See also

<https://nflreadr.nflverse.com/articles/dictionary_depth_charts.html>
for a web version of the dictionary

[`dictionary_depth_charts`](https://nflreadr.nflverse.com/reference/dictionary_depth_charts.md)
for the data dictionary as bundled within the package

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-data>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_depth_charts(2020)
})
#> ── nflverse depth charts ───────────────────────────────────────────────────────
#> ℹ Data updated: 2024-08-04 21:44:01 UTC
#> # A tibble: 36,168 × 15
#>    season club_code  week game_type depth_team last_name first_name
#>     <int> <chr>     <int> <chr>     <chr>      <chr>     <chr>     
#>  1   2020 ATL           1 REG       2          Hill      Brian     
#>  2   2020 ATL           1 REG       3          Smith     Alton     
#>  3   2020 ATL           1 REG       1          Jarrett   Grady     
#>  4   2020 ATL           1 REG       2          Senat     Deadrin   
#>  5   2020 ATL           1 REG       2          Hawkins   Jaylinn   
#>  6   2020 ATL           1 REG       1          Koo       Younghoe  
#>  7   2020 ATL           1 REG       1          Koo       Younghoe  
#>  8   2020 ATL           1 REG       1          Ridley    Calvin    
#>  9   2020 ATL           1 REG       2          Schaub    Matt      
#> 10   2020 ATL           1 REG       3          Smith     Romarius  
#> # ℹ 36,158 more rows
#> # ℹ 8 more variables: football_name <chr>, formation <chr>, gsis_id <chr>,
#> #   jersey_number <chr>, position <chr>, elias_id <chr>, depth_position <chr>,
#> #   full_name <chr>
# }
```
