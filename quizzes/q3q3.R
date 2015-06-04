library(pgmm)
library(caret)

data(olive)

olive <- olive[,-1]

model <- train(Area ~ ., method="rpart", data=olive)

newdata <- as.data.frame(t(colMeans(olive)))

testpred <- predict(model, newdata)
print(testpred)

library(randomForest)

model <- train(Area ~ ., method="rpart2", data=olive)
testpred <- predict(model, newdata)
print(testpred)
