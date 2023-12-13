#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @importFrom shinyjs useShinyjs
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    shinydashboard::dashboardPage(
      #----- Cabeçalho -----
      shinydashboard::dashboardHeader(title = "Kvid19"),
      #----- Barra lateral -----
      shinydashboard::dashboardSidebar(
        sidebarMenu(
          menuItem(text = div(icon("virus-covid", class = "fas", style = "margin-right: 5px;"), "Home"),
                   tabName = "home"),
          menuItem(text = div(icon("circle-question", class = "fas", style = "margin-right: 5px;"), "Ajuda"),
                   tabName = "help"),
          menuItem(text = div(icon("landmark", class = "fas", style = "margin-right: 5px;"),"Desenvolvedores"),
                   tabName = "dev"),
          menuItem(text = div(icon("envelope", class = "fas", style = "margin-right: 5px;"),"Contato"),
                   tabName = "cont"))

      ),
      #----- Corpo do App -----
      shinydashboard::dashboardBody(
        shinydashboard::tabItems(
          #----- Home -----
          shinydashboard::tabItem(tabName = "home",
                                  mod_home_ui(id = "home1")),
          #----- Ajuda -----
          shinydashboard::tabItem(tabName = "help",
                                  mod_help_ui("help1")),

          #----- Desenvolvedores -----
          shinydashboard::tabItem(tabName = "dev",
                                  mod_dev_ui("dev1")),
          #----- Contato -----
          shinydashboard::tabItem(tabName = "cont",
                                  mod_cont_ui("cont1"))
          #-------------------
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "Kvid19"
    ),
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
    shinyjs::useShinyjs(),
    shinyjs::inlineCSS(appCSS),
    # Altura dos box para tabitem Desenvolvedor
    # tags$script(
    #   HTML(
    #     "
    #       $(document).ready(function() {
    #         // Encontrar a altura máxima entre as caixas
    #         var maxHeight = Math.max.apply(null, $('.box').map(function() {
    #           return $(this).height();
    #         }).get());
    #
    #         // Definir a altura de todas as caixas para a altura máxima
    #         $('.box').height(maxHeight);
    #       });
    #       "
    #   )
    # )





  )
}
