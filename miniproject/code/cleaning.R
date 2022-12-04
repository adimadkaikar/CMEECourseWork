# Clearing the workspace before starting
rm(list = ls())

options(warn = -1)
# Loading required packages
suppressMessages(library(tidyverse))
suppressMessages(library(minpack.lm))

# Loading the original data
data <- read.csv('../data/LogisticGrowthData.csv')

# Cleaning !
data <- data %>% filter(Time >=0, PopBio > 0) %>% 
    mutate(Citation_no = as.numeric(as.factor(Citation))) %>% 
    mutate(ID = paste(Species, "_", as.character(Temp),
                      "_", Medium, "_", Citation_no, sep = "")) %>% 
    mutate(PopBioLog = log(PopBio))

data_needed <- data %>% select(X, Time, PopBio, ID, PopBioLog)

# Writing a modified csv file for needed stuff, rest of the data is fairly unnecessary
write.csv(file = "../data/modified.csv", data_needed)

print("Beginning model fitting")
source('mfitting.R')
source('nmfitting.R')
print("Model fitting complete!")
source('plotting.R')
source('comparison.R')

options(warn = 0)