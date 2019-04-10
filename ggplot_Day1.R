# Here we are plotting with ggplot
# Day_1
# First plots
# 10th April 2019

# Loading the libraries
library(tidyverse) # Blanket package
OR
library(ggplot2) # More specific to plotting

# Loading in the data
# R has built in datasets
ChickWeight <- datasets::ChickWeight

# Explore the data
summary(ChickWeight)
names(ChickWeight)
dim(ChickWeight)
glimpse(ChickWeight)

?ChickWeight

# Create a scatter and line graph
ggplot(data = ChickWeight, aes(x = Time, y = weight)) + # Specify: data, x-axis and y- axis
  geom_point() + # Scatter or point plot
  geom_line(aes(group = Chick)) # or each chick in the dataset
# the group function when plotting is the same as the "group_by" function
# Use + and not %>%  when plotting

ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) + # colour for different diets
  geom_point() +
  geom_line(aes(group = Chick))

# hypothesis: Test what is the most effective diet
ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) + # Different colour to each diet
  geom_point() + # Plotting the points
  geom_smooth(method = "lm") # lm= linear model: 1line of best fit

# Exploring the colour and size variation
ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point(aes(size = weight)) +
  geom_smooth(method = "lm", size = 0.5) +
  labs(x = "Time (days)", y = "weight (kg)") +
  # theme(legend.position = "Bottom") +
  theme_bw()









