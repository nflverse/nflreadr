# Load Officials

Loads data on which officials are assigned to oversee a specific game.
Data available from 2015 onwards.

## Usage

``` r
load_officials(
  seasons = TRUE,
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

A tibble with one row per game per official.

## See also

Issues with this data should be filed here:
<https://github.com/nflverse/nflreadr> and it will be triaged
appropriately.

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_officials()
})
#> ── nflverse officials ──────────────────────────────────────────────────────────
#> ℹ Data updated: 2026-01-15 07:15:52 UTC
#> # A tibble: 21,858 × 9
#>    game_id    game_key official_name  position  jersey_number official_id season
#>    <chr>      <chr>    <chr>          <chr>             <int> <chr>        <int>
#>  1 2015091000 56503    Brad Freeman   Field Ju…            88 25            2015
#>  2 2015091000 56503    Kent Payne     Head Lin…            79 28            2015
#>  3 2015091000 56503    Terrence Miles Back Jud…           111 139           2015
#>  4 2015091000 56503    Tim Podraza    Line Jud…            47 123           2015
#>  5 2015091000 56503    Scott Novak    Side Jud…             1 94            2015
#>  6 2015091000 56503    Undrey Wash    Umpire               96 134           2015
#>  7 2015091000 56503    Carl Cheffers  Referee              51 3             2015
#>  8 2015091300 56505    Lee Dyer       Back Jud…            27 72            2015
#>  9 2015091300 56505    Steve Zimmer   Field Ju…            33 116           2015
#> 10 2015091300 56505    Mark Hittner   Head Lin…            28 118           2015
#> # ℹ 21,848 more rows
#> # ℹ 2 more variables: season_type <chr>, week <int>
# }
```
