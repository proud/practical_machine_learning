library(caret)
library(gbm)

set.seed(3433)

library(AppliedPredictiveModeling)
data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

set.seed(62433)

model_rf = train(diagnosis ~ ., data=training, method="rf")
pred_rf <- predict(model_rf, testing)
cm_rf <- confusionMatrix(pred_rf, testing$diagnosis)
model_gbm = train(diagnosis ~ ., data=training, method="gbm", verbose=FALSE)
pred_gbm <- predict(model_gbm, testing)
cm_gbm <- confusionMatrix(pred_gbm, testing$diagnosis)
model_lda = train(diagnosis ~ ., data=training, method="lda")
pred_lda <- predict(model_lda, testing)
cm_lda <- confusionMatrix(pred_lda, testing$diagnosis)

predictions <- data.frame(pred_rf, pred_gbm, pred_lda, diagnosis=testing$diagnosis)
model_stacked <- train(diagnosis ~ ., data=predictions, method="rf")
pred_stacked <- predict(model_stacked, testing)
cm_stacked <- confusionMatrix(pred_stacked, predictions$diagnosis)

print(cm_rf$overall)
print(cm_gbm$overall)
print(cm_lda$overall)
print(cm_stacked$overall)
