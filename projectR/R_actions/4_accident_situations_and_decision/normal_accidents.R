library(dplyr)
normal_accidents <- df_all %>% select(accident_situation, number_of_nodes, number_of_loop_units) %>% filter(number_of_loop_units == "0")
