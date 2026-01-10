# Load Draft Picks from PFR

Loads every draft pick since 1980 courtesy of PFR.

## Usage

``` r
load_draft_picks(
  seasons = TRUE,
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  a numeric vector of seasons to return, default `TRUE` returns all
  available data

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

A tibble of NFL draft picks provided by Pro Football Reference.

## See also

<https://nflreadr.nflverse.com/articles/dictionary_draft_picks.html> for
the web data dictionary

[`dictionary_draft_picks`](https://nflreadr.nflverse.com/reference/dictionary_draft_picks.md)
for the data dictionary as bundled within the package

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-data>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_draft_picks()
})
#> ── nflverse Draft Picks, via Pro Football Reference ────────────────────────────
#> ℹ Data updated: 2026-01-07 05:18:36 UTC
#> # A tibble: 12,670 × 36
#>    season round  pick team  gsis_id pfr_player_id cfb_player_id  pfr_player_name
#>     <int> <int> <int> <chr> <chr>   <chr>         <chr>          <chr>          
#>  1   1980     1     1 DET   ""      SimsBi00      "billy-sims-1" Billy Sims     
#>  2   1980     1     2 NYJ   ""      JoneLa00      "lam-jones-1"  Lam Jones      
#>  3   1980     1     3 CIN   ""      MunoAn00      ""             Anthony Munoz  
#>  4   1980     1     4 GNB   ""      ClarBr23      "bruce-clark-… Bruce Clark    
#>  5   1980     1     5 BAL   ""      DickCu00      "curtis-dicke… Curtis Dickey  
#>  6   1980     1     6 STL   ""      GreeCu21      "curtis-greer… Curtis Greer   
#>  7   1980     1     7 ATL   ""      MillJu00      "junior-mille… Junior Miller  
#>  8   1980     1     8 NYG   ""      HaynMa00      "mark-haynes-… Mark Haynes    
#>  9   1980     1     9 MIN   ""      MartDo21      ""             Doug Martin    
#> 10   1980     1    10 SEA   ""      GreeJa01      "jacob-green-… Jacob Green    
#> # ℹ 12,660 more rows
#> # ℹ 28 more variables: hof <lgl>, position <chr>, category <chr>, side <chr>,
#> #   college <chr>, age <int>, to <int>, allpro <int>, probowls <int>,
#> #   seasons_started <int>, w_av <int>, car_av <lgl>, dr_av <int>, games <int>,
#> #   pass_completions <int>, pass_attempts <int>, pass_yards <int>,
#> #   pass_tds <int>, pass_ints <int>, rush_atts <int>, rush_yards <int>,
#> #   rush_tds <int>, receptions <int>, rec_yards <int>, rec_tds <int>, …
# }
```
