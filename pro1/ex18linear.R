# iris dataset으로 회귀분석 : train /test로 데이터 분리해서 처리
head(iris, 3)
str(iris)
NROW(iris)

set.seed(12) 
sam_tt <- sample(1:nrow(iris), nrow(iris) * 0.7, replace = F)
NROW(sam_tt) #105
train <- iris[sam_tt, ] #모델 학습용 데이터 train data
test <- iris[-sam_tt, ] #모델 검정용 데이터 test data
dim(train) #105   5
dim(test) #45  5
head(train,5)

#모델 작성
model <- lm(Sepal.Length ~ Sepal.Width +Petal.Length +Petal.Width, data = train)#train으로 학습
summary(model) #p-value: < 2.2e-16 < 0.05, Adjusted R-squared:  0.8455 

library(car)
#다중공선성
vif(model) #10을 넘으면 다중공선성을 의심해야 한다.
# Sepal.Width Petal.Length  Petal.Width 
# 1.337277    15.137142    14.014160    의심

#시각화
par(mfrow=c(2,2))
plot(model)

#정규성
shapiro.test(model$residuals) #p-value = 0.8316 > 0.05 만족

#독립성
durbinWatsonTest(model) # D-W Statistic   2.496394
# lag Autocorrelation D-W Statistic p-value
# 1      -0.2498465      2.496394   0.006

# 등분산성
ncvTest(model) #p = 0.12729 > 0.05 만족

#검정
pred <- predict(model, test) #test로 검정정
pred

cat('실제값 : ' , test[, 1], 5)
cat('예측값 : ' , pred[1:5])

#...