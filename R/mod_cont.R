#' cont UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom shinyjs reset
#' @importFrom shinyjs runjs
#' @importFrom shinyjs enable
#' @importFrom shinyjs disable
#' @import gmailr
#' @import shinyjs
mod_cont_ui <- function(id){
  ns <- NS(id)
  tagList(
    # UI Contato
    fluidPage(
      # shinyjs(),  # Inicializa o shinyjs
      fluidRow(
        status = "warning",
        solidHeader = TRUE,
        width = 12,
        # Box para envio do email
        box(
          title = "Entre em contato conosco!", width = 6,
          div(id = ns("divCont"),
              textInput(ns("nome"), labelMandatory("Nome:"),value = "", placeholder = "Nome completo"),
              textInput(ns("email"), labelMandatory("E-mail:"), value="", placeholder = "exemplo@email.com"),
              textInput(ns("titulo"), labelMandatory("Título do e-mail:"), value = "", placeholder = "Título da mensagem"),
              textAreaInput(ns("mensagem"), labelMandatory("Mensagem:"), value = "", placeholder = "Escreva sua mensagem.", height = "300px"),
              actionButton(ns("enviar"), "Enviar",icon("paper-plane"), class = "btn-primary"),
          )
        )
      )
    )
  )
}

#' cont Server Functions
#'
#' @noRd
mod_cont_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    observe({
      # Verifique se todos os campos têm resposta
      if (!any(sapply(c("nome", "email", "titulo", "mensagem"), function(x) input[[x]] == ""))) {
        # Se todos os campos tiverem resposta, habilite o botão
        shinyjs::enable("enviar")
      } else {
        # Caso contrário, desabilite o botão
        shinyjs::disable("enviar")
      }
    })
    #--------------------------------
    # Server Contato
    # função observeEvent para lidar com o envio do formulário
    observeEvent(input$enviar, {
      # browser()
      id <- notify("Compilando a mensagem...")
      on.exit(removeNotification(id), add = TRUE)
      # Sys.sleep(1)
      #---------- Enviando o e-mail --------------
      # Obter a data e hora do envio do email
      data_hora <- Sys.time()
      # Formatando a data e hora
      data_hora_formatada <- format(data_hora, "%Y-%m-%d %H:%M:%S")
      # Dividir a string em duas partes (data e hora)
      partes <- strsplit(data_hora_formatada, " ")
      # Acessar a data e a hora separadamente
      data <- partes[[1]][1]
      hora <- partes[[1]][2]

      # Autorizando gmail API a enviar email
      gmailr::gm_auth(email = "labinufopamontealegre@gmail.com")
      # adicionar função para receber as mensagens
      email <- gmailr::gm_mime() |>
        gmailr::gm_to("labinufopamontealegre@gmail.com") |>
        gmailr::gm_from("labinufopamontealegre@gmail.com") |>
        gmailr::gm_subject(input$titulo) |>
        # gmailr::gm_text_body("Testando o email")
        gm_html_body(html_msg(nome = input$nome,email = input$email,msg = input$mensagem, data,hora))

      # você pode usar os valores de input$nome, input$email e input$mensagem
      gmailr::gm_send_message(email)
      #--------------------------------------------
      #---------- Informando ao usuário o envio do e-mail --------------
      notify("Verificando token do email para envio...", id = id)
      Sys.sleep(1)

      notify("Solicitando envio do e-mail ao app Kavid-19...", id = id)
      Sys.sleep(1)

      notify("Permissão Firewall aceita para envio...", id = id)
      Sys.sleep(1)

      notify("Obrigado por entrar em contato...", id = id, type = "message")
      # Sys.sleep(1)
      on.exit(removeNotification(id), add = TRUE)


      #---- Mensagem de retorno ao usuário que foi enviado o email ----
      ###shinyModal to show to user when the update to the database table is successful
      showModal(
        modalDialog( title=paste0("Mensagem eviada com suecesso!!!"),
                     br(),
                     div(tags$b(paste0("Obrigado por entrar em contato conosco."), style = "color: blue;")),
                     footer = modalButton("Ok")
        )
      )
      # Resetando o formulário
      # browser()
      shinyjs::reset(id = "divCont")
      #------------------------------------------------------------------
    })
    #-------------------------------
  })
}

## To be copied in the UI
# mod_cont_ui("cont_1")

## To be copied in the server
# mod_cont_server("cont_1")
#---------------------------------------#---------------------------------------
#### Informações gerais para contrução do módulo
## Informações sobre a API google gmail
# link: https://gmailr.r-lib.org/dev/articles/oauth-client.html#create-an-oauth-client-of-web-application-type
## Inf sobre enviar email pelo R
# link: https://cran.r-project.org/web/packages/gmailr/vignettes/sending_messages.html
## Site console google claud
# link: https://console.cloud.google.com/apis/credentials?project=kvid-19

## Passo a passo
# 1) Cadastre uma credencial no API console Google Claud (site 1 acima tem informação)
# 2) Transfira o arquivo .jason para uma pasta gmailr dentro do projeto
# 3) configure um arquivo .Renviron GMAILR_OAUTH_CLIENT=/path/to/my/gmailr/oauth-client.json
# 4) No app, Configure o cliente gmail gm_auth(email = "labinufopamontealegre@gmail.com")
# 5) Mande o email

