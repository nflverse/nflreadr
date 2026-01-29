# Load Historical Player Contracts from OverTheCap.com

Loads player contracts from OverTheCap.com

## Usage

``` r
load_contracts(file_type = getOption("nflreadr.prefer", default = "rds"))
```

## Arguments

- file_type:

  One of `"rds"`, `"qs"`, `"csv"`, or `"parquet"`. Can also be set
  globally with options(nflreadr.prefer)

## Value

A tibble of active and non-active NFL player contracts.

## See also

<https://overthecap.com/contract-history> for a web version of the data

<https://nflreadr.nflverse.com/articles/dictionary_contracts.html> for a
web version of the dictionary

[`dictionary_contracts`](https://nflreadr.nflverse.com/reference/dictionary_contracts.md)
for the data dictionary as bundled within the package

Issues with this data should be filed here:
<https://github.com/nflverse/rotc>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_contracts()
})
#> ── nflverse Historical Contract Data from OverTheCap.com ───────────────────────
#> ℹ Data updated: 2026-01-29 07:44:05 UTC
#> # A tibble: 50,167 × 25
#>    player      position team  is_active year_signed years value   apy guaranteed
#>    <chr>       <chr>    <chr> <lgl>           <int> <int> <dbl> <dbl>      <dbl>
#>  1 Joe Burrow  QB       Beng… TRUE             2023     5  275   55        147. 
#>  2 Aaron Rodg… QB       GB/N… FALSE            2022     5  151.  50.3      101. 
#>  3 Josh Allen  QB       Bills FALSE            2021     6  258   43        100  
#>  4 Russell Wi… QB       Bron… FALSE            2022     5  245   49        124  
#>  5 Dak Presco… QB       Cowb… TRUE             2024     4  240   60        129  
#>  6 Justin Her… QB       Char… TRUE             2023     5  262.  52.5      134. 
#>  7 Lamar Jack… QB       Rave… TRUE             2023     5  260   52        135  
#>  8 Patrick Ma… QB       Chie… TRUE             2020    10  450   45         63.1
#>  9 Jalen Hurts QB       Eagl… TRUE             2023     5  255   51        110  
#> 10 Kyler Murr… QB       Card… TRUE             2022     5  230.  46.1      103. 
#> # ℹ 50,157 more rows
#> # ℹ 16 more variables: apy_cap_pct <dbl>, inflated_value <dbl>,
#> #   inflated_apy <dbl>, inflated_guaranteed <dbl>, player_page <chr>,
#> #   otc_id <int>, gsis_id <chr>, date_of_birth <chr>, height <chr>,
#> #   weight <chr>, college <chr>, draft_year <int>, draft_round <int>,
#> #   draft_overall <int>, draft_team <chr>, cols <list>
# }
```
