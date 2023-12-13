

sample(x = 1:9,size = 17,replace = T)


# Defina a função sample
sample_function <- function() {
  sample(x = 1:9, size = 19, replace = TRUE)
}

# Use a função replicate para repetir a chamada da função sample 25 vezes
result_matrix <- replicate(15, sample_function())

# Examine os resultados
print(result_matrix)

seqs <- result_matrix
# Generate clustering. Here, k=6, but you can experiment with other values of k.
# Remember that for k = n, you need to set nstart = n.
w <- kmer::cluster(seqs, k = 3, nstart = 6, residues = NULL, gap = "-")


# Hierarchical clustering
res.hc <- hclust(dist(seqs))
km.clust <- kmeans(seqs,4)$cluster
km.clust[res.hc$order]

factoextra::fviz_dend(w, k = 4, # corte em 4 grupos
                      horiz = F,
                      cex = 0.7, # tamanho do rótulo
                      k_colors = "jco",
                      rect_fill = TRUE,
                      rect_border = "jco",
                      rect = TRUE,
                      label_cols =  km.clust[2],
                      color_labels_by_k = TRUE, # cores por grupo
                      ggtheme = ggplot2::theme_gray() #mudar tema
)
#================================================

# Instale o pacote factoextra se ainda não o tiver instalado
# install.packages("factoextra")

# Carregue os pacotes necessários
library(factoextra)
library(cluster)

# Crie um exemplo de dendrograma
set.seed(123)
data <- matrix(rnorm(60), ncol = 3)
hc <- hclust(dist(data), method = "ward.D2")

# Use a função fviz_dend para plotar o dendrograma e personalize os eixos X e Y
fviz_dend(hc, k_colors = "black", k = 3, cex = 0.6, rect = TRUE, horiz = TRUE,
          main = "Dendrograma", xlab = "Distância Euclidiana", ylab = "Clusters",
          rect_border = "black", rect_fill = TRUE, rect_color = "black",
          rect_alpha = 0.2, rect_border_alpha = 1, xlim = c(0, 2.5), ylim = c(0, 4))

#===============================================
# Instale o pacote factoextra se ainda não o tiver instalado
# install.packages("factoextra")

# Carregue os pacotes necessários
library(factoextra)
library(cluster)

# Crie um exemplo de dendrograma
set.seed(123)
data <- matrix(rnorm(60), ncol = 3)
hc <- hclust(dist(data), method = "ward.D2")

# Defina as cores para cada grupo
cores <- c(rep("black", nrow(data) - 1), "red")[18:20]

# Use a função fviz_dend para plotar o dendrograma com uma amostra colorida de vermelho
fviz_dend(hc, k_colors = cores, k = 3, cex = 0.6, rect = TRUE, horiz = TRUE,
          main = "Dendrograma", xlab = "Distância Euclidiana", ylab = "Clusters",
          rect_border = "black", rect_fill = TRUE, rect_color = "black",
          rect_alpha = 0.2, rect_border_alpha = 1, xlim = c(0, 2.5), ylim = c(0, 4))

# Instale os pacotes se ainda não tiver instalado
# install.packages(c("factoextra", "dendextend"))

# Carregue as bibliotecas necessárias
library(factoextra)
library(cluster)
library(dendextend)

# Crie um exemplo de dendrograma
set.seed(123)
data <- matrix(rnorm(60), ncol = 3)
hc <- hclust(dist(data), method = "ward.D2")

# Identifique os ramos que você deseja colorir (por exemplo, amostra 1)
branches_to_color <- 1

# Use color_branches para colorir os ramos desejados (por exemplo, vermelho)
hc_colored <- color_branches(hc, branches = branches_to_color, col = "red")

# Use fviz_dend para plotar o dendrograma com os ramos coloridos
fviz_dend(hc_colored, k_colors = "black", k = 3, cex = 0.6, rect = TRUE, horiz = TRUE,
          main = "Dendrograma", xlab = "Distância Euclidiana", ylab = "Clusters",
          rect_border = "black", rect_fill = TRUE, rect_color = "black",
          rect_alpha = 0.2, rect_border_alpha = 1, xlim = c(0, 2.5), ylim = c(0, 4))

