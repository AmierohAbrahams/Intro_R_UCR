# Day 1
# Facetting
# Using new library called ggpubr
# Here we use the function called ggarrange - found in the ggpubr package

#Loading packages
library(tidyverse)
library(ggpubr)

# Laoding in the built in dataset
ChickWeight <- datasets::ChickWeight

# Create faceted figure
ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() + # Creating points for each of the observations
  geom_smooth(method = "lm") + # Note the `+` sign here
  facet_wrap(~Diet, ncol = 3) + # This is the line that creates the facets
  labs(x = "Days", y = "Mass (g)") +   # labelling axis
  ggtitle("Facet wrap 1")

? ChickWeight
? mean
?? mean
  
# Facet wrapping multiple graphs
# Using the function ggarrange

line_1 <- ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_line(aes(group = Chick)) +
  labs(x = "Days", y = "Mass (g)")
line_1

ChickLast <- ChickWeight %>%
  filter(Time == 21)

histogram_1 <- ggplot(data = ChickLast, aes(x = weight)) +
  geom_histogram(aes(fill = Diet), position = "dodge", binwidth = 100) +
  labs(x = "Final Mass (g)", y = "Count")
histogram_1

box_1 <- ggplot(data = ChickLast, aes(x = Diet, y = weight)) +
  geom_boxplot(aes(fill = Diet)) +
  labs(x = "Diet", y = "Final Mass (g)")
box_1

ggarrange(line_1, histogram_1, box_1,
          ncol = 2, # Set number of rows and columns
          labels = c("A", "B", "C"), # Label each figure
          common.legend = TRUE) # Create common legend









