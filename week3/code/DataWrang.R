# Cleaning the environment
rm(list = ls())
# Loading the required packages
require(tidyverse)
require(reshape2)

# loading the data and saving it as a matrix without headers
MyData <- as.matrix(read.csv('../data/PoundHillData.csv', header = F))

# Substituing 0s for missing data
MyData[MyData == ""] <- 0
# Transposing data to make it suitable for working on
MyData <- t(MyData)

# Converting it to a dataframe and adding column names
TempData <- as.data.frame(MyData[-1,], stringsAsFactors = F)
colnames(TempData) <- MyData[1,]

# Using melt to convert it to long form
MyWrangledData <- melt(TempData, id=c("Cultivation", "Block", "Plot", "Quadrat"), variable.name = "Species", value.name = "Count")

# Converting variables to required format
MyWrangledData[, "Cultivation"] <- as.factor(MyWrangledData[, "Cultivation"])
MyWrangledData[, "Block"] <- as.factor(MyWrangledData[, "Block"])
MyWrangledData[, "Plot"] <- as.factor(MyWrangledData[, "Plot"])
MyWrangledData[, "Quadrat"] <- as.factor(MyWrangledData[, "Quadrat"])
MyWrangledData[, "Count"] <- as.integer(MyWrangledData[, "Count"])
str(MyWrangledData)

# Using dplyr to convert the data to tibble
MyWrangledData <- dplyr::as_tibble(MyWrangledData)
filter(MyWrangledData, Count>100) #like subset(), but nicer!
slice(MyWrangledData, 10:15) # Look at a particular range of data rows

# A random pipe operation in dplyr
MyWrangledData %>%
    group_by(Species) %>%
    summarise(avg = mean(Count))
