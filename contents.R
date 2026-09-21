node_vec <- c("Personal origins of my most fundamental intuitions",
"Epistemology",
"Maths",
"Computer science",
"Physics",
"Chemistry",
"Biology",
"Geography",
"Psychology",
"Sociology",
"Economics",
"The arts",
"Politics",
"History",
"Apologetics",
"Fictional future speculations",
"Christianity",
"Ethics"
)

library(DiagrammeR)
library(dplyr)

nodes <- create_node_df(
  n = length(node_vec),
  label = node_vec,
  type = "step"
)

edges <- create_edge_df(
  from = c(1, 2, 3, 3, 5, 6, 7, 7, 9,  9,  10, 11, 13, 14, 14, 15, 17, 9,  12),
  to   = c(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 13, 14, 15, 16, 17, 18, 12, 16),
)

graph <- create_graph(nodes_df = nodes, edges_df = edges)

render_graph(graph)



library(janitor)

base_path <- "C:/Users/joshs/Downloads/test/Contents"

for (folder in node_vec) {
  
  folder_path <- file.path(base_path, folder)
  script_path <- file.path(
    folder_path,
    paste0(make_clean_names(folder), ".R")
  )
  
  dir.create(folder_path, recursive = TRUE, showWarnings = FALSE)
  
  if (!file.exists(script_path)) {
    file.create(script_path)
  }
}


























