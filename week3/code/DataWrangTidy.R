library(tidyverse)

PoundHillData <- read_csv("~/Documents/CMEECourseWork/week3/data/PoundHillData.csv", col_names = FALSE, na = "0")
PoundHillData[PoundHillData == ""] <- '0'
PoundHillData <- t(PoundHillData)
PoundFinal <- as_tibble(PoundHillData[-1,])
colnames(PoundFinal) <- PoundHillData[1,]
PoundLong <- pivot_longer(PoundFinal, 
                          -c("Cultivation", "Block", "Plot", "Quadrat"),
                          names_to = "Species", values_to = "Count")
t <- PoundLong %>% mutate_at(vars(Cultivation, Block, 
                                  Plot, Quadrat, Species), list(factor))
MyWrangledData <- t %>% mutate(across(Count, as.integer))

filter(MyWrangledData, Count>100) #like subset(), but nicer!
slice(MyWrangledData, 10:15) # Look at a particular range of data rows

MyWrangledData %>%
    group_by(Species) %>%
    summarise(avg = mean(Count))
