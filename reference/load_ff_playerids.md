# Load Fantasy Player IDs

Accesses DynastyProcess.com's database of fantasy football player IDs,
which help connect nflverse to various other platforms and IDs.

## Usage

``` r
load_ff_playerids()
```

## Value

a dataframe of player IDs

## See also

<https://nflreadr.nflverse.com/articles/dictionary_ff_playerids.html>
for the web data dictionary

Issues with this data should be filed here:
<https://github.com/dynastyprocess/data>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
load_ff_playerids()
})
#> ── nflverse (ffverse) player IDs ───────────────────────────────────────────────
#> ℹ Data updated: 2026-09-07 17:11:24 UTC
#> # A tibble: 12,492 × 35
#>    mfl_id sportradar_id  fantasypros_id gsis_id pff_id sleeper_id nfl_id espn_id
#>    <chr>  <chr>          <chr>          <chr>   <chr>  <chr>      <chr>  <chr>  
#>  1 17462  b1ded115-092a… 28013          00-004… 158323 13269      62623  4837248
#>  2 17463  2e62e603-363a… 25368          00-004… 157008 13275      62635  4685522
#>  3 17464  NA             NA             NA      NA     NA         NA     NA     
#>  4 17465  9fc8bed4-d9db… 22998          00-004… 146757 13404      62871  4567747
#>  5 17466  a67c28ce-9e03… 22953          00-004… NA     13272      62687  4430841
#>  6 17467  3a62187b-d6b6… 24361          00-004… 156253 13303      62732  4685413
#>  7 17468  0667d256-9f37… 24345          00-004… 164157 13289      62698  4714771
#>  8 17469  3d900120-419b… 26060          00-004… 122555 13425      63319  4596472
#>  9 17470  67aca910-4194… NA             00-004… 146802 13314      63898  4597679
#> 10 17471  125e9b80-426b… 28082          NA      NA     13427      NA     5084180
#> # ℹ 12,482 more rows
#> # ℹ 27 more variables: yahoo_id <chr>, fleaflicker_id <chr>, cbs_id <chr>,
#> #   pfr_id <chr>, cfbref_id <chr>, rotowire_id <chr>, rotoworld_id <chr>,
#> #   ktc_id <chr>, stats_id <chr>, stats_global_id <chr>, fantasy_data_id <chr>,
#> #   swish_id <chr>, name <chr>, merge_name <chr>, position <chr>, team <chr>,
#> #   birthdate <date>, age <dbl>, draft_year <int>, draft_round <int>,
#> #   draft_pick <int>, draft_ovr <int>, twitter_username <chr>, height <int>, …
# }
```
