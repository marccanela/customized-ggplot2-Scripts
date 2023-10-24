# SCATTERPLOT
library(ggplot2)
library(gcookbook)
library(dplyr)
ggplot(heightweight, aes(x = ageYear, y = heightIn)) +
  geom_point(size = 1)                                   # Smaller dots
# With empty dots
ggplot(heightweight, aes(x = ageYear, y = heightIn)) +
  geom_point(shape = 21)

# TWO VARIABLES
ggplot(heightweight, aes(x = ageYear, y = heightIn, shape = sex, colour = sex)) +  # We can also eliminate "shape" or "color"
  geom_point() +
  scale_shape_manual(values = c(1,2)) +         # Changing the numbers, we obtain different shapes and fillings
  scale_colour_brewer(palette = "Set1")         # Colors are more intense
# Gradations
ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = weightLb)) +
  geom_point(size = 3)
ggplot(heightweight, aes(x = ageYear, y = heightIn, color = sex, size = weightLb)) +
  geom_point(alpha = .5) +
  scale_colour_brewer(palette = "Set1")
  
# SOLVING THE EXCES OF DOTS
diamonds_sp <- ggplot(diamonds, aes(x = carat, y = price))
diamonds_sp +
  geom_point()
# 1st applying transparency
diamonds_sp +
  geom_point(alpha = .1)
diamonds_sp +
  geom_point(alpha = .01)
# 2n making a gradation
diamonds_sp +
  stat_bin2d(bins = 50) +
  scale_fill_gradient(low = "lightblue", high = "red", limits = c(0, 6000))
library(hexbin)
diamonds_sp +
  stat_binhex() +
  scale_fill_gradient(low = "lightblue", high = "red", limits = c(0, 6000))

# REGRESSION LINE
# With only one variable
hw_sp <- ggplot(heightweight, aes(x = ageYear, y = heightIn))
hw_sp +
  geom_point() +
  stat_smooth(method = lm, se = FALSE)      # Without confidence intervals
hw_sp +
  geom_point() +
  stat_smooth(method = lm, level = 0.95)    # With a confidence interval of 95%
# With two variables
hw_sp <- ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = sex)) +
  geom_point() +
  scale_colour_brewer(palette = "Set1")
hw_sp +
  geom_smooth(level = 0.95, fullrange = TRUE)                 # Curved line
hw_sp +
  geom_smooth(method = lm, level = 0.95, fullrange = TRUE)    # Curved line
# Adding the equation and the R^2
hw_sp +
  geom_point() +
  stat_smooth(method = lm, level = 0.95) +
  annotate("text", x = 16.5, y = 52, label = "r^2 == 0.42", parse = TRUE)

# TAGS ON THE POINTS
library(dplyr)
countries_sub <- countries %>%
  filter(Year == 2009 & healthexp > 2000)
countries_sp <- ggplot(countries_sub, aes(x = healthexp, y = infmortality)) +
  geom_point()
countries_sp +
  annotate("text", x = 4350, y = 5.4, label = "Canada") +   # Only in some dots
  annotate("text", x = 7400, y = 6.8, label = "USA")
countries_sp +
  geom_text(aes(label = Name), size = 4)                    # In all of the dots

# BALLON PLOT
hec <- HairEyeColor %>%
  as_tibble() %>%
  group_by(Hair, Eye) %>%
  summarize(count = sum(n))

ggplot(hec, aes(x = Eye, y = Hair)) +
  geom_point(aes(size = count), shape = 21, colour = "black", fill = "cornsilk") +
  scale_size_area(max_size = 20, guide = FALSE) +
  geom_text(aes(
    y = as.numeric(as.factor(Hair)) - sqrt(count)/34, label = count),
    vjust = 1.3,
    colour = "grey60",
    size = 4
  )

