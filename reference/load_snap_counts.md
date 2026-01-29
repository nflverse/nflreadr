# Load Snap Counts from PFR

Loads game level snap counts stats provided by Pro Football Reference
starting with the 2012 season.

## Usage

``` r
load_snap_counts(
  seasons = most_recent_season(),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  a numeric vector specifying what seasons to return, if `TRUE` returns
  all available data

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

A tibble of game-level snap counts provided by Pro Football Reference.

## See also

<https://nflreadr.nflverse.com/articles/dictionary_snap_counts.html> for
the web data dictionary

[`dictionary_snap_counts`](https://nflreadr.nflverse.com/reference/dictionary_snap_counts.md)
for the data dictionary as bundled within the package

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-pfr>

## Examples

``` r
# \donttest{
  try({ # prevents CRAN errors
  load_snap_counts()
  })
#> ── nflverse snap counts ────────────────────────────────────────────────────────
#> ℹ Data updated: 2026-01-26 12:58:59 UTC
#> # A tibble: 26,518 × 16
#>    game_id      pfr_game_id season game_type  week player pfr_player_id position
#>    <chr>        <chr>        <int> <chr>     <int> <chr>  <chr>         <chr>   
#>  1 2025_01_ARI… 202509070n…   2025 REG           1 Kelvi… BankKe01      T       
#>  2 2025_01_ARI… 202509070n…   2025 REG           1 Cesar… RuizCe00      C       
#>  3 2025_01_ARI… 202509070n…   2025 REG           1 Dillo… RaduDi00      OL      
#>  4 2025_01_ARI… 202509070n…   2025 REG           1 Erik … McCoEr01      C       
#>  5 2025_01_ARI… 202509070n…   2025 REG           1 Spenc… RattSp00      QB      
#>  6 2025_01_ARI… 202509070n…   2025 REG           1 Juwan… JohnJu02      TE      
#>  7 2025_01_ARI… 202509070n…   2025 REG           1 Rashi… ShahRa00      WR      
#>  8 2025_01_ARI… 202509070n…   2025 REG           1 Chris… OlavCh00      WR      
#>  9 2025_01_ARI… 202509070n…   2025 REG           1 Alvin… KamaAl00      RB      
#> 10 2025_01_ARI… 202509070n…   2025 REG           1 Brand… CookBr00      WR      
#> # ℹ 26,508 more rows
#> # ℹ 8 more variables: team <chr>, opponent <chr>, offense_snaps <dbl>,
#> #   offense_pct <dbl>, defense_snaps <dbl>, defense_pct <dbl>, st_snaps <dbl>,
#> #   st_pct <dbl>
# }
```
