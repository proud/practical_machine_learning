library(caret)
library(AppliedPredictiveModeling)

set.seed(3433)

data(AlzheimerDisease)
adData = data.frame(diagnosis, predictors)

inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

training <- training[grep("^IL|diagnosis", colnames(training))]
testing <- testing[grep("^IL|diagnosis", colnames(testing))]

prePCA <- preProcess(training[-1], method="pca", thresh=0.80)
trainPCA <- predict(prePCA, training[-1])
modelPCA <- train(training$diagnosis ~ ., method="glm", data=trainPCA)
testPCA <- predict(prePCA, testing[-1])

confusionMatrix(testing$diagnosis, predict(modelPCA, testPCA))
