###########donguleri (girthleri) iceren networkleri bulma ve kaza gruplari ile ortak tablo haline getirme#########
library(data.table)
girth_comp <- sapply(dec_graph, function(x){girth(x)$girth})
graph_girths <- data.frame(girth_comp) 

