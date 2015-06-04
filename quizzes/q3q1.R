library(AppliedPredictiveModeling)
library(caret)

data(segmentationOriginal)

testing <- segmentationOriginal[segmentationOriginal$Case == 'Test', -2]
training <- segmentationOriginal[segmentationOriginal$Case == 'Train', -2]

set.seed(125)
model <- train(Class ~ ., method="rpart", data=training)

print(model$finalModel)
