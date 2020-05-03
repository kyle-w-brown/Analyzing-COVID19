# Linear Regression of JHU Time Series 

# Mortal Rate as the Predictor
mortalUSlm <- read.csv("https://raw.githubusercontent.com/WorldCapital/COVID19-Project/master/COVID-19/JHU_county_time_series.csv")
mortalUSlm <- lm(Mortality_Rate ~ Confirmed + Deaths + Recovered + FIPS + Incident_Rate  + People_Tested  + People_Hospitalized  + Testing_Rate + Hospitalization_Rate, data = countyUS)
confint(mortalUSlm)
summary(mortalUSlm)

#> confint(mortalUSlm)
#                             2.5 %       97.5 %
#(Intercept)           1.652284e-01 4.6295403433
#Confirmed            -1.746263e-03 0.0002642959
#Deaths                1.599327e-03 0.0163916167
#Recovered            -9.298223e-04 0.0012258376
#FIPS                 -3.283382e-02 0.0182436369
#Incident_Rate        -1.571874e-03 0.0166771746
#People_Tested        -2.507911e-05 0.0001091853
#People_Hospitalized  -1.980213e-03 0.0030409218
#Testing_Rate         -2.364439e-03 0.0001442469
#Hospitalization_Rate -3.935092e-02 0.1701047374

#> summary(mortalUSlm)
#Call:
#  lm(formula = Mortality_Rate ~ Confirmed + Deaths + Recovered + 
#       FIPS + Incident_Rate + People_Tested + People_Hospitalized + 
#       Testing_Rate + Hospitalization_Rate, data = countyUS)

#Residuals:
#     Min       1Q   Median       3Q      Max 
#-1.74730 -0.47161  0.01175  0.38685  2.12121 

#Coefficients:
#                       Estimate  Std. Error  t value  Pr(>|t|)  
#(Intercept)           2.397e+00   1.062e+00    2.256   0.0367 *
#Confirmed            -7.410e-04   4.785e-04   -1.549   0.1389  
#Deaths                8.995e-03   3.520e-03    2.555   0.0199 *
#Recovered             1.480e-04   5.130e-04    0.288   0.7763  
#FIPS                 -7.295e-03   1.216e-02   -0.600   0.5559  
#Incident_Rate         7.553e-03   4.343e-03    1.739   0.0991 .
#People_Tested         4.205e-05   3.195e-05    1.316   0.2047  
#People_Hospitalized   5.303e-04   1.195e-03    0.444   0.6625  
#Testing_Rate         -1.110e-03   5.970e-04   -1.859   0.0794 .
#Hospitalization_Rate  6.538e-02   4.985e-02    1.312   0.2062  
#---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#Residual standard error: 1.057 on 18 degrees of freedom
#(31 observations deleted due to missingness)
#Multiple R-squared:  0.6843,	Adjusted R-squared:  0.5264 
#F-statistic: 4.334 on 9 and 18 DF,  p-value: 0.003951


mse = mean(mortalUSlm$residuals^2)
print(paste0("MSE= ", mse))

#> print(paste0("MSE= ", mse))
#[1] "MSE= 0.717658874682637"

print(paste0("RMSE= ", RMSE(mortalUSlm$residuals)))
#> print(paste0("RMSE= ", RMSE(mortalUSlm$residuals)))
#[1] "RMSE= 0.847147492873961"

par(mfrow = c(2,2)) 
plot(mortalUSlm)