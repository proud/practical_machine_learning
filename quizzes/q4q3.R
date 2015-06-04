library(caret)
library(elasticnet)

set.seed(3523)

library(AppliedPredictiveModeling)
data(concrete)

inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)

model <- train(CompressiveStrength ~ ., data = training, method="lasso")
print(model)

plot(model$finalModel, xvar="penalty")
