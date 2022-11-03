# Cleaning the environment
rm(list = ls())

# Loading the required packages
require(tidyverse)

# Loading the data 
MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")

# Converting the Prey masses in mg to g
MyDF$Prey.mass[MyDF$Prey.mass.unit == 'mg'] <-
    MyDF$Prey.mass[MyDF$Prey.mass.unit == 'mg']/1000

# Subsection for plotting log Predator mass
pdf("../results/Pred_subplots.pdf", 11.7, 8.3)
par(mfrow=c(2,3))
for(type in unique(MyDF$Type.of.feeding.interaction)){
    tmp <- MyDF %>% filter(Type.of.feeding.interaction == type)
    hist(log(tmp$Predator.mass), 
         main = type, xlab = "log mass value")
}
mtext("Subplots showing the log of Predtor mass by feeding interaction", side = 3, line = -1.5, outer = TRUE)
par(mfrow = c(1,1))
dev.off()

# Subsection for plotting log Prey mass
pdf("../results/Prey_Subplots.pdf", 11.7, 8.3)
par(mfrow = c(2,3))
for(type in unique(MyDF$Type.of.feeding.interaction)){
    tmp <- MyDF %>% filter(Type.of.feeding.interaction == type)
    hist(log(tmp$Prey.mass), 
         main = type, xlab = "log mass value", breaks=seq(-25,10, by=5))
}
mtext("Subplots showing the log of Prey mass by feeding interaction", side = 3, line = -1.5, outer = TRUE)
par(mfrow = c(1,1))
dev.off()

# Subsection for plottng log ratio of prey to predator mass
pdf("../results/SizeRatio_Subplots.pdf", 11.7, 8.3)
par(mfrow=c(2,3))
for(type in unique(MyDF$Type.of.feeding.interaction)){
    tmp <- MyDF %>% filter(Type.of.feeding.interaction == type)
    hist(log(tmp$Prey.mass/tmp$Predator.mass), 
         main = type, xlab = "log mass ratio")
}
mtext("Subplots showing the log of Prey mass to Predator mass ratio by feeding interaction", side = 3, line = -1.5, outer = TRUE)
par(mfrow = c(1,1))
dev.off()

# Initializing a new dataframe containing only required variables
# Calculating log ratio
MyNewDF <- MyDF %>% select(Predator.mass, Prey.mass, Type.of.feeding.interaction)
MyNewDF <- MyNewDF %>% mutate(log_ratio = log10(Prey.mass/Predator.mass),
                              Predator.mass = log10(Predator.mass),
                              Prey.mass = log10(Prey.mass))

# Initializing and populating matrix with mean and median values
new_df <- MyNewDF %>% group_by(Type.of.feeding.interaction) %>%
    summarise(LogPredMean = mean(Predator.mass), 
              LogPreyMean = mean(Prey.mass),
              LogRatioMean = mean(log_ratio),
              LogPredMedian = median(Predator.mass),
              LogPreyMedian = median(Prey.mass),
              LogRatioMedian = median(log_ratio))

# Writing the csv output file    
write.csv(new_df, file = '../results/PP_results.csv', row.names = F)
