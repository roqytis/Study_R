#svm으로 분류모델 작성 : iris dataset
library(e1071)

head(iris, 5)

?svm

# 모델 생성1
svm_model1 <- svm(Species ~ ., data = iris)
svm_model1

summary(svm_model1)

# 모델 생성2
x <- subset(iris, select = -Species) # 독립변수
y <- iris$Species
x
y

svm_model2 <- svm(x,y)
summary(svm_model2)

dist(iris[, -5], method = 'euclidean')
cmdscale(dist(iris[, -5])) #유클리디안 거리 결과를 공간적인 배치형식으로 보기

plot(cmdscale(dist(iris[, -5])), col=as.integer(iris[,5]),
     pch=c('o','+')[1:150 %in% svm_model2$index + 1])

pred <- predict(svm_model2,x)
head(pred,5)

t<- table(pred,y) #confusion matrix
t

sum(diag(t))/ nrow(x) #0.9733333

#최상의 모델을 위한 튜님
svm_tune <- tune(svm,train.x=x, train.y = y, kernel='radial',
                 ranges = list(cost= c(0.01,0.1,1,10,100)),
                 grammer = c(0.25,0.5,1.0,2.0,4.0))
svm_tune

svm_after_tune <- svm(Species ~.,data=iris, kernel='radial',cost =1)
summary(svm_after_tune)

pred <- predict(svm_after_tune, x, type="response")
t<- table(pred,y) #confusion matrix
t

sum(diag(t))/ nrow(x) #0.9733333
