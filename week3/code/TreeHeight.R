# This function calculates heights of trees given distance of each tree from its 
# base and angle to its top using trigonometric formula
#
# height = distance * tan(radians)
#
# ARGUMENTS
#
# degrees: The angle of elevation of trees
# distance: The distance from base of tree (e.g meters)
#
# OUTPUT
# The heights of tree (same units as distance)

# Cleaning the environment
rm(list = ls())

# Loading the data
trees <- read.csv('../data/trees.csv', header = T)

# Tree height calculating function
TreeHeight <- function(degrees, distance){
    radians <- degrees * pi / 180
    height <- distance * tan(radians)
    print(paste('The height is:', height))
    
    return(height)
}

# Adding a new column to the data frame 
trees$Tree.Height.m <- TreeHeight(trees$Angle.degrees, trees$Distance.m)

# Writing a csv with the tree heights
write.csv(trees, '../results/TreeHts.csv')
