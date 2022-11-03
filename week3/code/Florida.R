# Cleaning the environment
rm(list=ls())

# Loading the required packages
require(tidyverse)

# Loading the data from the data directory
load("../data/KeyWestAnnualMeanTemperature.RData")
ls()

# Looking at the data
class(ats)
head(ats)

# Plotting the original data with a regression line
p <- ggplot(ats, aes(x = Year, y = Temp)) + 
    geom_point() + geom_smooth(method = "lm")
p <- p + theme_bw()
p

# Storing the observed correlation coefficient
o_cor <- cor(ats$Year, ats$Temp)

# Setting the number of resampling itterations
n <- 10000
# Creating a vector to store the correlation coefficient for each resampling
cor_vec <- vector(, n)

# Resampling and calculating the correlation coefficient for each resampling 
# and storing it in the vector the loopy way
for(i in 1:n){
    tmp <-  sample(ats$Temp, replace = F)
    cor_vec[i] <- cor(ats$Year, tmp)
}

# Plotting the histogram for the simulated cor and the overseved cor as an abline
g <- ggplot(data = as.data.frame(cor_vec), aes(x=cor_vec))+
    geom_histogram(aes(y=..density..), bins = 50, fill = I('#505F90')) +
    geom_density(colour = 'red')+
    theme_bw() 
g<- g + geom_vline(aes(xintercept=o_cor), colour="red", lwd = 1.1) +
    labs(title = "Histogram of the permutation analysis", 
         x = "Correlation coefficient") + 
    theme(plot.title = element_text(hjust = 0.5))
g

# Printing the probability of observed coefficient 
print(paste("The probabilty that the observed coefficient is by chance is:", sum(cor_vec > o_cor)/n))
