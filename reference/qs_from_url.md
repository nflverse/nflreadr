# Load .qs file from a remote connection

**\[deprecated\]**

The underlying package qs has been removed from CRAN on 2026-01-17 so
nflreadr stopped the qs support

## Usage

``` r
qs_from_url(url)
```

## Arguments

- url:

  a character url

## Value

a dataframe

## Examples

``` r
# \donttest{
try({
  qs_from_url(
    "https://github.com/nflverse/nflverse-data/releases/download/player_stats/player_stats.qs"
  )
})
#> Error : `qs_from_url()` was deprecated in nflreadr 1.6.0 and is now defunct.
#> ℹ Please use one of the other `*_from_url()` functions.
# }
```
