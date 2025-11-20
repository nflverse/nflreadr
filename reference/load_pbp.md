# Load Play By Play

Loads play by play seasons from the [nflverse-data
repository](https://github.com/nflverse/nflverse-data)

## Usage

``` r
load_pbp(
  seasons = most_recent_season(),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  A numeric vector of 4-digit years associated with given NFL seasons -
  defaults to latest season. If set to `TRUE`, returns all available
  data since 1999.

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

The complete nflfastR dataset as returned by
`nflfastR::build_nflfastR_pbp()` (see below) for all given `seasons`

## See also

<https://nflreadr.nflverse.com/articles/dictionary_pbp.html> for a web
version of the data dictionary

[`dictionary_pbp`](https://nflreadr.nflverse.com/reference/dictionary_pbp.md)
for the data dictionary bundled as a package dataframe

<https://www.nflfastr.com/reference/build_nflfastR_pbp.html> for the
nflfastR function `nflfastR::build_nflfastR_pbp()`

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-pbp>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_pbp(2019:2020)
})
#> ── nflverse play by play data ──────────────────────────────────────────────────
#> ℹ Data updated: 2025-04-30 08:01:16 UTC
#> # A tibble: 94,965 × 372
#>    play_id game_id     old_game_id home_team away_team season_type  week posteam
#>      <dbl> <chr>       <chr>       <chr>     <chr>     <chr>       <int> <chr>  
#>  1       1 2019_01_AT… 2019090804  MIN       ATL       REG             1 NA     
#>  2      36 2019_01_AT… 2019090804  MIN       ATL       REG             1 ATL    
#>  3      51 2019_01_AT… 2019090804  MIN       ATL       REG             1 ATL    
#>  4      79 2019_01_AT… 2019090804  MIN       ATL       REG             1 ATL    
#>  5     100 2019_01_AT… 2019090804  MIN       ATL       REG             1 ATL    
#>  6     121 2019_01_AT… 2019090804  MIN       ATL       REG             1 ATL    
#>  7     148 2019_01_AT… 2019090804  MIN       ATL       REG             1 MIN    
#>  8     185 2019_01_AT… 2019090804  MIN       ATL       REG             1 MIN    
#>  9     214 2019_01_AT… 2019090804  MIN       ATL       REG             1 MIN    
#> 10     239 2019_01_AT… 2019090804  MIN       ATL       REG             1 MIN    
#> # ℹ 94,955 more rows
#> # ℹ 364 more variables: posteam_type <chr>, defteam <chr>, side_of_field <chr>,
#> #   yardline_100 <dbl>, game_date <chr>, quarter_seconds_remaining <dbl>,
#> #   half_seconds_remaining <dbl>, game_seconds_remaining <dbl>,
#> #   game_half <chr>, quarter_end <dbl>, drive <dbl>, sp <dbl>, qtr <dbl>,
#> #   down <dbl>, goal_to_go <int>, time <chr>, yrdln <chr>, ydstogo <dbl>,
#> #   ydsnet <dbl>, desc <chr>, play_type <chr>, yards_gained <dbl>, …
# }
```
