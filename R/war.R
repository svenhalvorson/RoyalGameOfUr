# Let's make a spotted one with semi-random locations and
# colors based off some probabilities

get_warriors = function(n, k, color1, color2){

  first_color = tibble(
    x1 = runif(n = n),
    y1 = rchisq(n = n, df = k),
    color = color1
  ) %>%
    mutate(y1 = y1/max(y1)*0.6 + 0.1)

  tibble(
    x1 = runif(n = n),
    y1 = rchisq(n = n, df = k),
    color = color2
  ) %>%
    mutate(y1 = y1/max(y1)*0.6 + 0.1) %>%
    stretch(y_stretch = -1) %>%
    slide(y_slide = 1) %>%
    bind_rows(first_color)

}

plot_war = function(n, k){

  geom_point(
    data = get_dots(n, k),
    mapping = aes(
      x = x1,
      y = y1,
      col
    )
  )



}
