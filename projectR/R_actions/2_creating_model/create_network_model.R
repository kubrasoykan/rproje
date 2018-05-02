n_df <- n_df[, -1]
e_df <- e_df[, -1]

BUG <- graph_from_data_frame(e_df, directed = F, vertices = n_df)