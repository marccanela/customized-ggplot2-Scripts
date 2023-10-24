# SIMPLE PLOTS
library(ggplot2)
library(gcookbook)
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +
  geom_point() +          # Add dots in each value
  expand_limits(y = 0)    # Allow the Y axis to show the zero

# The Y axis can be shown in logarithmic scale
ggplot(worldpop, aes(x = Year, y = Population)) +
  geom_line() +
  geom_point() +
  scale_y_log10()

# Plots with two lines
# With colors
ggplot(tg, aes(x = dose, y = length, colour = supp)) +    # If we want colorful lines
  geom_line(linetype = "dashed") +                        # The line will be discontinuous
  scale_colour_brewer(palette = "Set1")                   # The color is more intense
ggplot(tg, aes(x = dose, y = length, fill = supp)) +      # We want colorful dots
  geom_line() +
  geom_point(size = 4, shape = 21)

# Black and white
ggplot(tg, aes(x = dose, y = length, linetype = supp)) +  # We want (dis)continuous lines
  geom_line()
ggplot(tg, aes(x = dose, y = length, shape = supp)) +     # We want geometrical shapes
  geom_line() +
  geom_point(size = 4)

# PLOTS OF AREA UNDER THE CURVE
sunspotyear <- data.frame(
  Year     = as.numeric(time(sunspot.year)),
  Sunspots = as.numeric(sunspot.year)
)
ggplot(sunspotyear, aes(x = Year, y = Sunspots)) +
  geom_area(colour = "black", fill = "blue", alpha = .2) # It's good to check how it is without "black"

# Multiple areas under the curve
library(gcookbook)
ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area(colour = "black", size = .2, alpha = .4) +
  scale_fill_brewer(palette = "Blues")
# Proportional plots
ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area(position = "fill", colour = "black", size = .2, alpha = .4) +
  scale_fill_brewer(palette = "Blues") +
  scale_y_continuous(labels = scales::percent)

# CONFIDENCE INTERVALS
library(dplyr)
climate_mod <- climate %>%
  filter(Source == "Berkeley") %>%
  select(Year, Anomaly10y, Unc10y)
# Shadowing
ggplot(climate_mod, aes(x = Year, y = Anomaly10y)) +
  geom_ribbon(aes(ymin = Anomaly10y - Unc10y, ymax = Anomaly10y + Unc10y), alpha = 0.2) +
  geom_line()
# Line of dots
ggplot(climate_mod, aes(x = Year, y = Anomaly10y)) +
  geom_line(aes(y = Anomaly10y - Unc10y), colour = "grey50", linetype = "dotted") +
  geom_line(aes(y = Anomaly10y + Unc10y), colour = "grey50", linetype = "dotted") +
  geom_line()


