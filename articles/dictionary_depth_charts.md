# Data Dictionary - Depth Charts

Please note that the data source has changed after the 2024 season. From
2025 onwards, the following variables and descriptions will apply.

| field       | data_type | description                                                                                                                                                          |
|:------------|:----------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| dt          | character | The timestamp (ISO8601-formatted text) indicating when the data record was loaded. Can be used to assign the data set to a specific point in time during the season. |
| team        | character | Team that depth chart belongs to                                                                                                                                     |
| player_name | character | Full name of player                                                                                                                                                  |
| espn_id     | character | ESPN Player ID                                                                                                                                                       |
| gsis_id     | character | Game Stats and Info Service ID: the primary ID for play-by-play data                                                                                                 |
| pos_grp_id  | character | Player position group identifier                                                                                                                                     |
| pos_grp     | character | Player position group: formation of offense, defense, or special teams                                                                                               |
| pos_id      | character | Player position identifier                                                                                                                                           |
| pos_name    | character | Player position name                                                                                                                                                 |
| pos_abb     | character | Player position abbreviation                                                                                                                                         |
| pos_slot    | numeric   | A number assigned to each position in a formation                                                                                                                    |
| pos_rank    | numeric   | Player’s rank on depth chart grouped by pos_slot                                                                                                                     |
