#' @title Server
#' @description The main application server function
#'
#' @param config The config file
#'
#' @return Nothing
#' @export
#'
#' @importFrom dplyr select
#'
server <- function(config) {
  function(input, output, session) {
    config <- config::get(
      value = "database",
      file = config
    )

    db <- new_db_pool(
      config = config
    )

    output$tbl <- DT::renderDT({
      DBI::dbGetQuery(
        conn = db,
        statement = r"(select * from "eviction_addresses"."user")"
      ) |>
        select(-password_hash)
    })
  }
}
