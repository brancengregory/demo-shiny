#' @title New DB Pool
#' @description Creates a new database connection pool
#'
#' @param config A list of connection arguments consumed by `{pool}` and `{odbc}`
#'
#' @return A database connection pool
#' @export
#'
new_db_pool <- function(config) {
  pool::dbPool(
    drv = odbc::odbc(),
    Driver = config$driver,
    Server = config$server,
    Database = config$database,
    Port = config$port,
    Username = config$uid,
    Password = config$pwd,
    SSLmode = "verify-ca",
    Pqopt = stringr::str_glue(
      "{sslrootcert={{config$ssl.ca}}",
      "sslcert={{config$ssl.cert}}",
      "sslkey={{config$ssl.key}}}",
      .open = "{{",
      .close = "}}",
      .sep = " "
    )
  )
}
