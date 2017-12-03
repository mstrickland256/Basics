library(stats)
library(forecast)
library(ggplot2)

#Strip data down to a single column, no label.

snap <- read.csv("xxx.csv")
crackle <- findfrequency(snap)
  #used to determine the frequency/period for seasonality.
pop <- ts(crackle, frequency=30)
  #frequency here marks the period. 12 for months in a year, 4 for quarters in a year, 30 for days in a month. There must be at least two full periods in the data based on the chosen frequency, or there will be an error. Adjust in accord with the preceding "findfrequency" function.
plot(decompose(pop)
  #this will create four graphs: 1 of the original data, three decomposed showing the trendline, seasonal swings, and the extracted "noise" from the former.

tick <- auto.arima(crackle, d=NA, D=NA, max.p=5, max.q=5,
              max.P=2, max.Q=2, max.order=5, max.d=2, max.D=1,
              start.p=2, start.q=2, start.P=1, start.Q=1,
              stationary=FALSE, seasonal=TRUE,
              ic=c("aicc", "aic", "bic"), stepwise=TRUE, trace=FALSE,
              approximation=(length(crackle)>100 | frequency(crackle)>12), xreg=NULL,
              test=c("kpss","adf","pp"), seasonal.test=c("ocsb","ch"),
              allowdrift=TRUE, allowmean=TRUE, lambda=NULL, biasadj=FALSE,
              parallel=FALSE, num.cores=2)
  #Auto ARIMA will automatically seek out the best model based on AIC, etc. Note three places here where the arguments need to be edited for the name of the times series variable.

plot(forecast(tick))
