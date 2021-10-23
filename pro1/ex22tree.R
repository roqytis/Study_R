#분류분석 모델 중 Decision Tree(의사결정나무)

install.packages('party')
library(party)

airquality #뉴욕의  대기질에 대한 관련된 데이터 집합
str(airquality)
dim(airquality) #153   6
#온도(종속변수)에 영향을 미치는 변수(독립변수)를 설정하고 분류 모델
airmodel <- ctree(Temp ~  Solar.R+ Ozone + Wind, data = airquality)
airmodel

plot(airmodel)

#------------ iris dataset (꽃의 종류별로 분류 : 3가지)-----------------------------------
head(iris)
# train/ test
set.seed(123)
idx <- sample(1:nrow(iris), nrow(iris)*0.7)
train <- iris[idx, ]
test <- iris[-idx, ]

formula <- Species ~ .
irismodel <- ctree(formula = formula, data =train)
irismodel # 중요변수는 Petal.Length, Petal.width

plot(irismodel)

# 예측
pred <- predict(irismodel, test)
pred

t <- table(pred, test$Species)
t
sum(diag(t))/ nrow(test) #0.977778

#분류정확도 계산 함수
install.packages("caret")
library(caret)

confusionMatrix(pred, test$Species) # Accuracy : 0.9778

#새값으로 예측
head(iris, 1)
newdf <- iris[1,]
newdf
newdf$Sepal.Length <- 7
newdf$Sepal.Width <- 8
newdf$Petal.Length <- 7
newdf$Petal.Width <- 8
newdf
predict(irismodel, newdf)
