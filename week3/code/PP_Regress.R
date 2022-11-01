rm(list = ls())
library(tidyverse)

MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")
MyDF$Prey.mass[MyDF$Prey.mass.unit == 'mg'] <- 
    MyDF$Prey.mass[MyDF$Prey.mass.unit == 'mg']/1000

g <- ggplot(MyDF, aes(x = log10(Prey.mass), y = log10(Predator.mass), 
                      colour = Predator.lifestage)) +
    geom_point(shape = I(3)) + 
    geom_smooth(method = "lm", aes(colour=Predator.lifestage), fullrange=T)
    theme_classic()
g <- g + facet_wrap(.~Type.of.feeding.interaction, 
                    ncol=1, strip.position = "right") 
g <- g + theme_bw() + theme(legend.position = "bottom") + 
    guides(color = guide_legend(nrow = 1))

g <- g + scale_x_continuous(labels = c('1e-07', '1e-03', '1e+01'), 
                            breaks = c(-7, -3, 1)) 

g <- g + scale_y_continuous(labels = c('1e-06', '1e-02', '1e+02', '1e+06'), 
                            breaks = c(-6, -2, 2, 6)) 

g <- g + xlab("Prey mass in grams") + ylab("Predator mass in grams")

g

pdf("../results/PP_Regress_plot.pdf", 11.7, 8.3)
print(g)
dev.off()

new <- MyDF %>% select(Prey.mass, Predator.mass, Type.of.feeding.interaction, Predator.lifestage)

new_df <- data.frame(Type.of.feeding.interaction = character(),
                     Predator.lifestage = character(), 
                     Regression.slope = double(), 
                     Regression.intercept = double(), 
                     R.squared = double(), 
                     F.statistic = double(),
                     p.value = double())

for(inter in unique(new$Type.of.feeding.interaction)){
    for(lifestage in unique(new$Predator.lifestage)){
        tmp <- new %>%
            filter(Type.of.feeding.interaction == inter,
                   Predator.lifestage == lifestage)
        if(nrow(tmp) > 2){
            mod <- lm(log10(Predator.mass)~log10(Prey.mass), data = tmp)
            tmp1 <- summary(mod)
            #name_1 <- paste(inter, lifestage, sep = "_")
            #assign(name_1, summary(mod))
            #print(inter)
            #print(lifestage)
            needed <- c(tmp1$coefficients[2,1],
                        tmp1$coefficients[1,1],
                        tmp1$r.squared, 
                        tmp1$fstatistic[1], 
                        tmp1$coefficients[,4][2])
            new_df[nrow(new_df)+1,] <- c(inter, lifestage, needed)
        }
    }
}

write.csv(new_df, file = '../results/PP_Regress_Results.csv')
