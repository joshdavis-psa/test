node_vec <- c(
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
  from = c(),
  to   = c()
)

graph <- create_graph(nodes_df = nodes, edges_df = edges)

render_graph(graph)
