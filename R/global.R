#' @title Global
#' @description The globals file for the main application
#'
#' @return Nothing
#' @export
#'
global <- function() {
  onStop(
    function() {
      pool::poolClose(db)
    }
  )
}
