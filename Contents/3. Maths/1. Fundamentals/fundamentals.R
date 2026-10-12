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
  from = c(1, 2, 3, 4, 5, 6, 6, 6,  8, 9),
  to   = c(2, 3, 6, 6, 6, 7, 8, 11, 9, 10)
)

graph <- create_graph(nodes_df = nodes, edges_df = edges)

render_graph(graph)
