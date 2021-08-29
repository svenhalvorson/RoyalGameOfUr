# make a basic one with three triangles
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
#'   )
triangle = function(
  df,
  color = ''
){

  # vertices will be a data frame of thre rows with x1 and y1 as only
  # columns. Not going to worry about triangle inequality or nuh'un that
  df %>%
    bind_cols(
      tibble(
        x2 = vertices[['x1']][c(2, 3, 1)],
        y2 = vertices[['y1']][c(2, 3, 1)],
      )
    )

}


