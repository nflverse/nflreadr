# Load Injury Reports

Data collected from an API for weekly injury report data.

## Usage

``` r
load_injuries(
  seasons = most_recent_season(),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  a numeric vector of seasons to return, data available since 2009.
  Defaults to latest season available.

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

a tibble of season-level injury report data.

## See also

<https://nflreadr.nflverse.com/articles/dictionary_injuries.html> for a
web version of the dictionary

[`dictionary_injuries`](https://nflreadr.nflverse.com/reference/dictionary_injuries.md)
for the data dictionary as bundled within the package

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-data>

## Examples

``` r
# \donttest{
try({# prevents cran errors
    load_injuries(2020)
})
#> ── nflverse injury & practice reports ──────────────────────────────────────────
#> ℹ Data updated: 2022-07-26 05:23:25 UTC
#> # A tibble: 5,661 × 16
#>    season game_type team   week gsis_id  position full_name first_name last_name
#>     <dbl> <chr>     <chr> <dbl> <chr>    <chr>    <chr>     <chr>      <chr>    
#>  1   2020 REG       ARI       1 00-0035… WR       KeeSean … KeeSean    Johnson  
#>  2   2020 REG       ARI       1 00-0022… WR       Larry Fi… Larry      Fitzgera…
#>  3   2020 REG       ARI       1 00-0030… WR       DeAndre … DeAndre    Hopkins  
#>  4   2020 REG       ARI       1 00-0031… TE       Maxx Wil… Maxx       Williams 
#>  5   2020 REG       ARI       1 00-0036… T        Josh Jon… Josh       Jones    
#>  6   2020 REG       ATL       1 00-0027… G        James Ca… James      Carpenter
#>  7   2020 REG       ATL       1 00-0032… RB       Todd Gur… Todd       Gurley   
#>  8   2020 REG       ATL       1 00-0026… C        Alex Mack Alex       Mack     
#>  9   2020 REG       ATL       1 00-0032… DE       Dante Fo… Dante      Fowler   
#> 10   2020 REG       ATL       1 00-0034… WR       Russell … Russell    Gage     
#> # ℹ 5,651 more rows
#> # ℹ 7 more variables: report_primary_injury <chr>,
#> #   report_secondary_injury <chr>, report_status <chr>,
#> #   practice_primary_injury <chr>, practice_secondary_injury <chr>,
#> #   practice_status <chr>, date_modified <dttm>
# }
```
