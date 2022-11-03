# Cleaning the workspace
rm(list = ls())

# Loading required packages
require(tidyverse)
require(maps)

# Loading the dataset
load("../data/GPDDFiltered.RData")

# Plottng blank world map and axes
map()
map.axes()

# Superimposing the points from gpdd data
points(gpdd$long, gpdd$lat, col ='red', pch =16)

# The observations are concentrated in the Northern hemisphere.
# In particular they are concentrated in North America and Europe. 
# There are very few observations from the southern and eastern hemispheres.
# This will cause biases during analyses. 