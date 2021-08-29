#' @export
#' @example basic_plot() + geom_segment(data = edges())


basic_plot = function(){

  ggplot(
    data = NULL,
    aes(
      x = x1,
      xend = x2,
      y = y1,
      yend = y2
    )
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

