# 상관관계 분석
result <- read.csv("testdata/drinking_water.csv", header = TRUE, fileEncoding = 'utf-8')
head(result)
str(result)

cov(result$친밀도, result$적절성) #공분산
cov(result) # 0.4164218

#상관계수
cor(result$친밀도, result$적절성) #0.4992086
cor(result$친밀도, result$만족도) #0.467145
cor(result$적절성, result$만족도) #0.7668527
cor(result$적절성 + result$만족도, result$만족도)

cor(result,method ='pearson')

# 상관관계 시각화
symnum(cor(result)) #숫자를 심볼로 표시

install.packages("corrgram")
library(corrgram)

corrgram(result)
corrgram(result, upper.panel = panel.conf)
corrgram(result, lower.panel = panel.conf)

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

chart.Correlation(result, histogram = , pch='+')

# 참고
cor(result, method = 'spearman') #서열척도(범주형)
cor(result, method = 'kendall')

# 상관계수 검정
x <- 1:5
y <- c(1,0,3,4,5)
cor.test(x,y,method = 'pearson') #p-value = 0.02937 < 0.05 이므로 상관관계 있다.
