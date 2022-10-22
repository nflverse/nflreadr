# Data Dictionaries

This section of the repository hosts data dictionary CSVs for nflverse data. These get served to users in several formats:

- as package data for nflreadr package users (i.e. running `nflreadr::dictionary_pbp` returns a dataframe)
- as vignettes for nflreadr (i.e. running `vignette("dictionary_pbp")` in the R console returns a browsable dataframe)
- as website documentation (i.e. <https://nflreadr.nflverse.com/articles/dictionary_pbp.html>)

## Updating a dictionary

You can make corrections and updates to an existing dictionary by making a pull request with a CSV update and rebuilding the data. Approximate steps: 

1. Fork the repository (R users: use `usethis::create_from_github()`)
2. Create a new branch for the desired change (R users: `usethis::pr_init()`)
3. Update the CSV (can be done in Excel or other text editor program of choice)
4. Run the corresponding code chunk of `data-raw/build_data_dictionaries.R` (including the `use_data()` portion), or just run the entire file.
5. Update the package version number in DESCRIPTION by one dev version (xx.xx.xx.01+), and then describe the change in NEWS.md.
6. Commit and push the changes to your branch, and then make a PR. 

## Adding a new dictionary

Adding new dictionary follows pretty similar steps, but has a few more package-based infrastructure updates:

1. Fork the repository (R users: use `usethis::create_from_github()`)
2. Create a new branch for the desired change (R users: `usethis::pr_init()`)
3. Add the CSV dictionary - it usually contains field name, column type, and description columns at a minimum. (can be done in Excel or other text editor program of choice)
4. Add a corresponding code chunk to `data-raw/build_data_dictionaries.R`, including the `use_data()` portion, feel free to duplicate one of the other code chunks that does this for a different dictionary. This will create the internal package dataframe.
5. Add a section to R/data.R, duplicating the documentation from another option. This documents the internal package dataframe for R users and powers the help command (`?nflreadr::dictionary_pbp`).
6. Add a vignette, copying one of the existing vignettes (e.g. `vignettes/dictionary_participation.Rmd`). This creates the vignette and also creates the website documentation.
7. Add a line to `pkgdown/_pkgdown.yml` under "Dictionaries", which creates website navigation for that vignette. 
8. Update the package version number in DESCRIPTION by one dev version (xx.xx.xx.01+), and then describe the new dictionary in NEWS.md.
9. Commit and push the changes to your branch, and then make a PR. 
