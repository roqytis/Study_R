#선형회귀 : cars dataset

head(cars,3) #speed(속도) dist(제동거리)

cor(cars$speed, cars$dist) #0.8068949

model <- lm(formula = dist~speed, data= cars)
model
summary(model)

coef(model) #회귀 계수수
fitted(model) #예측값 : 각 speed 값에 dist에측값

residuals(model)[1:4] #잔차

# cat('실제값 :', fitted(model)[1:4])
# cat('예측값 : ', cars$dist[1:4])

fitted(model)[1:4] + residuals(model)[1:4] # 예측값 + 잔차 ==> 실제값
cars$dist[1:4]

confint(model) #신뢰구간

summary(model)$r.squared #결정계수

#예측값
predict(model, newdata = data.frame(speed=10))

