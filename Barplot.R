library(ggplot2)
library(gcookbook)

# SIMPLE PLOTS
pg_mean
ggplot(pg_mean,             # Data frame name
       aes(x = group,       # X column name
           y = weight)) +   # Y column name
  geom_col(width = 0.5)     # With 0.5 we get thinner lines

# If X are numbers, we need to convert them into a factor to avoid getting white spaces:
BOD
ggplot(BOD,
       aes(x = Time,            # This is a number
           y = demand)) +
  geom_col()
ggplot(BOD,
       aes(x = factor(Time),    # This is a factor
           y = demand)) +
  geom_col()

# Data may be reordered depending on a specific column
ggplot(BOD,
       aes(x = factor(reorder(Time,demand)),    # Reorder "Time" as described in "demand"
           y = demand)) +
  geom_col() +
  xlab("Time")

# PLOTS OF COUNTINGS
diamonds                          # There are 53.940 files
ggplot(diamonds, aes(x = cut)) +  # Without indicating the Y, it counts the number of times each X appears
  geom_bar()

# GROUPPING BARS ACCORDING TO A CATEGORICAL VARIABLE
cabbage_exp
ggplot(cabbage_exp, aes(x = Date, y = Weight,
                        fill = Cultivar)) +   # Name of the group column
  geom_col(width = 0.5, position = position_dodge(0.7)) # With 0.5 we get more separated bars

# We may include a black line around the bar: colour = "black"
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(width = 0.5, position = position_dodge(0.7), colour = "black")

# We may change the color to pastel: palette = "Pastel1"
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(width = 0.5, position = position_dodge(0.7), colour = "black") +
  scale_fill_brewer(palette = "Pastel1")
# Or the color we prefer:
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(width = 0.5, position = position_dodge(0.7), colour = "black") +
  scale_fill_manual(values = c("#CCEEEF", "#FFFDDD"),
                    guide = FALSE)                      # With this, we eliminate the legend

# We gather the two bars in just one
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(width = 0.5, colour = "black")
# If we invert the position of the categories
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(width = 0.5, colour = "black", position = position_stack(reverse = TRUE))
# If we want all bars from the same size
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(width = 0.5, colour = "black", position = "fill") +
  scale_y_continuous(labels = scales::percent)

# Including tags
ggplot(BOD,
       aes(x = factor(reorder(Time,demand)),
           y = demand)) +
  geom_col() +
  xlab("Time") +
  geom_text(aes(label = demand), vjust = 1.5, colour = "white")

ggplot(BOD,
       aes(x = factor(reorder(Time,demand)),
           y = demand)) +
  geom_col() +
  xlab("Time") +
  geom_text(aes(label = demand), vjust = -0.2)

ce <- cabbage_exp %>%
  arrange(Date, rev(Cultivar))
ce <- ce %>%
  group_by(Date) %>%
  mutate(label_y = cumsum(Weight) - 0.5 * Weight)
ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(colour = "black") +
  geom_text(aes(y = label_y, label = paste(format(Weight, nsmall = 2), "kg")), size = 4) +
  scale_fill_brewer(palette = "Pastel1")

# CHANGING THE COLOR IN FUNCTION OF POSITIVE AND NEGATIVE VALUES
# Loading a sample data frame...
library(dplyr)
climate_sub <- climate %>%
  filter(Source == "Berkeley" & Year >= 1900) %>%
  mutate(pos = Anomaly10y >= 0)
climate_sub

# The plot is done with position = "identity" (because we have negative values)
ggplot(climate_sub, aes(x = Year, y = Anomaly10y, fill = pos)) +
  geom_col(position = "identity")

# CLEVELAND DOT PLOT
library(gcookbook)
tophit <- tophitters2001[1:25, ] # We get the top 25 hits of the dataset
ggplot(tophit, aes(x = avg, y = name)) +
  geom_point()

# Inverting the axis
ggplot(tophit, aes(x = reorder(name, avg), y = avg)) + # Reordering to make it more aesthetic
  geom_point(size = 3) + # Dots are thicker
  theme_bw() +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.x = element_line(colour = "grey60", linetype = "dashed"),
    axis.text.x = element_text(angle = 60, hjust = 1)
  )

# We may even make it more aesthetic
ggplot(tophit, aes(x = avg, y = name)) +
  geom_segment(aes(yend = name), xend = 0, colour = "grey50") +
  geom_point(size = 3, aes(colour = lg)) +
  theme_bw() +
  theme(
    panel.grid.major.y = element_blank(),   # We delete the horizontal lines
  )
  
  
  
  
  
