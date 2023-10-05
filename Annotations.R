library(ggplot2)

# ANNOTATIONS
p <- ggplot(faithful, aes(x = eruptions, y = waiting)) +
  geom_point()
p +
  annotate("text", x = 3, y = 48, label = "Group 1",
           family = "sans", fontface = "bold", colour = "black", size = 5) +
  annotate("text", x = 4.5, y = 66, label = "Group 2",
           family = "serif", fontface = "italic", colour = "black", size = 4)

# Maths formulas
p <- ggplot(data.frame(x = c(-3,3)), aes(x = x)) +
  stat_function(fun = dnorm)
p +
  annotate("text", x = 0, y = 0.05, parse = TRUE, size = 4,
           label = "'Function:  ' * y==frac(1, sqrt(2*pi)) * e^{-x^2/2}")

# ADDING LINES
library(gcookbook)
hw_plot <- ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = sex)) +
  geom_point()

# Add horizontal and vertical lines
hw_plot +
  geom_hline(yintercept = 60) +
  geom_vline(xintercept = 14)

# Add angled line
hw_plot +
  geom_abline(intercept = 37.4, slope = 1.75)

# Adding the mean
library(dplyr)
hw_means <- heightweight %>%
  group_by(sex) %>%
  summarise(heightIn = mean(heightIn))
hw_plot +
  geom_hline(
    data = hw_means,
    aes(yintercept = heightIn, colour = sex),
    linetype = "dashed",
    size = 1
  )

# Adding an arrow
library(gcookbook)
p <- ggplot(filter(climate, Source == "Berkeley"), aes(x = Year, y = Anomaly10y)) +
  geom_line()
library(grid)
p +
  annotate("segment", x = 1850, xend = 1820, y = -.8, yend = -.95,
           colour = "blue", size = 2, arrow = arrow()) +
  annotate("segment", x = 1950, xend = 1980, y = -.25, yend = -.25,
           arrow = arrow(ends = "both", angle = 90, length = unit(.2,"cm")))

# Adding a rectangle to remark a region
library(gcookbook)
p <- ggplot(filter(climate, Source == "Berkeley"), aes(x = Year, y = Anomaly10y)) +
  geom_line()
p +
  annotate("rect", xmin = 1950, xmax = 1980, ymin = -1, ymax = 1,
           alpha = .1,fill = "blue")

# HIGHLIGHTING JUST AN ELEMENT
library(dplyr)
pg_mod <- PlantGrowth %>%
  mutate(hl = recode(group, "ctrl" = "no", "trt1" = "no", "trt2" = "yes"))
ggplot(pg_mod, aes(x = group, y = weight, fill = hl)) +
  geom_boxplot() +
  scale_fill_manual(values = c("grey85", "#FFDDCC"), guide = FALSE)
# Si hi ha pocs elements, no cal crear una nova columna
ggplot(PlantGrowth, aes(x = group, y = weight, fill = group)) +
  geom_boxplot() +
  scale_fill_manual(values = c("grey85", "grey85", "#FFDDCC"), guide = FALSE)

# ADDING ERRORBARS
library(gcookbook)
library(dplyr)
ce_mod <- cabbage_exp %>%
  filter(Cultivar == "c39")

# With a bar graph
ggplot(ce_mod, aes(x = Date, y = Weight)) +
  geom_col(fill = "white", colour = "black") +
  geom_errorbar(aes(ymin = Weight - se, ymax = Weight + se), width = .2)

# With a line graph
ggplot(ce_mod, aes(x = Date, y = Weight)) +
  geom_line(aes(group = 1)) +
  geom_point(size = 4) +
  geom_errorbar(aes(ymin = Weight - se, ymax = Weight + se), width = .2)

# Good: dodge width set to same as bar width (0.9)
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge") +
  geom_errorbar(aes(ymin = Weight - se, ymax = Weight + se),
                position = position_dodge(0.9), width = .2)

pd <- position_dodge(.3)  # Save the dodge spec because we use it repeatedly

ggplot(cabbage_exp, aes(x = Date, y = Weight, colour = Cultivar, group = Cultivar)) +
  geom_errorbar(
    aes(ymin = Weight - se, ymax = Weight + se),
    width = .2,
    size = 0.25,
    colour = "black",
    position = pd
  ) +
  geom_line(position = pd) +
  geom_point(position = pd, size = 2.5)


