# Not cleaning the workspace as this script is called after 
#plotting and requires the came data 

# Importing required libraries
#library(tidyverse)
#library(minpack.lm)

# Printing a nice message
print("Printing graphs required for report. Almost there!")
# Comparing residuals and AICs
test1 <- model_coef_df %>%  select(ID, lin_AIC, quad_AIC, cubic_AIC)
test2 <- NonLinModel_coef_df %>% select(ID, logi_AIC, gompy_AIC)

test <- left_join(test1, test2, by = "ID")
test[test==-Inf] = Inf
test[is.na(test)] = Inf
rm(test1, test2)

test <- test %>%  
    mutate(best_lin = pmin(lin_AIC, quad_AIC, cubic_AIC)) %>% 
    mutate(best_non_lin = pmin(logi_AIC, gompy_AIC)) %>% 
    mutate(best_model = pmin(best_non_lin, best_lin))

test <- test %>% 
    mutate(name_lin = case_when(lin_AIC == best_lin ~ "linear", 
                                quad_AIC== best_lin ~ "quadratic", 
                                cubic_AIC == best_lin ~ "cubic")) %>% 
    mutate(name_non_lin = case_when(logi_AIC == best_non_lin ~ "logistic",
                                    gompy_AIC == best_non_lin ~ "gompertz")) %>% 
    mutate(best_model_name = case_when(lin_AIC == best_model ~ "linear", 
                                  quad_AIC== best_model ~ "quadratic", 
                                  cubic_AIC == best_model ~ "cubic",
                                  logi_AIC == best_model ~ "logistic",
                                  gompy_AIC == best_model ~ "gompertz"))


whoosh <- as.data.frame(table(test$best_model_name))
names(whoosh)[1] <- "Model_name"

pie <- ggplot(data = whoosh, aes(x="", y=Freq, fill=Model_name)) +
    geom_bar(width = 1, stat = "identity", colour="black", alpha=0.5) +
    coord_polar("y", start = 0) + theme_minimal() +
    theme(legend.position = "bottom",
          axis.ticks = element_blank(),
          axis.title.x = element_blank(), 
          axis.title.y = element_blank(),
          panel.grid = element_blank(),
          panel.border = element_blank(),
          axis.text.x = element_blank(),
          plot.title = element_text(hjust = 0.5)) +
    labs(title = "Best model fits") + 
    scale_fill_discrete()
pie <- pie + geom_text(aes(label=Freq), position = position_stack(vjust = 0.5))
pdf("../results/pie_chart.pdf")
print(pie)
dev.off()

long_form <- test %>%  select(lin_AIC, quad_AIC, cubic_AIC, 
                              logi_AIC, gompy_AIC) %>% 
    rename(linear = `lin_AIC`, quadratic=`quad_AIC`, cubic = `cubic_AIC`,
           logistic=`logi_AIC`, gompertz = `gompy_AIC`) %>% 
    pivot_longer(
        everything(),
    names_to = "Model_name",
    names_prefix = "AIC",
    values_to = "AIC_value"
)
head(long_form)

box <- ggplot(data = long_form, aes(x=Model_name, y=AIC_value, fill=Model_name)) + 
    geom_violin(alpha=0.55) +
    theme_minimal()+
    theme(legend.position = "bottom",
          plot.title = element_text(hjust = 0.5)) +
    labs(title = "AIC value spread of different models",
         x = "Name of model", y = "AIC value")
box <- box + stat_summary(fun.data = mean_sdl, geom = "pointrange", size=0.25)
pdf("../results/violin.pdf")
print(box)
dev.off()

whoosh2 <- as.data.frame(table(test$name_lin))
names(whoosh2)[1] <- "Model_name"

pie <- ggplot(data = whoosh2, aes(x="", y=Freq, fill=Model_name)) +
    geom_bar(width = 1, stat = "identity", colour="black", alpha=0.7) +
    coord_polar("y", start = 0) + theme_minimal() +
    theme(legend.position = "bottom",
          axis.ticks = element_blank(),
          axis.title.x = element_blank(), 
          axis.title.y = element_blank(),
          panel.grid = element_blank(),
          panel.border = element_blank(),
          axis.text.x = element_blank(),
          plot.title = element_text(hjust = 0.5)) +
    labs(title = "Best model fits") + 
    scale_fill_brewer(palette = 15)
pie <- pie + geom_text(aes(label=Freq), position = position_stack(vjust = 0.5))
pdf("../results/pie_chart_lin.pdf")
print(pie)
dev.off()

whoosh3 <- as.data.frame(table(test$name_non_lin))
names(whoosh3)[1] <- "Model_name"

pie <- ggplot(data = whoosh3, aes(x="", y=Freq, fill=Model_name)) +
    geom_bar(width = 1, stat = "identity", colour="black",alpha=0.7) +
    coord_polar("y", start = 0) + theme_minimal() +
    theme(legend.position = "bottom",
          axis.ticks = element_blank(),
          axis.title.x = element_blank(), 
          axis.title.y = element_blank(),
          panel.grid = element_blank(),
          panel.border = element_blank(),
          axis.text.x = element_blank(),
          plot.title = element_text(hjust = 0.5)) +
    labs(title = "Best model fits") +
    scale_fill_brewer(palette = 12)
pie <- pie + geom_text(aes(label=Freq), position = position_stack(vjust = 0.5))
pdf("../results/pie_chart_non_lin.pdf")
print(pie)
dev.off()

ID_name <- model_coef_df[284,"ID"]
data_subset <- data %>%  filter(ID==ID_name[[1]])
pred_values <- data.frame(time_points = seq(min(data_subset$Time), 
                                            max(data_subset$Time), by = 0.01))
lin <- model_coef_df %>% filter(ID == ID_name[[1]]) %>% 
    select(lin_slope, lin_int)

quad <- model_coef_df %>% filter((ID == ID_name[[1]])) %>% 
    select(quad_p_2, quad_p_1, quad_int) 

cubic <- model_coef_df %>% filter(ID == ID_name[[1]]) %>%
    select(cubic_p_3, cubic_p_2, cubic_p_1, cubic_int)
logi <- NonLinModel_coef_df %>% 
    filter(ID==ID_name[[1]]) %>% 
    select(logi_r_max, logi_K, logi_N_0)
gompy <- NonLinModel_coef_df %>% 
    filter(ID==ID_name[[1]]) %>% 
    select(gompy_r_max, gompy_K, gompy_N_0, gompy_t_lag)

pred_values$logi <- logistic_model(pred_values$time_points, 
                                   logi[[1]], logi[[2]], logi[[3]])

pred_values$gompy <- gompertz_model(pred_values$time_points, 
                                    gompy[[1]], gompy[[2]],
                                    gompy[[3]], gompy[[4]])


pred_values$lin_pred <- lin[[1]] * pred_values$time_points + lin[[2]]

pred_values$quad_pred <- quad[[2]] * poly(pred_values$time_points,2, raw=T)[,1] + 
    quad[[1]] * poly(pred_values$time_points,2, raw = T)[,2] + quad[[3]]

pred_values$cubic_pred <- cubic[[3]] * poly(pred_values$time_points,3,raw = T)[,1] + 
    cubic[[2]] * poly(pred_values$time_points,3,raw = T)[,2] + 
    cubic[[1]] * poly(pred_values$time_points,3,raw = T)[,3] + cubic[[4]]

pretty_p <- ggplot(data = data_subset, aes(x=Time, y=PopBioLog)) +
    geom_point(size=1) + theme_minimal() + 
    labs(title = "Model fit",x = "Time (hours)", y = "Population in log scale") + 
    theme(axis.text.x = element_text(color = "black", size = 11),
          axis.text.y = element_text(colour = "black", size = 11),
          axis.line = element_line(colour = "black", size = 0.3),
          axis.title = element_text(colour = "black", size = 13),
          plot.title = element_text(hjust = 0.5, size = 14))
pretty_p <- pretty_p + geom_line(data = pred_values, 
                                 aes(x=time_points, y=lin_pred, 
                                     colour = "linear")) +
    geom_line(data = pred_values, 
              aes(x=time_points, y=quad_pred, colour="quadratic")) +
    geom_line(data = pred_values, 
              aes(x = time_points, y = cubic_pred, colour="cubic")) +
    geom_line(data = pred_values, 
              aes(x=time_points, y=logi, colour="logistic")) +
    geom_line(data = pred_values, 
              aes(x=time_points, y=gompy, colour="gompertz")) + 
    annotate("text", x = 40, y = 4,
             label = paste("Gompertz AIC:", NonLinModel_coef_df[284, "gompy_AIC"])) +
    annotate("text", x = 40, y = 3,
             label = paste("Logistic AIC:", NonLinModel_coef_df[284, "logi_AIC"])) +
    annotate("text", x = 40, y = 2,
             label = paste("Cubic AIC:", model_coef_df[284, "cubic_AIC"])) +
    annotate("text", x = 40, y = 1,
             label = paste("Quadratic AIC:", model_coef_df[284, "quad_AIC"])) +
    annotate("text", x = 40, y = 0,
             label = paste("Linear AIC:", model_coef_df[284, "lin_AIC"]))
pretty_p <- pretty_p + theme(legend.position = "bottom",
                             legend.title = element_blank(),
                             legend.text = element_text(colour = "black"))
pdf("../results/good_fit.pdf")
print(pretty_p)
dev.off()

ID_name <- model_coef_df[160,"ID"]
data_subset <- data %>%  filter(ID==ID_name[[1]])
pred_values <- data.frame(time_points = seq(min(data_subset$Time), 
                                            max(data_subset$Time), by = 0.01))
lin <- model_coef_df %>% filter(ID == ID_name[[1]]) %>% 
    select(lin_slope, lin_int)

quad <- model_coef_df %>% filter((ID == ID_name[[1]])) %>% 
    select(quad_p_2, quad_p_1, quad_int) 

cubic <- model_coef_df %>% filter(ID == ID_name[[1]]) %>%
    select(cubic_p_3, cubic_p_2, cubic_p_1, cubic_int)
logi <- NonLinModel_coef_df %>% 
    filter(ID==ID_name[[1]]) %>% 
    select(logi_r_max, logi_K, logi_N_0)
gompy <- NonLinModel_coef_df %>% 
    filter(ID==ID_name[[1]]) %>% 
    select(gompy_r_max, gompy_K, gompy_N_0, gompy_t_lag)

pred_values$logi <- logistic_model(pred_values$time_points, 
                                   logi[[1]], logi[[2]], logi[[3]])

pred_values$gompy <- gompertz_model(pred_values$time_points, 
                                    gompy[[1]], gompy[[2]],
                                    gompy[[3]], gompy[[4]])


pred_values$lin_pred <- lin[[1]] * pred_values$time_points + lin[[2]]

pred_values$quad_pred <- quad[[2]] * poly(pred_values$time_points,2, raw=T)[,1] + 
    quad[[1]] * poly(pred_values$time_points,2, raw = T)[,2] + quad[[3]]

pred_values$cubic_pred <- cubic[[3]] * poly(pred_values$time_points,3,raw = T)[,1] + 
    cubic[[2]] * poly(pred_values$time_points,3,raw = T)[,2] + 
    cubic[[1]] * poly(pred_values$time_points,3,raw = T)[,3] + cubic[[4]]

ugly_p <- ggplot(data = data_subset, aes(x=Time, y=PopBioLog)) +
    geom_point(size=1) + theme_minimal() + 
    labs(title = "Model fit",x = "Time (hours)", y = "Population in log scale") + 
    theme(axis.text.x = element_text(color = "black", size = 11),
          axis.text.y = element_text(colour = "black", size = 11),
          axis.line = element_line(colour = "black", size = 0.3),
          axis.title = element_text(colour = "black", size = 13),
          plot.title = element_text(hjust = 0.5, size = 14))
ugly_p <- ugly_p + geom_line(data = pred_values, 
                                 aes(x=time_points, y=lin_pred, 
                                     colour = "linear")) +
    geom_line(data = pred_values, 
              aes(x=time_points, y=quad_pred, colour="quadratic")) +
    geom_line(data = pred_values, 
              aes(x = time_points, y = cubic_pred, colour="cubic")) +
    geom_line(data = pred_values, 
              aes(x=time_points, y=logi, colour="logistic")) +
    geom_line(data = pred_values, 
              aes(x=time_points, y=gompy, colour="gompertz")) + 
    annotate("text", x = 400, y = 2.35,
             label = paste("Gompertz AIC:", NonLinModel_coef_df[160, "gompy_AIC"])) +
    annotate("text", x = 400, y = 1.95,
             label = paste("Logistic AIC:", NonLinModel_coef_df[160, "logi_AIC"])) +
    annotate("text", x = 400, y = 1.45,
             label = paste("Cubic AIC:", model_coef_df[160, "cubic_AIC"])) +
    annotate("text", x = 400, y = 0.95,
             label = paste("Quadratic AIC:", model_coef_df[160, "quad_AIC"])) +
    annotate("text", x = 400, y = 0.45,
             label = paste("Linear AIC:", model_coef_df[160, "lin_AIC"]))
ugly_p <- ugly_p + theme(legend.position = "bottom",
                             legend.title = element_blank(),
                             legend.text = element_text(colour = "black"))
pdf("../results/bad_fit.pdf")
print(ugly_p)
dev.off()

print("Analysis complete! ;)")