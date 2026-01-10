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
#> ℹ Data updated: 2026-01-10 14:34:27 UTC
#> # A tibble: 12,186 × 35
#>    mfl_id sportradar_id  fantasypros_id gsis_id pff_id sleeper_id nfl_id espn_id
#>    <chr>  <chr>          <chr>          <chr>   <chr>  <chr>      <chr>  <chr>  
#>  1 17030  3c76cab3-3df2… 24755          00-004… 133244 12522      58203  4688380
#>  2 17031  270e09bc-8bf8… 25968          00-004… 131396 12524      58349  4432762
#>  3 17032  53848cba-bcad… 23160          00-004… 146409 12508      58227  4689114
#>  4 17033  b0eb5b67-4ef2… 22884          00-004… 146590 12510      58297  4432734
#>  5 17034  d89f0384-21a6… 23680          00-004… 127253 12500      58436  4889929
#>  6 17035  38b62d7f-4403… 25373          00-004… 143862 12470      58394  4683423
#>  7 17036  b8a1b579-3a7e… 25972          00-004… 122599 12511      58390  4429955
#>  8 17037  299d4fe8-188c… 23150          00-004… 86272  12486      58299  4427238
#>  9 17038  451c7689-4fc2… 23066          00-004… 145053 12494      58386  4433971
#> 10 17039  94b8f9e1-3109… 23096          00-004… 83537  12545      58245  4360689
#> # ℹ 12,176 more rows
#> # ℹ 27 more variables: yahoo_id <chr>, fleaflicker_id <chr>, cbs_id <chr>,
#> #   pfr_id <chr>, cfbref_id <chr>, rotowire_id <chr>, rotoworld_id <chr>,
#> #   ktc_id <chr>, stats_id <chr>, stats_global_id <chr>, fantasy_data_id <chr>,
#> #   swish_id <chr>, name <chr>, merge_name <chr>, position <chr>, team <chr>,
#> #   birthdate <date>, age <dbl>, draft_year <int>, draft_round <int>,
#> #   draft_pick <int>, draft_ovr <int>, twitter_username <chr>, height <int>, …
# }
```
