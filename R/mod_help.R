#' help UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @import shiny
#' @import shinydashboard
#' @import htmltools
#' @importFrom shiny NS tagList
#


mod_help_ui <- function(id){
  ns <- NS(id)
  tagList(
    tabPanel("Ajuda",
             fluidRow(box (width = 12,
                  h2("Informações para os usuários", style= "font-size: 20pt; text-align: center;font-weight: bold;"),

  # Descrição do Aplicativo
                h2("Sobre o Aplicativo", style = "font-size: 16pt; font-weight: bold;"),

                p( "Este aplicativo é uma ferramenta de a análise de sequências genômicas do vírus SARS-CoV-2, por meio do
               método k-mer sem a necessidade de alinhamento de sequências. O método k-mer, uma abordagem  utilizada na bioinformática,
               é fundamental para a identificação de padrões genéticos e a compreensão da diversidade viral.", style = "text-align: justify"),

                p(" O aplicativo compara sequências genômicas, em formato " ,strong(".fasta ")," com as sequências presentes no branco de dados, e retorna um dendograma,
               com os grupos",strong("k")," podendo definir o tamanho do k-mer, e a quantidade de grupos que deseja visualizar.", style = "text-align: justify"),

   # Apresentação da Base de Dados

                  h2("Base de Dados Interna", style = "font-size: 16pt; font-weight: bold;"),

                  ("Estas são as sequências do genoma do SARS-CoV-2 que serão comparadas com as novas sequências inseridas."),
                  tags$ul(
                    tags$li(strong("MZ477746.1 "), " | BRAZIL /PR-HF104/ 2021"),
                    tags$li(strong("MZ477745.1 "), " | BRAZIL /PR-HF102/ 2021"),
                    tags$li(strong("MZ477753.1 "), " | BRAZIL /PR-HF111/ 2021"),
                    tags$li(strong("MZ477748.1 "), " | BRAZIL /PR-HF106/ 2021"),
                    tags$li(strong("MZ397170.1 "), " | BRAZIL /1808/ 2021"),
                    tags$li(strong("MZ477756.1 "), " | BRAZIL /PR-HF114/ 2021"),
                    tags$li(strong("MZ477802.1 "), " | BRAZIL /PR-HF302/ 2021"),
                    tags$li(strong("MZ169912.1 "), " | BRAZIL /1431/ 2021"),
                    tags$li(strong("OQ521707.1 "), " | BRAZIL /21890654NCC/ 2021"),
                    tags$li(strong("OQ521691.1 "), " | BRAZIL /21890319MSM/ 2021"),
                    tags$li(strong("OQ521823.1 "), " | BRAZIL /21892621JBA/ 2021"),
                    tags$li(strong("MZ419859.1 "), " | BRAZIL /ICO10208/ 2020"),
                    tags$li(strong("MZ419858.1 "), " | BRAZIL /ICO10202/ 2020"),
                    tags$li(strong("MZ264787.1 "), " | BRAZIL /CD1739-P4/ 2020"),
                    tags$li(strong("OL442154.1 "), " | BRAZIL /HRMS_1631/ 2020"),
                    tags$li(strong("OQ430686.1 "), " | BRAZIL /528/ 2020"),
                    tags$li(strong("NC_045512.2"), " | Wuhan-Hu-1/ 2020" )),

  # Como usar o aplicativo


                  h2("Como Usar o Aplicativo:", style = "font-size: 16pt; font-weight: bold;"),

                  p("Para começar, carregar seus próprios arquivos em formato " ,strong(".fasta ")),

                  p(strong("Etapas", style = "font-size: 12pt; font-weight: bold;"),

                  tags$ol(
                  tags$li("Ao iniciar o aplicativo navegue para a aba", strong("Home")),
                  tags$li("Clique em ", strong(" Browse")," : para carregar os arquivos contendo as sequências genômicas no formato ", strong(" .fasta.")),
                  tags$li("Carregue os Arquivos",strong(" .fasta"),"desejados e clique em ", strong("Abrir"), "."),
                  tags$li("Visualize o Dendrograma na Área de Plotagem: gerado com base nas sequências carregadas."),
                  tags$li("Para Alterar o Número de grupos exibidos no dendrograma, clique", strong("More"),". O tamanho do k-mer pode ser ajustado usando o controle deslizante, pode variar de 2 a 6."),
                  tags$li("Clique em", strong("More"), "Novamente:"),
                  tags$li("Visualize o Novo Dendrograma: "))

                  ,

                           #video
          #video
          box( width = 12,
                  h2("Assistindo aos Vídeos:",  style = "font-size: 12pt; font-weight: bold;"),
                   p("Assista o vídeo abaixo sobre como realizar utilizar esse aplicativo."),
              tags$video(id = "myvideo",
                                   src = "www/video.mp4",
                                   type = "video/mp4",
                                   controls = TRUE,
                                   autoplay = TRUE,
                                   loop = TRUE,
                                   width = "100%",
                                   height = "auto"),
              br(),





             h4("Mais:"),


             p("Se encontrar algum problema ou tiver dúvidas, pode entrar em contato conosco através da aba",strong("Contato ")," para suporte."),

    )
   )
  )
 )
)
)
}

#' help Server Functions
#'
#' @noRd
mod_help_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_help_ui("help_1")

## To be copied in the server
# mod_help_server("help_1")
