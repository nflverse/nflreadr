# List all available nflverse releases

This functions lists all nflverse data releases that are available in
the nflverse-data repo. Release names can be used for downloads in
[`nflverse_download()`](https://nflreadr.nflverse.com/reference/nflverse_download.md).

## Usage

``` r
nflverse_releases(.token = "default")
```

## Arguments

- .token:

  a GitHub API token, `"default"` uses
  [`gh::gh_token()`](https://gh.r-lib.org/reference/gh_token.html)

## Value

A dataframe containing release names, release descriptions, and other
relevant release information.

## Examples

``` r
# \donttest{

try( # avoids cran failures, can skip in normal usage
nflverse_releases()
)
#> ── nflverse release listing ────────────────────────────────────────────────────
#> ℹ Data updated: 2026-02-16 16:48:14 UTC
#> # A tibble: 25 × 8
#>    release_name   release_description timestamp   rds parquet   csv csv_gz   zip
#>    <chr>          <chr>               <chr>     <int>   <int> <int>  <int> <int>
#>  1 espn_data      "ESPN Stats"        2026-02-…     2       2     2      2     0
#>  2 players        "Player informatio… 2026-02-…     1       1     1      1     0
#>  3 contracts      "OverTheCap contra… 2026-02-…     2       1     0      1     0
#>  4 players_compo… "Component files f… 2026-02-…     2       2     2      2     0
#>  5 depth_charts   "Depth chart data,… 2026-02-…    25      25    25      2     0
#>  6 rosters        "Roster data, acce… 2026-02-…   106     106   106      3     0
#>  7 weekly_rosters "Week-level roster… 2026-02-…    24      24    24      2     0
#>  8 nextgen_stats  "NFL Next Gen Stat… 2026-02-…    30       3     0     30     0
#>  9 pfr_advstats   "PFR Adv Stats dat… 2026-02-…    68      36    36     12     0
#> 10 misc           "Various bits of d… 2026-02-…     7       1     6      0     0
#> # ℹ 15 more rows
# }
```
