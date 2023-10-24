library(ggplot2)

pg_plot <- ggplot(PlantGrowth, aes(x = group, y = weight, fill = group)) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Pastel2")

# Delete the legend
pg_plot +
  guides(fill = FALSE)

# Put the legend on top
pg_plot +
  theme(legend.position = "top")

# Put the legend inside
pg_plot +
  theme(legend.position = c(.8, .3))
pg_plot +
  theme(legend.position = c(1, 0), legend.justification = c(1, 0)) +
  theme(legend.background = element_rect(fill = "white", colour = "black"))  # Improving the style
pg_plot +
  theme(legend.position = c(1, 0), legend.justification = c(1, 0)) +
  theme(legend.background = element_blank()) +  # Remove overall border
  theme(legend.key = element_blank())           # Remove border around each item
pg_plot +
  theme(legend.position = c(1, 0), legend.justification = c(1, 0))

# Change the order of the elements
pg_plot <- ggplot(PlantGrowth, aes(x = group, y = weight, fill = group)) +
  geom_boxplot()
pg_plot +
  scale_x_discrete(limits = c("trt1", "trt2", "ctrl")) +                        # Changing the order of the plot
  scale_fill_brewer(palette = "Pastel2", limits = c("trt1", "trt2", "ctrl"))    # Changing the order of the legend

# Invert the order of the legend
pg_plot +
  guides(fill = guide_legend(reverse = TRUE))

# Change the title of the legend
pg_plot + 
  labs(fill = "Condition")
# Delkete the title of the legend
pg_plot + 
  guides(fill = guide_legend(title = NULL))

# Change the tags of the legend
pg_plot +
  scale_fill_discrete(labels = c("Control", "Type 1\ntreatment", "Type 2\ntreatment")) +
  theme(legend.text = element_text(lineheight = .8), legend.key.height = unit(1, "cm")) # Make the legend bigger


