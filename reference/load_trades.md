# Load Trades

This returns a table of historical trades as maintained by Lee Sharpe.

## Usage

``` r
load_trades(seasons = TRUE)
```

## Arguments

- seasons:

  a numeric vector of seasons to return, default `TRUE` returns all
  available data.

## Value

A tibble of game information for past and/or future games.

## See also

<https://nflreadr.nflverse.com/articles/dictionary_trades.html> for a
web version of the dictionary

[`dictionary_trades`](https://nflreadr.nflverse.com/reference/dictionary_trades.md)
for the data dictionary as bundled within the package

Issues with this data should be filed here:
<https://github.com/nflverse/nfldata>

## Examples

``` r
# \donttest{
 load_trades(2020)
#> ── nflverse trades (via PFR / Lee Sharpe) ──────────────────────────────────────
#> ℹ Data updated: 2026-01-18 10:35:06 UTC
#> # A tibble: 211 × 11
#>    trade_id season trade_date gave  received pick_season pick_round pick_number
#>       <dbl>  <dbl> <date>     <chr> <chr>          <dbl>      <dbl>       <dbl>
#>  1     1465   2020 2020-03-03 DEN   JAX             2020          4         137
#>  2     1465   2020 2020-03-03 JAX   DEN               NA         NA          NA
#>  3     1466   2020 2020-03-04 CAR   LAC               NA         NA          NA
#>  4     1466   2020 2020-03-04 LAC   CAR               NA         NA          NA
#>  5     1471   2020 2020-03-15 BAL   JAX             2020          5         157
#>  6     1471   2020 2020-03-15 JAX   BAL               NA         NA          NA
#>  7     1467   2020 2020-03-16 IND   SF              2020          1          13
#>  8     1467   2020 2020-03-16 SF    IND               NA         NA          NA
#>  9     1468   2020 2020-03-16 BUF   MIN             2020          1          22
#> 10     1468   2020 2020-03-16 BUF   MIN             2020          5         155
#> # ℹ 201 more rows
#> # ℹ 3 more variables: conditional <dbl>, pfr_id <chr>, pfr_name <chr>
# }
```
