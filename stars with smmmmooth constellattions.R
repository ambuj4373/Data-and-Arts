# Define the coordinates of the stars that form constellations
constellation_df <- data.frame(
  x = c(-300, -200, -100, -50, 0, 50, 100, 200, 300, 400),
  y = c(-200, -150, -250, -300, -200, -250, -150, -200, -250, -200),
  constellation = c("Orion", "Orion", "Orion", "Orion", "Orion", 
                    "Orion", "Orion", "Orion", "Orion", "Orion")
)

# Create the plot with the stars and constellations
p <- ggplot() +
  geom_point(data = stars_df, aes(x = x, y = y, size = ifelse(color == "#FFFFFF", size*1.5, size),
                                  color = color, alpha = ifelse(color == "#FFFFFF", 0.8, 0.4)),
             show.legend = FALSE) +
  scale_color_identity() +
  scale_size_continuous(range = c(0.1, 1)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "black"))

# Add lines connecting the stars that form constellations
p <- p + geom_line(data = constellation_df, aes(x = x, y = y, group = constellation),
                   color = "#FFFFFF", alpha = 0.5)

# Adjust the plot size and add a title
p <- p + theme(plot.margin = margin(2, 2, 2, 2, "cm")) +
  ggtitle("Starry Night with Constellations")
p
# Save the plot as a PNG image with 3840 x 2160 pixels
ggsave("stars_with_constellations.png", p, width = 3840/96, height = 2160/96, dpi = 96)





####---------------------------------####-----------------------------------###

# Define the coordinates of the stars that form constellations
constellation_df <- data.frame(
  x = c(-300, -200, -100, -50, 0, 50, 100, 200, 300, 400),
  y = c(-200, -150, -250, -300, -200, -250, -150, -200, -250, -200),
  constellation = c("Orion", "Orion", "Orion", "Orion", "Orion", 
                    "Orion", "Orion", "Orion", "Orion", "Orion")
)

# Create the plot with the stars and constellations
p <- ggplot() +
  geom_point(data = stars_df, aes(x = x, y = y, size = ifelse(color == "#FFFFFF", size*1.5, size),
                                  color = color, alpha = ifelse(color == "#FFFFFF", 0.8, 0.4)),
             show.legend = FALSE) +
  scale_color_identity() +
  scale_size_continuous(range = c(0.1, 1)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "black"))

# Add lines connecting the stars that form constellations
p <- p + geom_path(data = constellation_df, aes(x = x, y = y, group = constellation),
                   color = "#FFFFFF", alpha = 0.5, linejoin = "round", lineend = "round")

# Adjust the plot size and add a title
p <- p + theme(plot.margin = margin(2, 2, 2, 2, "cm")) +
  ggtitle("Starry Night with Constellations")

# Save the plot as a PNG image with 3840 x 2160 pixels
ggsave("stars_with_smooth_constellations.png", p, width = 3840/96, height = 2160/96, dpi = 96)

