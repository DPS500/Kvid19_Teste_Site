#' dev UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#' @import shiny
#' @import shinydashboard
#' @importFrom shiny NS tagList

box_height = "35em"
mod_dev_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      #Título para os Desenvolvedores
      h1("Desenvolvedores", style= "
           font-size: 20pt; text-align: center;font-weight: bold;"),
      #------------ 1 Linha ----------
      fluidRow( width = 12,
                tags$div(class = "boxdev1",
        # Zarzar ----
        box(
          tags$style(HTML(".col-sm-3 {padding-right: 0px; padding-left: 5px;}")),
          # class = "box",
          status = "primary",
          solidHeader = FALSE,
          width = 3,
          # offset = 3,
          height = box_height,
          tags$img(src="www/zarzar.png",
                   style = "width: 100%; height: auto; max-width: 50%; overflow-y: auto;",
                   class = "img-circle",
                   width = "100px", height = "100px"
                   ),
          #Usado para centralizar o que estiver dentro do box
          style = "text-align: center",
          #Título com o nome da desenvolvedora
          h1(style="font-size: 15pt;
             text-align: center; font-weight: bold;",
             "Carlos Antônio Zarzar"),
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          #Descrição
          p(style= "font-size: 10pt;
             text-align: center;",
            "Universidade Federal do Oeste do Pará - UFOPA"),
          p(style= "font-size: 10pt;
             text-align: center;","Campus Monte Alegre"),
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          #Link com um determinado nome
          a("Currículo Lattes", href= "http://lattes.cnpq.br/6505656674643382",
            style="font-size: 10pt;
             text-align: center;")
        ),
        # Denise ----
        box(
          # tags$style(HTML(".col-sm-3 {padding-right: 0px; padding-left: 5px;}")),
          # class = "box",
          status = "primary",
          solidHeader = FALSE,
          width = 3,
          # offset = 3,
          height = box_height,
          # height = "100%",
          #Tags para colocar a imagem de Denise em formato circular
          tags$img(src="www/denise.jpeg", style = "width: 100%; height: auto; max-width: 50%; overflow-y: auto;",
                   class = "img-circle",
                   width = "200px", height = "200px"),style = "text-align: center",
          #Título com o nome da desenvolvedora
          h1(style="font-size: 15pt;
             text-align: center; font-weight: bold;",
             "Denise de Assis Paiva"),
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          #Descrição
          p(style="font-size: 10pt;
             text-align: center;",
            "Universidade Federal de Lavras - UFLA"),
          #Usado para criar um espaço entre o Título e a descrição
          br(),
          #Link com um determinado nome
          a("Currículo Lattes", href= "http://lattes.cnpq.br/6114238098801542",
            style="font-size: 10pt;
             text-align: center;")
        ),
        # Thelma ----
        box(
          # tags$style(HTML(".col-sm-3 {padding-right: 0px; padding-left: 5px;}")),
          # class = "box",
          status = "primary",
          solidHeader = FALSE,
          width = 3,
          # offset = 3,
          height = box_height,
          # height = "100%",
          tags$img(src="www/thelma.jpeg", style = "width: 100%; height: auto; max-width: 50%; overflow-y: auto;",
                   class = "img-circle",
                   width = "200px", height = "200px"),

          #Usado para centralizar o que estiver dentro do box
          style = "text-align: center",

          #Título com o nome da desenvolvedora
          h1(style="font-size: 15pt;
             text-align: center; font-weight: bold;",
             "Thelma Sáfadi"),

          #Usado para criar um espaço entre o Título e a descrição
          br(),

          #Descrição
          p(style= "font-size: 10pt;
            text-align: center;",
            "Universidade Federal de Lavras - UFLA"),

          #Usado para criar um espaço entre o Título e a descrição
          br(),

          #Link com um determinado nome
          a("Currículo Lattes", href= "http://lattes.cnpq.br/9821585244827807",
            style="ont-size: 10pt;
             text-align: center;")
        ),
        # Karla ----
        box(
          # tags$style(HTML(".col-sm-3 {padding-right: 0px; padding-left: 5px;}")),
          # class = "box",
          status = "primary",
          solidHeader = FALSE,
          width = 3,
          # offset = 3,
          height = box_height,
          tags$img(src="www/karla.jpeg", style = "width: 100%; height: auto; max-width: 50%; overflow-y: auto;",
                   class = "img-circle",
                   width = "200px", height = "200px"),

          #Usado para centralizar o que estiver dentro do box
          style = "text-align: center",

          #Título com o nome da desenvolvedora
          h1(style="font-size: 15pt;
             text-align: center; font-weight: bold;",
             "Karla Suemy Clemente Yotoko"),

          #Usado para criar um espaço entre o Título e a descrição
          br(),


          br(),

          #Descrição
          p(style= "font-size: 10pt;
             text-align: center;",
            "   Universidade Federal de Viçosa -  UFV  "),

          #Usado para criar um espaço entre o Título e a descrição
          br(),

          #Link com um determinado nome
          a("Currículo Lattes", href= "http://lattes.cnpq.br/6405218841067158",
            style="font-size: 10pt;
             text-align: center;")
        )
      )
      ),
      #------------ 2 Linha ----------
      fluidRow(width = 12,
               tags$div(class = "custom-container",
        # Gabriel ----
        column(width = 3,offset = 2,
               # offset = 1,
               box(
                 # class="box",
                 status = "primary",
                 solidHeader = FALSE,
                 width = NULL,
                 # offset = 3,
                 height = box_height,
                 tags$img(src="www/gabriel.png", style = "width: 100%; height: auto; max-width: 50%; overflow-y: auto;",
                          class = "img-circle",
                          width = "200px", height = "200px"),

                 #Usado para centralizar o que estiver dentro do box
                 style = "text-align: center",

                 #Título com o nome da desenvolvedora
                 h1(style="font-size: 15pt;
             text-align: center; font-weight: bold;",
                    "Gabriel Rodrigues da Silva"),

                 #Usado para criar um espaço entre o Título e a descrição
                 br(),

                 #Descrição
                 p(style= "font-size: 10pt;
             text-align: center;",
                   "Universidade Federal do Oeste do Pará - UFOPA"),

                 p(style= "font-size: 10pt;
             text-align: center;","Campus Monte Alegre"),

                 #Usado para criar um espaço entre o Título e a descrição
                 br(),

                 #Link com um determinado nome
                 a("Currículo Lattes", href= "lattes.cnpq.br/8677409423160124",
                   style="font-size: 10pt;
             text-align: center;")
               )
        ),
        # Daniel ----
        column(width = 3,
          # offset = 1,
          box(
            # class="box",
            status = "primary",
            solidHeader = FALSE,
            width = NULL,
            # offset = 1,
            height = box_height,
            tags$img(src="www/daniel.png", style = "width: 100%; height: auto; max-width: 50%; overflow-y: auto;",
                     class = "img-circle",
                     width = "200px", height = "200px"),

            #Usado para centralizar o que estiver dentro do box
            style = "text-align: center",

            #Título com o nome da desenvolvedora
            h1(style="font-size: 15pt;
             text-align: center; font-weight: bold;",
               "Daniel Pinto Siqueira"),

            #Usado para criar um espaço entre o Título e a descrição
            br(),

            #Descrição
            p(style= "font-size: 10pt;
             text-align: center;",
              "Universidade Federal do Oeste do Pará - UFOPA"),

            p(style= "font-size: 10pt;
             text-align: center;","Campus Monte Alegre"),
            #Usado para criar um espaço entre o Título e a descrição
            br(),

            #Link com um determinado nome
            a("Currículo Lattes", href= "http://lattes.cnpq.br/3311133937308698",
              style="font-size: 10pt;
             text-align: center;")
          )
        ),
        # Luan ----
        column(width = 3,
          # offset = 1,
          box(
            # class="box",
            status = "primary",
            solidHeader = FALSE,
            width = NULL,
            # offset = 1,
            height = box_height,
            tags$img(src="www/luan.png", style = "width: 100%; height: auto; max-width: 50%; overflow-y: auto;",
                     class = "img-circle",
                     width = "200px", height = "200px"),

            #Usado para centralizar o que estiver dentro do box
            style = "text-align: center",

            #Título com o nome da desenvolvedor
            h1(style=" font-size: 15pt;
             text-align: center; font-weight: bold;",
               "Luan Patrick Moura de Souza"),

            #Usado para criar um espaço entre o Título e a descrição
            br(),

            #Descrição
            p(style= "font-size: 10pt;
             text-align: center;",
              "Universidade Federal do Oeste do Pará - UFOPA"),

            p(style= "font-size: 10pt;
             text-align: center;","Campus Monte Alegre"),

            #Usado para criar um espaço entre o Título e a descrição
            br(),

            #Link com um determinado nome
            a("Currículo Lattes", href= "http://lattes.cnpq.br/8643319250252707",
              style="font-size: 10pt;
             text-align: center;")
          )
        )
        )
      ),
      #------------ 3 Linha ----------
      # Informação das instituições
      fluidRow(
        tags$div(
          align = "center",
          style = "width: 100%; text-align: center;",
          # Linha horizontal
          hr(style = "border-top: 1px solid #000; width: 100%; text-align: center;"),
          # Título
          h1("Apoio", style = "font-family: 'Times New Roman'; font-size: 30pt; font-weight: bold;margin: auto;"),
          # Imagens
          tags$img(src = "www/logo_curso", style = "width: 100%; height: auto; max-width: 15%; text-align: center; overflow-y: auto;", class = "img-circle"),
          tags$img(src = "www/logo_campus", style = "width: 100%; height: auto; max-width: 20%; text-align: center; overflow-y: auto;", class = "img-circle"),
          tags$img(src = "www/ufla.png", style = "width: 100%; height: auto; max-width: 20%; text-align: center; overflow-y: auto;"),
          tags$img(src = "www/ufv.png", style = "width: 100%; height: auto; max-width: 20%; text-align: center; overflow-y: auto;"),

          # Estilo adicional para centralizar
          style = "max-width: 1024px; margin: auto;"
        )
      )
      #-----------------------------------------------
    )
  )
}

#' dev Server Functions
#'
#' @noRd
mod_dev_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_dev_ui("dev_1")

## To be copied in the server
# mod_dev_server("dev_1")
