head(countyUS)
countUS <- subset(countyUS, select = -c(X, Province_State, Last_Update, Country_Region, UID, Lat, Long_, ISO3))
countUS <- subset(countyUS, select = -c(X, Province_State, Last_Update,Country_Region,UID, Lat, Long_, ISO3))

countUS <- na.omit(countUS)

countUS <- transform(countUS, Confirmed = as.numeric(Confirmed), 
                     Deaths = as.numeric(Deaths),
                     Recovered = as.numeric(Recovered),
                     Active = as.numeric(Active),
                     FIPS = as.numeric(FIPS),
                     People_Tested = as.numeric(People_Tested),
                     People_Hospitalized = as.numeric(People_Hospitalized))


summary(countUS)

#apply(countUS, 2, mean)

pr.out = prcomp(countUS, scale = FALSE)
names(pr.out)                 


pr.out$center 


pr.out$scale 


pr.out$rotation

dim(pr.out$x)

biplot(pr.out, scale =0)


pr.out$rotation = -pr.out$rotation 
pr.out$x = -pr.out$x 
biplot(pr.out, scale =0) 


pr.out$sdev 

pr.var = pr.out$sdev^2 
pr.var 

pve = pr.var/sum(pr.var) 
pve 



lm.fit3=lm(deaths_cum ??? cases_cum + I(cases_cum^2), data = us) 
summary(lm.fit3)

mse = mean(lm.fit3$residuals^2)
print(paste0("MSE= ", mse))

print(paste0("RMSE= ", RMSE(lm.fit3$residuals)))



nyTimesNLM <- lm(deaths ~  cases, I(cases^2), data = ny_Times_Counties)
confint(nyTimesNLM)
summary(nyTimesNLM)


mse = mean(nyTimesNLM$residuals^2)
print(paste0("MSE= ", mse))

print(paste0("RMSE= ", RMSE(nyTimesNLM$residuals)))

