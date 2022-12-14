#' @title UI
#' @description The main UI function for the application
#'
#' @return Nothing
#' @export
#'
ui <- function() {
  fluidPage(
    titlePanel("title panel"),
    sidebarLayout(
      position = "right",
      sidebarPanel("sidebar panel"),
      mainPanel(
        "main panel",
        DT::DTOutput("tbl")
      )
    )
  )
}
