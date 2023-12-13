#' email_usr
#'
#' @description A utils function para enviar mensagens personalizadas
#'
#' @return O valor ser retornado da função é um vetor carateres composto por um corpo do email e o texto que o usuário escreveu com seu nome e email.
#'
#' @noRd
#'  @importFrom stringr str_glue

# Corpo do texto personalizado para enviar o email de cada usuário
## Parâmetros
## nome = nome da pessoa que esreve o email
## email = o e-mail da pessoal que escreve para entrarmos em contato
## msg = a mensage do usuário (corpo do texto)
html_msg <- function(nome,email,msg,data,hora){
  stringr::str_glue(
    "
    <body>
          <h1>Kvid-19 Relatório de Problema</h1>

          <p>Olá, Desenvolvedores,</p>

          <p>Gostaria de informar que encontrei um problema no aplicativo Kvid-19. Abaixo estão os detalhes do problema:</p>

          <p><strong>Descrição do Problema/E-mail:</strong></p>
          <p>{msg}</p>

          <p>Agradeço antecipadamente por sua atenção para resolver esse problema.</p>

          <p>Atenciosamente,<br>
          Nome: {nome}<br>
          E-mail: {email}<br>
          Data: {data}<br>
          Hora: {hora}</p>

          <p>Este e-mail foi gerado automaticamente. Por favor, não responda a este e-mail.</p>
    </body>
    </html>
    "
  )
}
# teste
# html_msg("Zarzar","carlos.zarzar@gmail.com","Testando o email msg!!!!")

### Mensage de notificação ao enviar o email para um feedback do usuário
notify <- function(msg, id = NULL, type = NULL) {
  showNotification(msg, id = id, duration = NULL, closeButton = FALSE, type = type)
}

#-----------------------------------------------------------------------------------------------------------#


#FUNÇÃO CRIADA PARA COLOCA UM ASTERÍSTICO NO LABEL PARA RESPOSTAS OBRIGATÓRIAS


labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}


# UTILIZANDO CSS PARA USO NO APP
appCSS <-c(
  ".mandatory_star { color: red; }
   .shiny-input-container { margin-top: 25px; }
   #submit_msg { margin-left: 15px; }
   #error { color: red; }
   body { background: #fcfcfc; }
   #header { background: #fff; border-bottom: 1px solid #ddd; margin: -20px -15px 0; padding: 15px 15px 10px; }
  "
)
#-------------------------------------------------------------



