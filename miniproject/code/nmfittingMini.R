############ GOMPERTZ MODEL #############

######################## Actual model fitting #########################

#### Function to calculate model parameters
model_params <- function(){
    # lowest population size
    N_0_start <<- min(data_subset$PopBioLog) 
    # highest population size?
    K_start <<- max(data_subset$PopBioLog) 
    # use our previous estimate from the OLS fitting from above
    r_max_start <<- rnorm(1, model_coef_df[num_row, "lin_slope"], 1)
    # find last
    t_lag_start <<- 
        data_subset$Time[which.max(diff(diff(data_subset$PopBioLog)))]
    return(0)
}

##### Function to call in case the try-catch gives errors
weird_function <- function(){
    final_result <- c()
    AIC_vec <- c(Inf)
    num_of_tries <- 0
    correct <- 1
    i <- 1
    while(num_of_tries<=100){
        num_of_tries <- num_of_tries +1
        result <- try({
            model_params()
            fit_gompertz <<- nlsLM(
                PopBioLog ~ gompertz_model(t = Time, r_max, K, N_0, t_lag), 
                data_subset,
                list(t_lag=t_lag_start, r_max=r_max_start, 
                     N_0 = N_0_start, K = K_start))
            
        },silent = T)
        if(class(result)=="try-error"){
            next
        }
        else{
            i <- i + 1
            RSS <- resi(data_subset$PopBioLog, fitted(fit_gompertz))
            AIC_vec <- c(AIC_vec, MyAIC(RSS,4, nrow(data_subset)))
            if(AIC_vec[i]<AIC_vec[correct]){
                correct <- i
                final_result <- result
            }
        }
        
    }
    if(is.null(final_result)){
        print("Model complete flop. Chuck the data")
    }
    return(final_result)
}

#### Main try catch function
###### Calls another function if there's an error or warning
OutPut <- function(num_row){
    out <-tryCatch(
        {
            model_params()
            fit_gompertz <<- nlsLM(
                PopBioLog ~ gompertz_model(t = Time, r_max, K, N_0, t_lag), 
                data_subset,
                list(t_lag=t_lag_start, r_max=r_max_start, 
                     N_0 = N_0_start, K = K_start))
            return(fit_gompertz)
        },
        error = function(e){
            weird_result <- weird_function()
            return(weird_result)
        },
        warning = function(w){
            weird_result <- weird_function()
            return(weird_result)
        },
        finally = {
        }
    )
}


##### Main loop which calls and stores everything
j<-1
num_of_null_models <- 0
set.seed(1234)

for(ID_name in unique(data$ID)){
    data_subset <- data %>% filter(ID == ID_name)
    num_row <- which(model_coef_df$ID == ID_name)
    if(nrow(data_subset) >5){
        weird_weird_result <- OutPut(num_row)
        if(is.null(weird_weird_result)){
            num_of_null_models <- num_of_null_models + 1
        }
        else{
            NonLinModel_coef_df[num_row, "gompy_r_max"] <-
                coef(weird_weird_result)["r_max"]
            NonLinModel_coef_df[num_row, "gompy_K"] <-
                coef(weird_weird_result)["K"]
            NonLinModel_coef_df[num_row, "gompy_N_0"] <-
                coef(weird_weird_result)["N_0"]
            NonLinModel_coef_df[num_row, "gompy_t_lag"] <- 
                coef(weird_weird_result)["t_lag"]
            NonLinModel_coef_df[num_row, "gompy_AIC"] <- 
                MyAIC(resi(data_subset$PopBioLog, fitted(weird_weird_result)),
                      4, nrow(data_subset))
        }
    }
    j<-j+1
}
