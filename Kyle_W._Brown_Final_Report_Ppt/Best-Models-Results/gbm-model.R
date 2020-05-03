# Final Model for COVID-19 Project 
library(httr)
library(jsonlite) 
library(h2o)

h2o.init()


#COVID-19 API from STATWORX
payload <- list(code = "US") 
response <- httr::POST(url = "https://api.statworx.com/covid", body = toJSON(payload, auto_unbox = TRUE), encode = "json") 

content <- rawToChar(response$content) 
us <- data.frame(fromJSON(content)) 


conv_data <- us
str(conv_data)


#Convert variables into factors
conv_data$day <- as.factor(conv_data$day)
conv_data$month <- as.factor(conv_data$month)  
conv_data$year <- as.factor(conv_data$year) 
conv_data$cases <- as.factor(conv_data$cases)  
conv_data$deaths <- as.factor(conv_data$deaths)  
conv_data$country <- as.factor(conv_data$country)  
conv_data$code <- as.factor(conv_data$code) 
conv_data$population <- as.factor(conv_data$population)  
conv_data$cases_cum <- as.factor(conv_data$cases_cum)  
conv_data$deaths_cum <- as.factor(conv_data$deaths_cum)
conv_data$ID  <- 1:nrow(conv_data)  
conv_data.hex  <- as.h2o(conv_data)

#----------------------------------------------------------------------------------------------------------------------------------

#Split data into Train/Validation/Test Sets
split_h2o <- h2o.splitFrame(conv_data.hex, c(0.6, 0.2), seed = 1234 )
train_conv_h2o <- h2o.assign(split_h2o[[1]], "train" ) # 60%
valid_conv_h2o <- h2o.assign(split_h2o[[2]], "valid" ) # 20%
test_conv_h2o  <- h2o.assign(split_h2o[[3]], "test" )  # 20%


#Model
# Set names for h2o
target <- "cases_cum"
predictors <- setdiff(names(train_conv_h2o), target)


# Run the automated machine learning 
automl_h2o_models <- h2o.automl(
  x = predictors, 
  y = target,
  training_frame    = train_conv_h2o,
  leaderboard_frame = valid_conv_h2o
)

#------------------------------------------------------------------------------------------------------------------------------------

# Leaderboard for AutoML models
automl_h2o_models@leaderboard

#> automl_h2o_models@leaderboard

#                                             model_id  mean_per_class_error   logloss      rmse       mse
#1         GBM_grid__1_AutoML_20200419_000459_model_11             0.1538462  3.057785 0.7551169 0.5702015
#2         GBM_grid__1_AutoML_20200419_000459_model_17             0.1538462  2.600758 0.7426484 0.5515267
#3         GBM_grid__1_AutoML_20200419_000459_model_14             0.1538462  2.953171 0.7547937 0.5697135
#4         GBM_grid__1_AutoML_20200419_000459_model_19             0.1666667  2.915022 0.8000938 0.6401500
#5          GBM_grid__1_AutoML_20200419_000459_model_3             0.1820513 15.400890 0.8465990 0.7167299
#6 DeepLearning_grid__2_AutoML_20200419_000459_model_6             0.1846154  6.973854 0.8723805 0.7610478


#-----------------------------------------------------------------------------------------------------------------------------------

# Extract leader model
automl_leader <- automl_h2o_models@leader
automl_leader


#> automl_leader
#Model Details:
#  ==============
  
#  H2OMultinomialModel: gbm
#Model ID:  GBM_grid__1_AutoML_20200419_000459_model_11 
#Model Summary: 
#  number_of_trees number_of_internal_trees model_size_in_bytes min_depth max_depth mean_depth min_leaves
#1              30                     1440              246515         1         4    3.63472          2
#max_leaves mean_leaves
#1         16     6.77708


#H2OMultinomialMetrics: gbm
#** Reported on training data. **
  
#  Training Set Metrics: 
#  =====================
  
#  Extract training frame with `h2o.getFrame("automl_training_train")`
#MSE: (Extract with `h2o.mse`) 3.935282e-06
#RMSE: (Extract with `h2o.rmse`) 0.001983755
#Logloss: (Extract with `h2o.logloss`) 0.001966052
#Mean Per-Class Error: 0
#R^2: (Extract with `h2o.r2`) 1

#Hit Ratio Table: Extract with `h2o.hit_ratio_table(<model>,train = TRUE)`
#=======================================================================
#  Top-10 Hit Ratios: 
#  k hit_ratio
#1   1  1.000000
#2   2  1.000000
#3   3  1.000000
#4   4  1.000000
#5   5  1.000000
#6   6  1.000000
#7   7  1.000000
#8   8  1.000000
#9   9  1.000000
#10 10  1.000000



#H2OMultinomialMetrics: gbm
#** Reported on cross-validation data. **
#  ** 5-fold cross-validation on training data (Metrics computed for combined holdout predictions) **
  
#  Cross-Validation Set Metrics: 
#  =====================
  
#  Extract cross-validation frame with `h2o.getFrame("automl_training_train")`
#MSE: (Extract with `h2o.mse`) 0.6727001
#RMSE: (Extract with `h2o.rmse`) 0.820183
#Logloss: (Extract with `h2o.logloss`) 3.463518
#Mean Per-Class Error: 0.6730769
#R^2: (Extract with `h2o.r2`) 0.998335
#Hit Ratio Table: Extract with `h2o.hit_ratio_table(<model>,xval = TRUE)`
#=======================================================================
#  Top-10 Hit Ratios: 
#  k hit_ratio
#1   1  0.307692
#2   2  0.323077
#3   3  0.323077
#4   4  0.323077
#5   5  0.323077
#6   6  0.323077
#7   7  0.323077
#8   8  0.323077
#9   9  0.323077
#10 10  0.323077


#Cross-Validation Metrics Summary: 
#                              mean           sd cv_1_valid cv_2_valid cv_3_valid cv_4_valid cv_5_valid
#accuracy                0.30769232  0.094211146 0.46153846 0.23076923 0.23076923 0.30769232 0.30769232
#err                      0.6923077  0.094211146 0.53846157  0.7692308  0.7692308  0.6923077  0.6923077
#err_count                      9.0    1.2247449        7.0       10.0       10.0        9.0        9.0
#logloss                  3.4635184    0.4602315  2.7115996  3.6106849  3.9662728   3.548047  3.4809875
#max_per_class_error            1.0          0.0        1.0        1.0        1.0        1.0        1.0
#mean_per_class_accuracy 0.86153847   0.01884223  0.8923077 0.84615386 0.84615386 0.86153847 0.86153847
#mean_per_class_error    0.13846155   0.01884223 0.10769231 0.15384616 0.15384616 0.13846155 0.13846155
#mse                      0.6727001   0.08535113 0.53059614 0.71209335  0.7577791  0.6815926 0.68143946
#r2                       0.9982088 6.2457175E-4  0.9988421 0.99843067 0.99719256 0.99811006  0.9984687
#rmse                    0.81877226  0.053760055 0.72842026  0.8438563  0.8705051  0.8255862 0.82549345


#---------------------------------------------------------------------------------------------------------------------

# AutoML Leader plot
plot(automl_leader)
