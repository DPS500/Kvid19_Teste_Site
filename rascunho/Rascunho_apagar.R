#### Rascunho pode apagar #####
## Rascunho para o módulo shinydashboardPlus

library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(ggplot2)

#UI module that should create a fluidRow with my plot
mod_home_tab_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      shinydashboardPlus::box(
        title = "Motivation",
        # icon = shiny::icon("question"),
        # collapsible = TRUE,
        sidebar = shinydashboardPlus::boxSidebar(
          id = "mycardsidebar",
          width = 50,
          sliderInput(
            inputId = ns("groupk"),
            label = "Número de grupos (k):",
            min = 1,
            max = 6,
            value = 2
          )
        ),
        plotOutput(ns("pubs_pl"))
      )
    )
  )

}
#Server module to render plot
mod_home_tab_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$pubs_pl <- renderPlot({
      ggplot2::ggplot(data = data.frame(x = rnorm(10),
                                        y = rnorm(10)),
                      ggplot2::aes(x = x, y = y))+
        ggplot2::geom_point()})
  })
}


ui <- shinydashboardPlus::dashboardPage(

  # Application title
  header = shinydashboard::dashboardHeader(),
  # Sidebar with a slider input for number of bins
  sidebar = shinydashboard::dashboardSidebar(),

  body = shinydashboard::dashboardBody(
    #This does not work
    mod_home_tab_ui("home_tab_ui_1"),

  )



)

# Define server logic required to draw a histogram
server <- function(input, output) {
  # This does not work
  mod_home_tab_server("home_tab_ui_1")


}

# Run the application
shinyApp(ui = ui, server = server)
