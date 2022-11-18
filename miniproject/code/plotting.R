rm(list = ls())
library(tidyverse)

data <- read_csv('../data/modified.csv')
head(data)

g <- ggplot(data, aes(x = Time, y = PopBio, colour = Temp)) + 
    geom_point()
g <- g + facet_wrap(Species~., scales = "free") 
g

pdf('../results/vis.pdf')
for(ID_name in unique(data$ID)){
    data_subset <- filter(data, ID == ID_name)
    g <- ggplot(data_subset, aes(x = Time, 
                                 y = PopBio)) + 
        geom_point()
    g <- g + xlab('Time') + ylab('Population') + ggtitle(ID_name)
    print(g) 
}
dev.off()
