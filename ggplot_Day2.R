# Plotting with boot
# Using the third variable as a colour variation (Colour scale)
# Short cuts:
# Cntrl shift m: %>% 
# Alt - : <- 
# cntrl enter: run script

# Loading the libraries
library(tidyverse)
library(boot)

# Load in built in dataset

urine <- boot::urine # Assign a name "urine" to appear in the environment
# Explore data
head(urine) # First 6rows of the data
tail(urine) # Last six rows of the data
dim(urine) # Dimensions: 79 - Rows and 7 - columns
names(urine)
colnames(urine)
rownames(urine)

# ggplot - Plotting function in R
ggplot(urine, aes(x = osmo, y = ph)) + # ggplot- plotting/specify axis
  geom_point(aes(colour = cond)) # cond - This is a variable in the dataset

?urine # Dataset info

ggplot(urine, aes(x = osmo, y = ph)) +
  geom_point(aes(colour = as.factor(r)))

# To create own colour pallete
# • http://tristen.ca/hcl-picker/#/hlc/6/0.95/48B4B6/345363
# • http://tools.medialab.sciences-po.fr/iwanthue/index.php
# • http://jsfiddle.net/d6wXV/6/embedded/result/




