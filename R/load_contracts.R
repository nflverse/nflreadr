#' Load Historical Player Contracts from OverTheCap.com
#'
#' @description Loads player contracts from OverTheCap.com
#'
#' @param file_type One of `"rds"`, `"csv"`, or `"parquet"`.
#'   Can also be set globally with options(nflreadr.prefer)
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({ # prevents cran errors
#'   load_contracts()
#' })
#' }
#'
#' @return A tibble of active and non-active NFL player contracts.
#'
#' @seealso <https://overthecap.com/contract-history> for a web version of the data
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_contracts.html> for a web version of the dictionary
#' @seealso [`dictionary_contracts`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/rotc>
#'
#' @export
load_contracts <- function(
  file_type = getOption("nflreadr.prefer", default = "rds")
) {
  file_type <- rlang::arg_match0(file_type, c("rds", "parquet", "csv"))
  url <- glue::glue(
    "https://github.com/nflverse/nflverse-data/releases/download/contracts/historical_contracts.{file_type}"
  )
  out <- load_from_url(url, nflverse = TRUE)
  if (anyNA(out$draft_year)) {
    out <- fill_contract_draft_info(out, load_players(file_type = file_type))
  }
  return(out)
}

fill_contract_draft_info <- function(contracts, players) {
  out <- data.table::copy(contracts)
  out_attrs <- attributes(out)
  player_draft <- data.table::copy(data.table::as.data.table(players))
  needed_contract_cols <- c(
    "otc_id", "draft_year", "draft_round", "draft_overall", "draft_team"
  )
  needed_player_cols <- c(
    "otc_id", "draft_year", "draft_round", "draft_pick", "draft_team"
  )
  if (
    !all(needed_contract_cols %in% names(out)) ||
      !all(needed_player_cols %in% names(player_draft))
  ) {
    return(out)
  }

  data.table::setDT(out)
  player_draft <- data.table::data.table(
    otc_id = suppressWarnings(as.integer(player_draft[["otc_id"]])),
    player_draft_year = player_draft[["draft_year"]],
    player_draft_round = player_draft[["draft_round"]],
    player_draft_overall = player_draft[["draft_pick"]],
    player_draft_team = player_draft[["draft_team"]]
  )
  player_draft <- player_draft[
    !is.na(player_draft[["otc_id"]]) &
      (!is.na(player_draft[["player_draft_year"]]) |
        !is.na(player_draft[["player_draft_round"]]) |
        !is.na(player_draft[["player_draft_overall"]]) |
        !is.na(player_draft[["player_draft_team"]]))
  ]
  player_draft <- unique(player_draft, by = "otc_id")

  draft_match <- match(out[["otc_id"]], player_draft[["otc_id"]])
  draft_fields <- list(
    draft_year = "player_draft_year",
    draft_round = "player_draft_round",
    draft_overall = "player_draft_overall",
    draft_team = "player_draft_team"
  )
  for (contract_field in names(draft_fields)) {
    replacement <- out[[contract_field]]
    player_values <- player_draft[[draft_fields[[contract_field]]]][draft_match]
    replacement <- replacement %c% player_values
    data.table::set(out, j = contract_field, value = replacement)
  }
  data.table::setattr(out, "class", out_attrs$class)
  for (attr_name in setdiff(
    names(out_attrs),
    c("names", "row.names", "class", ".internal.selfref")
  )) {
    data.table::setattr(out, attr_name, out_attrs[[attr_name]])
  }
  out
}
