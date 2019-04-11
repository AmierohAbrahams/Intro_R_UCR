# Mapping with ggplot
# 11 APril
# Mapping for site locations
# Along SA coastline
# Amieroh Abrahams

# Load libraries
library(tidyverse)
library(ggpubr) # facetting/ activates the function ggarrange

# Load in your data
load("data/south_africa_coast.RData")
load("data/sa_provinces.RData")
load("data/rast_annual.RData")
# load("data/MUR.RData")
load("data/MUR_low_res.RData")

# Self made colour pallete
cols11 <- c("#004dcd", "#0068db", "#007ddb", "#008dcf", "#009bbc",
            "#00a7a9", "#1bb298", "#6cba8f", "#9ac290", "#bec99a")

ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_point()

ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_polygon(colour = "black", fill = "grey70", aes(group = group)) +
  geom_path(data = sa_provinces, aes(group = group)) # The province borders

plot1 <- ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_raster(data = MUR_low_res, aes(fill = bins)) +
  geom_polygon(colour = "black", fill = "grey70", aes(group = group)) +
  geom_path(data = sa_provinces, aes(group = group)) +
  scale_fill_manual("Temps. (°C)", values = cols11) + # Set the colour palette
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0)

sst <- MUR_low_res # Assigning MUR_low_res to a new name
# This is plotting MUR_low_res with sst (sst being the new name)
ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_raster(data = sst, aes(fill = bins)) +
  geom_polygon(colour = "black", fill = "grey70", aes(group = group)) +
  geom_path(data = sa_provinces, aes(group = group)) +
  scale_fill_manual("Temp. (°C)", values = cols11) + # Set the colour palette
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0)

ggsave(plot = plot1, "plot1.pdf", height = 6, width = 9)




