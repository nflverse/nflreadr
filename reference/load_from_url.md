# Load any rds/csv/csv.gz/parquet/qs file from a remote URL

Load any rds/csv/csv.gz/parquet/qs file from a remote URL

## Usage

``` r
load_from_url(url, ..., seasons = TRUE, nflverse = FALSE)
```

## Arguments

- url:

  a vector of URLs to load into memory. If more than one URL provided,
  will row-bind them.

- ...:

  named arguments that will be added as attributes to the data, e.g.
  `nflverse_type` = "pbp"

- seasons:

  a numeric vector of years that will be used to filter the dataframe's
  `season` column. If `TRUE` (default), does not filter.

- nflverse:

  TRUE to add nflverse_data classing and attributes.

## Value

a dataframe, possibly of type `nflverse_data`

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  urls <- c("https://github.com/nflverse/nflverse-data/releases/download/rosters/roster_2020.csv",
            "https://github.com/nflverse/nflverse-data/releases/download/rosters/roster_2021.csv")
 load_from_url(urls, nflverse = TRUE, nflverse_type = "rosters for 2020 & 2021")
})
#> ── nflverse rosters for 2020 & 2021 ────────────────────────────────────────────
#> ℹ Data updated: 2025-11-20 13:47:32 UTC
#> # A tibble: 6,029 × 36
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
#> # ℹ 6,019 more rows
#> # ℹ 29 more variables: first_name <chr>, last_name <chr>, birth_date <IDate>,
#> #   height <int>, weight <int>, college <chr>, gsis_id <chr>, espn_id <int>,
#> #   sportradar_id <chr>, yahoo_id <int>, rotowire_id <int>, pff_id <int>,
#> #   pfr_id <chr>, fantasy_data_id <int>, sleeper_id <int>, years_exp <int>,
#> #   headshot_url <chr>, ngs_position <chr>, week <int>, game_type <chr>,
#> #   status_description_abbr <chr>, football_name <chr>, esb_id <chr>, …
# }
```
