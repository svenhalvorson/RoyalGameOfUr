#' @export
#' @example
#' lil_triangle = tibble(
#' x1 = c(0, 0, 1),
#' y1 = c(0, 1, 0)
#' )
#'
#' basic_plot() +
#'   geom_segment(data = edges()) +
#'   geom_segment(
#'     data = triangle(lil_triangle),
#'     color = 'red'
#'   ) +
#'   geom_segment(
#'     data = stretch(triangle(lil_triangle), 1.5, 2),
#'     color = 'green'
#'   )

stretch = function(
  df,
  x_stretch = 1,
  y_stretch = 1
){

  df %>%
    mutate(
      across(
        any_of(c('x1', 'x2')),
        ~ .x*x_stretch
      ),
      across(
        any_of(c('y1', 'y2')),
        ~ .x*y_stretch
      )
    )


}

