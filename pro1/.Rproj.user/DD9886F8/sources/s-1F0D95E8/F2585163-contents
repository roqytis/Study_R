#선형회귀 : iris dataset
data(iris)
head(iris, 3) 
iris
names(iris)#Sepal.Length Sepal.Width Petal.Length Petal.Width Species
dim(iris) #150  5

cor(iris$Sepal.Length, iris$Petal.Length) # 0.8717538 강한 양의 상관관계
cor(iris$Sepal.Length,iris$Sepal.Width) # -0.1175698 약한 음의 상관관계

cor(iris$Sepal.Length, iris$Petal.Length) # 0.8717538 강한 양의 상관관계
plot(iris$Sepal.Length, iris$Petal.Length)

# 모델 1 : 약한 음의 상관관계로 작성
model1 <- lm(formula= Sepal.Length~ Sepal.Width, data = iris)
model1
summary(model1) #p-value: 0.1519 > 0.05 이므로 모델로 유의하지 않다.
#R-squared: 0.01382

#모델 2 :강한 양의 상관관계로 작성
model2 <- lm(formula = Sepal.Length ~ Petal.Length, data=iris)
model2
summary(model2) #p-value:  2.2e-16 < 0.05 이므로 모델로 유의하다.
#R -squared: 0.76

#상관계수가 낮은 경우에는 회귀 모델로 사용할 수 없다. 
