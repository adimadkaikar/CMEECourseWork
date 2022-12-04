# Cleaning environment
rm(list = ls())

# Loading required libraries

# Loading the data
data <- read.csv('../data/modified.csv')
data <- data[,-1]

# Loading the model coefficients
suppressMessages(model_coef_df <- read_csv("../results/LinearCoefs.csv"))
suppressMessages(NonLinModel_coef_df <- read_csv("../results/NonLinearCoefs.csv"))

# Sourcing the model functions
source('NonLinModels.R')

# Printing a nice messgane
print("Starting big plotting. Enjoy your coffee!")
# Opening and plotting all the plots
pdf('../results/vis.pdf')
for(ID_name in unique(data$ID)){
    data_subset <- filter(data, ID == ID_name) 
    pred_values <- data.frame(time_points = seq(min(data_subset$Time), 
                                                max(data_subset$Time), 
                                                by=0.1))
    
    lin <- model_coef_df %>% filter(ID == ID_name) %>% 
        select(lin_slope, lin_int)
    
    quad <- model_coef_df %>% filter((ID == ID_name)) %>% 
        select(quad_p_2, quad_p_1, quad_int) 
    
    cubic <- model_coef_df %>% filter(ID == ID_name) %>%
        select(cubic_p_3, cubic_p_2, cubic_p_1, cubic_int)
    
    pred_values$lin_pred <- lin[[1]] * pred_values$time_points + lin[[2]]
    
    pred_values$quad_pred <- quad[[2]] * 
        poly(pred_values$time_points,2, raw=T)[,1] + quad[[1]] * 
        poly(pred_values$time_points,2, raw = T)[,2] + quad[[3]]
    
    pred_values$cubic_pred <- cubic[[3]] * 
        poly(pred_values$time_points,3,raw = T)[,1] + 
        cubic[[2]] * poly(pred_values$time_points,3,raw = T)[,2] + 
        cubic[[1]] * poly(pred_values$time_points,3,raw = T)[,3] + cubic[[4]]
    
    g <- ggplot(data_subset, aes(x = Time, y = PopBioLog)) + geom_point() 
    g <- g + geom_line(data = pred_values, aes(x = time_points, y = lin_pred, 
                                               col ='linear'))
    g <- g + geom_line(data = pred_values, aes(x = time_points, y = quad_pred,
                                               col = 'quadratic'))
    
    g <- g + geom_line(data = pred_values, aes(x= time_points, y = cubic_pred,
                                               col='cubic'))
    g <- g + xlab('Time') + ylab('Population') + 
        ggtitle(paste("Growth curve for:",ID_name))
    g <- g + theme_minimal()
    g <- g + theme(legend.position = "bottom",
                   plot.title = element_text(hjust = 0.5))
    print(g)
    
    logi <- NonLinModel_coef_df %>% 
        filter(ID==ID_name) %>% 
        select(logi_r_max, logi_K, logi_N_0)
    gompy <- NonLinModel_coef_df %>% 
        filter(ID==ID_name) %>% 
        select(gompy_r_max, gompy_K, gompy_N_0, gompy_t_lag)
    
    pred_values$logi <- logistic_model(pred_values$time_points, 
                                       logi[[1]], logi[[2]], logi[[3]])
    
    pred_values$gompy <- gompertz_model(pred_values$time_points, 
                                        gompy[[1]], gompy[[2]],
                                        gompy[[3]], gompy[[4]])
    
    p <- ggplot(data = data_subset, aes(x = Time, y = PopBioLog)) + geom_point()
    p <- p + geom_line(data = pred_values, 
                       aes(x = time_points, y = logi, col="logistic"))
    p <- p + geom_line(data = pred_values, 
                       aes(x = time_points, y = gompy, col="gompertz"))
    p <- p + theme_minimal()
    p <- p + theme(legend.position = "bottom",
                   plot.title = element_text(hjust = 0.5))
    p <- p + labs(title = paste("Fitted Growth curves for:", ID_name) ,
                  y="Population (log)")
    print(p)
}
dev.off()

##### Non-linear model plotting 

# Printing another nice message
print("Plotting over. Thank you for your patience!")
