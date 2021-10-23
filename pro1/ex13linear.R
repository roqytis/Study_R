# 단순 선형회귀 모델 : 미국 여성 키, 몸무게 데이터 사용

head(women,2) #R이 기본제공
cor(women$height, women$weight) #0.9954948

plot(weight ~ height,data=women)

mfit <- lm(weight ~height, data = women)
mfit
# (Intercept)       height  
# -87.52         3.45  
abline(mfit, col='red')

summary(mfit) #요약통계량
#p_value 값이 0.05보다 낮아야 좋다
# y = 3.45000 * x + -87.51667
y= 3.45000 * 58 + -87.51667
cat('예측 몸무게 : ', y)

y = predict(mfit, data.frame(height = c(55,60,65,78)))
cat('예측 몸무게 : ',y) #예측 몸무게 :  102.2333 119.4833 136.7333 181.583

rsq = cor(women$height, women$weight) ** 2
cat('R-squared : ', rsq) #0.991

# 회귀분석모형의 적절성을 위한 조건 : 아래의 조건 위배 시에는 변수 제거나 조정을 신중히 고려해야 함.
# 1) 정규성 : 독립변수들의 잔차항이 정규분포를 따라야 한다.
# 2) 독립성 : 독립변수들 간의 값이 서로 관련성이 없어야 한다.
# 3) 선형성 : 독립변수의 변화에 따라 종속변수도 변화하나 일정한 패턴을 가지면 좋지 않다.
# 4) 등분산성 : 독립변수들의 오차(잔차)의 분산은 일정해야 한다. 특정한 패턴 없이 고르게 분포되어야 한다.
# 5) 다중공선성 : 독립변수들 간에 강한 상관관계로 인한 문제가 발생하지 않아야 한다.
# 예) 나이와 학년이 신체 구조에 미치는 영향(교집합이 매우 커 다중공선성 우려).


par(mfrow=c(2,2))
plot(mfit)
