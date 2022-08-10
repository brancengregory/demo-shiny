#' @title Run the Dashboard
#' @description Runs the dashboard
#'
#' @param ... List of arguments passed to `shiny::shinyApp()`
#'
#' @return Nothing
#' @export
#'
run <- function(config, ...) {
  shiny::shinyApp(
    ui = ui,
    server = server(config),
    onStart = global,
    ...
  )
}
