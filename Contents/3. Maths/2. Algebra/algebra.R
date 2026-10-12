node_vec <- c("Relations",
"Equivalence relations",
"Functions",
"One-sided limits of functions",
"Limits of functions",
"Continuity",
"Integrals",
"Operations",
"Binary operations",
"Groups",
"Addition",
"The natural numbers",
"Derivatives",
"Antiderivatives/primitives",
"Sigma notation",
"Subtraction",
"The integers",
"Sequences: functions from the naturals",
"Limits of sequences",
"Rings",
"Multiplication",
"Natural exponents",
"Fields",
"The rational numbers",
"Negative exponents",
"Division",
"Vector spaces",
"Properties of vectors",
"Linear maps"
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
  from = c(27, 27, 26, 25, 23, 21, 20, 20, 18, 16, 14, 13, 12, 12, 11, 11, 11, 10, 10, 10, 9,  8, 6,  5,  5, 4, 4, 3, 3, 1, 1),
  to   = c(29, 28, 24, 26, 24, 22, 23, 22, 19, 17, 7,  14, 18, 17, 16, 15, 12, 27, 20, 12, 10, 9, 13, 19, 6, 7, 5, 8, 4, 3, 2)
)

graph <- create_graph(nodes_df = nodes, edges_df = edges)

render_graph(graph)
