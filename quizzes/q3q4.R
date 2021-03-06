library(ElemStatLearn)
library(caret)

data(SAheart)

set.seed(8484)

train = sample(1:dim(SAheart)[1], size=dim(SAheart)[1]/2, replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

set.seed(13234)
model = train(chd ~ age+alcohol+obesity+tobacco+typea+ldl, method="glm", data=trainSA, family=binomial())

missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}

missClass(trainSA$chd, predict(model, trainSA))
missClass(testSA$chd, predict(model, testSA))
