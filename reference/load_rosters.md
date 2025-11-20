# Load Rosters

Load Rosters

## Usage

``` r
load_rosters(
  seasons = most_recent_season(roster = TRUE),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  a numeric vector of seasons to return, defaults to returning this
  year's data if it is March or later. If set to `TRUE`, will return all
  available data. Data available back to 1920.

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

A tibble of season-level roster data.

## See also

<https://nflreadr.nflverse.com/articles/dictionary_rosters.html> for a
web version of the data dictionary

[`dictionary_rosters`](https://nflreadr.nflverse.com/reference/dictionary_rosters.md)
for the data dictionary as a dataframe

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-data>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_rosters(2020)
})
#> ── nflverse roster data ────────────────────────────────────────────────────────
#> ℹ Data updated: 2023-09-13 01:04:45 UTC
#> # A tibble: 3,068 × 36
#>    season team  position depth_chart_position jersey_number status full_name    
#>     <int> <chr> <chr>    <chr>                        <int> <chr>  <chr>        
#>  1   2020 IND   K        K                                4 UFA    Adam Vinatie…
#>  2   2020 TB    QB       QB                              12 ACT    Tom Brady    
#>  3   2020 NO    QB       QB                               9 ACT    Drew Brees   
#>  4   2020 HOU   QB       QB                               3 INA    Josh McCown  
#>  5   2020 LV    TE       TE                              82 ACT    Jason Witten 
#>  6   2020 KC    LB       OLB                             94 UFA    Terrell Suggs
#>  7   2020 DET   LS       LS                              48 ACT    Don Muhlbach 
#>  8   2020 PHI   OL       T                               71 RES    Jason Peters 
#>  9   2020 ATL   QB       QB                               8 ACT    Matt Schaub  
#> 10   2020 ARI   P        P                                4 ACT    Andy Lee     
#> # ℹ 3,058 more rows
#> # ℹ 29 more variables: first_name <chr>, last_name <chr>, birth_date <date>,
#> #   height <dbl>, weight <int>, college <chr>, gsis_id <chr>, espn_id <chr>,
#> #   sportradar_id <chr>, yahoo_id <chr>, rotowire_id <chr>, pff_id <chr>,
#> #   pfr_id <chr>, fantasy_data_id <chr>, sleeper_id <chr>, years_exp <int>,
#> #   headshot_url <chr>, ngs_position <chr>, week <int>, game_type <chr>,
#> #   status_description_abbr <chr>, football_name <chr>, esb_id <chr>, …
# }
```
