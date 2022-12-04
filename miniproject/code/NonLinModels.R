####### Model Equation #########
# Modified gompertz growth model (Zwietering 1990)
gompertz_model <- function(t, r_max, K, N_0, t_lag){ 
    return(N_0 + (K - N_0) * 
               exp(-exp(r_max * exp(1) * (t_lag - t)/((K - N_0) * log(10)) + 1)))
}   

################################################################################
################################################################################

###### LOGISTIC MODEL #######

#### Equation for Logistic Model ####

logistic_model <- function(t, r_max, K, N_0){ # The classic logistic equation
    return(log(N_0) + log(K) + r_max * t - log(K + N_0 * (exp(r_max * t) - 1)))
}
################################################################################
################################################################################
