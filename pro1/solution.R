#2번
# x <- c(2,3,5,6,7,10)
# x
# max(x) #최대값
# min(x) #최소값
# mean(x) #평균


#3번
# n<- 1:12
# x <- matrix(n,nrow=3, ncol=4) #x의 매트릭스
# x
# c =t(x) #전치행렬
# c
# n <- 9
# 
# #5번
# a <- c(10,20)
# b <- c(10,20)
# 
# ls()
# 
# rm(list=ls())
# 
# gc()
# 
# #6번
# install.packages("plyr")
# library('plyr')

# 회귀분석모형의 적절성을 위한 조건 : 아래의 조건 위배 시에는 변수 제거나 조정을 신중히 고려해야 함.
# 1) 정규성 : 독립변수들의 잔차항이 정규분포를 따라야 한다.
# 2) 독립성 : 독립변수들 간의 값이 서로 관련성이 없어야 한다.
# 3) 선형성 : 독립변수의 변화에 따라 종속변수도 변화하나 일정한 패턴을 가지면 좋지 않다.
# 4) 등분산성 : 독립변수들의 오차(잔차)의 분산은 일정해야 한다. 특정한 패턴 없이 고르게 분포되어야 한다.
# 5) 다중공선성 : 독립변수들 간에 강한 상관관계로 인한 문제가 발생하지 않아야 한다.
# 예) 나이와 학년이 신체 구조에 미치는 영향(교집합이 매우 커 다중공선성 우려).

# #1번
# name <- c('aa', 'bb','cc','dd')
# gender <- c("F","M","M","F")
# price <- c(50,65,45,75)
# client <- data.frame(name,gender,price)
# client
# 
# client[client$price >= 65, "result"] = "Best"
# client[client$price < 65, "result"] = "Normal"
# client
# client[, "gender2"] <- c("Female","Male","Male","Female")
# client
# #if
# 
# 
# if(price >= 65){
#   
#   cat("best")
# }else{
#   print("normal")
# }

# hf <- read.csv('testdata/galton.csv', header = T)
# 
# dim(hf) #898  6
# summary(hf)
# 
# hf_woman <- subset(hf, sex == 'F')
# head(hf_woman, )
# hf_woman <- hf_woman[c('mother','height')]
# 
# head(hf_woman, 5)
# dim(hf_woman) 
# 
# cov(hf_woman$mother, hf_woman$height) 
# cov_xy <-cov(hf_woman$mother, hf_woman$height)
# cov_xy
# #상관계수는 공분산을 각변수의 표준편차의 곱으로 나눔
# r_xy <- cov_xy /(sd(hf_woman$father) * sd(hf_woman$height))
# r_xy #상관계수 0.3913174
# 
# cor(hf_woman$father, hf_woman$height) # 0.3913174
# cor(hf_woman$father, hf_woman$height, method= 'pearson')


# 10 .독립변수: A중학교 남학생, 매일 저녁 음식, 인스턴트 음료
# 종속 변스: 늘어나는 몸무게
# 
# 9.음의 상관관계로 산점도에서 점들이 우하향 방향으로 띠를 형성합니다. 그리고 점들이 선에 가깝게 위치합니다. 변수 사이에 강한 
# 음의 선형 관계가 있고 한 변수가 증가하면 다른 변수도 감소하기 때문에 음의 관계가 있습니다. 
# 
# 8.merge
# 7.seq(25, -15, -5)
# 
# 6.
# vec <- rep("R",5)
# vec
# 5. 명목척도
# 4.ls()는 현재 저장되어 있는 변수들을 모두 출력한다. 
# rm(d1, d2)는 d1과 d2를 지워주는 역할을 한다. 
# getwd()는 현재 작업 경로의 위치를 확인할 수 있는 함수 이다.
# 3.list
# 2.null
# 1.명목척도
# 순위척도
# 등간척도
# 비율척도
