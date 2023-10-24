library(ggplot2)

# SWITCH THE AXIS
ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot() +
  coord_flip()      # Flip the axis

# INDICATE THE RANGE OF THE AXIS
pg_plot <- ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot()
pg_plot

pg_plot +
  ylim(0, max(PlantGrowth$weight))

# Invert the direction
ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot() +
  scale_y_reverse()

# Change the order of categorical elements
pg_plot <- ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot()
pg_plot +
  scale_x_discrete(limits = c("trt1", "ctrl", "trt2"))  # You may not include all of them

# ESCALATE THE AXIS
library(gcookbook)
m_plot <- ggplot(marathon, aes(x = Half,y = Full)) +
  geom_point()
m_plot +
  coord_fixed(ratio = 1/2)  # You may change the ratio. Without specifying, we get 1:1

# Indicate important points on the axis
ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot() +
  scale_y_continuous(breaks = c(4, 4.25, 4.5, 5, 6, 8))

# Eliminate marks and lines
pg_plot <- ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot()
pg_plot
# Eliminate values from the Y axis
pg_plot +
  theme(axis.ticks = element_blank(), axis.text.y = element_blank())
# Eliminates lines of the plot matrix
pg_plot +
  scale_y_continuous(breaks = NULL)
pg_plot +
  theme_bw()

# Change numbers for words
library(gcookbook)
hw_plot <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) +
  geom_point()
hw_plot

hw_plot +
  scale_y_continuous(
    breaks = c(50, 56, 60, 66, 72),
    labels = c("Tiny", "Really\nshort", "Short", "Medium", "Tallish")
  )

# Orientation of categorical variables
pg_plot <- ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot() +
  scale_x_discrete(
    breaks = c("ctrl", "trt1", "trt2"),
    labels = c("Control", "Treatment 1", "Treatment 2")
  )
# In vertical
pg_plot +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
# Oblique
pg_plot +
  theme(axis.text.x = element_text(angle = 30, hjust = 1, vjust = 1))

# Change the labels of the axis
library(gcookbook)
hw_plot <- ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = sex)) +
  geom_point()
hw_plot +
  xlab("Age\n(years)") +
  ylab("Height in inches")
# Eliminate the labels
hw_plot +
  xlab("") +
  ylab("")
# Change the typography and format
hw_plot <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) +
  geom_point()
hw_plot +
  theme(axis.title.x = element_text(face = "italic", colour = "darkred", size = 14))

# Remark the lines of the axis
hw_plot <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) +
  geom_point()
hw_plot +
  theme(axis.line = element_line(colour = "black"))

# Logarithmic axis
library(MASS)
animals_plot <- ggplot(Animals, aes(x = body, y = brain, label = rownames(Animals))) +
  geom_text(size = 3)
animals_plot +
  scale_x_log10() +
  scale_y_log10()
ggplot(Animals, aes(x = log10(body), y = log10(brain), label = rownames(Animals))) +
  geom_text(size = 3)
# Add lines to the axis
animals_plot +
  scale_x_log10() +
  scale_y_log10() +
  annotation_logticks()

# Write a date on the axis
library(dplyr)
library(scales)
econ_mod <- economics %>%
  filter(date >= as.Date("1992-05-01") & date <  as.Date("1993-06-01"))
ggplot(econ_mod, aes(x = date, y = psavert)) +
  geom_line() +
  scale_x_date(labels = date_format("%b %Y"))
# Relative time
www <- data.frame(
  minute = as.numeric(time(WWWusage)),
  users  = as.numeric(WWWusage)
)
ggplot(www, aes(x = minute, y = users)) +
  geom_line() +
  scale_x_continuous(
    breaks = c(0, 20, 40, 60, 80, 100),
    labels = c("0:00", "0:20", "0:40", "1:00", "1:20", "1:40")
  )

# CIRCULAR AXIS (e.g. intensity and wind direction)
library(gcookbook)
ggplot(wind, aes(x = DirCat, fill = SpeedCat)) +
  geom_histogram(binwidth = 15, boundary = -7.5, colour = "black", size = .25) +
  guides(fill = guide_legend(reverse = TRUE)) +
  coord_polar() +
  scale_x_continuous(limits = c(0,360),
                     breaks = seq(0, 360, by = 45),
                     minor_breaks = seq(0, 360, by = 15)) +
  scale_fill_brewer()


