node_vec <- c("Fundamentals",
"Algebra",
"Analysis",
"Calculus",
"Probability",
"Statistics",
"Phenomenological modelling"
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
  from = c(1, 1, 2, 2, 3, 3, 4, 4, 5, 6),
  to   = c(2, 3, 4, 6, 4, 5, 5, 7, 6, 7)
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
