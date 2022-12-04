# Clenaing workspace
rm(list = ls())

# Loading required libraries
library(tidyverse)
library(minpack.lm)

data <- read.csv('../data/modified.csv')

#### DATA FRAME FOR STORING MODEL COEFFICIENTS ####

model_coef_df <- data.frame(ID = unique(data$ID),
                            sample_size = rep(NA, length(unique(data$ID))),
                            lin_slope = rep(NA, length(unique(data$ID))), 
                            lin_int = rep(NA, length(unique(data$ID))),
                            lin_AIC = rep(NA, length(unique(data$ID))),
                            lin_r_sq = rep(NA, length(unique(data$ID))),
                            quad_p_2 = rep(NA, length(unique(data$ID))),
                            quad_p_1 = rep(NA, length(unique(data$ID))),
                            quad_int = rep(NA, length(unique(data$ID))),
                            quad_AIC = rep(NA, length(unique(data$ID))),
                            quad_r_sq = rep(NA, length(unique(data$ID))),
                            cubic_p_3 = rep(NA, length(unique(data$ID))),
                            cubic_p_2 = rep(NA, length(unique(data$ID))),
                            cubic_p_1 = rep(NA, length(unique(data$ID))),
                            cubic_int = rep(NA, length(unique(data$ID))),
                            cubic_AIC = rep(NA, length(unique(data$ID))),
                            cubic_r_sq = rep(NA, length(unique(data$ID))))

#### ALL LINEAR MODELS ####

### Sourcing the AIC function
source('AIC_func.R')

# Running a loop over all subsets
for(ID_name in unique(data$ID)){
    # Subsetting data
    data_subset <- data %>% filter(ID == ID_name)

    # Finding row number 
    
    num_row <- which(model_coef_df$ID == ID_name)
    # Filling in the sample size 
    model_coef_df[num_row, "sample_size"] <- nrow(data_subset)
    
    # Fitting the linear model
    linear_model <- lm(PopBioLog~Time, data = data_subset)
    
    # Saving the coefficients
    model_coef_df[num_row, "lin_slope"] <- coef(linear_model)[[2]]
    model_coef_df[num_row, "lin_int"] <- coef(linear_model)[[1]]
    model_coef_df[num_row, "lin_r_sq"] <- summary(linear_model)$adj.r.squared
    
    # AIC Linear
    model_coef_df[num_row, "lin_AIC"] <- 
        MyAIC(resi(data_subset$PopBioLog, fitted(linear_model)), 
              2, nrow(data_subset))
    
    # Fitting a linear quadratic model
    quad_model <- lm(PopBioLog~poly(Time, 2, raw = T), data = data_subset)
    
    # Saving the coefficients
    model_coef_df[num_row, "quad_p_2"] <- coef(quad_model)[[3]]
    model_coef_df[num_row, "quad_p_1"] <- coef(quad_model)[[2]]
    model_coef_df[num_row, "quad_int"] <- coef(quad_model)[[1]]
    model_coef_df[num_row, "quad_r_sq"] <- summary(quad_model)$adj.r.squared
    
    # AIC for quadratic model
    model_coef_df[num_row, "quad_AIC"] <- 
        MyAIC(resi(data_subset$PopBioLog, fitted(quad_model)), 
                                                3, nrow(data_subset))
    
    # Fitting a linear cubic model
    cubic_model <- lm(PopBioLog~poly(Time, 3, raw=T), data = data_subset)
    
    # saving the coefficients
    model_coef_df[num_row, "cubic_p_3"] <- coef(cubic_model)[[4]]
    model_coef_df[num_row, "cubic_p_2"] <- coef(cubic_model)[[3]]
    model_coef_df[num_row, "cubic_p_1"] <- coef(cubic_model)[[2]]
    model_coef_df[num_row, "cubic_int"] <- coef(cubic_model)[[1]]
    model_coef_df[num_row, "cubic_r_sq"] <- summary(cubic_model)$adj.r.squared
    
    # AIC for quadratic model
    model_coef_df[num_row, "cubic_AIC"] <- 
        MyAIC(resi(data_subset$PopBioLog, fitted(cubic_model)), 
              4, nrow(data_subset))
}

write.csv(file ="../results/LinearCoefs.csv", model_coef_df,
          row.names = F)
