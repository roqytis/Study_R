#단순/ 다중 회귀분석 : mtcars dataset

head(mtcars)
str(mtcars)
dim(mtcars)

#연습1 - 단순선형회귀
# hp:독립변수, mpg: 종속변수 모델 얻기
#임의의 마력수를 입력하면 연비를 예측하고 싶어~
#데이터 수집 후 가공을 함 그런데 mtcars가 제공됨으로 이를 그냥 사용

cor(mtcars$hp, mtcars$mpg) # 상관계수: -0.7761684

par(mar=c(1,1,1,1))
?plot
plot(mpg~ hp, data =mtcars, xlab='hp', ylab='mpg')

#인과관계가 있다고 판단됨
model1 <- lm(mpg ~ hp, data = mtcars)
model1
# y= -0.06823  * new_hp + 30.09886
summary(model1) # p-value: 1.788e-07 < 0.05 유의한 모델, R-squared:  0.6024

abline(model1, col= 'blue')

#예측 : 수식 사용
new_hp=110
cat('예측값 : ', -0.06823*new_hp + 30.09886)

new_hp=160
cat('예측값 : ', -0.06823*new_hp + 30.09886)

new_hp=70
cat('예측값 : ', -0.06823*new_hp + 30.09886)

#예측 : predict 함수
mynew <- mtcars[c(1,2),]
mynew <- edit(mynew)
mynew
pred = predict(model1, newdata = mynew)
pred


#연습2 - 단중선형회귀
#임의의 마력수와 차쳄게를 입력하면 연비를 예측하고 싶어~
# hp,wt :독립변수, mpg: 종속변수 모델 얻기
#데이터 수집 후 가공을 함 그런데 mtcars가 제공됨으로 이를 그냥 사용
cor(mtcars$hp, mtcars$mpg) #-0.7761684
cor(mtcars$wt, mtcars$mpg) #-0.8676594

model2 <- lm(mpg~hp + wt, data = mtcars)
model2
# (Intercept)           hp           wt  
# 37.22727     -0.03177     -3.87783  

summary(model2) # p-value: 9.109e-12 < 0.05유의한 모델. Adjusted R-squared:  0.8148 

#y = -0.03177 * new_hp + -3.87783 * new_wt + 37.22727

#에측: 수식 사용
new_hp =110; new_wt=2.2620
cat('예측값 : ', -0.03177 * new_hp + -3.87783 * new_wt + 37.22727)

new_hp =150; new_wt=5.620
cat('예측값 : ', -0.03177 * new_hp + -3.87783 * new_wt + 37.22727)

new_hp =80; new_wt=1.620
cat('예측값 : ', -0.03177 * new_hp + -3.87783 * new_wt + 37.22727)

#예측값 / 실제값 비교
pred2 = predict(model2)
cat('예측값 : ', pred2[1:10])
cat('실제값 : ', mtcars$mpg[1:10])

#새로운 값으로 예측 : predict 함수
new_data <- data.frame(hp = 110, wt= 2.620)
predict(model2, newdata = new_data)

new_data <- data.frame(hp = 80, wt = 1.620)
predict(model2, newdata = new_data)
