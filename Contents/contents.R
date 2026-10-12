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

# Build contents for this folder

library(DiagrammeR)
library(dplyr)

nodes <- create_node_df(
  n = length(node_vec),
  label = node_vec,
  type = "step"
)

edges <- create_edge_df(
  from = c(17, 15, 14, 14, 13, 12, 11, 10, 9,  9,  9,  7, 7, 6, 5, 3, 3, 2, 1),
  to   = c(18, 17, 16, 15, 14, 16, 13, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2)
)

graph <- create_graph(nodes_df = nodes, edges_df = edges)

render_graph(graph)

# If desired, programmatically create sub-folders too

update_subfolders <- FALSE

if (update_subfolders) {
  
  library(janitor)
  library(rstudioapi)
  
  base_path <- dirname(getActiveDocumentContext()$path)
  
  subfolder_vec <- paste0(
    seq_along(node_vec), ". ",
    node_vec
  )
  
  for (subfolder in subfolder_vec) {
    
    subfolder_path <- file.path(base_path, subfolder)
    
    if (!file.exists(subfolder_path)) {
      dir.create(subfolder_path, recursive = TRUE, showWarnings = FALSE)
    }
    
    script_path <- file.path(
      subfolder_path,
      subfolder %>%
        make_clean_names() %>%
        sub("^[^_]*_", "", .) %>%
        paste0(".R")
    )
    
    if (!file.exists(script_path)) {
      file.create(script_path)
    }
  }
}
