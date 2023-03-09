library(ggplot2)
library(Cairo)

# Set seed for reproducibility
set.seed(123)

# Generate random data for stars
n_stars <- 2500
stars_df <- data.frame(
  x = runif(n_stars, min = -500, max = 500),
  y = runif(n_stars, min = -500, max = 500),
  size = runif(n_stars, min = 0.1, max = 0.5),
  color = sample(c("#FFFFFF", "#FFF0D4", "#FFE0A8", "#FFD48C", "#FFC070", "#FFB054"), n_stars, replace = TRUE, prob = c(0.7, 0.2, 0.9, 0.07, 0.6, 0.1))
)

# Define a new color palette using scale_color_gradient()
colors <- colorRampPalette(c("#FFD48C", "#FFC070", "#FFB054", "#FF8800"))

# Create the plot with the stars and constellations
p <- ggplot() +
  geom_point(data = stars_df, aes(x = x, y = y, size = ifelse(color == "#FFFFFF", size*1.5, size),
                                  color = color), show.legend = FALSE) +
  
  scale_size_continuous(range = c(0.1, 1)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "black"))

# Add lines connecting the stars that form constellations
p <- p + geom_path(data = constellation_df, aes(x = x, y = y, group = constellation),
                   color = "#FFFFFF", alpha = 0.5, linejoin = "round", lineend = "round")

# Manually set the colors using scale_color_manual()
colors_manual <- c("#FFF0D4", "#FFE0A8", "#FFD48C", "#FFC070", "#FFB054", "#FF8800")
names(colors_manual) <- c("A", "B", "C", "D", "E", "F")
p <- p + scale_color_manual(values = colors_manual)

# Adjust the plot size and add a title
p <- p + theme(plot.margin = margin(2, 2, 2, 2, "cm")) +
  ggtitle("Starry Night with Constellations")

# Save the plot as a PNG image with 3840 x 2160 pixels
ggsave("stars_with_manual_and_gradient_colors.png", p, width = 3840/96, height = 2160/96, dpi = 96)
       