# Load Combine Data from PFR

Loads combine data since 2000 courtesy of PFR.

## Usage

``` r
load_combine(
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

A tibble of NFL combine data provided by Pro Football Reference.

## See also

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-data>

<https://nflreadr.nflverse.com/articles/dictionary_combine.html> for a
web version of the dictionary

[`dictionary_combine`](https://nflreadr.nflverse.com/reference/dictionary_combine.md)
for the data dictionary as bundled within the package

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_combine()
})
#> ── nflverse combine measurements ───────────────────────────────────────────────
#> ℹ Data updated: 2025-03-12 17:18:16 UTC
#> # A tibble: 8,649 × 18
#>    season draft_year draft_team  draft_round draft_ovr pfr_id cfb_id player_name
#>     <int>      <dbl> <chr>             <dbl>     <dbl> <chr>  <chr>  <chr>      
#>  1   2000       2000 New York J…           1        13 AbraJ… NA     John Abrah…
#>  2   2000       2000 Seattle Se…           1        19 AlexS… shaun… Shaun Alex…
#>  3   2000       2000 Kansas Cit…           6       188 AlfoD… NA     Darnell Al…
#>  4   2000         NA NA                   NA        NA NA     NA     Kyle Allam…
#>  5   2000       2000 Carolina P…           1        23 AndeR… NA     Rashard An…
#>  6   2000         NA NA                   NA        NA arian… NA     Jake Arians
#>  7   2000       2000 Washington…           1         2 ArriL… lavar… LaVar Arri…
#>  8   2000         NA NA                   NA        NA AtkiC… NA     Corey Atki…
#>  9   2000         NA NA                   NA        NA NA     NA     Kyle Atteb…
#> 10   2000       2000 Chicago Be…           4       125 AustR… NA     Reggie Aus…
#> # ℹ 8,639 more rows
#> # ℹ 10 more variables: pos <chr>, school <chr>, ht <chr>, wt <dbl>,
#> #   forty <dbl>, bench <dbl>, vertical <dbl>, broad_jump <dbl>, cone <dbl>,
#> #   shuttle <dbl>
# }
```
