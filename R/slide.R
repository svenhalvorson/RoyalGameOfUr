#' @export
#' @example
#' lil_triangle = tibble(
#'   x1 = c(0, 0, 1),
#'   y1 = c(0, 1, 0)
#' )
#'
#' basic_plot() +
#'   geom_segment(data = edges()) +
#'   geom_segment(
#'     data = triangle(lil_triangle),
#'     color = 'red'
#'   ) +
#'   geom_segment(
#'     data = slide(triangle(lil_triangle), 1, 2),
#'     color = 'green'
#'   )

slide = function(
  df,
  x_slide = 0,
  y_slide = 0
){

  df %>%
    mutate(
      across(
        any_of(c('x1', 'x2')),
        ~ .x + x_slide
      ),
      across(
        any_of(c('y1', 'y2')),
        ~ .x + y_slide
      )
    )


}
