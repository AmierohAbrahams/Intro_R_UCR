# Working with tidy data
# Long is better than wide data
# Mainly focus on the tidyverse package
# Amieroh Abrahams
# 11 April 2019

# Loading libraries
library(tidyverse)

# Loading in the dataset
load("data/SACTN_mangled.RData") # In this dataset
# Different data frames

# Plotting the data
ggplot(SACTN1, aes(x = date, y = temp)) +
  geom_line(aes(colour = site, group = paste0(site, src))) +
  labs(x = "", y = "Temperature (°C)", colour = "Site") +
  theme_bw()

# Gather function in R
# Part of the tidyverse package
# Cntrl shift m : %>% 

SACTN2_tidy <- SACTN2 %>% # Loading the dataset
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp") 
# Gathering the three variables and creating a new column
# This new column is called "src" and below the "src" variable name
# We will have the various sources/src :src are (DEA,KZNSB,SAWS)
# Then we create a new column with all the values and the 
# Title of this column is "temp" - temperature collected by
# each of the different sources.

# Here we remove the NA values within the dataset
SACTN2_tidy2 <- SACTN2 %>% # Loading the dataset
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp") %>% 
  na.omit() #Removes all NA values/ another function drop_na

# Spreading 
SACTN3_tidy <- SACTN3 %>%
  spread(key = var, value = val)

# Separating and uniting
SACTN4a_tidy <- SACTN4a %>%
  separate(col = index, into = c("site", "src"), sep = "/")

# Unite
SACTN4b_tidy <- SACTN4b %>%
  unite(year, month, day, col = "date", sep = "-")

# Joining
SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy)







