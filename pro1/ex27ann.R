#ANN (인공신경망 알고리즘)- 분류 및 예측모델 작성 가능
#노드(뉴런) 1개로만 구성된 알고리즌 - 퍼셉트로(Percsptron) : 논리회로 중 xor 해결 못함
install.packages("nnet")
library(nnet)

input <- matrix(c(0,0,1,1,0,1,0,1), ncol=2)
input
#output <- matrix(c(0,0,0,1)) # and
#output <- matrix(c(0,1,1,1))  # or
output <- matrix(c(0,1,1,0))  #xor

output
#?nnet
ann <- nnet(input, output, maxit= 1000, size = 2, decay = 0.001)
ann #maxit 학습 횟수 decay 학습률

result <- predict(ann, input)
result
ifelse(result > 0.5,1,0)

# 샘플2 
df <- data.frame(
   x1 = 1:6,
   x2 = 6:1,
   y = factor(c('n','n','n','y','y','y'))
)
df

model_net <- nnet(y~., df, size = 5) # size는 학습량 연산 량이 늘어난다
model_net

summary(model_net)

#install.packages("devtools")
#library(devtools)
#source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')

plot.nnet(summary(model_net))
