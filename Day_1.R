# Day 1 - Intro to R
# UWC
# Amieroh Abrahams
# 10 April 2019

apples <- c(5.3, 7.8, 19.4, 1)
mean(apples)
sd(apples)
dim(apples) # dimensions: Null? Dataframe
length(apples)
range(apples)
median(apples)
max(apples)
min(apples)

# Libraries
library(tidyverse)

# Reading a dataset into R
laminaria <- read_csv("data/laminaria.csv") # Using the lamianaria data found in the laminaria folder

dim(laminaria) # 140 Rows and 12 columns
mean(laminaria) # Cannot use the mean function on a dataframe

# Calculate the mean of:
# Blade weight and blade length
# %>% - Cntrl shift m: Pipe
lam_sum <- laminaria %>% # Specify the dataset
  summarise(mean_wt = mean(blade_weight), # calculate mean of blade weight
            mean_bl = mean(blade_length)) # Calculate mean of the blade length
lam_sum

# Explore data - laminaria dataset
head(laminaria) # First six rows of the dataset
tail(laminaria) # Last six rows of the dataset

head(laminaria, n = 2) # Shows the first two rows of the dataset
tail(laminaria, n = 3) # Shows last 3 rows

names(laminaria) # Variables 
colnames(laminaria)

nrow(laminaria) # Amount of rows in dataset
ncol(laminaria) # amount of columns in the dataset

lam2 <- laminaria %>% # specify the dataset
  select(blade_weight, blade_length, site) # Selecting specific columns
lam2

lam3 <- laminaria %>% # Specify the dataset
  filter(site == "Sea Point") %>% # Specify one particular site
  summarise(mean_wt = mean(blade_weight), # mean BW of the one site
            mean_bl = mean(blade_length), # mean BL of the one site
            sd_bl = sd(blade_length)) # Standard deviation of BL
lam3


# Function within tidyverse: Slice
lam_slice <- laminaria %>% 
  slice(6:13)

# Working with missing values
lam_miss <- laminaria %>% # Specify the dataset
  summarise(mean_sm = mean(stipe_mass)) # Mean of the stipe mass
lam_miss

# Removing NA with na.rm = TRUE
lam_miss <- laminaria %>% # Specify the dataset
  summarise(mean_sm = mean(stipe_mass, na.rm = TRUE)) # Mean of the stipe mass
lam_miss

# Calculate the standard error
laminaria %>% # Select 'laminaria'
  group_by(site) %>% # Group the dataframe by site
  summarise(var_bl = var(blade_length), # Calculate variance
            n_bl = n()) %>% # Count number of values
  mutate(se_bl = sqrt(var_bl / n_bl)) # Calculate se

# Visualisation

# Plotting in R - ggplot
# specify dataset, specify axis variables
# ggplot: instead %>% use a +

ggplot(data = laminaria, aes(x = stipe_mass, y = stipe_length)) +
  geom_point(shape = 21, colour = "salmon", fill = "white") +
  labs(x = "Stipe mass (kg)", y = "Stipe length (cm)")




















