# Load .parquet file from a remote connection

Retrieves a parquet file from URL. This function is cached

## Usage

``` r
parquet_from_url(url)
```

## Arguments

- url:

  a character url

## Value

a dataframe as parsed by
[`arrow::read_parquet()`](https://arrow.apache.org/docs/r/reference/read_parquet.html)

## Examples

``` r
# \donttest{
try({
  parquet_from_url(
    "https://github.com/nflverse/nflverse-data/releases/download/player_stats/player_stats.parquet"
  )
})
#>          player_id player_name   player_display_name position position_group
#>             <char>      <char>                <char>   <char>         <char>
#>      1: 00-0000003        <NA> Abdul-Karim al-Jabbar       RB             RB
#>      2: 00-0000003        <NA> Abdul-Karim al-Jabbar       RB             RB
#>      3: 00-0000003        <NA> Abdul-Karim al-Jabbar       RB             RB
#>      4: 00-0000003        <NA> Abdul-Karim al-Jabbar       RB             RB
#>      5: 00-0000003        <NA> Abdul-Karim al-Jabbar       RB             RB
#>     ---                                                                     
#> 134466: 00-0039921    T.Benson           Trey Benson       RB             RB
#> 134467: 00-0039921    T.Benson           Trey Benson       RB             RB
#> 134468: 00-0039921    T.Benson           Trey Benson       RB             RB
#> 134469: 00-0039921    T.Benson           Trey Benson       RB             RB
#> 134470: 00-0039921    T.Benson           Trey Benson       RB             RB
#>                                                                              headshot_url
#>                                                                                    <char>
#>      1:                                                                              <NA>
#>      2:                                                                              <NA>
#>      3:                                                                              <NA>
#>      4:                                                                              <NA>
#>      5:                                                                              <NA>
#>     ---                                                                                  
#> 134466: https://static.www.nfl.com/image/upload/f_auto,q_auto/league/iu0gbspz3kjdqlazvtkn
#> 134467: https://static.www.nfl.com/image/upload/f_auto,q_auto/league/iu0gbspz3kjdqlazvtkn
#> 134468: https://static.www.nfl.com/image/upload/f_auto,q_auto/league/iu0gbspz3kjdqlazvtkn
#> 134469: https://static.www.nfl.com/image/upload/f_auto,q_auto/league/iu0gbspz3kjdqlazvtkn
#> 134470: https://static.www.nfl.com/image/upload/f_auto,q_auto/league/iu0gbspz3kjdqlazvtkn
#>         recent_team season  week season_type opponent_team completions attempts
#>              <char>  <int> <int>      <char>        <char>       <int>    <int>
#>      1:         MIA   1999     1         REG           DEN           0        0
#>      2:         MIA   1999     2         REG           ARI           0        0
#>      3:         MIA   1999     4         REG           BUF           0        0
#>      4:         CLE   1999     7         REG            LA           0        0
#>      5:         CLE   1999     8         REG            NO           0        0
#>     ---                                                                        
#> 134466:         ARI   2024    10         REG           NYJ           0        0
#> 134467:         ARI   2024    12         REG           SEA           0        0
#> 134468:         ARI   2024    13         REG           MIN           0        0
#> 134469:         ARI   2024    14         REG           SEA           0        0
#> 134470:         ARI   2024    15         REG            NE           0        0
#>         passing_yards passing_tds interceptions sacks sack_yards sack_fumbles
#>                 <num>       <int>         <num> <num>      <num>        <int>
#>      1:             0           0             0     0          0            0
#>      2:             0           0             0     0          0            0
#>      3:             0           0             0     0          0            0
#>      4:             0           0             0     0          0            0
#>      5:             0           0             0     0          0            0
#>     ---                                                                      
#> 134466:             0           0             0     0          0            0
#> 134467:             0           0             0     0          0            0
#> 134468:             0           0             0     0          0            0
#> 134469:             0           0             0     0          0            0
#> 134470:             0           0             0     0          0            0
#>         sack_fumbles_lost passing_air_yards passing_yards_after_catch
#>                     <int>             <num>                     <num>
#>      1:                 0                 0                         0
#>      2:                 0                 0                         0
#>      3:                 0                 0                         0
#>      4:                 0                 0                         0
#>      5:                 0                 0                         0
#>     ---                                                              
#> 134466:                 0                 0                         0
#> 134467:                 0                 0                         0
#> 134468:                 0                 0                         0
#> 134469:                 0                 0                         0
#> 134470:                 0                 0                         0
#>         passing_first_downs passing_epa passing_2pt_conversions  pacr dakota
#>                       <num>       <num>                   <int> <num>  <num>
#>      1:                   0          NA                       0    NA     NA
#>      2:                   0          NA                       0    NA     NA
#>      3:                   0          NA                       0    NA     NA
#>      4:                   0          NA                       0    NA     NA
#>      5:                   0          NA                       0    NA     NA
#>     ---                                                                     
#> 134466:                   0          NA                       0    NA     NA
#> 134467:                   0          NA                       0    NA     NA
#> 134468:                   0          NA                       0    NA     NA
#> 134469:                   0          NA                       0    NA     NA
#> 134470:                   0          NA                       0    NA     NA
#>         carries rushing_yards rushing_tds rushing_fumbles rushing_fumbles_lost
#>           <int>         <num>       <int>           <num>                <num>
#>      1:      16            60           1               0                    0
#>      2:       9            33           0               0                    0
#>      3:       3             2           0               0                    0
#>      4:       6            27           0               0                    0
#>      5:      13            39           0               0                    0
#>     ---                                                                       
#> 134466:      10            62           0               0                    0
#> 134467:       4            18           0               0                    0
#> 134468:       3            20           0               0                    0
#> 134469:       2            15           0               0                    0
#> 134470:       5            22           0               0                    0
#>         rushing_first_downs rushing_epa rushing_2pt_conversions receptions
#>                       <num>       <num>                   <int>      <int>
#>      1:                   4  6.24877114                       0          1
#>      2:                   1 -1.43495017                       0          3
#>      3:                   0 -1.53995173                       0          0
#>      4:                   0  0.21605089                       0          2
#>      5:                   2 -2.97225885                       0          0
#>     ---                                                                   
#> 134466:                   3  1.51264573                       0          2
#> 134467:                   0 -0.32611939                       0          0
#> 134468:                   1  0.51592559                       0          0
#> 134469:                   1  0.05310984                       0          1
#> 134470:                   2 -0.38436320                       0          0
#>         targets receiving_yards receiving_tds receiving_fumbles
#>           <int>           <num>         <int>             <num>
#>      1:       1               7             0                 0
#>      2:       4              18             0                 0
#>      3:       1               0             0                 0
#>      4:       2               8             0                 0
#>      5:       0               0             0                 0
#>     ---                                                        
#> 134466:       2              25             0                 0
#> 134467:       0               0             0                 0
#> 134468:       0               0             0                 0
#> 134469:       1               4             0                 0
#> 134470:       0               0             0                 0
#>         receiving_fumbles_lost receiving_air_yards receiving_yards_after_catch
#>                          <num>               <num>                       <num>
#>      1:                      0                   0                           0
#>      2:                      0                   0                           0
#>      3:                      0                   0                           0
#>      4:                      0                   0                           0
#>      5:                      0                   0                           0
#>     ---                                                                       
#> 134466:                      0                  -8                          33
#> 134467:                      0                   0                           0
#> 134468:                      0                   0                           0
#> 134469:                      0                  -5                           9
#> 134470:                      0                   0                           0
#>         receiving_first_downs receiving_epa receiving_2pt_conversions   racr
#>                         <num>         <num>                     <int>  <num>
#>      1:                     0     0.2923782                         0  0.000
#>      2:                     1     0.3770089                         0  0.000
#>      3:                     0    -0.6995777                         0     NA
#>      4:                     0    -0.2284540                         0  0.000
#>      5:                     0            NA                         0     NA
#>     ---                                                                     
#> 134466:                     2     1.9870165                         0 -3.125
#> 134467:                     0            NA                         0     NA
#> 134468:                     0            NA                         0     NA
#> 134469:                     0    -0.1444960                         0 -0.800
#> 134470:                     0            NA                         0     NA
#>         target_share air_yards_share       wopr special_teams_tds
#>                <num>           <num>      <num>             <num>
#>      1:   0.05263158             NaN        NaN                 0
#>      2:   0.11764706             NaN        NaN                 0
#>      3:   0.02380952             NaN        NaN                 0
#>      4:   0.05000000             NaN        NaN                 0
#>      5:           NA              NA         NA                 0
#>     ---                                                          
#> 134466:   0.08333333     -0.07207207 0.07454955                 0
#> 134467:           NA              NA         NA                 0
#> 134468:           NA              NA         NA                 0
#> 134469:   0.02631579     -0.03184713 0.01718069                 0
#> 134470:           NA              NA         NA                 0
#>         fantasy_points fantasy_points_ppr
#>                  <num>              <num>
#>      1:           12.7               13.7
#>      2:            5.1                8.1
#>      3:            0.2                0.2
#>      4:            3.5                5.5
#>      5:            3.9                3.9
#>     ---                                  
#> 134466:            8.7               10.7
#> 134467:            1.8                1.8
#> 134468:            2.0                2.0
#> 134469:            1.9                2.9
#> 134470:            2.2                2.2
# }
```
