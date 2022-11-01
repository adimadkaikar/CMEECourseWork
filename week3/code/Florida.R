rm(list=ls())
require(tidyverse)

load("../data/KeyWestAnnualMeanTemperature.RData")

p <- ggplot(ats, aes(x = Year, y = Temp)) + 
    geom_point() + geom_smooth(method = "lm")
p <- p + theme_bw()
p

o_cor <- cor(ats$Year, ats$Temp)

n <- 10000
cor_vec <- vector(, n)

for(i in 1:n){
    tmp <-  sample(ats$Temp, replace = F)
    cor_vec[i] <- cor(ats$Year, tmp)
}

g <- ggplot(data = as.data.frame(cor_vec), aes(x=cor_vec))+
    geom_histogram(aes(y=..density..), bins = 50, fill = I('#505F90')) +
    geom_density(colour = 'red')+
    theme_bw() 
g<- g + geom_vline(aes(xintercept=o_cor), colour="red", lwd = 1.1) +
    labs(title = "Histogram of the permutation analysis", 
         x = "Correlation coefficient") + 
    theme(plot.title = element_text(hjust = 0.5))
g

print(paste("The probabilty that the observed coefficient is by chance is:", sum(cor_vec > o_cor)/n))
