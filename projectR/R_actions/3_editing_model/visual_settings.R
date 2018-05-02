################## gorsellestirme ayarlari ######################################################
library(igraph)
library(RColorBrewer)
memory.limit(50000)

V(BUG)$label <- V(BUG)$name
V(BUG)[V(BUG)$att == "drv"]$label <- "driver"
V(BUG)[V(BUG)$att == "drv"]$shape <- "square"
V(BUG)[V(BUG)$att == "chs"]$shape <- "rectangle"
V(BUG)[V(BUG)$type == "FALSE"]$shape <- "circle"
V(BUG)[V(BUG)$type == "TRUE"]$color <- "grey"



##### her bir kaza ilce koduna kendisine özel renk atama#############################################

colorr <- function(vector){
  n = length(unique(vector))
  N = length(vector)
  u = unique(vector)
  pallete <- rainbow(n)
  c <- c()
  for( i in 1:N){
    number <- which(u %in% vector[i])
    c[i] <- pallete[number]
  }
  return(c)
}

ff <- colorr(as.vector(V(BUG)$att[which(V(BUG)$type == "FALSE")]))
V(BUG)[V(BUG)$type == "FALSE"]$color <- ff
