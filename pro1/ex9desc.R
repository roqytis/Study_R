# 기술 통계 : 추론통계를 위한 자료의 정리, 요약, 해석 등을 통해 자료의 특성을 규명하는 통계적 방법

data <- read.csv('testdata/descriptive.csv',header = T)
dim(data)
head(data, 3)
summary(data$cost) #생활비

data <- na.omit(data)
summary(data$cost)
dim(data) # 139 8

data <- subset(data, data$cost >= 2 & data$ost <= 10)
data
dim(data)

length(data$cost)
plot(data$cost)
boxplot(data$cost)

mean(data$cost)
sd(data$cost)

#왜도, 첨도
install.packages("moments")
library(moments)

cost <- data$cost
skewness(cost) #왜도 : -0.2402368
hist(cost, prob = T)
lines(density(cost))

kurtosis(cost)

#거주지역
data$resident2[data$resident == 1] <- '특별시'
data$resident2[data$resident >= 2 & data$resident <= 4] <- '광역시'
data$resident2[data$resident == 5] <- '시구군'

head(data, 2)

x <- table(data$resident2)
x
prop.table(x)

#위와 유사한 작업을 통해 보고서 작성