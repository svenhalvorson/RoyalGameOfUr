# The geometry I want to use will consider this board:
# |-|-|-|-| |-|-|
# |-|-|-|-|-|-|-|
# |-|-|-|-|-|-|-|
# |-|-|-|-| |-|-|

# Where the bottom left point is the origin of a cartesian plane.
# this function will generate a board (set of edges) as a data frame

#' @export
#' @example
#' edges() %>%
#'   ggplot(
#'     aes(
#'       x = x1,
#'       xend = x2,
#'       y = y1,
#'       yend = y2
#'     )
#'   ) +
#'   geom_segment() +
#'   coord_fixed()

edges = function(
  color = 'black'
){

  # Points where the edges reside in:
  h_range = 0:7
  v_range = 0:3

  board_points = expand_grid(
    x = h_range,
    y = v_range
  )

  # Our edges are pairs of points with one coordinate in common
  # Filter on that:
  board_points %>%
    mutate(key = 1) %>%
    inner_join(
      mutate(board_points, key = 1),
      by = 'key',
      suffix = c("1", "2")
    ) %>%
    select(-key) %>%
    filter(
      # One coordinate in common
      (x1 == x2) | (y1 == y2),
      # Not points
      (x1 != x2) | (y1 != y2)
    ) %>%
    # Retain all the one unit sticks:
    filter(
      (x2 - x1 == 1) | (y2 - y1 == 1),
      # Remove two edges to make the gaps:
      (y1 != 0) | (y2 != 0) | (x1 != 4),
      (y1 != 3) | (y2 != 3) | (x1 != 4)
    ) %>%
    mutate(color = color)


}
