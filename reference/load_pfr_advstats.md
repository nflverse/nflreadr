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

  One of `c("rds", "csv", "parquet")`. Can also be set globally with
  `options(nflreadr.prefer)`

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
#> ℹ Data updated: 2026-09-17 11:02:11 UTC
#> # A tibble: 37 × 24
#>    game_id     pfr_game_id season  week game_type team  opponent pfr_player_name
#>    <chr>       <chr>        <int> <int> <chr>     <chr> <chr>    <chr>          
#>  1 2026_01_NE… 202609090s…   2026     1 REG       SEA   NE       Drew Lock      
#>  2 2026_01_NE… 202609090s…   2026     1 REG       SEA   NE       Sam Darnold    
#>  3 2026_01_NE… 202609090s…   2026     1 REG       NE    SEA      Drake Maye     
#>  4 2026_01_SF… 202609100r…   2026     1 REG       LA    SF       Matthew Staffo…
#>  5 2026_01_SF… 202609100r…   2026     1 REG       LA    SF       Stetson Bennett
#>  6 2026_01_SF… 202609100r…   2026     1 REG       SF    LA       Brock Purdy    
#>  7 2026_01_CH… 202609130c…   2026     1 REG       CAR   CHI      Bryce Young    
#>  8 2026_01_CH… 202609130c…   2026     1 REG       CAR   CHI      Kenny Pickett  
#>  9 2026_01_CH… 202609130c…   2026     1 REG       CHI   CAR      Caleb Williams 
#> 10 2026_01_TB… 202609130c…   2026     1 REG       CIN   TB       Joe Burrow     
#> # ℹ 27 more rows
#> # ℹ 16 more variables: pfr_player_id <chr>, passing_drops <dbl>,
#> #   passing_drop_pct <dbl>, receiving_drop <dbl>, receiving_drop_pct <dbl>,
#> #   passing_bad_throws <dbl>, passing_bad_throw_pct <dbl>, times_sacked <dbl>,
#> #   times_blitzed <dbl>, times_hurried <dbl>, times_hit <dbl>,
#> #   times_pressured <dbl>, times_pressured_pct <dbl>, def_times_blitzed <dbl>,
#> #   def_times_hurried <dbl>, def_times_hitqb <dbl>
# }
```
