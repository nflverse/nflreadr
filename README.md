
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nflreadr <a href='https://nflreadr.nflverse.com'><img src='man/figures/logo.svg' align="right" width="25%" min-width="120px" /></a>

<!-- badges: start -->

[![CRAN
status](https://img.shields.io/cran/v/nflreadr?style=flat-square&logo=R&label=CRAN)](https://CRAN.R-project.org/package=nflreadr)
[![Codecov test
coverage](https://img.shields.io/codecov/c/github/nflverse/nflreadr?label=codecov&style=flat-square&logo=codecov)](https://codecov.io/gh/nflverse/nflreadr?branch=main)
[![Dev
status](https://img.shields.io/github/r-package/v/nflverse/nflreadr/main?label=dev%20version&style=flat-square&logo=github)](https://nflreadr.nflverse.com/)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg?style=flat-square)](https://lifecycle.r-lib.org/articles/stages.html)
[![R build
status](https://img.shields.io/github/workflow/status/nflverse/nflreadr/R-CMD-check?label=R%20check&style=flat-square&logo=github)](https://github.com/nflverse/nflreadr/actions)
[![nflverse
discord](https://img.shields.io/discord/591914197219016707.svg?color=5865F2&label=nflverse%20discord&logo=discord&logoColor=5865F2&style=flat-square)](https://discord.com/invite/5Er2FBnnQa)

<!-- badges: end -->

nflreadr is a low-level package for downloading data from nflverse
repositories. It includes caching, optional progress updates, and data
dictionaries.

## Installation

Install the stable version from CRAN with:

``` r
install.packages("nflreadr")
```

Install the development version from GitHub with:

``` r
install.packages("nflreadr", repos = "https://nflverse.r-universe.dev")

# or use remotes/devtools
# install.packages("remotes")
remotes::install_github("nflverse/nflreadr")
```

## Usage

The main functions of `nflreadr` are prefixed with `load_`.

``` r
library(nflreadr)
load_pbp(2020)
#>        play_id        game_id old_game_id home_team away_team season_type week
#>     1:       1 2020_01_ARI_SF  2020091311        SF       ARI         REG    1
#>     2:      39 2020_01_ARI_SF  2020091311        SF       ARI         REG    1
#>     3:      54 2020_01_ARI_SF  2020091311        SF       ARI         REG    1
#>     4:      93 2020_01_ARI_SF  2020091311        SF       ARI         REG    1
#>     5:     118 2020_01_ARI_SF  2020091311        SF       ARI         REG    1
#>    ---                                                                        
#> 48510:    4280  2020_21_KC_TB  2021020700        TB        KC        POST   21
#> 48511:    4307  2020_21_KC_TB  2021020700        TB        KC        POST   21
#> 48512:    4328  2020_21_KC_TB  2021020700        TB        KC        POST   21
#> 48513:    4349  2020_21_KC_TB  2021020700        TB        KC        POST   21
#> 48514:    4370  2020_21_KC_TB  2021020700        TB        KC        POST   21
#>        posteam posteam_type defteam side_of_field yardline_100  game_date
#>     1:    <NA>         <NA>    <NA>          <NA>           NA 2020-09-13
#>     2:      SF         home     ARI           ARI           35 2020-09-13
#>     3:      SF         home     ARI            SF           75 2020-09-13
#>     4:      SF         home     ARI            SF           55 2020-09-13
#>     5:      SF         home     ARI           ARI           41 2020-09-13
#>    ---                                                                   
#> 48510:      KC         away      TB            TB           10 2021-02-07
#> 48511:      TB         home      KC            TB           80 2021-02-07
#> 48512:      TB         home      KC            TB           81 2021-02-07
#> 48513:      TB         home      KC            TB           81 2021-02-07
#> 48514:    <NA>         <NA>    <NA>          <NA>           NA 2021-02-07
#>        quarter_seconds_remaining half_seconds_remaining game_seconds_remaining
#>     1:                       900                   1800                   3600
#>     2:                       900                   1800                   3600
#>     3:                       900                   1800                   3600
#>     4:                       882                   1782                   3582
#>     5:                       839                   1739                   3539
#>    ---                                                                        
#> 48510:                       100                    100                    100
#> 48511:                        93                     93                     93
#> 48512:                        50                     50                     50
#> 48513:                        30                     30                     30
#> 48514:                         0                      0                      0
#>        game_half quarter_end drive sp qtr down goal_to_go  time  yrdln ydstogo
#>     1:     Half1           0    NA  0   1   NA          0 15:00 ARI 35       0
#>     2:     Half1           0     1  0   1   NA          0 15:00 ARI 35       0
#>     3:     Half1           0     1  0   1    1          0 15:00  SF 25      10
#>     4:     Half1           0     1  0   1    1          0 14:42  SF 45      10
#>     5:     Half1           0     1  0   1    1          0 13:59 ARI 41      10
#>    ---                                                                        
#> 48510:     Half2           0    21  0   4    2          0 01:40  TB 10       6
#> 48511:     Half2           0    22  0   4    1          0 01:33  TB 20      10
#> 48512:     Half2           0    22  0   4    2          0 00:50  TB 19      11
#> 48513:     Half2           0    22  0   4    3          0 00:30  TB 19      11
#> 48514:     Half2           0    22  0   4   NA          0 00:00   <NA>       0
#>        ydsnet
#>     1:     NA
#>     2:     41
#>     3:     41
#>     4:     41
#>     5:     41
#>    ---       
#> 48510:     48
#> 48511:     -2
#> 48512:     -2
#> 48513:     -2
#> 48514:     -2
#>                                                                                                                                                                                                              desc
#>     1:                                                                                                                                                                                                       GAME
#>     2:                                                                                                                                            5-Z.Gonzalez kicks 65 yards from ARI 35 to end zone, Touchback.
#>     3: (15:00) (Shotgun) 10-J.Garoppolo pass short right to 85-G.Kittle to SF 30 for 5 yards (48-I.Simmons). PENALTY on ARI-48-I.Simmons, Horse Collar Tackle, 15 yards, enforced at SF 30. Caught at SF29. 1-YAC
#>     4:                                                                                                                        (14:42) (Shotgun) 31-R.Mostert right tackle to ARI 41 for 14 yards (34-J.Thompson).
#>     5:                                                                                                                                        (13:59) 31-R.Mostert left end to ARI 39 for 2 yards (48-I.Simmons).
#>    ---                                                                                                                                                                                                           
#> 48510:                                                                            (1:40) (No Huddle, Shotgun) 15-P.Mahomes pass short right intended for 87-T.Kelce INTERCEPTED by 45-D.White at TB 0. Touchback.
#> 48511:                                                                                                                                                            (1:33) 12-T.Brady kneels to TB 19 for -1 yards.
#> 48512:                                                                                                                                                              (:50) 12-T.Brady kneels to TB 19 for no gain.
#> 48513:                                                                                                                                                             (:30) 12-T.Brady kneels to TB 18 for -1 yards.
#> 48514:                                                                                                                                                                                                   END GAME
#>        play_type yards_gained shotgun no_huddle qb_dropback qb_kneel qb_spike
#>     1:      <NA>           NA       0         0          NA        0        0
#>     2:   kickoff            0       0         0           0        0        0
#>     3:      pass            5       1         0           1        0        0
#>     4:       run           14       1         0           0        0        0
#>     5:       run            2       0         0           0        0        0
#>    ---                                                                       
#> 48510:      pass            0       1         1           1        0        0
#> 48511:  qb_kneel           -1       0         0           0        1        0
#> 48512:  qb_kneel            0       0         0           0        1        0
#> 48513:  qb_kneel           -1       0         0           0        1        0
#> 48514:      <NA>           NA       0         0          NA        0        0
#>        qb_scramble pass_length pass_location air_yards yards_after_catch
#>     1:           0        <NA>          <NA>        NA                NA
#>     2:           0        <NA>          <NA>        NA                NA
#>     3:           0       short         right         4                 1
#>     4:           0        <NA>          <NA>        NA                NA
#>     5:           0        <NA>          <NA>        NA                NA
#>    ---                                                                  
#> 48510:           0       short         right        10                NA
#> 48511:           0        <NA>          <NA>        NA                NA
#> 48512:           0        <NA>          <NA>        NA                NA
#> 48513:           0        <NA>          <NA>        NA                NA
#> 48514:           0        <NA>          <NA>        NA                NA
#>        run_location run_gap field_goal_result kick_distance extra_point_result
#>     1:         <NA>    <NA>              <NA>            NA               <NA>
#>     2:         <NA>    <NA>              <NA>            NA               <NA>
#>     3:         <NA>    <NA>              <NA>            NA               <NA>
#>     4:        right  tackle              <NA>            NA               <NA>
#>     5:         left     end              <NA>            NA               <NA>
#>    ---                                                                        
#> 48510:         <NA>    <NA>              <NA>            NA               <NA>
#> 48511:         <NA>    <NA>              <NA>            NA               <NA>
#> 48512:         <NA>    <NA>              <NA>            NA               <NA>
#> 48513:         <NA>    <NA>              <NA>            NA               <NA>
#> 48514:         <NA>    <NA>              <NA>            NA               <NA>
#>        two_point_conv_result home_timeouts_remaining away_timeouts_remaining
#>     1:                  <NA>                       3                       3
#>     2:                  <NA>                       3                       3
#>     3:                  <NA>                       3                       3
#>     4:                  <NA>                       3                       3
#>     5:                  <NA>                       3                       3
#>    ---                                                                      
#> 48510:                  <NA>                       3                       0
#> 48511:                  <NA>                       3                       0
#> 48512:                  <NA>                       3                       0
#> 48513:                  <NA>                       3                       0
#> 48514:                  <NA>                       3                       0
#>        timeout timeout_team td_team td_player_name td_player_id
#>     1:      NA         <NA>    <NA>           <NA>         <NA>
#>     2:       0         <NA>    <NA>           <NA>         <NA>
#>     3:       0         <NA>    <NA>           <NA>         <NA>
#>     4:       0         <NA>    <NA>           <NA>         <NA>
#>     5:       0         <NA>    <NA>           <NA>         <NA>
#>    ---                                                         
#> 48510:       0         <NA>    <NA>           <NA>         <NA>
#> 48511:       0         <NA>    <NA>           <NA>         <NA>
#> 48512:       0         <NA>    <NA>           <NA>         <NA>
#> 48513:       0         <NA>    <NA>           <NA>         <NA>
#> 48514:      NA         <NA>    <NA>           <NA>         <NA>
#>        posteam_timeouts_remaining defteam_timeouts_remaining total_home_score
#>     1:                         NA                         NA                0
#>     2:                          3                          3                0
#>     3:                          3                          3                0
#>     4:                          3                          3                0
#>     5:                          3                          3                0
#>    ---                                                                       
#> 48510:                          0                          3               31
#> 48511:                          3                          0               31
#> 48512:                          3                          0               31
#> 48513:                          3                          0               31
#> 48514:                         NA                         NA               31
#>        total_away_score posteam_score defteam_score score_differential
#>     1:                0            NA            NA                 NA
#>     2:                0             0             0                  0
#>     3:                0             0             0                  0
#>     4:                0             0             0                  0
#>     5:                0             0             0                  0
#>    ---                                                                
#> 48510:                9             9            31                -22
#> 48511:                9            31             9                 22
#> 48512:                9            31             9                 22
#> 48513:                9            31             9                 22
#> 48514:                9            NA            NA                 NA
#>        posteam_score_post defteam_score_post score_differential_post
#>     1:                 NA                 NA                      NA
#>     2:                  0                  0                       0
#>     3:                  0                  0                       0
#>     4:                  0                  0                       0
#>     5:                  0                  0                       0
#>    ---                                                              
#> 48510:                  9                 31                     -22
#> 48511:                 31                  9                      22
#> 48512:                 31                  9                      22
#> 48513:                 31                  9                      22
#> 48514:                 NA                 NA                      NA
#>        no_score_prob opp_fg_prob opp_safety_prob opp_td_prob   fg_prob
#>     1:   0.000000000 0.000000000    0.0000000000  0.00000000 0.0000000
#>     2:   0.004660523 0.144037008    0.0020718346  0.22605130 0.2126011
#>     3:   0.004660523 0.144037008    0.0020718346  0.22605130 0.2126011
#>     4:   0.004406921 0.099808544    0.0014860847  0.15465693 0.2498454
#>     5:   0.004443581 0.070264190    0.0011319806  0.10199661 0.2951015
#>    ---                                                                
#> 48510:   0.207054272 0.003707392    0.0002403159  0.02547012 0.2206357
#> 48511:   1.000000000 0.000000000    0.0000000000  0.00000000 0.0000000
#> 48512:   1.000000000 0.000000000    0.0000000000  0.00000000 0.0000000
#> 48513:   1.000000000 0.000000000    0.0000000000  0.00000000 0.0000000
#> 48514:   0.000000000 0.000000000    0.0000000000  0.00000000 0.0000000
#>        safety_prob   td_prob extra_point_prob two_point_conversion_prob
#>     1: 0.000000000 0.0000000                0                         0
#>     2: 0.003827934 0.4067504                0                         0
#>     3: 0.003827934 0.4067504                0                         0
#>     4: 0.004835500 0.4849607                0                         0
#>     5: 0.004311302 0.5227508                0                         0
#>    ---                                                                 
#> 48510: 0.001242326 0.5416498                0                         0
#> 48511: 0.000000000 0.0000000                0                         0
#> 48512: 0.000000000 0.0000000                0                         0
#> 48513: 0.000000000 0.0000000                0                         0
#> 48514: 0.000000000 0.0000000                0                         0
#>              ep        epa total_home_epa total_away_epa total_home_rush_epa
#>     1:       NA         NA       0.000000       0.000000           0.0000000
#>     2: 1.474098  0.0000000       0.000000       0.000000           0.0000000
#>     3: 1.474098  1.2948379       1.294838      -1.294838           0.0000000
#>     4: 2.768936  0.8572143       2.152052      -2.152052           0.8572143
#>     5: 3.626150 -0.4546648       1.697387      -1.697387           0.4025495
#>    ---                                                                      
#> 48510: 4.266047 -4.2660469      21.832677     -21.832677          -6.0756731
#> 48511: 0.000000  0.0000000      21.832677     -21.832677          -6.0756731
#> 48512: 0.000000  0.0000000      21.832677     -21.832677          -6.0756731
#> 48513: 0.000000  0.0000000      21.832677     -21.832677          -6.0756731
#> 48514:       NA         NA      21.832677     -21.832677          -6.0756731
#>        total_away_rush_epa total_home_pass_epa total_away_pass_epa    air_epa
#>     1:           0.0000000            0.000000            0.000000         NA
#>     2:           0.0000000            0.000000            0.000000         NA
#>     3:           0.0000000            1.294838           -1.294838 -0.1327868
#>     4:          -0.8572143            1.294838           -1.294838         NA
#>     5:          -0.4025495            1.294838           -1.294838         NA
#>    ---                                                                       
#> 48510:           6.0756731           22.489197          -22.489197  2.7339531
#> 48511:           6.0756731           22.489197          -22.489197         NA
#> 48512:           6.0756731           22.489197          -22.489197         NA
#> 48513:           6.0756731           22.489197          -22.489197         NA
#> 48514:           6.0756731           22.489197          -22.489197         NA
#>          yac_epa comp_air_epa comp_yac_epa total_home_comp_air_epa
#>     1:        NA           NA           NA               0.0000000
#>     2:        NA    0.0000000     0.000000               0.0000000
#>     3:  1.427625   -0.1327868     1.427625              -0.1327868
#>     4:        NA    0.0000000     0.000000              -0.1327868
#>     5:        NA    0.0000000     0.000000              -0.1327868
#>    ---                                                            
#> 48510: -7.000000    0.0000000     0.000000              -2.7332284
#> 48511:        NA    0.0000000     0.000000              -2.7332284
#> 48512:        NA    0.0000000     0.000000              -2.7332284
#> 48513:        NA    0.0000000     0.000000              -2.7332284
#> 48514:        NA           NA           NA              -2.7332284
#>        total_away_comp_air_epa total_home_comp_yac_epa total_away_comp_yac_epa
#>     1:               0.0000000                0.000000                0.000000
#>     2:               0.0000000                0.000000                0.000000
#>     3:               0.1327868                1.427625               -1.427625
#>     4:               0.1327868                1.427625               -1.427625
#>     5:               0.1327868                1.427625               -1.427625
#>    ---                                                                        
#> 48510:               2.7332284                3.253570               -3.253570
#> 48511:               2.7332284                3.253570               -3.253570
#> 48512:               2.7332284                3.253570               -3.253570
#> 48513:               2.7332284                3.253570               -3.253570
#> 48514:               2.7332284                3.253570               -3.253570
#>        total_home_raw_air_epa total_away_raw_air_epa total_home_raw_yac_epa
#>     1:              0.0000000              0.0000000               0.000000
#>     2:              0.0000000              0.0000000               0.000000
#>     3:             -0.1327868              0.1327868               1.427625
#>     4:             -0.1327868              0.1327868               1.427625
#>     5:             -0.1327868              0.1327868               1.427625
#>    ---                                                                     
#> 48510:            -23.1161015             23.1161015              42.707624
#> 48511:            -23.1161015             23.1161015              42.707624
#> 48512:            -23.1161015             23.1161015              42.707624
#> 48513:            -23.1161015             23.1161015              42.707624
#> 48514:            -23.1161015             23.1161015              42.707624
#>        total_away_raw_yac_epa          wp       def_wp   home_wp      away_wp
#>     1:               0.000000 0.546261787 4.537382e-01 0.5462618 4.537382e-01
#>     2:               0.000000 0.546261787 4.537382e-01 0.5462618 4.537382e-01
#>     3:              -1.427625 0.546261787 4.537382e-01 0.5462618 4.537382e-01
#>     4:              -1.427625 0.579976439 4.200236e-01 0.5799764 4.200236e-01
#>     5:              -1.427625 0.604475498 3.955245e-01 0.6044755 3.955245e-01
#>    ---                                                                       
#> 48510:             -42.707624 0.001260691 9.987393e-01 0.9987393 1.260691e-03
#> 48511:             -42.707624 0.999958634 4.136562e-05 0.9999586 4.136562e-05
#> 48512:             -42.707624 0.999946475 5.352497e-05 0.9999465 5.352497e-05
#> 48513:             -42.707624 0.999933124 6.687641e-05 0.9999331 6.687641e-05
#> 48514:             -42.707624          NA           NA 1.0000000 0.000000e+00
#>                 wpa     vegas_wpa vegas_home_wpa home_wp_post away_wp_post
#>     1:  0.000000000  0.0000000000   0.000000e+00           NA           NA
#>     2:  0.000000000  0.0000000000   0.000000e+00    0.5462618 4.537382e-01
#>     3:  0.033714652 -0.0023362637  -2.336264e-03    0.5799764 4.200236e-01
#>     4:  0.024499059  0.0416022539   4.160225e-02    0.6044755 3.955245e-01
#>     5: -0.004064739  0.0038627982   3.862798e-03    0.6004108 3.995892e-01
#>    ---                                                                    
#> 48510: -0.001219325 -0.0002551418   2.551418e-04    0.9999586 4.136562e-05
#> 48511:           NA            NA   5.483627e-06           NA           NA
#> 48512:           NA            NA  -8.344650e-07           NA           NA
#> 48513:           NA            NA   1.513958e-05           NA           NA
#> 48514:           NA            NA             NA           NA           NA
#>            vegas_wp vegas_home_wp total_home_rush_wpa total_away_rush_wpa
#>     1: 0.7373994589     0.7373995          0.00000000          0.00000000
#>     2: 0.7373994589     0.7373995          0.00000000          0.00000000
#>     3: 0.7373994589     0.7373995          0.00000000          0.00000000
#>     4: 0.7350631952     0.7350632          0.02449906         -0.02449906
#>     5: 0.7766654491     0.7766654          0.02043432         -0.02043432
#>    ---                                                                   
#> 48510: 0.0002749305     0.9997251         -0.12707064          0.12707064
#> 48511: 0.9999802113     0.9999802         -0.12707064          0.12707064
#> 48512: 0.9999856949     0.9999857         -0.12707064          0.12707064
#> 48513: 0.9999848604     0.9999849         -0.12707064          0.12707064
#> 48514:           NA     1.0000000         -0.12707064          0.12707064
#>        total_home_pass_wpa total_away_pass_wpa air_wpa      yac_wpa
#>     1:          0.00000000          0.00000000      NA           NA
#>     2:          0.00000000          0.00000000      NA           NA
#>     3:          0.03371465         -0.03371465       0  0.033714652
#>     4:          0.03371465         -0.03371465      NA           NA
#>     5:          0.03371465         -0.03371465      NA           NA
#>    ---                                                             
#> 48510:          0.40661279         -0.40661279       0 -0.001219325
#> 48511:          0.40661279         -0.40661279      NA           NA
#> 48512:          0.40661279         -0.40661279      NA           NA
#> 48513:          0.40661279         -0.40661279      NA           NA
#> 48514:          0.40661279         -0.40661279      NA           NA
#>        comp_air_wpa comp_yac_wpa total_home_comp_air_wpa
#>     1:           NA           NA              0.00000000
#>     2:            0   0.00000000              0.00000000
#>     3:            0   0.03371465              0.00000000
#>     4:            0   0.00000000              0.00000000
#>     5:            0   0.00000000              0.00000000
#>    ---                                                  
#> 48510:            0   0.00000000              0.06803601
#> 48511:            0   0.00000000              0.06803601
#> 48512:            0   0.00000000              0.06803601
#> 48513:            0   0.00000000              0.06803601
#> 48514:           NA           NA              0.06803601
#>        total_away_comp_air_wpa total_home_comp_yac_wpa total_away_comp_yac_wpa
#>     1:              0.00000000              0.00000000              0.00000000
#>     2:              0.00000000              0.00000000              0.00000000
#>     3:              0.00000000              0.03371465             -0.03371465
#>     4:              0.00000000              0.03371465             -0.03371465
#>     5:              0.00000000              0.03371465             -0.03371465
#>    ---                                                                        
#> 48510:             -0.06803601              0.21431288             -0.21431288
#> 48511:             -0.06803601              0.21431288             -0.21431288
#> 48512:             -0.06803601              0.21431288             -0.21431288
#> 48513:             -0.06803601              0.21431288             -0.21431288
#> 48514:             -0.06803601              0.21431288             -0.21431288
#>        total_home_raw_air_wpa total_away_raw_air_wpa total_home_raw_yac_wpa
#>     1:             0.00000000             0.00000000             0.00000000
#>     2:             0.00000000             0.00000000             0.00000000
#>     3:             0.00000000             0.00000000             0.03371465
#>     4:             0.00000000             0.00000000             0.03371465
#>     5:             0.00000000             0.00000000             0.03371465
#>    ---                                                                     
#> 48510:             0.06803601            -0.06803601             0.38171791
#> 48511:             0.06803601            -0.06803601             0.38171791
#> 48512:             0.06803601            -0.06803601             0.38171791
#> 48513:             0.06803601            -0.06803601             0.38171791
#> 48514:             0.06803601            -0.06803601             0.38171791
#>        total_away_raw_yac_wpa punt_blocked first_down_rush first_down_pass
#>     1:             0.00000000           NA              NA              NA
#>     2:             0.00000000            0               0               0
#>     3:            -0.03371465            0               0               0
#>     4:            -0.03371465            0               1               0
#>     5:            -0.03371465            0               0               0
#>    ---                                                                    
#> 48510:            -0.38171791            0               0               0
#> 48511:            -0.38171791            0               0               0
#> 48512:            -0.38171791            0               0               0
#> 48513:            -0.38171791            0               0               0
#> 48514:            -0.38171791           NA              NA              NA
#>        first_down_penalty third_down_converted third_down_failed
#>     1:                 NA                   NA                NA
#>     2:                  0                    0                 0
#>     3:                  1                    0                 0
#>     4:                  0                    0                 0
#>     5:                  0                    0                 0
#>    ---                                                          
#> 48510:                  0                    0                 0
#> 48511:                  0                    0                 0
#> 48512:                  0                    0                 0
#> 48513:                  0                    0                 1
#> 48514:                 NA                   NA                NA
#>        fourth_down_converted fourth_down_failed incomplete_pass touchback
#>     1:                    NA                 NA              NA         0
#>     2:                     0                  0               0         1
#>     3:                     0                  0               0         0
#>     4:                     0                  0               0         0
#>     5:                     0                  0               0         0
#>    ---                                                                   
#> 48510:                     0                  0               0         1
#> 48511:                     0                  0               0         0
#> 48512:                     0                  0               0         0
#> 48513:                     0                  0               0         0
#> 48514:                    NA                 NA              NA         0
#>        interception punt_inside_twenty punt_in_endzone punt_out_of_bounds
#>     1:           NA                 NA              NA                 NA
#>     2:            0                  0               0                  0
#>     3:            0                  0               0                  0
#>     4:            0                  0               0                  0
#>     5:            0                  0               0                  0
#>    ---                                                                   
#> 48510:            1                  0               0                  0
#> 48511:            0                  0               0                  0
#> 48512:            0                  0               0                  0
#> 48513:            0                  0               0                  0
#> 48514:           NA                 NA              NA                 NA
#>        punt_downed punt_fair_catch kickoff_inside_twenty kickoff_in_endzone
#>     1:          NA              NA                    NA                 NA
#>     2:           0               0                     0                  0
#>     3:           0               0                     0                  0
#>     4:           0               0                     0                  0
#>     5:           0               0                     0                  0
#>    ---                                                                     
#> 48510:           0               0                     0                  0
#> 48511:           0               0                     0                  0
#> 48512:           0               0                     0                  0
#> 48513:           0               0                     0                  0
#> 48514:          NA              NA                    NA                 NA
#>        kickoff_out_of_bounds kickoff_downed kickoff_fair_catch fumble_forced
#>     1:                    NA             NA                 NA            NA
#>     2:                     0              0                  0             0
#>     3:                     0              0                  0             0
#>     4:                     0              0                  0             0
#>     5:                     0              0                  0             0
#>    ---                                                                      
#> 48510:                     0              0                  0             0
#> 48511:                     0              0                  0             0
#> 48512:                     0              0                  0             0
#> 48513:                     0              0                  0             0
#> 48514:                    NA             NA                 NA            NA
#>        fumble_not_forced fumble_out_of_bounds solo_tackle safety penalty
#>     1:                NA                   NA          NA     NA      NA
#>     2:                 0                    0           0      0       0
#>     3:                 0                    0           1      0       1
#>     4:                 0                    0           1      0       0
#>     5:                 0                    0           1      0       0
#>    ---                                                                  
#> 48510:                 0                    0           0      0       0
#> 48511:                 0                    0           0      0       0
#> 48512:                 0                    0           0      0       0
#> 48513:                 0                    0           0      0       0
#> 48514:                NA                   NA          NA     NA      NA
#>        tackled_for_loss fumble_lost own_kickoff_recovery
#>     1:               NA          NA                   NA
#>     2:                0           0                    0
#>     3:                0           0                    0
#>     4:                0           0                    0
#>     5:                0           0                    0
#>    ---                                                  
#> 48510:                0           0                    0
#> 48511:                0           0                    0
#> 48512:                0           0                    0
#> 48513:                0           0                    0
#> 48514:               NA          NA                   NA
#>        own_kickoff_recovery_td qb_hit rush_attempt pass_attempt sack touchdown
#>     1:                      NA     NA           NA           NA   NA        NA
#>     2:                       0      0            0            0    0         0
#>     3:                       0      0            0            1    0         0
#>     4:                       0      0            1            0    0         0
#>     5:                       0      0            1            0    0         0
#>    ---                                                                        
#> 48510:                       0      0            0            1    0         0
#> 48511:                       0      0            1            0    0         0
#> 48512:                       0      0            1            0    0         0
#> 48513:                       0      0            1            0    0         0
#> 48514:                      NA     NA           NA           NA   NA        NA
#>        pass_touchdown rush_touchdown return_touchdown extra_point_attempt
#>     1:             NA             NA               NA                  NA
#>     2:              0              0                0                   0
#>     3:              0              0                0                   0
#>     4:              0              0                0                   0
#>     5:              0              0                0                   0
#>    ---                                                                   
#> 48510:              0              0                0                   0
#> 48511:              0              0                0                   0
#> 48512:              0              0                0                   0
#> 48513:              0              0                0                   0
#> 48514:             NA             NA               NA                  NA
#>        two_point_attempt field_goal_attempt kickoff_attempt punt_attempt fumble
#>     1:                NA                 NA              NA           NA     NA
#>     2:                 0                  0               1            0      0
#>     3:                 0                  0               0            0      0
#>     4:                 0                  0               0            0      0
#>     5:                 0                  0               0            0      0
#>    ---                                                                         
#> 48510:                 0                  0               0            0      0
#> 48511:                 0                  0               0            0      0
#> 48512:                 0                  0               0            0      0
#> 48513:                 0                  0               0            0      0
#> 48514:                NA                 NA              NA           NA     NA
#>        complete_pass assist_tackle lateral_reception lateral_rush
#>     1:            NA            NA                NA           NA
#>     2:             0             0                 0            0
#>     3:             1             0                 0            0
#>     4:             0             0                 0            0
#>     5:             0             0                 0            0
#>    ---                                                           
#> 48510:             0             0                 0            0
#> 48511:             0             0                 0            0
#> 48512:             0             0                 0            0
#> 48513:             0             0                 0            0
#> 48514:            NA            NA                NA           NA
#>        lateral_return lateral_recovery passer_player_id passer_player_name
#>     1:             NA               NA             <NA>               <NA>
#>     2:              0                0             <NA>               <NA>
#>     3:              0                0       00-0031345        J.Garoppolo
#>     4:              0                0             <NA>               <NA>
#>     5:              0                0             <NA>               <NA>
#>    ---                                                                    
#> 48510:              0                0       00-0033873          P.Mahomes
#> 48511:              0                0             <NA>               <NA>
#> 48512:              0                0             <NA>               <NA>
#> 48513:              0                0             <NA>               <NA>
#> 48514:             NA               NA             <NA>               <NA>
#>        passing_yards receiver_player_id receiver_player_name receiving_yards
#>     1:            NA               <NA>                 <NA>              NA
#>     2:            NA               <NA>                 <NA>              NA
#>     3:             5         00-0033288             G.Kittle               5
#>     4:            NA               <NA>                 <NA>              NA
#>     5:            NA               <NA>                 <NA>              NA
#>    ---                                                                      
#> 48510:            NA         00-0030506              T.Kelce              NA
#> 48511:            NA               <NA>                 <NA>              NA
#> 48512:            NA               <NA>                 <NA>              NA
#> 48513:            NA               <NA>                 <NA>              NA
#> 48514:            NA               <NA>                 <NA>              NA
#>        rusher_player_id rusher_player_name rushing_yards
#>     1:             <NA>               <NA>            NA
#>     2:             <NA>               <NA>            NA
#>     3:             <NA>               <NA>            NA
#>     4:       00-0031687          R.Mostert            14
#>     5:       00-0031687          R.Mostert             2
#>    ---                                                  
#> 48510:             <NA>               <NA>            NA
#> 48511:       00-0019596            T.Brady            -1
#> 48512:       00-0019596            T.Brady             0
#> 48513:       00-0019596            T.Brady            -1
#> 48514:             <NA>               <NA>            NA
#>        lateral_receiver_player_id lateral_receiver_player_name
#>     1:                       <NA>                         <NA>
#>     2:                       <NA>                         <NA>
#>     3:                       <NA>                         <NA>
#>     4:                       <NA>                         <NA>
#>     5:                       <NA>                         <NA>
#>    ---                                                        
#> 48510:                       <NA>                         <NA>
#> 48511:                       <NA>                         <NA>
#> 48512:                       <NA>                         <NA>
#> 48513:                       <NA>                         <NA>
#> 48514:                       <NA>                         <NA>
#>        lateral_receiving_yards lateral_rusher_player_id
#>     1:                      NA                     <NA>
#>     2:                      NA                     <NA>
#>     3:                      NA                     <NA>
#>     4:                      NA                     <NA>
#>     5:                      NA                     <NA>
#>    ---                                                 
#> 48510:                      NA                     <NA>
#> 48511:                      NA                     <NA>
#> 48512:                      NA                     <NA>
#> 48513:                      NA                     <NA>
#> 48514:                      NA                     <NA>
#>        lateral_rusher_player_name lateral_rushing_yards lateral_sack_player_id
#>     1:                       <NA>                    NA                   <NA>
#>     2:                       <NA>                    NA                   <NA>
#>     3:                       <NA>                    NA                   <NA>
#>     4:                       <NA>                    NA                   <NA>
#>     5:                       <NA>                    NA                   <NA>
#>    ---                                                                        
#> 48510:                       <NA>                    NA                   <NA>
#> 48511:                       <NA>                    NA                   <NA>
#> 48512:                       <NA>                    NA                   <NA>
#> 48513:                       <NA>                    NA                   <NA>
#> 48514:                       <NA>                    NA                   <NA>
#>        lateral_sack_player_name interception_player_id interception_player_name
#>     1:                     <NA>                   <NA>                     <NA>
#>     2:                     <NA>                   <NA>                     <NA>
#>     3:                     <NA>                   <NA>                     <NA>
#>     4:                     <NA>                   <NA>                     <NA>
#>     5:                     <NA>                   <NA>                     <NA>
#>    ---                                                                         
#> 48510:                     <NA>             00-0035707                  D.White
#> 48511:                     <NA>                   <NA>                     <NA>
#> 48512:                     <NA>                   <NA>                     <NA>
#> 48513:                     <NA>                   <NA>                     <NA>
#> 48514:                     <NA>                   <NA>                     <NA>
#>        lateral_interception_player_id lateral_interception_player_name
#>     1:                           <NA>                             <NA>
#>     2:                           <NA>                             <NA>
#>     3:                           <NA>                             <NA>
#>     4:                           <NA>                             <NA>
#>     5:                           <NA>                             <NA>
#>    ---                                                                
#> 48510:                           <NA>                             <NA>
#> 48511:                           <NA>                             <NA>
#> 48512:                           <NA>                             <NA>
#> 48513:                           <NA>                             <NA>
#> 48514:                           <NA>                             <NA>
#>        punt_returner_player_id punt_returner_player_name
#>     1:                    <NA>                      <NA>
#>     2:                    <NA>                      <NA>
#>     3:                    <NA>                      <NA>
#>     4:                    <NA>                      <NA>
#>     5:                    <NA>                      <NA>
#>    ---                                                  
#> 48510:                    <NA>                      <NA>
#> 48511:                    <NA>                      <NA>
#> 48512:                    <NA>                      <NA>
#> 48513:                    <NA>                      <NA>
#> 48514:                    <NA>                      <NA>
#>        lateral_punt_returner_player_id lateral_punt_returner_player_name
#>     1:                            <NA>                              <NA>
#>     2:                            <NA>                              <NA>
#>     3:                            <NA>                              <NA>
#>     4:                            <NA>                              <NA>
#>     5:                            <NA>                              <NA>
#>    ---                                                                  
#> 48510:                            <NA>                              <NA>
#> 48511:                            <NA>                              <NA>
#> 48512:                            <NA>                              <NA>
#> 48513:                            <NA>                              <NA>
#> 48514:                            <NA>                              <NA>
#>        kickoff_returner_player_name kickoff_returner_player_id
#>     1:                         <NA>                       <NA>
#>     2:                         <NA>                       <NA>
#>     3:                         <NA>                       <NA>
#>     4:                         <NA>                       <NA>
#>     5:                         <NA>                       <NA>
#>    ---                                                        
#> 48510:                         <NA>                       <NA>
#> 48511:                         <NA>                       <NA>
#> 48512:                         <NA>                       <NA>
#> 48513:                         <NA>                       <NA>
#> 48514:                         <NA>                       <NA>
#>        lateral_kickoff_returner_player_id lateral_kickoff_returner_player_name
#>     1:                               <NA>                                 <NA>
#>     2:                               <NA>                                 <NA>
#>     3:                               <NA>                                 <NA>
#>     4:                               <NA>                                 <NA>
#>     5:                               <NA>                                 <NA>
#>    ---                                                                        
#> 48510:                               <NA>                                 <NA>
#> 48511:                               <NA>                                 <NA>
#> 48512:                               <NA>                                 <NA>
#> 48513:                               <NA>                                 <NA>
#> 48514:                               <NA>                                 <NA>
#>        punter_player_id punter_player_name kicker_player_name kicker_player_id
#>     1:             <NA>               <NA>               <NA>             <NA>
#>     2:             <NA>               <NA>         Z.Gonzalez       00-0033862
#>     3:             <NA>               <NA>               <NA>             <NA>
#>     4:             <NA>               <NA>               <NA>             <NA>
#>     5:             <NA>               <NA>               <NA>             <NA>
#>    ---                                                                        
#> 48510:             <NA>               <NA>               <NA>             <NA>
#> 48511:             <NA>               <NA>               <NA>             <NA>
#> 48512:             <NA>               <NA>               <NA>             <NA>
#> 48513:             <NA>               <NA>               <NA>             <NA>
#> 48514:             <NA>               <NA>               <NA>             <NA>
#>        own_kickoff_recovery_player_id own_kickoff_recovery_player_name
#>     1:                           <NA>                             <NA>
#>     2:                           <NA>                             <NA>
#>     3:                           <NA>                             <NA>
#>     4:                           <NA>                             <NA>
#>     5:                           <NA>                             <NA>
#>    ---                                                                
#> 48510:                           <NA>                             <NA>
#> 48511:                           <NA>                             <NA>
#> 48512:                           <NA>                             <NA>
#> 48513:                           <NA>                             <NA>
#> 48514:                           <NA>                             <NA>
#>        blocked_player_id blocked_player_name tackle_for_loss_1_player_id
#>     1:              <NA>                <NA>                        <NA>
#>     2:              <NA>                <NA>                        <NA>
#>     3:              <NA>                <NA>                        <NA>
#>     4:              <NA>                <NA>                        <NA>
#>     5:              <NA>                <NA>                        <NA>
#>    ---                                                                  
#> 48510:              <NA>                <NA>                        <NA>
#> 48511:              <NA>                <NA>                        <NA>
#> 48512:              <NA>                <NA>                        <NA>
#> 48513:              <NA>                <NA>                        <NA>
#> 48514:              <NA>                <NA>                        <NA>
#>        tackle_for_loss_1_player_name tackle_for_loss_2_player_id
#>     1:                          <NA>                        <NA>
#>     2:                          <NA>                        <NA>
#>     3:                          <NA>                        <NA>
#>     4:                          <NA>                        <NA>
#>     5:                          <NA>                        <NA>
#>    ---                                                          
#> 48510:                          <NA>                        <NA>
#> 48511:                          <NA>                        <NA>
#> 48512:                          <NA>                        <NA>
#> 48513:                          <NA>                        <NA>
#> 48514:                          <NA>                        <NA>
#>        tackle_for_loss_2_player_name qb_hit_1_player_id qb_hit_1_player_name
#>     1:                          <NA>               <NA>                 <NA>
#>     2:                          <NA>               <NA>                 <NA>
#>     3:                          <NA>               <NA>                 <NA>
#>     4:                          <NA>               <NA>                 <NA>
#>     5:                          <NA>               <NA>                 <NA>
#>    ---                                                                      
#> 48510:                          <NA>               <NA>                 <NA>
#> 48511:                          <NA>               <NA>                 <NA>
#> 48512:                          <NA>               <NA>                 <NA>
#> 48513:                          <NA>               <NA>                 <NA>
#> 48514:                          <NA>               <NA>                 <NA>
#>        qb_hit_2_player_id qb_hit_2_player_name forced_fumble_player_1_team
#>     1:               <NA>                 <NA>                        <NA>
#>     2:               <NA>                 <NA>                        <NA>
#>     3:               <NA>                 <NA>                        <NA>
#>     4:               <NA>                 <NA>                        <NA>
#>     5:               <NA>                 <NA>                        <NA>
#>    ---                                                                    
#> 48510:               <NA>                 <NA>                        <NA>
#> 48511:               <NA>                 <NA>                        <NA>
#> 48512:               <NA>                 <NA>                        <NA>
#> 48513:               <NA>                 <NA>                        <NA>
#> 48514:               <NA>                 <NA>                        <NA>
#>        forced_fumble_player_1_player_id forced_fumble_player_1_player_name
#>     1:                             <NA>                               <NA>
#>     2:                             <NA>                               <NA>
#>     3:                             <NA>                               <NA>
#>     4:                             <NA>                               <NA>
#>     5:                             <NA>                               <NA>
#>    ---                                                                    
#> 48510:                             <NA>                               <NA>
#> 48511:                             <NA>                               <NA>
#> 48512:                             <NA>                               <NA>
#> 48513:                             <NA>                               <NA>
#> 48514:                             <NA>                               <NA>
#>        forced_fumble_player_2_team forced_fumble_player_2_player_id
#>     1:                        <NA>                             <NA>
#>     2:                        <NA>                             <NA>
#>     3:                        <NA>                             <NA>
#>     4:                        <NA>                             <NA>
#>     5:                        <NA>                             <NA>
#>    ---                                                             
#> 48510:                        <NA>                             <NA>
#> 48511:                        <NA>                             <NA>
#> 48512:                        <NA>                             <NA>
#> 48513:                        <NA>                             <NA>
#> 48514:                        <NA>                             <NA>
#>        forced_fumble_player_2_player_name solo_tackle_1_team solo_tackle_2_team
#>     1:                               <NA>               <NA>               <NA>
#>     2:                               <NA>               <NA>               <NA>
#>     3:                               <NA>                ARI               <NA>
#>     4:                               <NA>                ARI               <NA>
#>     5:                               <NA>                ARI               <NA>
#>    ---                                                                         
#> 48510:                               <NA>               <NA>               <NA>
#> 48511:                               <NA>               <NA>               <NA>
#> 48512:                               <NA>               <NA>               <NA>
#> 48513:                               <NA>               <NA>               <NA>
#> 48514:                               <NA>               <NA>               <NA>
#>        solo_tackle_1_player_id solo_tackle_2_player_id
#>     1:                    <NA>                    <NA>
#>     2:                    <NA>                    <NA>
#>     3:              00-0036356                    <NA>
#>     4:              00-0035705                    <NA>
#>     5:              00-0036356                    <NA>
#>    ---                                                
#> 48510:                    <NA>                    <NA>
#> 48511:                    <NA>                    <NA>
#> 48512:                    <NA>                    <NA>
#> 48513:                    <NA>                    <NA>
#> 48514:                    <NA>                    <NA>
#>        solo_tackle_1_player_name solo_tackle_2_player_name
#>     1:                      <NA>                      <NA>
#>     2:                      <NA>                      <NA>
#>     3:                 I.Simmons                      <NA>
#>     4:                J.Thompson                      <NA>
#>     5:                 I.Simmons                      <NA>
#>    ---                                                    
#> 48510:                      <NA>                      <NA>
#> 48511:                      <NA>                      <NA>
#> 48512:                      <NA>                      <NA>
#> 48513:                      <NA>                      <NA>
#> 48514:                      <NA>                      <NA>
#>        assist_tackle_1_player_id assist_tackle_1_player_name
#>     1:                      <NA>                        <NA>
#>     2:                      <NA>                        <NA>
#>     3:                      <NA>                        <NA>
#>     4:                      <NA>                        <NA>
#>     5:                      <NA>                        <NA>
#>    ---                                                      
#> 48510:                      <NA>                        <NA>
#> 48511:                      <NA>                        <NA>
#> 48512:                      <NA>                        <NA>
#> 48513:                      <NA>                        <NA>
#> 48514:                      <NA>                        <NA>
#>        assist_tackle_1_team assist_tackle_2_player_id
#>     1:                 <NA>                      <NA>
#>     2:                 <NA>                      <NA>
#>     3:                 <NA>                      <NA>
#>     4:                 <NA>                      <NA>
#>     5:                 <NA>                      <NA>
#>    ---                                               
#> 48510:                 <NA>                      <NA>
#> 48511:                 <NA>                      <NA>
#> 48512:                 <NA>                      <NA>
#> 48513:                 <NA>                      <NA>
#> 48514:                 <NA>                      <NA>
#>        assist_tackle_2_player_name assist_tackle_2_team
#>     1:                        <NA>                 <NA>
#>     2:                        <NA>                 <NA>
#>     3:                        <NA>                 <NA>
#>     4:                        <NA>                 <NA>
#>     5:                        <NA>                 <NA>
#>    ---                                                 
#> 48510:                        <NA>                 <NA>
#> 48511:                        <NA>                 <NA>
#> 48512:                        <NA>                 <NA>
#> 48513:                        <NA>                 <NA>
#> 48514:                        <NA>                 <NA>
#>        assist_tackle_3_player_id assist_tackle_3_player_name
#>     1:                      <NA>                        <NA>
#>     2:                      <NA>                        <NA>
#>     3:                      <NA>                        <NA>
#>     4:                      <NA>                        <NA>
#>     5:                      <NA>                        <NA>
#>    ---                                                      
#> 48510:                      <NA>                        <NA>
#> 48511:                      <NA>                        <NA>
#> 48512:                      <NA>                        <NA>
#> 48513:                      <NA>                        <NA>
#> 48514:                      <NA>                        <NA>
#>        assist_tackle_3_team assist_tackle_4_player_id
#>     1:                 <NA>                      <NA>
#>     2:                 <NA>                      <NA>
#>     3:                 <NA>                      <NA>
#>     4:                 <NA>                      <NA>
#>     5:                 <NA>                      <NA>
#>    ---                                               
#> 48510:                 <NA>                      <NA>
#> 48511:                 <NA>                      <NA>
#> 48512:                 <NA>                      <NA>
#> 48513:                 <NA>                      <NA>
#> 48514:                 <NA>                      <NA>
#>        assist_tackle_4_player_name assist_tackle_4_team tackle_with_assist
#>     1:                        <NA>                 <NA>                 NA
#>     2:                        <NA>                 <NA>                  0
#>     3:                        <NA>                 <NA>                  0
#>     4:                        <NA>                 <NA>                  0
#>     5:                        <NA>                 <NA>                  0
#>    ---                                                                    
#> 48510:                        <NA>                 <NA>                  0
#> 48511:                        <NA>                 <NA>                  0
#> 48512:                        <NA>                 <NA>                  0
#> 48513:                        <NA>                 <NA>                  0
#> 48514:                        <NA>                 <NA>                 NA
#>        tackle_with_assist_1_player_id tackle_with_assist_1_player_name
#>     1:                           <NA>                             <NA>
#>     2:                           <NA>                             <NA>
#>     3:                           <NA>                             <NA>
#>     4:                           <NA>                             <NA>
#>     5:                           <NA>                             <NA>
#>    ---                                                                
#> 48510:                           <NA>                             <NA>
#> 48511:                           <NA>                             <NA>
#> 48512:                           <NA>                             <NA>
#> 48513:                           <NA>                             <NA>
#> 48514:                           <NA>                             <NA>
#>        tackle_with_assist_1_team tackle_with_assist_2_player_id
#>     1:                      <NA>                           <NA>
#>     2:                      <NA>                           <NA>
#>     3:                      <NA>                           <NA>
#>     4:                      <NA>                           <NA>
#>     5:                      <NA>                           <NA>
#>    ---                                                         
#> 48510:                      <NA>                           <NA>
#> 48511:                      <NA>                           <NA>
#> 48512:                      <NA>                           <NA>
#> 48513:                      <NA>                           <NA>
#> 48514:                      <NA>                           <NA>
#>        tackle_with_assist_2_player_name tackle_with_assist_2_team
#>     1:                             <NA>                      <NA>
#>     2:                             <NA>                      <NA>
#>     3:                             <NA>                      <NA>
#>     4:                             <NA>                      <NA>
#>     5:                             <NA>                      <NA>
#>    ---                                                           
#> 48510:                             <NA>                      <NA>
#> 48511:                             <NA>                      <NA>
#> 48512:                             <NA>                      <NA>
#> 48513:                             <NA>                      <NA>
#> 48514:                             <NA>                      <NA>
#>        pass_defense_1_player_id pass_defense_1_player_name
#>     1:                     <NA>                       <NA>
#>     2:                     <NA>                       <NA>
#>     3:                     <NA>                       <NA>
#>     4:                     <NA>                       <NA>
#>     5:                     <NA>                       <NA>
#>    ---                                                    
#> 48510:               00-0035707                    D.White
#> 48511:                     <NA>                       <NA>
#> 48512:                     <NA>                       <NA>
#> 48513:                     <NA>                       <NA>
#> 48514:                     <NA>                       <NA>
#>        pass_defense_2_player_id pass_defense_2_player_name fumbled_1_team
#>     1:                     <NA>                       <NA>           <NA>
#>     2:                     <NA>                       <NA>           <NA>
#>     3:                     <NA>                       <NA>           <NA>
#>     4:                     <NA>                       <NA>           <NA>
#>     5:                     <NA>                       <NA>           <NA>
#>    ---                                                                   
#> 48510:                     <NA>                       <NA>           <NA>
#> 48511:                     <NA>                       <NA>           <NA>
#> 48512:                     <NA>                       <NA>           <NA>
#> 48513:                     <NA>                       <NA>           <NA>
#> 48514:                     <NA>                       <NA>           <NA>
#>        fumbled_1_player_id fumbled_1_player_name fumbled_2_player_id
#>     1:                <NA>                  <NA>                <NA>
#>     2:                <NA>                  <NA>                <NA>
#>     3:                <NA>                  <NA>                <NA>
#>     4:                <NA>                  <NA>                <NA>
#>     5:                <NA>                  <NA>                <NA>
#>    ---                                                              
#> 48510:                <NA>                  <NA>                <NA>
#> 48511:                <NA>                  <NA>                <NA>
#> 48512:                <NA>                  <NA>                <NA>
#> 48513:                <NA>                  <NA>                <NA>
#> 48514:                <NA>                  <NA>                <NA>
#>        fumbled_2_player_name fumbled_2_team fumble_recovery_1_team
#>     1:                  <NA>           <NA>                   <NA>
#>     2:                  <NA>           <NA>                   <NA>
#>     3:                  <NA>           <NA>                   <NA>
#>     4:                  <NA>           <NA>                   <NA>
#>     5:                  <NA>           <NA>                   <NA>
#>    ---                                                            
#> 48510:                  <NA>           <NA>                   <NA>
#> 48511:                  <NA>           <NA>                   <NA>
#> 48512:                  <NA>           <NA>                   <NA>
#> 48513:                  <NA>           <NA>                   <NA>
#> 48514:                  <NA>           <NA>                   <NA>
#>        fumble_recovery_1_yards fumble_recovery_1_player_id
#>     1:                      NA                        <NA>
#>     2:                      NA                        <NA>
#>     3:                      NA                        <NA>
#>     4:                      NA                        <NA>
#>     5:                      NA                        <NA>
#>    ---                                                    
#> 48510:                      NA                        <NA>
#> 48511:                      NA                        <NA>
#> 48512:                      NA                        <NA>
#> 48513:                      NA                        <NA>
#> 48514:                      NA                        <NA>
#>        fumble_recovery_1_player_name fumble_recovery_2_team
#>     1:                          <NA>                   <NA>
#>     2:                          <NA>                   <NA>
#>     3:                          <NA>                   <NA>
#>     4:                          <NA>                   <NA>
#>     5:                          <NA>                   <NA>
#>    ---                                                     
#> 48510:                          <NA>                   <NA>
#> 48511:                          <NA>                   <NA>
#> 48512:                          <NA>                   <NA>
#> 48513:                          <NA>                   <NA>
#> 48514:                          <NA>                   <NA>
#>        fumble_recovery_2_yards fumble_recovery_2_player_id
#>     1:                      NA                        <NA>
#>     2:                      NA                        <NA>
#>     3:                      NA                        <NA>
#>     4:                      NA                        <NA>
#>     5:                      NA                        <NA>
#>    ---                                                    
#> 48510:                      NA                        <NA>
#> 48511:                      NA                        <NA>
#> 48512:                      NA                        <NA>
#> 48513:                      NA                        <NA>
#> 48514:                      NA                        <NA>
#>        fumble_recovery_2_player_name sack_player_id sack_player_name
#>     1:                          <NA>           <NA>             <NA>
#>     2:                          <NA>           <NA>             <NA>
#>     3:                          <NA>           <NA>             <NA>
#>     4:                          <NA>           <NA>             <NA>
#>     5:                          <NA>           <NA>             <NA>
#>    ---                                                              
#> 48510:                          <NA>           <NA>             <NA>
#> 48511:                          <NA>           <NA>             <NA>
#> 48512:                          <NA>           <NA>             <NA>
#> 48513:                          <NA>           <NA>             <NA>
#> 48514:                          <NA>           <NA>             <NA>
#>        half_sack_1_player_id half_sack_1_player_name half_sack_2_player_id
#>     1:                  <NA>                    <NA>                  <NA>
#>     2:                  <NA>                    <NA>                  <NA>
#>     3:                  <NA>                    <NA>                  <NA>
#>     4:                  <NA>                    <NA>                  <NA>
#>     5:                  <NA>                    <NA>                  <NA>
#>    ---                                                                    
#> 48510:                  <NA>                    <NA>                  <NA>
#> 48511:                  <NA>                    <NA>                  <NA>
#> 48512:                  <NA>                    <NA>                  <NA>
#> 48513:                  <NA>                    <NA>                  <NA>
#> 48514:                  <NA>                    <NA>                  <NA>
#>        half_sack_2_player_name return_team return_yards penalty_team
#>     1:                    <NA>        <NA>           NA         <NA>
#>     2:                    <NA>          SF            0         <NA>
#>     3:                    <NA>        <NA>            0          ARI
#>     4:                    <NA>        <NA>            0         <NA>
#>     5:                    <NA>        <NA>            0         <NA>
#>    ---                                                              
#> 48510:                    <NA>          TB            0         <NA>
#> 48511:                    <NA>        <NA>            0         <NA>
#> 48512:                    <NA>        <NA>            0         <NA>
#> 48513:                    <NA>        <NA>            0         <NA>
#> 48514:                    <NA>        <NA>           NA         <NA>
#>        penalty_player_id penalty_player_name penalty_yards replay_or_challenge
#>     1:              <NA>                <NA>            NA                   0
#>     2:              <NA>                <NA>            NA                   0
#>     3:        00-0036356           I.Simmons            15                   0
#>     4:              <NA>                <NA>            NA                   0
#>     5:              <NA>                <NA>            NA                   0
#>    ---                                                                        
#> 48510:              <NA>                <NA>            NA                   0
#> 48511:              <NA>                <NA>            NA                   0
#> 48512:              <NA>                <NA>            NA                   0
#> 48513:              <NA>                <NA>            NA                   0
#> 48514:              <NA>                <NA>            NA                   0
#>        replay_or_challenge_result        penalty_type
#>     1:                       <NA>                <NA>
#>     2:                       <NA>                <NA>
#>     3:                       <NA> Horse Collar Tackle
#>     4:                       <NA>                <NA>
#>     5:                       <NA>                <NA>
#>    ---                                               
#> 48510:                       <NA>                <NA>
#> 48511:                       <NA>                <NA>
#> 48512:                       <NA>                <NA>
#> 48513:                       <NA>                <NA>
#> 48514:                       <NA>                <NA>
#>        defensive_two_point_attempt defensive_two_point_conv
#>     1:                          NA                       NA
#>     2:                           0                        0
#>     3:                           0                        0
#>     4:                           0                        0
#>     5:                           0                        0
#>    ---                                                     
#> 48510:                           0                        0
#> 48511:                           0                        0
#> 48512:                           0                        0
#> 48513:                           0                        0
#> 48514:                          NA                       NA
#>        defensive_extra_point_attempt defensive_extra_point_conv
#>     1:                            NA                         NA
#>     2:                             0                          0
#>     3:                             0                          0
#>     4:                             0                          0
#>     5:                             0                          0
#>    ---                                                         
#> 48510:                             0                          0
#> 48511:                             0                          0
#> 48512:                             0                          0
#> 48513:                             0                          0
#> 48514:                            NA                         NA
#>        safety_player_name safety_player_id season        cp      cpoe series
#>     1:               <NA>             <NA>   2020        NA        NA      1
#>     2:               <NA>             <NA>   2020        NA        NA      1
#>     3:               <NA>             <NA>   2020 0.7822789  21.77211      1
#>     4:               <NA>             <NA>   2020        NA        NA      2
#>     5:               <NA>             <NA>   2020        NA        NA      3
#>    ---                                                                      
#> 48510:               <NA>             <NA>   2020 0.3514991 -35.14991     65
#> 48511:               <NA>             <NA>   2020        NA        NA     66
#> 48512:               <NA>             <NA>   2020        NA        NA     66
#> 48513:               <NA>             <NA>   2020        NA        NA     66
#> 48514:               <NA>             <NA>   2020        NA        NA     66
#>        series_success series_result order_sequence start_time time_of_day
#>     1:              1    First down              1   16:25:00        <NA>
#>     2:              1    First down             39   16:25:00    20:25:48
#>     3:              1    First down             54   16:25:00    20:26:28
#>     4:              1    First down             93   16:25:00    20:27:19
#>     5:              0    Field goal            118   16:25:00    20:28:02
#>    ---                                                                   
#> 48510:              0      Turnover           4280   18:30:00    03:09:08
#> 48511:              0      QB kneel           4307   18:30:00    03:10:24
#> 48512:              0      QB kneel           4328   18:30:00    03:11:07
#> 48513:              0      QB kneel           4349   18:30:00    03:11:27
#> 48514:              0      QB kneel           4370   18:30:00        <NA>
#>                      stadium                                          weather
#>     1:        Levi's Stadium Hazy Temp: 66° F, Humidity: 68%, Wind: NNW 6 mph
#>     2:        Levi's Stadium Hazy Temp: 66° F, Humidity: 68%, Wind: NNW 6 mph
#>     3:        Levi's Stadium Hazy Temp: 66° F, Humidity: 68%, Wind: NNW 6 mph
#>     4:        Levi's Stadium Hazy Temp: 66° F, Humidity: 68%, Wind: NNW 6 mph
#>     5:        Levi's Stadium Hazy Temp: 66° F, Humidity: 68%, Wind: NNW 6 mph
#>    ---                                                                       
#> 48510: Raymond James Stadium Clear Temp: 63° F, Humidity: 78%, Wind: NW 9 mph
#> 48511: Raymond James Stadium Clear Temp: 63° F, Humidity: 78%, Wind: NW 9 mph
#> 48512: Raymond James Stadium Clear Temp: 63° F, Humidity: 78%, Wind: NW 9 mph
#> 48513: Raymond James Stadium Clear Temp: 63° F, Humidity: 78%, Wind: NW 9 mph
#> 48514: Raymond James Stadium Clear Temp: 63° F, Humidity: 78%, Wind: NW 9 mph
#>                                  nfl_api_id play_clock play_deleted
#>     1: 10160000-0581-80a3-3e67-fadbeaac892d          0            0
#>     2: 10160000-0581-80a3-3e67-fadbeaac892d         10            0
#>     3: 10160000-0581-80a3-3e67-fadbeaac892d         10            0
#>     4: 10160000-0581-80a3-3e67-fadbeaac892d         14            0
#>     5: 10160000-0581-80a3-3e67-fadbeaac892d          6            0
#>    ---                                                             
#> 48510: 10160000-0585-01aa-36fc-5a38a4f1dbb9         26            0
#> 48511: 10160000-0585-01aa-36fc-5a38a4f1dbb9         13            0
#> 48512: 10160000-0585-01aa-36fc-5a38a4f1dbb9          1            0
#> 48513: 10160000-0585-01aa-36fc-5a38a4f1dbb9         23            0
#> 48514: 10160000-0585-01aa-36fc-5a38a4f1dbb9          0            0
#>        play_type_nfl special_teams_play st_play_type end_clock_time
#>     1:    GAME_START                  0         <NA>           <NA>
#>     2:      KICK_OFF                  1         <NA>           <NA>
#>     3:          PASS                  0         <NA>           <NA>
#>     4:          RUSH                  0         <NA>          14:32
#>     5:          RUSH                  0         <NA>          13:51
#>    ---                                                             
#> 48510:          PASS                  0         <NA>          01:33
#> 48511:          RUSH                  0         <NA>           <NA>
#> 48512:          RUSH                  0         <NA>           <NA>
#> 48513:          RUSH                  0         <NA>           <NA>
#> 48514:      END_GAME                  0         <NA>           <NA>
#>        end_yard_line fixed_drive fixed_drive_result drive_real_start_time
#>     1:          <NA>           1         Field goal                  <NA>
#>     2:         SF 25           1         Field goal                  <NA>
#>     3:         SF 45           1         Field goal                  <NA>
#>     4:        ARI 41           1         Field goal                  <NA>
#>     5:        ARI 39           1         Field goal                  <NA>
#>    ---                                                                   
#> 48510:          TB 0          21           Turnover                  <NA>
#> 48511:         TB 19          22        End of half                  <NA>
#> 48512:         TB 19          22        End of half                  <NA>
#> 48513:         TB 18          22        End of half                  <NA>
#> 48514:          <NA>          22        End of half                  <NA>
#>        drive_play_count drive_time_of_possession drive_first_downs
#>     1:               NA                     <NA>                NA
#>     2:                6                     3:10                 2
#>     3:                6                     3:10                 2
#>     4:                6                     3:10                 2
#>     5:                6                     3:10                 2
#>    ---                                                            
#> 48510:                9                     1:57                 2
#> 48511:                3                     1:33                 0
#> 48512:                3                     1:33                 0
#> 48513:                3                     1:33                 0
#> 48514:                3                     1:33                 0
#>        drive_inside20 drive_ended_with_score drive_quarter_start
#>     1:             NA                     NA                  NA
#>     2:              0                      1                   1
#>     3:              0                      1                   1
#>     4:              0                      1                   1
#>     5:              0                      1                   1
#>    ---                                                          
#> 48510:              1                      0                   4
#> 48511:              0                      0                   4
#> 48512:              0                      0                   4
#> 48513:              0                      0                   4
#> 48514:              0                      0                   4
#>        drive_quarter_end drive_yards_penalized drive_start_transition
#>     1:                NA                    NA                   <NA>
#>     2:                 1                    15                KICKOFF
#>     3:                 1                    15                KICKOFF
#>     4:                 1                    15                KICKOFF
#>     5:                 1                    15                KICKOFF
#>    ---                                                               
#> 48510:                 4                   -10                   PUNT
#> 48511:                 4                     0           INTERCEPTION
#> 48512:                 4                     0           INTERCEPTION
#> 48513:                 4                     0           INTERCEPTION
#> 48514:                 4                     0           INTERCEPTION
#>        drive_end_transition drive_game_clock_start drive_game_clock_end
#>     1:                 <NA>                   <NA>                 <NA>
#>     2:           FIELD_GOAL                  15:00                11:50
#>     3:           FIELD_GOAL                  15:00                11:50
#>     4:           FIELD_GOAL                  15:00                11:50
#>     5:           FIELD_GOAL                  15:00                11:50
#>    ---                                                                 
#> 48510:         INTERCEPTION                  03:30                01:33
#> 48511:             END_GAME                  01:33                00:00
#> 48512:             END_GAME                  01:33                00:00
#> 48513:             END_GAME                  01:33                00:00
#> 48514:             END_GAME                  01:33                00:00
#>        drive_start_yard_line drive_end_yard_line drive_play_id_started
#>     1:                  <NA>                <NA>                    NA
#>     2:                 SF 25              ARI 34                    39
#>     3:                 SF 25              ARI 34                    39
#>     4:                 SF 25              ARI 34                    39
#>     5:                 SF 25              ARI 34                    39
#>    ---                                                                
#> 48510:                 KC 42               TB 10                  4033
#> 48511:                 TB 20               TB 19                  4307
#> 48512:                 TB 20               TB 19                  4307
#> 48513:                 TB 20               TB 19                  4307
#> 48514:                 TB 20               TB 19                  4307
#>        drive_play_id_ended away_score home_score location result total
#>     1:                  NA         24         20     Home     -4    44
#>     2:                 197         24         20     Home     -4    44
#>     3:                 197         24         20     Home     -4    44
#>     4:                 197         24         20     Home     -4    44
#>     5:                 197         24         20     Home     -4    44
#>    ---                                                                
#> 48510:                4280          9         31  Neutral     22    40
#> 48511:                4370          9         31  Neutral     22    40
#> 48512:                4370          9         31  Neutral     22    40
#> 48513:                4370          9         31  Neutral     22    40
#> 48514:                4370          9         31  Neutral     22    40
#>        spread_line total_line div_game     roof surface temp wind    home_coach
#>     1:           7       48.5        1 outdoors   grass   NA   NA Kyle Shanahan
#>     2:           7       48.5        1 outdoors   grass   NA   NA Kyle Shanahan
#>     3:           7       48.5        1 outdoors   grass   NA   NA Kyle Shanahan
#>     4:           7       48.5        1 outdoors   grass   NA   NA Kyle Shanahan
#>     5:           7       48.5        1 outdoors   grass   NA   NA Kyle Shanahan
#>    ---                                                                         
#> 48510:          -3       55.0        0 outdoors   grass   63    9  Bruce Arians
#> 48511:          -3       55.0        0 outdoors   grass   63    9  Bruce Arians
#> 48512:          -3       55.0        0 outdoors   grass   63    9  Bruce Arians
#> 48513:          -3       55.0        0 outdoors   grass   63    9  Bruce Arians
#> 48514:          -3       55.0        0 outdoors   grass   63    9  Bruce Arians
#>             away_coach stadium_id          game_stadium aborted_play success
#>     1: Kliff Kingsbury      SFO01        Levi's Stadium            0      NA
#>     2: Kliff Kingsbury      SFO01        Levi's Stadium            0       0
#>     3: Kliff Kingsbury      SFO01        Levi's Stadium            0       1
#>     4: Kliff Kingsbury      SFO01        Levi's Stadium            0       1
#>     5: Kliff Kingsbury      SFO01        Levi's Stadium            0       0
#>    ---                                                                      
#> 48510:       Andy Reid      TAM00 Raymond James Stadium            0       0
#> 48511:       Andy Reid      TAM00 Raymond James Stadium            0       0
#> 48512:       Andy Reid      TAM00 Raymond James Stadium            0       0
#> 48513:       Andy Reid      TAM00 Raymond James Stadium            0       0
#> 48514:       Andy Reid      TAM00 Raymond James Stadium            0      NA
#>             passer passer_jersey_number    rusher rusher_jersey_number receiver
#>     1:        <NA>                   NA      <NA>                   NA     <NA>
#>     2:        <NA>                   NA      <NA>                   NA     <NA>
#>     3: J.Garoppolo                   10      <NA>                   NA G.Kittle
#>     4:        <NA>                   NA R.Mostert                   31     <NA>
#>     5:        <NA>                   NA R.Mostert                   31     <NA>
#>    ---                                                                         
#> 48510:   P.Mahomes                   15      <NA>                   NA  T.Kelce
#> 48511:        <NA>                   NA   T.Brady                   NA     <NA>
#> 48512:        <NA>                   NA   T.Brady                   NA     <NA>
#> 48513:        <NA>                   NA   T.Brady                   NA     <NA>
#> 48514:        <NA>                   NA      <NA>                   NA     <NA>
#>        receiver_jersey_number pass rush first_down special play  passer_id
#>     1:                     NA    0    0         NA       0    0       <NA>
#>     2:                     NA    0    0          0       1    0       <NA>
#>     3:                     85    1    0          1       0    1 00-0031345
#>     4:                     NA    0    1          1       0    1       <NA>
#>     5:                     NA    0    1          0       0    1       <NA>
#>    ---                                                                    
#> 48510:                     87    1    0          0       0    1 00-0033873
#> 48511:                     NA    0    0          0       0    0       <NA>
#> 48512:                     NA    0    0          0       0    0       <NA>
#> 48513:                     NA    0    0          0       0    0       <NA>
#> 48514:                     NA    0    0         NA       0    0       <NA>
#>         rusher_id receiver_id        name jersey_number         id
#>     1:       <NA>        <NA>        <NA>            NA       <NA>
#>     2:       <NA>        <NA>        <NA>            NA       <NA>
#>     3:       <NA>  00-0033288 J.Garoppolo            10 00-0031345
#>     4: 00-0031687        <NA>   R.Mostert            31 00-0031687
#>     5: 00-0031687        <NA>   R.Mostert            31 00-0031687
#>    ---                                                            
#> 48510:       <NA>  00-0030506   P.Mahomes            15 00-0033873
#> 48511: 00-0019596        <NA>     T.Brady            NA 00-0019596
#> 48512: 00-0019596        <NA>     T.Brady            NA 00-0019596
#> 48513: 00-0019596        <NA>     T.Brady            NA 00-0019596
#> 48514:       <NA>        <NA>        <NA>            NA       <NA>
#>        fantasy_player_name fantasy_player_id   fantasy fantasy_id out_of_bounds
#>     1:                <NA>              <NA>      <NA>       <NA>             0
#>     2:                <NA>              <NA>      <NA>       <NA>             0
#>     3:            G.Kittle        00-0033288  G.Kittle 00-0033288             0
#>     4:           R.Mostert        00-0031687 R.Mostert 00-0031687             0
#>     5:           R.Mostert        00-0031687 R.Mostert 00-0031687             0
#>    ---                                                                         
#> 48510:             T.Kelce        00-0030506   T.Kelce 00-0030506             0
#> 48511:             T.Brady        00-0019596   T.Brady 00-0019596             0
#> 48512:             T.Brady        00-0019596   T.Brady 00-0019596             0
#> 48513:             T.Brady        00-0019596   T.Brady 00-0019596             0
#> 48514:                <NA>              <NA>      <NA>       <NA>             0
#>        home_opening_kickoff     qb_epa  xyac_epa xyac_mean_yardage
#>     1:                    1         NA        NA                NA
#>     2:                    1  0.0000000        NA                NA
#>     3:                    1  1.2948379 0.5033697          4.275047
#>     4:                    1  0.8572143        NA                NA
#>     5:                    1 -0.4546648        NA                NA
#>    ---                                                            
#> 48510:                    1 -4.2660469        NA                NA
#> 48511:                    1  0.0000000        NA                NA
#> 48512:                    1  0.0000000        NA                NA
#> 48513:                    1  0.0000000        NA                NA
#> 48514:                    1         NA        NA                NA
#>        xyac_median_yardage xyac_success   xyac_fd     xpass    pass_oe
#>     1:                  NA           NA        NA        NA         NA
#>     2:                  NA           NA        NA        NA         NA
#>     3:                   2    0.6193061 0.2396954 0.5150585  48.494154
#>     4:                  NA           NA        NA 0.4133573 -41.335732
#>     5:                  NA           NA        NA 0.4469202 -44.692025
#>    ---                                                                
#> 48510:                  NA           NA        NA 0.9044219   9.557813
#> 48511:                  NA           NA        NA        NA         NA
#> 48512:                  NA           NA        NA        NA         NA
#> 48513:                  NA           NA        NA        NA         NA
#> 48514:                  NA           NA        NA        NA         NA
```

## Data Sources

Data accessed by this package is stored on GitHub and can typically be
found in one of the following repositories:

-   [nflverse/nflfastR-data](https://github.com/nflverse/nflfastR-data)
-   [nflverse/nfldata](https://github.com/nflverse/nfldata)
-   [nflverse/nflfastR-roster](https://github.com/nflverse/nflfastR-roster)
-   [nflverse/espnscrapeR-data](https://github.com/nflverse/espnscrapeR-data)
-   [dynastyprocess/data](https://github.com/dynastyprocess/data)

For a full list of functions, please see the [reference
page](https://nflreadr.nflverse.com/reference/index.html).

## Configuration

The following options help configure default `nflreadr` behaviours.

``` r
options(nflreadr.cache) # one of "memory", "filesystem", or "off"
options(nflreadr.prefer) # one of "qs" or "rds"
```

You can also configure `nflreadr` to display progress messages with the
[`progressr` package](https://progressr.futureverse.org), e.g.

``` r
progressr::with_progress(load_rosters(seasons = 2010:2020))
 |========             |  40%
```

## Getting help

The best places to get help on this package are:

-   the [nflverse discord](https://discord.com/invite/5Er2FBnnQa) (for
    both this package as well as anything R/NFL related)
-   opening [an
    issue](https://github.com/nflverse/nflreadr/issues/new/choose)

## Contributing

Many hands make light work! Here are some ways you can contribute to
this project:

-   You can [open an
    issue](https://github.com/nflverse/nflreadr/issues/new/choose) if
    you’d like to request specific data or report a bug/error.

-   If you’d like to contribute code, please check out [the contribution
    guidelines](https://nflreadr.nflverse.com/CONTRIBUTING.html).

## Terms of Use

The R code for this package is released as open source under the [MIT
License](https://nflreadr.nflverse.com/LICENSE.html). NFL data accessed
by this package belong to their respective owners, and are governed by
their terms of use.
