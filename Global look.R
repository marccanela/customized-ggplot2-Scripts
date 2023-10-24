library(ggplot2)

# TITLE OF THE PLOT
library(gcookbook)
ggplot(heightweight, aes(x = ageYear, y = heightIn)) +
  geom_point() +
  ggtitle("Age and Height\nof Schoolchildren", "11.5 to 17.5 years old") +
  theme(plot.title = element_text(hjust = 0.5)) # To center the title

# DIFFERENT PLOT THEMES
library(gcookbook)
hw_plot <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) +
  geom_point()
# Default
hw_plot +
  theme_grey()
# Black-and-white theme
hw_plot +
  theme_bw()
# Minimal theme without background annotations
hw_plot +
  theme_minimal()
# Classic theme, with axis lines but no gridlines
hw_plot +
  theme_classic()

# Only show the inner horizontal lines of the plot
hw_plot +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )

# Only show the inner vertical lines of the plot
hw_plot +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank()
  )








