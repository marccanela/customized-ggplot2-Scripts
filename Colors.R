library(ggplot2)

library(MASS)
ggplot(birthwt, aes(x = bwt)) +
  geom_histogram(fill = "red", colour = "black")
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(colour = "red")

# ADDING COLORS TO DIFFERENT VARIABLES
library(gcookbook)
ggplot(cabbage_exp, aes(x = Date, y = Weight)) +
  geom_col(aes(fill = Cultivar), colour = "black", position = "dodge")
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(colour = cyl))

# To avoid a gradation, change continuous variables to categorical
library(dplyr)
mtcars_mod <- mtcars %>%
  mutate(cyl = as.factor(cyl))  # Convert cyl to a factor
ggplot(mtcars_mod, aes(x = wt, y = mpg)) +
  geom_point(aes(colour = cyl))

# COLOR PALETTES
plot <- ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area()
plot + scale_fill_brewer(palette = "Pastel1")
plot + scale_fill_brewer(palette = "Pastel2")
plot + scale_fill_brewer(palette = "Set3")
plot + scale_fill_brewer(palette = "Greens")

plot2 <- ggplot(mtcars_mod, aes(x = wt, y = mpg)) +
  geom_point(aes(colour = cyl))
plot2 + scale_colour_brewer(palette = "Set1")
plot2 + scale_colour_brewer(palette = "Set2")
plot2 + scale_colour_brewer(palette = "Dark2")
plot2 + scale_colour_brewer(palette = "Greys")

# Put personalized colors
ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = sex)) +
  geom_point() +
  scale_colour_manual(values = c("#CC6666", "#7777DD"))


