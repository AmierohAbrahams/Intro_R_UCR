# Tidiest data
# Day2
# Amieroh ABrahams
# 11 April 2019

# Load in libraries
library(tidyverse)
library(lubridate)

# Load in the the data
# load the data from a .RData file
load("data/SACTNmonthly_v4.0.RData")
# Copy the data as a dataframe with a shorter name
SACTN <- SACTNmonthly_v4.0
# Remove the original
rm(SACTNmonthly_v4.0)

# group_by function 
# Group by depth
SACTN_depth <- SACTN %>%
  group_by(depth)

SACTN_src_group <- SACTN %>%
  group_by(src, date)

SACTN_depth_mean_2 <- SACTN %>%
  group_by(depth) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            count = n()) # Count # Safety measure

# Exploring all the tidyverse function in one chunk of code
SACTN_tidy <- SACTN %>%
  filter(site == "Paternoster" | site == "Oudekraal") %>%
  group_by(site, src) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE))

# Working with multiple sites but not all of the sites in the dataset
selected_sites <- c("Paternoster", "Oudekraal", "Muizenberg", "Humewood")

# Then calculate the statistics
SACTN_select <- SACTN %>%
  filter(site %in% selected_sites) %>%
  group_by(site, src) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE))








