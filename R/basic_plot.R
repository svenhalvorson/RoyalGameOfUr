#' @export
#' @example
# basic_plot() +
#   geom_segment(
#     data = make_edges(),
#     aes(
#       xend = x2,
#       yend = y2
#     )
#   )

basic_plot = function(){

  ggplot(
    data = NULL
  ) +
    coord_fixed() +
    theme_classic() +
    theme(
      axis.line = element_blank(),
      axis.ticks = element_blank(),
      axis.text = element_blank(),
      axis.title = element_blank()
    )

}

