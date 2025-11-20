# Data Dictionary - Trades

| field       | data_type | description                                                             |
|:------------|:----------|:------------------------------------------------------------------------|
| trade_id    | numeric   | ID of Trade                                                             |
| season      | numeric   | 4 digit number indicating to which season the specified trade occurred. |
| trade_date  | numeric   | Exact date that trade occurred                                          |
| gave        | character | Team that gave pick/player in row                                       |
| received    | character | Team that received pick/player in row                                   |
| pick_season | numeric   | Draft in which traded pick was in                                       |
| pick_round  | numeric   | Round in which traded pick was in                                       |
| pick_number | numeric   | Pick number of traded pick                                              |
| conditional | numeric   | Binary indicator of whether or not traded pick was conditional          |
| pfr_id      | character | Pro-Football-Reference ID of traded player                              |
| pfr_name    | character | Full name of traded player                                              |
