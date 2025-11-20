# nflverse_sitrep data class

[`nflverse_sitrep()`](https://nflreadr.nflverse.com/reference/sitrep.md)
returns an S3 class that was created to allow for custom printing. It
will otherwise dispatch to the `list` class.

## Details

Re-exporting with
[`methods::setOldClass()`](https://rdrr.io/r/methods/setOldClass.html)
allows these dataframes to be used in S4 generics like those from DBI
and jsonlite.
