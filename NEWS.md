# nflreadr (development version)


## Minor changes

- Remove progress handling from `*_from_url()` family of functions and move responsibility to `progressively()` function decorator instead. (v1.0.0.1)
- Add weekly kicking data.
- Add `stat_type` argument to `load_player_stats()` - currently available options are `"offense"` and `"kicking"`, future iterations may include `"defense"`, `"punting"`, `"return"`. (v1.0.0.2)
- Refactored to use `data.table` instead of `dplyr`/`purrr` - this hopefully improves speed and reduces the dependency footprint. (v1.0.0.3)
- Use `rlang::arg_match0` instead of `match.arg` - uses rlang explicitly (instead of implicitly) (v1.0.0.4)

---

# nflreadr 1.0.0

The goal of {`nflreadr`} is to efficiently load data from [nflverse GitHub repositories](https://github.com/nflverse), and features caching, optional progress updates, and data dictionaries.

At this time, it includes data from the following repositories:

- [nflverse/nflfastR-data](https://github.com/nflverse/nflfastR-data)
- [nflverse/nfldata](https://github.com/nflverse/nfldata)
- [nflverse/nflfastR-roster](https://github.com/nflverse/nflfastR-roster)
- [nflverse/espnscrapeR-data](https://github.com/nflverse/espnscrapeR-data)
- [dynastyprocess/data](https://github.com/dynastyprocess/data)

This will hopefully provide a unified and reliable package for downloading nflverse data that can be extended to the rest of the nflverse and ffverse package families.

Special thanks to Seb, Ben, John, Lee, and Thomas for their contributions to the package and to the data pipelines that this package relies on 🎉
