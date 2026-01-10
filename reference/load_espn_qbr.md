# Load ESPN's QBR

Load ESPN's QBR

## Usage

``` r
load_espn_qbr(
  seasons = most_recent_season(),
  summary_type = c("season", "week"),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- seasons:

  a numeric vector of seasons to return, data available since 2006.
  Defaults to latest season available. TRUE will select all seasons.

- summary_type:

  One of `"season"` or `"week"`, defaults to `"season"`

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

a tibble of ESPN QBR data, summarized according to `summary_type`

## See also

<https://nflreadr.nflverse.com/articles/dictionary_espn_qbr.html> for a
web version of the dictionary

[`dictionary_espn_qbr`](https://nflreadr.nflverse.com/reference/dictionary_espn_qbr.md)
for the data dictionary as bundled within the package

Issues with this data should be filed here:
<https://github.com/nflverse/espnscrapeR-data>

## Examples

``` r
# \donttest{
    load_espn_qbr(2020)
#> ── nflverse QBR (via ESPN/espnscrapeR) ─────────────────────────────────────────
#> ℹ Data updated: 2026-01-10 09:12:59 UTC
#> # A tibble: 84 × 23
#>    season season_type game_week    team_abb player_id name_short  rank qbr_total
#>     <int> <chr>       <chr>        <chr>    <chr>     <chr>      <dbl>     <dbl>
#>  1   2020 Regular     Season Total GB       8439      A. Rodgers     1      79.8
#>  2   2020 Regular     Season Total KC       3139477   P. Mahomes     2      78.1
#>  3   2020 Regular     Season Total BUF      3918298   J. Allen       3      76.6
#>  4   2020 Regular     Season Total TEN      14876     R. Tanneh…     4      72.6
#>  5   2020 Regular     Season Total MIA      8664      R. Fitzpa…     5      70.9
#>  6   2020 Regular     Season Total NO       2580      D. Brees       6      68.3
#>  7   2020 Regular     Season Total BAL      3916387   L. Jackson     7      67.3
#>  8   2020 Regular     Season Total SEA      14881     R. Wilson      8      67.1
#>  9   2020 Regular     Season Total TB       2330      T. Brady       9      66  
#> 10   2020 Regular     Season Total CLE      3052587   B. Mayfie…    10      65.5
#> # ℹ 74 more rows
#> # ℹ 15 more variables: pts_added <dbl>, qb_plays <dbl>, epa_total <dbl>,
#> #   pass <dbl>, run <dbl>, exp_sack <dbl>, penalty <dbl>, qbr_raw <dbl>,
#> #   sack <dbl>, name_first <chr>, name_last <chr>, name_display <chr>,
#> #   headshot_href <chr>, team <chr>, qualified <lgl>
# }
```
