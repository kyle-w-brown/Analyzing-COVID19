#Non-Linear Model NY Times using Deaths
nyTimesNLM <- read.csv("https://raw.githubusercontent.com/WorldCapital/COVID19-Project/master/COVID-19/nyt-us-counties.csv")
nyTimesNLM <- lm(deaths ~ fips + cases, I(cases^2), data = ny_Times_Counties)
confint(nyTimesNLM)
summary(nyTimesNLM)

#                    2.5 %        97.5 %
#(Intercept) -6.158255e-02 -4.619689e-02
#fips        -6.207604e-07 -1.272867e-07
#cases        3.375156e-02  3.390987e-02

#> summary(nyTimesNLM)
#Call:
#  lm(formula = deaths ~ fips + cases, data = ny_Times_Counties, 
#     subset = I(cases^2))
#
#Residuals:
#     Min       1Q   Median       3Q      Max 
#-27.1142   0.0216   0.0223   0.0399  19.3935 

#Coefficients:
#              Estimate  Std. Error  t value   Pr(>|t|)    
#(Intercept) -5.389e-02   3.925e-03  -13.730   < 2e-16 ***
#fips        -3.740e-07   1.259e-07   -2.971   0.00297 ** 
#cases        3.383e-02   4.038e-05  837.709   < 2e-16 ***
#  ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#Residual standard error: 0.6038 on 55656 degrees of freedom
#(3543 observations deleted due to missingness)
#Multiple R-squared:  0.9265,	Adjusted R-squared:  0.9265 
#F-statistic: 3.51e+05 on 2 and 55656 DF,  p-value: < 2.2e-16



mse = mean(nyTimesNLM$residuals^2)
print(paste0("MSE= ", mse))

#> print(paste0("MSE= ", mse))
#[1] "MSE= 0.364578917674488"

print(paste0("RMSE= ", RMSE(nyTimesNLM$residuals)))

#> print(paste0("RMSE= ", RMSE(nyTimesNLM$residuals)))
#[1] "RMSE= 0.603803707900579"

par(mfrow = c(2,2)) 
plot(nyTimesNLM)

