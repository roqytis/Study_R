#SVM (support Vector Machine) : 서로 다른 집단에 속하는 데이터 간에 간격이 최대가 되는 
#초평면을 기준으로 데이터를 분류하는 알고리즘
#초평면 마진을 최대화하는데 결정적 영향을 주는 데이터들을 support vectors라고 함
# kernel trick을 이용해서 비선형 데이터인 경우에도 차원을 늘려 분류가 가능.

set.seed(1)
x <- matrix(rnorm(20* 2), ncol = 2)
y <- c(rep(-1,10), rep(1,10))
x
y

x[y == 1,] <- x[y == 1,] + 1
x
plot(x, col = (2-y))

# SVM 모델
#install.packages("e1071")
library(e1071)

df <- data.frame(x = x, y = as.factor(y))
df
#?svm
svmfit <- svm(formula = y ~ ., data = df, kernel = 'linear', cost = 10, scale = F)
svmfit #Number of Support Vectors:  7

# SVM-Type:  C-classification 
# SVM-Kernel:  linear 
# cost:  10 

plot(svmfit,df)

attributes(svmfit)

svmfit$index #1  2  5  7 14 16 17
df[c(1, 2, 5, 7, 14, 16, 17), ]

summary(svmfit)


svmfit <- svm(formula = y ~ ., data = df, kernel = 'linear', cost = 0.1, scale = F)
plot(svmfit,df)
summary(svmfit)
