library(ElemStatLearn)
library(caret)

data(vowel.train)
data(vowel.test)

vowel.train$y <- factor(vowel.train$y)
vowel.test$y <- factor(vowel.test$y)

set.seed(33833)

model_rf <- train(y ~ ., data=vowel.train, method="rf")
model_gbm <- train(y ~ ., data=vowel.train, method="gbm", verbose=FALSE)

predictions_rf <- predict(model_rf, vowel.test)
cm_rf <- confusionMatrix(predictions_rf, vowel.test$y)
print(cm_rf$overall)

predictions_gbm <- predict(model_gbm, vowel.test)
cm_gbm <- confusionMatrix(predictions_gbm, vowel.test$y)
print(cm_gbm$overall)
