# 다중회귀 분석 : 독립변수가 복수

state.x77
str(state.x77)
class(state.x77)

states <- as.data.frame(state.x77[, c('Murder','Population', 'Illiteracy','Income','Frost')])
str(states)
names(states) #"Murder";살인 사건 발생률 "population": 인구수 "Illiteracy": 문맹률 "Income":수입 "Frost":결빙일과 관련이 있는지 확인

cor(states)
#Murder Population Illiteracy     Income      Frost
# Murder      1.0000000  0.3436428  0.7029752 -0.2300776 -0.5388834

#모델 작성
mfit <- lm(formula = Murder ~ Population + Illiteracy + Income + Frost,data = states) #Murder가 종속변수 나머지 독립변수
# y = wx + b      y =w1x1 +w2x2 + ... + b
mfit

summary(mfit) #p-value: 9.133e-08 < 0.05 이므로 유의한 모델
# Adjusted R-squared:  0.5285  30%이상 나오면 괜찮다

# 회귀분석모형의 적절성을 위한 조건 : 아래의 조건 위배 시에는 변수 제거나 조정을 신중히 고려해야 함.
# 1) 정규성 : 독립변수들의 잔차항이 정규분포를 따라야 한다.
# 2) 독립성 : 독립변수들 간의 값이 서로 관련성이 없어야 한다.
# 3) 선형성 : 독립변수의 변화에 따라 종속변수도 변화하나 일정한 패턴을 가지면 좋지 않다.
# 4) 등분산성 : 독립변수들의 오차(잔차)의 분산은 일정해야 한다. 특정한 패턴 없이 고르게 분포되어야 한다.
# 5) 다중공선성 : 독립변수들 간에 강한 상관관계로 인한 문제가 발생하지 않아야 한다.
# 예) 나이와 학년이 신체 구조에 미치는 영향(교집합이 매우 커 다중공선성 우려).

#시각화
par(mfrow = c(2,2))
plot(mfit)

#잔차의 정규성
shapiro.test(residuals(mfit)) # p-value = 0.6672 > 0.05 정규성 만족

install.packages("car", dependencies = T) #car에 종속적인 모든 패키지 설치
library(car)

# 독립성 : D-W Statistic p-value 값이 2에 가까울수록 좋다. 
durbinWatsonTest(mfit) #D-W Statistic : 2.317691

#선형성
boxTidwell(Murder ~Population+ Illiteracy, data = states)
# MLE of lambda Score Statistic (z) Pr(>|z|)
# Population       0.86939             -0.3228   0.7468 > 0.05 보다 크면 선형성 만족
# Illiteracy       1.35812              0.6194   0.5357 > 0.05 보다 크면 선형성 만족

#등분산성
ncvTest(mfit) # p = 0.18632 > 0.05 등분산성 만족

# 다중공선성: 발생한다면 요인을 제거
vif(mfit) #10을 넘으면 다중공선성 문제 발생
vif(mfit) > 10
sqrt(vif(mfit)) #2를 넘으면 다중공선성 문제 발생

#예측값 얻기
#states로 학습
part_states <- states[1:3,]
part_states
part_states <- edit(part_states)
part_states


predict(mfit, part_states)
# Population Illiteracy Income Frost 살인사건 발생율 에측값
# 1000        1.1   6000    22 Alabama 6.414696
# 500        1.5   3000   200  Alaska 7.870191
# 3000        1.8   2000    15 Arizona 9.500264

#독립변수 선택 방법
mfit1 <- lm(Murder ~ ., data = states)
summary(mfit1) #Adjusted R-squared:  0.5285 

mfit2 <- lm(Murder ~ Population + Illiteracy, data = states)
summary(mfit2) #Adjusted R-squared:  0.5484

#두개의 모델 비교
AIC(mfit1, mfit2)
# df      AIC
# mfit1  6 241.6429
# mfit2  4 237.6565

#AIC를 자동으로 처리 : stepwise regression
#backward(후진소거법) : 모든 변수를 넣고 기여도가 낮은 것부터 하나씩제거 
full_model <- lm(Murder ~ ., data = states)
reduce_model <- step(full_model, direction = 'backward')

summary(reduce_model)

#forward(전진소거법)
min_model <- lm(Murder ~ 1, data = states)
fwd_model <- step(min_model, direction = 'forward',
                  scope = (Murder ~ Population + Illiteracy + Income + Frost), trace = 1)

summary(fwd_model)

#또 다른 방법...
#all subset regression
library(leaps)
m <- leaps::regsubsets(Murder ~ Population + Illiteracy + Income + Frost, data = states, nbest = 4)
summary(m)

par(mfrow = c(1,1))
plot(m, scale='adjr2')

