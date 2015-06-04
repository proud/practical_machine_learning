library(lubridate)
dat = read.csv("~/Desktop/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

library(forecast)
model = bats(training$visitsTumblr)
fcast <- forecast(model, 235)
accuracy(fcast, testing$visitsTumblr)
