MyData <- as.matrix(read.csv('../data/PoundHillData.csv', header = F))

MyData[MyData == ""] <- 0
MyData <- t(MyData)

TempData <- as.data.frame(MyData[-1,], stringsAsFactors = F)
colnames(TempData) <- MyData[1,]

MyWrangledData <- melt(TempData, id=c("Cultivation", "Block", "Plot", "Quadrat"), variable.name = "Species", value.name = "Count")

MyWrangledData[, "Cultivation"] <- as.factor(MyWrangledData[, "Cultivation"])
MyWrangledData[, "Block"] <- as.factor(MyWrangledData[, "Block"])
MyWrangledData[, "Plot"] <- as.factor(MyWrangledData[, "Plot"])
MyWrangledData[, "Quadrat"] <- as.factor(MyWrangledData[, "Quadrat"])
MyWrangledData[, "Count"] <- as.integer(MyWrangledData[, "Count"])
str(MyWrangledData)

MyWrangledData <- dplyr::as_tibble(MyWrangledData)
filter(MyWrangledData, Count>100) #like subset(), but nicer!
slice(MyWrangledData, 10:15) # Look at a particular range of data rows

MyWrangledData %>%
    group_by(Species) %>%
    summarise(avg = mean(Count))
