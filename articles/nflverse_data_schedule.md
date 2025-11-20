# nflverse Data Update and Availability Schedule

`nflreadr` provides a wide range of NFL related data. This is powered by
an extensive, automated data infrastructure. This article provides
information on update and availability schedules, as this is a pressing
question for many nflverse users, especially right before the start of a
season.

## Automation Status

The following table reports on the status and last update times of
nflverse data pipelines.

| Data               | Status                                                                                                                                                                                                          | Last Updated                                                                                                                                                                                                                                                                                              |
|:-------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| pbp_raw            | [![pbp_raw](https://img.shields.io/github/actions/workflow/status/nflverse/nflverse-pbp-internal/release_raw_pbp.yaml?label=raw_pbp_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)         | [![raw pbp data](https://img.shields.io/github/last-commit/nflverse/nflfastR-raw?label=Raw%20PBP%20Updated&style=flat-square)](https://nflreadr.nflverse.com/articles/)                                                                                                                                   |
| pbp                | [![pbp and ps](https://img.shields.io/github/actions/workflow/status/nflverse/nflverse-pbp/update_data.yaml?label=pbp_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)                       | [![pbp](https://img.shields.io/badge/dynamic/json?color=blue&label=load_pbp&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/pbp/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/pbp)                                         |
| stats_player       | [![pbp and stats](https://img.shields.io/github/actions/workflow/status/nflverse/nflverse-pbp/update_data.yaml?label=player_stats_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)           | [![stats_player](https://img.shields.io/badge/dynamic/json?color=blue&label=load_player_stats&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/stats_player/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/stats_player)     |
| stats_team         | [![pbp and stats](https://img.shields.io/github/actions/workflow/status/nflverse/nflverse-pbp/update_data.yaml?label=team_stats_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)             | [![stats_team](https://img.shields.io/badge/dynamic/json?color=blue&label=load_team_stats&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/stats_team/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/stats_team)             |
| rosters            | [![rosters](https://img.shields.io/github/actions/workflow/status/nflverse/nflverse-rosters/update_rosters.yaml?label=rosters_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)               | [![rosters](https://img.shields.io/badge/dynamic/json?color=blue&label=load_rosters&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/rosters/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/rosters)                         |
| players            | [![players](https://img.shields.io/github/actions/workflow/status/nflverse/nflverse-players/update_players.yaml?label=players_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)               | [![players](https://img.shields.io/badge/dynamic/json?color=blue&label=load_players&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/players/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/players)                         |
| snap_counts        | [![snap_counts](https://img.shields.io/github/actions/workflow/status/nflverse/pfr_scrapR/update_snap_counts.yaml?label=snaps_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)               | [![snap_counts](https://img.shields.io/badge/dynamic/json?color=blue&label=load_snap_counts&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/snap_counts/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/snap_counts)         |
| draft_picks        | [![snap_counts](https://img.shields.io/github/actions/workflow/status/nflverse/pfr_scrapR/update_draft_picks.yaml?label=draft_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)               | [![draft_picks](https://img.shields.io/badge/dynamic/json?color=blue&label=load_draft_picks&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/draft_picks/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/draft_picks)         |
| pfr_advstats       | [![adv_stats](https://img.shields.io/github/actions/workflow/status/nflverse/pfr_scrapR/update_advanced_stats.yaml?label=advstats_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)           | [![pfr_advstats](https://img.shields.io/badge/dynamic/json?color=blue&label=load_pfr_advstats&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/pfr_advstats/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/pfr_advstats)     |
| nextgen_stats      | [![ngs](https://img.shields.io/github/actions/workflow/status/nflverse/ngs-data/update_ngs.yaml?label=ngs_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)                                   | [![nextgen_stats](https://img.shields.io/badge/dynamic/json?color=blue&label=load_nextgen_stats&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/nextgen_stats/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/nextgen_stats) |
| injuries           | [![injuries](https://img.shields.io/github/actions/workflow/status/nflverse/nflverse-rosters/update_injuries.yaml?label=injuries_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)            | [![injuries](https://img.shields.io/badge/dynamic/json?color=blue&label=load_injuries&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/injuries/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/injuries)                     |
| depth_charts       | [![depthcharts](https://img.shields.io/github/actions/workflow/status/nflverse/nflverse-rosters/update_depth_charts.yaml?label=depth_charts_status&style=flat-square)](https://nflreadr.nflverse.com/articles/) | [![depth_charts](https://img.shields.io/badge/dynamic/json?color=blue&label=load_depth_charts&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/depth_charts/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/depth_charts)     |
| combine            | [![combine](https://img.shields.io/github/actions/workflow/status/nflverse/pfr_scrapR/update_combine.yaml?label=combine_status&style=flat-square)](https://nflreadr.nflverse.com/articles/)                     | [![combine](https://img.shields.io/badge/dynamic/json?color=blue&label=load_combine&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/combine/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/combine)                         |
| nfl4th             | [![nfl4th](https://img.shields.io/github/actions/workflow/status/nflverse/nfl4th/update_precompute.yaml?label=nfl4th_precompute&style=flat-square)](https://nflreadr.nflverse.com/articles/)                    |                                                                                                                                                                                                                                                                                                           |
| ffverse player IDs | [![weekly-playerids](https://img.shields.io/github/actions/workflow/status/dynastyprocess/data/weekly-playerids.yml?label=ff_playerids&style=flat-square)](https://nflreadr.nflverse.com/articles/)             |                                                                                                                                                                                                                                                                                                           |
| ffverse rankings   | [![weekly-fantasypros](https://img.shields.io/github/actions/workflow/status/dynastyprocess/data/weekly-fantasypros.yml?label=rankings&style=flat-square)](https://nflreadr.nflverse.com/articles/)             |                                                                                                                                                                                                                                                                                                           |
| contracts          | [![contracts](https://img.shields.io/github/actions/workflow/status/nflverse/rotc/update_otc.yaml?label=contracts&style=flat-square)](https://nflreadr.nflverse.com/articles/)                                  | [![contracts](https://img.shields.io/badge/dynamic/json?color=blue&label=load_contracts&query=last_updated&style=flat-square&url=https://github.com/nflverse/nflverse-data/releases/download/contracts/timestamp.json)](https://github.com/nflverse/nflverse-data/releases/tag/contracts)                 |

## nflverse Play-by-Play Data

There are three ways to obtain nflverse pbp data.

1.  We recommend using
    [`nflreadr::load_pbp()`](https://nflreadr.nflverse.com/reference/load_pbp.md)
    or `nflfastR::load_pbp()` as the primary method of retrieving pbp
    data. This uses our automated data infrastructure to download clean
    data, and [we update
    this](https://github.com/nflverse/nflverse-pbp/blob/866020fdf54bee79ea11b6cf69168d438dd26dea/.github/workflows/update_data.yaml#L3-L13)
    on a nightly basis after each game day (and additionally at specific
    points on game days) during the season.
2.  If this is not quick enough, `nflfastR::build_nflfastR_pbp()` parses
    raw pbp json files we save, **usually available within 15 minutes
    after a game has ended**.
3.  If you have a SQL database, `nflfastR::update_db()` helps maintain a
    pbp database. It uses `nflfastR::build_nflfastR_pbp()` so can be run
    on the same schedule (i.e. within 15 minutes after a game has
    ended).

In all cases, it is recommended to update the data again during the
night from Wednesday to Thursday in order to also receive the stat
corrections that the NFL will incorporate from Monday to Wednesday at
the latest. -\> Thursday’s
[`load_pbp()`](https://nflreadr.nflverse.com/reference/load_pbp.md) is
the cleanest data we have.

## nflverse Player and Team Stats

[Player
stats](https://nflreadr.nflverse.com/reference/load_player_stats.html)
and [Team
stats](https://nflreadr.nflverse.com/reference/load_team_stats.html) are
computed on the [same schedule as play-by-play
data](https://github.com/nflverse/nflverse-pbp/blob/866020fdf54bee79ea11b6cf69168d438dd26dea/.github/workflows/update_data.yaml#L3-L13),
i.e. on a nightly basis after each game day (and additionally at
specific points on game days) during the season.

At the moment, it is not possible to speed up this process with a
function in nflfastR. Even `nflfastR::calculate_stats` requires
automated data. If this is too slow for you, please contact us on
[nflverse discord](https://discord.com/invite/5Er2FBnnQa). If there is
high demand, this may be adjusted.

## nflverse-FTN Charting Data

[ftn charting
data](https://nflreadr.nflverse.com/reference/load_ftn_charting.html)
updates every day at 0, 6, 12, 18 UTC during the season. The actual
availability of new data depends on the update schedule of FTN.

## nflverse Participation Data

[Participation
data](https://nflreadr.nflverse.com/reference/load_participation.html)
prior to 2023 is from NFL NGS. The data source died during the 2023
season.

Participation data from 2023 onwards is courtesy of FTN and is provided
**after all post-season games are completed**. It does not update during
the season!

## nflverse Game/Schedule Data

[Game/Schedule
data](https://nflreadr.nflverse.com/reference/load_schedules.html)
updates very 5 minutes during the season.

## nflverse Roster Data

[Roster data](https://nflreadr.nflverse.com/reference/load_rosters.html)
updates every day at 7AM UTC.

## Player Level Weekly NFL Next Gen Stats

Player level [weekly
stats](https://nflreadr.nflverse.com/reference/load_nextgen_stats.html)
provided by NFL Next Gen Stats update every night (in the range of 3
am - 5 am ET) during the season. The actual availability of new data
depends on the update schedule of NGS.

## PFR Snap Count Data

[Snap Count
data](https://nflreadr.nflverse.com/reference/load_snap_counts.html)
updates every day at 0, 6, 12, 18 UTC during the season. The actual
availability of new data depends on the update schedule of PFR.

## PFR Advanced Stats

[PFR Advanced
Stats](https://nflreadr.nflverse.com/reference/load_pfr_advstats.html)
updates every day at 7AM UTC during the season. The actual availability
of new data depends on the update schedule of PFR.

## Depth Chart Data

[Depth
Charts](https://nflreadr.nflverse.com/articles/dictionary_depth_charts.html)
update every day at 7AM UTC throughout the year.

Please note that the data source has changed after the 2024 season. From
2025 onwards, depth charts are not assigned a week. Instead, each update
provides a new ISO8601-formatted timestamp that users can assign to any
point in time during the season. Each update is appended to the existing
data with a new timestamp.

## Injury Data

Our data source died after the 2024 season. **At the moment, there is no
2025 data** and there is no ETA yet as to when we will be able to make
injury data available again.
