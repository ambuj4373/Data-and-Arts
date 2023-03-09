




library(ggplot2)
library(Cairo)



set.seed(123)
n_stars <- 2500

stars_df <- data.frame(
  x = runif(n_stars, min = -500, max = 500),
  y = runif(n_stars, min = -500, max = 500),
  size = runif(n_stars, min = 0.1, max = 0.5),
  color = sample(c("#FFFFFF", "#FFF0D4", "#FFE0A8", "#FFD48C", "#FFC070", "#FFB054"), n_stars, replace = TRUE, prob = c(0.7, 0.2, 0.9, 0.07, 0.6, 0.1))
)

p <- ggplot(stars_df, aes(x = x, y = y)) +
  geom_point(aes(size = ifelse(color == "#FFFFFF", size*1.5, size),
                 color = color, alpha = ifelse(color == "#FFFFFF", 0.8, 0.4)), show.legend = FALSE) +
  scale_color_identity() +
  scale_size_continuous(range = c(0.1, 1)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "black"))
p


# save the plot as a PNG image with 3840 x 2160 pixels
ggsave("stars.png", p, width = 3840/96, height = 2160/96, dpi = 96)