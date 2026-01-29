# Load Advanced Stats from PFR

Loads player level season stats provided by Pro Football Reference
starting with the 2018 season, primarily to augment existing nflverse
data.

## Usage

``` r
load_pfr_advstats(
  seasons = most_recent_season(),
  stat_type = c("pass", "rush", "rec", "def"),
  summary_level = c("week", "season"),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  a numeric vector specifying what seasons to return, if `TRUE` returns
  all available data

- stat_type:

  one of "pass", "rush", "rec", "def"

- summary_level:

  one of "week" (default) or "season" - some data is only available at
  the season level

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

A tibble of player statistics provided by Pro Football Reference that
supplements data in nflverse

## See also

<https://nflreadr.nflverse.com/articles/dictionary_pfr_passing.html> for
the web data dictionary

<https://www.pro-football-reference.com/years/2021/passing_advanced.htm>

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-data>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_pfr_advstats()
})
#> ── nflverse advanced pass weekly stats via PFR ─────────────────────────────────
#> ℹ Data updated: 2026-01-28 12:53:56 UTC
#> # A tibble: 682 × 24
#>    game_id     pfr_game_id season  week game_type team  opponent pfr_player_name
#>    <chr>       <chr>        <int> <int> <chr>     <chr> <chr>    <chr>          
#>  1 2025_01_DA… 202509040p…   2025     1 REG       PHI   DAL      Jalen Hurts    
#>  2 2025_01_DA… 202509040p…   2025     1 REG       DAL   PHI      Dak Prescott   
#>  3 2025_01_KC… 202509050s…   2025     1 REG       LAC   KC       Justin Herbert 
#>  4 2025_01_KC… 202509050s…   2025     1 REG       KC    LAC      Patrick Mahomes
#>  5 2025_01_TB… 202509070a…   2025     1 REG       ATL   TB       Michael Penix  
#>  6 2025_01_TB… 202509070a…   2025     1 REG       TB    ATL      Baker Mayfield 
#>  7 2025_01_CI… 202509070c…   2025     1 REG       CLE   CIN      Joe Flacco     
#>  8 2025_01_CI… 202509070c…   2025     1 REG       CIN   CLE      Joe Burrow     
#>  9 2025_01_MI… 202509070c…   2025     1 REG       IND   MIA      Daniel Jones   
#> 10 2025_01_MI… 202509070c…   2025     1 REG       MIA   IND      Tua Tagovailoa 
#> # ℹ 672 more rows
#> # ℹ 16 more variables: pfr_player_id <chr>, passing_drops <dbl>,
#> #   passing_drop_pct <dbl>, receiving_drop <dbl>, receiving_drop_pct <dbl>,
#> #   passing_bad_throws <dbl>, passing_bad_throw_pct <dbl>, times_sacked <dbl>,
#> #   times_blitzed <dbl>, times_hurried <dbl>, times_hit <dbl>,
#> #   times_pressured <dbl>, times_pressured_pct <dbl>, def_times_blitzed <dbl>,
#> #   def_times_hurried <dbl>, def_times_hitqb <dbl>
# }
```
