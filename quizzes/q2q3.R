library(AppliedPredictiveModeling)
library(caret)

data(concrete)

set.seed(975)

inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

hist(training$Superplasticizer)
hist(log(training$Superplasticizer))
