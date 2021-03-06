# Mapping with style
# 11 April 2019
# Amieroh Abrahams

# Load libraries
# Here are two new packages
library(tidyverse)
library(scales)
library(ggsn)
??ggsn

# Load Africa map
load("data/africa_map.RData")

ggplot() +
  borders() + # The global shape file
  coord_equal()

sa_1 <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  coord_equal(xlim = c(12, 36), ylim = c(-38, -22), expand = 0) # Force lon/lat extent
sa_1

sa_2 <- sa_1 +
  annotate("text", label = "Atlantic\nOcean", # "n" - starts a new line
           x = 15.1, y = -32.0,
           size = 5.0,
           angle = 180,
           colour = "gold") +
  annotate("text", label = "Indian\nOcean",
           x = 33.2, y = -34.2,
           size = 90.0,
           angle = 330,
           colour = "springgreen")
sa_2


sa_3 <- sa_2 +
  scalebar(x.min = 22, x.max = 26, y.min = -36, y.max = -35, # Set location of bar
           dist = 200, height = 1, st.dist = 0.8, st.size = 4, # Set particulars
           dd2km = TRUE, model = "WGS84") + # Set appearance
  north(x.min = 22.5, x.max = 25.5, y.min = -33, y.max = -31, # Set location of symbol
        scale = 1.2, symbol = 16)
sa_3












