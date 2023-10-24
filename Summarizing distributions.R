library(ggplot2)

# HISTOGRAM
ggplot(faithful, aes(x = waiting)) +
  geom_histogram()                    # All together with uniform color
ggplot(faithful, aes(x = waiting)) +
  geom_histogram(binwidth = 2,        # Width of the bars
                 fill = "white",      # Painted in white
                 colour = "black")    # With a black frame

# Adding a density curve
ggplot(faithful, aes(x = waiting, y = ..density..)) +
  geom_histogram(fill = "cornsilk", colour = "grey60", size = .2) +
  geom_density()      # Adding a curve

# Histograms for each factor
library(MASS)
birthwt_mod <- birthwt
birthwt_mod$smoke <- recode_factor(birthwt_mod$smoke, '0' = 'No Smoke', '1' = 'Smoke')
# Two separated histograms
ggplot(birthwt_mod, aes(x = bwt)) +
  geom_histogram(fill = "white", colour = "black") +
  facet_grid(smoke ~ .)
ggplot(birthwt_mod, aes(x = bwt, y = ..density..)) +
  geom_histogram(binwidth = 200, fill = "cornsilk", colour = "grey60", size = .2) +
  geom_density() +
  facet_grid(smoke ~ .)
# A histogram overlapped with another
ggplot(birthwt_mod, aes(x = bwt, fill = smoke)) +
  geom_histogram(position = "identity", alpha = 0.4)
ggplot(birthwt_mod, aes(x = bwt, fill = smoke)) +
  geom_density(alpha = .3)

# BOX PLOT
library(MASS)
ggplot(birthwt, aes(x = factor(race), y = bwt)) +
  geom_boxplot(width = .5,          # Width of the bars
               outlier.shape = 21,  # Shape of the outlines
               notch = TRUE)  +     # Highlighting the median
  stat_summary(fun = "mean", geom = "point", shape = 23, size = 3, fill = "white") # Include the mean

# Violin plot
library(gcookbook)
ggplot(heightweight, aes(x = sex, y = heightIn)) + 
  geom_violin() +
  scale_fill_brewer(palette = "Pastel1")
ggplot(heightweight, aes(x = sex, y = heightIn)) + 
  geom_violin() +
  geom_boxplot(width=0.1)

# DENSITY PLOT
faithful_p <- ggplot(faithful, aes(x = eruptions, y = waiting))
# With dots and curves
faithful_p +
  geom_point() +
  stat_density2d()
faithful_p +
  geom_point() +
  stat_density2d(aes(alpha = ..density..), geom = "tile", contour = FALSE)
# Only with curves
faithful_p +
  stat_density2d(aes(colour = ..level..))











