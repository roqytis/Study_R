#상관분석 : 두 변수 사이의 관계를 수치적으로 나타내는 분석
#예1)

x <- c(1,2,3,4,5)
y <- c(3,5,8,11,13)
plot(x,y)

cov(x,y) # 공분산 6.5 양의 관계. 힘의 크기는 단위가 제각각이므로 관계를 구체적으로 표현 할  수 없다.
cor(x,y) # 상관계수는 -0.9970545
x <- c(1,2,3,4,5)
y <- c(-3,-5,-8,-11,-13)
plot(x,y)

cov(x,y) # 공분산 -6.5 음의 관계
cor(x,y) # 상관계수는 -0.9970545

#예2) 아버지와 아들 키의 자료로 상관관계
hf <- read.csv('testdata/galton.csv', header = T) #sample dataset
dim(hf) #898  6
summary(hf)
str(hf)
class(hf)

head(hf, 5)

hf_man <- subset(hf, sex == 'M')
head(hf_man, 5)
hf_man <- hf_man[c('father','height')]
head(hf_man, 5)
dim(hf_man) #465   2

cov(hf_man$father, hf_man$height) # 공분산 2.368441. 관계의 방향을 알 수 있으나 관계의 정도를 정확히 알 수 없다.
cov_xy <-cov(hf_man$father, hf_man$height)
cov_xy
#상관계수는 공분산을 각변수의 표준편차의 곱으로 나눔
r_xy <- cov_xy /(sd(hf_man$father) * sd(hf_man$height))
r_xy #상관계수 0.3913174

cor(hf_man$father, hf_man$height) # 0.3913174
cor(hf_man$father, hf_man$height, method= 'pearson')
? cor
