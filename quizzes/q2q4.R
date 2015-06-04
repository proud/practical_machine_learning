library(caret)
library(AppliedPredictiveModeling)

set.seed(3433)

data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

head(training[grep("^IL", colnames(training))])


preProc <- preProcess(iltraining, method="pca", thresh=0.80)
print(preProc)
