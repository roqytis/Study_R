#ANN : iris dataset
library(nnet)
library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')

set.seed(123)
idx <- sample(1:nrow(iris), 0.7 * nrow(iris))
train <- iris [idx, ]
test <- iris[-idx, ]
dim(train)
dim(test)

#node가 1개 
model1 <- nnet(Species ~ ., train, size = 1)
model1 #a 4-1-3 network with 11 weights
summary(model1)
plot.nnet(summary(model1))

# 분류 예측
pred1 <- predict(model1, test, type="class")
t1 <- table(pred1, test$Species)
t1
sum(diag(t1)) / nrow(test) #0.9777778

#node가 3개 
model3 <- nnet(Species ~ ., train, size = 3)
model3 #a 4-1-3 network with 11 weights
summary(model3)
plot.nnet(summary(model3))

# 분류 예측
pred2 <- predict(model3, test, type="class")
t2 <- table(pred1, test$Species)
t2
sum(diag(t2)) / nrow(test) #0.9777778
