# Cleaning the workspace
rm(list = ls())

# Loading required packages
require(tidyverse)
require(maps)

# Loading the dataset
load("../data/GPDDFiltered.RData")

map()
map.axes()
points(gpdd$long, gpdd$lat, col ='red', pch =16)
