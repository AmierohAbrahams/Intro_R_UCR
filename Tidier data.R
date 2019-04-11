# Tidier data
# Day 2
# April 2019
# Amieroh Abrahams
# Chapter 11

# Load libraries
library(tidyverse)
library(lubridate)

# Loading in dataset
load("data/SACTNmonthly_v4.0.RData") # Loading data from data folder
SACTN <- SACTNmonthly_v4.0 # Renaming the SACTNmonthly to SACTN
rm(SACTNmonthly_v4.0) #rm - remove function: removing the 
# SACTNmonthly_v4.0

# Tidy data
# filter, mutate, group_by, select, arrange - Found in the tidyverse package

SACTN_1 <- SACTN %>% 
  filter(site == "Port Nolloth") # Only extract port nolloth data

# Filtering and restricting for certain months
SACTN %>%
  filter(site == "Pollock Beach", 
         month(date) == 12 | month(date) == 1) # Here we specify month as
# The lubridate package allows for R to only detect the month within the date
# column

SACTN_ARR <- SACTN %>%
  arrange(depth, temp) #Arrange function places the lowest value to
# the top of the dataset

# Descending order: Highest to lowest
SACTN_2 <- SACTN %>%
  arrange(desc(temp)) # Highest temperature to the top of the data and
# lowest temperature at the bottom

# Filter but for specific dates/years
SACTN_Hume <- SACTN %>% # Selecting the dataset
  filter(site == "Humewood", year(date) == 1990) #Filtering/extracting
# only Humewood and only for the year 1990 from the date column
# This is possible because of the lubridate function

# Filtering for more than just one year
humewood_90s <- SACTN %>% #dataset used
  filter(site == "Humewood", year(date) %in% seq(1990, 1999))

PN_SACTN <- SACTN %>%
  filter(site == "Port Nolloth", # First give the site to filter
         src == "DEA", # Then specify the source
         temp <= 11 | # Temperatures at or below 11°C OR
           is.na(temp)) # Include missing values

# Tidyverse package - fnction called select

SACTN_select <- SACTN %>% 
  select(site, src, temp)

SACTN_organsed <- SACTN %>% 
  select(temp,src,site) # Arranging the variables into
# prefered order

SACTN_every <- SACTN %>%
  select(type, src, everything())

# Exploring the mutate column
# Creates a new column
SACTN_mutated <- SACTN %>%
  mutate(kelvin = temp + 273.15) # mutate adds a new column
# First rule with the mutate function is to give a name to the 
# New column being created

# Summarise function
SACTN_sum <- SACTN %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE),
            min_temp = min(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE))







