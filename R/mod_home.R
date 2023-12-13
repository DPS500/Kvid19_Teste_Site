#' home UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom Biostrings readAAStringSet
#' @importFrom BiocManager install
#' @importFrom stringr str_locate str_sub
#' @importFrom kmer cluster
#' @importFrom XVector subseq
#' @importFrom factoextra fviz_dend
#' @importFrom ggplot2 theme_gray
#' @importFrom shinydashboardPlus boxSidebar updateBoxSidebar
#----- Instalando Biostrings a partir de BiocManager -----
# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("Biostrings")
#---------------------------------------------------------
mod_home_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      #----- Importando arquivo .fasta -----
      box(width = 12,
          fileInput(ns("file"),
                    div("Escolha seus arquivos no formato ", em(".fasta"), ":"),
                    multiple = TRUE,
                    accept = c("text/fasta",
                               "text/x-fasta",
                               ".fasta",
                               ".fa"))
          # )
      ),
      #----- Plotando o Gráfico (Dendrograma) -----
      shinydashboardPlus::box(
        title = "Dendrograma",
        # closable = FALSE,
        width = 12,
        height = "500px",
        solidHeader = FALSE,
        collapsible = TRUE,
        # Sidebar de configuração do plot (dendograma)
        sidebar = shinydashboardPlus::boxSidebar(
          id = "mycardsidebar",
          width = 50,
          sliderInput(
            inputId = ns("groupk"),
            label = "Número de grupos (k):",
            min = 2,
            max = 6,
            value = 2
          )
        ),
        # Dendograma plot
        # plotOutput(ns("distPlot")) ,
        plotOutput(ns("dend")) # Gráfico Dendograma
      )
    )
  )
}

#' home Server Functions
#'
#' @noRd
mod_home_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    #----- Home -----
    #----- Plotando o Gráfico (Dendograma) -----
    output$dend <- renderPlot({
      req(input$file) # REQUERIDO Garante que o usuário tenha carregado um arquivo
      #----- Importando arquivo .fasta (banco de dados do app) ----
      # browser() # Shiny Debugging
      # Carregando banco de dados de COVID-19 registrados (Genoma completo)
      (fasta_files <- list.files(path = "./data" , pattern = '\\.fasta$'))
      # Read the nucleotide sequences in FASTA format.
      sequences <- Biostrings::readAAStringSet(paste0("data/",fasta_files))
      #----- Importando arquivo .fasta (do usuário) ----
      new_seq <- Biostrings::readAAStringSet(input$file$datapath)
      sequences <- c(sequences,new_seq) # Juntando as sequencias = bando de dado + usuários
      # browser() # Shiny Debugging
      # Título ID do código
      texto <- names(sequences)
      # Use str_locate() para encontrar a posição do "|"
      posicao <- stringr::str_locate(texto, "\\| | \\S")
      # Extraia a parte da string antes do "|"
      parte_desejada <- stringr::str_sub(texto, start = 1, end = posicao[1] - 1)
      # Nomeando as sequencias .fast do bando de dados e importada pelo usuário
      names(sequences) <- parte_desejada
      #---------------------------
      # browser() # Shiny Debugging
      # Count the number of base pairs in each sequence
      (lengths <- lengths(sequences))
      # Print the length of the shortest sequence
      (shortest_length <- min(lengths))
      # Trim sequences to the shortest length
      trimmed_sequences <- XVector::subseq(sequences, end = shortest_length)
      # Convert to a matrix for grouping
      seqs <- as.matrix(trimmed_sequences)
      # Generate clustering. Here, k=6, but you can experiment with other values of k.
      # Remember that for k = n, you need to set nstart = n.
      w <- kmer::cluster(seqs, k = 6, nstart = 6, residues = NULL, gap = "-")
      # Plotando gráfico
      # plot(w, main = "", horiz = TRUE)
      #--------------- Melhorando plot -----
      # browser()
      # Ordem do clusteres do dendrograma
      index <- stats::order.dendrogram(w)
      # Crie um vetor de cores para os elementos do dendrograma
      # cores[index]
      cores <- c(rep("black",17),rep("red",length(new_seq)))
      # cores <- c(rep("black",17),rainbow(length(new_seq)))
      # Gráfico dendograma
      factoextra::fviz_dend(w,
                            k = input$groupk, # corte em 4 grupos
                            horiz = F,
                            cex = 0.85, # tamanho do rótulo
                            k_colors = "jco",
                            rect_fill = TRUE,
                            # rect_border = "jco",
                            rect = TRUE,
                            ylim = c(-0.001,0.004),
                            label_cols = cores[index],
                            color_labels_by_k = TRUE, # cores por grupo
                            ggtheme = ggplot2::theme_gray() #mudar tema
      )
      #-----------------------------------
    })
    #-------------------------------------------
  })
}

## To be copied in the UI
# mod_home_ui("home_1")

## To be copied in the server
# mod_home_server("home_1")
