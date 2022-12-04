# Clenaing workspace keeping only required things
rm(list = setdiff(ls(), 'model_coef_df'))

# Loading required libraries
library(tidyverse)
library(minpack.lm)

data <- read.csv('../data/modified.csv')
#data <- data[,-1]

#### MODEL PARAMETER SAVING DATAFRAME

NonLinModel_coef_df <- data.frame(ID = unique(data$ID),
                            sample_size = rep(NA, length(unique(data$ID))),
                            logi_r_max = rep(NA, length(unique(data$ID))),
                            logi_K = rep(NA, length(unique(data$ID))),
                            logi_N_0 = rep(NA, length(unique(data$ID))),
                            logi_AIC = rep(NA, length(unique(data$ID))),
                            gompy_r_max = rep(NA, length(unique(data$ID))),
                            gompy_K = rep(NA, length(unique(data$ID))),
                            gompy_N_0 = rep(NA, length(unique(data$ID))),
                            gompy_t_lag = rep(NA, length(unique(data$ID))),
                            gompy_AIC = rep(NA, length(unique(data$ID))))

############### NON LINEAR MODELS ###############

source('AIC_func.R')
source('NonLinModels.R')
source('nmfittingMini.R')
source('nmfittingMiniLogis.R')

write.csv(file = "../results/NonLinearCoefs.csv", 
          NonLinModel_coef_df, row.names = F)
