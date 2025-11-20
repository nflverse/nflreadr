# Load Weekly Rosters

Returns week level rosters (rather than latest for a given season as
returned by
[`load_rosters()`](https://nflreadr.nflverse.com/reference/load_rosters.md))

## Usage

``` r
load_rosters_weekly(
  seasons = most_recent_season(roster = TRUE),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  a numeric vector of seasons to return, defaults to returning this
  year's data if it is March or later. If set to `TRUE`, will return all
  available data. Data available back to 2002.

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

A tibble of weekly roster data.

## See also

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-data>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_rosters_weekly(2020)
})
#> ── nflverse weekly roster data ─────────────────────────────────────────────────
#> ℹ Data updated: 2023-09-13 01:04:04 UTC
#> # A tibble: 44,130 × 36
#>    season team  position depth_chart_position jersey_number status full_name    
#>     <int> <chr> <chr>    <chr>                        <int> <chr>  <chr>        
#>  1   2020 IND   K        K                                4 UFA    Adam Vinatie…
#>  2   2020 TB    QB       QB                              12 ACT    Tom Brady    
#>  3   2020 TB    QB       QB                              12 ACT    Tom Brady    
#>  4   2020 TB    QB       QB                              12 ACT    Tom Brady    
#>  5   2020 TB    QB       QB                              12 ACT    Tom Brady    
#>  6   2020 TB    QB       QB                              12 ACT    Tom Brady    
#>  7   2020 TB    QB       QB                              12 ACT    Tom Brady    
#>  8   2020 TB    QB       QB                              12 ACT    Tom Brady    
#>  9   2020 TB    QB       QB                              12 ACT    Tom Brady    
#> 10   2020 TB    QB       QB                              12 ACT    Tom Brady    
#> # ℹ 44,120 more rows
#> # ℹ 29 more variables: first_name <chr>, last_name <chr>, birth_date <date>,
#> #   height <dbl>, weight <int>, college <chr>, gsis_id <chr>, espn_id <chr>,
#> #   sportradar_id <chr>, yahoo_id <chr>, rotowire_id <chr>, pff_id <chr>,
#> #   pfr_id <chr>, fantasy_data_id <chr>, sleeper_id <chr>, years_exp <int>,
#> #   headshot_url <chr>, ngs_position <chr>, week <int>, game_type <chr>,
#> #   status_description_abbr <chr>, football_name <chr>, esb_id <chr>, …
# }
```
