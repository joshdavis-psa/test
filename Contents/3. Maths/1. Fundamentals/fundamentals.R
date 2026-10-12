node_vec <- c("Being",
"Existence",
"Identity",
"(Causation and) implication",
"Sets",
"ZF axioms",
"Axiom of choice",
"What is a space?",
"Topological spaces",
"Convergence",
"Cartesian product"
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
  from = c(9,  8, 6,  6, 6, 5, 4, 3, 2, 1),
  to   = c(10, 9, 11, 8, 7, 6, 6, 6, 3, 2)
)

graph <- create_graph(nodes_df = nodes, edges_df = edges)

render_graph(graph)
