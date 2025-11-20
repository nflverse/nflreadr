# Load .rds file from a remote connection

Load .rds file from a remote connection

## Usage

``` r
rds_from_url(url)
```

## Arguments

- url:

  a character url

## Value

a dataframe as created by
[`readRDS()`](https://rdrr.io/r/base/readRDS.html)

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  rds_from_url("https://github.com/nflverse/nflverse-data/releases/download/test/combines.rds")
})
#>       season draft_year           draft_team draft_round draft_ovr   pfr_id
#>        <int>      <num>               <char>       <num>     <num>   <char>
#>    1:   2000       2000        New York Jets           1        13 AbraJo00
#>    2:   2000       2000     Seattle Seahawks           1        19 AlexSh00
#>    3:   2000       2000   Kansas City Chiefs           6       188 AlfoDa20
#>    4:   2000         NA                 <NA>          NA        NA     <NA>
#>    5:   2000       2000    Carolina Panthers           1        23 AndeRa21
#>   ---                                                                      
#> 7676:   2022       2022    Green Bay Packers           1        28 WyatDe00
#> 7677:   2022         NA                 <NA>          NA        NA WydeJa00
#> 7678:   2022       2022     Cleveland Browns           4       124 YorkCa00
#> 7679:   2022         NA                 <NA>          NA        NA     <NA>
#> 7680:   2022       2022 New England Patriots           4       137 ZappBa00
#>                  cfb_id      player_name    pos           school     ht    wt
#>                  <char>           <char> <char>           <char> <char> <num>
#>    1:              <NA>     John Abraham    OLB   South Carolina    6-4   252
#>    2: shaun-alexander-1  Shaun Alexander     RB          Alabama    6-0   218
#>    3:              <NA>   Darnell Alford     OT      Boston Col.    6-4   334
#>    4:              <NA>     Kyle Allamon     TE       Texas Tech    6-2   253
#>    5:              <NA> Rashard Anderson     CB    Jackson State    6-2   206
#>   ---                                                                        
#> 7676:   devonte-wyatt-1    Devonte Wyatt     DT          Georgia    6-3   304
#> 7677: jalen-wydermyer-1  Jalen Wydermyer     TE        Texas A&M    6-4   255
#> 7678:       cade-york-1        Cade York      K              LSU    6-1   206
#> 7679:              <NA>      Nick Zakelj     OT          Fordham    6-6   316
#> 7680:    bailey-zappe-1     Bailey Zappe     QB Western Kentucky    6-1   215
#>       forty bench vertical broad_jump  cone shuttle
#>       <num> <num>    <num>      <num> <num>   <num>
#>    1:  4.55    NA       NA         NA    NA      NA
#>    2:  4.58    NA       NA         NA    NA      NA
#>    3:  5.56    23     25.0         94  8.48    4.98
#>    4:  4.97    NA     29.0        104  7.29    4.49
#>    5:  4.55    NA     34.0        123  7.18    4.15
#>   ---                                              
#> 7676:  4.77    NA     29.0        111    NA      NA
#> 7677:    NA    NA       NA         NA    NA      NA
#> 7678:    NA    12       NA         NA    NA      NA
#> 7679:  5.13    27     28.5        110  7.75    4.71
#> 7680:  4.88    NA     30.0        109  7.19    4.40
# }
```
