# Cleaning the environment
rm(list = ls())

# A simple script to illustrate R input and output
# Run line by line and check inputs outputs to understand what is happening

MyData <- read.csv('../data/trees.csv', header = T)

write.csv(MyData, '../results/MyData.csv')
write.table(MyData[1,], file = '../results/MyData.csv', append = T)
write.csv(MyData, '../results/MyData.csv', row.names = T)
write.table(MyData, '../results/MyData.csv', col.names = F)
