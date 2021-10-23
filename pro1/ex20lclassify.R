#Ligistc Regression - 이진분류(시그모이드 함수를 사용)
#상관/인과관계 x
#독립변수: 연속형, 종속변수 : 범주형

#연습1: binary.csv : 영어성적등으로 대학원 입학여부 분류 모델 작성
mydata <- read.csv('testdata/binary.csv')
head(mydata,5)
dim(mydata) #400   4
str(mydata)

summary(mydata) #데이터의 대략적 분포 확인

# admit에 대한 rank 빈도 수 출력
table(mydata$admit, mydata$rank)

xtabs(formula = ~admit + rank , data = mydata)

#train/ test로 분리
set.seed(1)
idx <- sample(1:nrow(mydata), nrow(mydata)*0.7)
length(idx)
train <- mydata[idx, ]
test <- mydata[-idx, ]
dim(train) #280   4
dim(test) #120   4

# 모델 
lgmodel <- glm(formula =  admit ~ ., data = train, family = binomial(link = 'logit'))
lgmodel

summary(lgmodel)

#분류 예측
pred <- predict(lgmodel, newdata = test, type= 'response')
pred
cat('예측값 : ', head(pred, 10))
cat('예측값 : ', head(ifelse(pred > 0.5,1,0), 30))
cat('실제값 : ', test$admit[1:10])

# 분류 정확도 계산
result_pred <- ifelse(pred > 0.5,1,0)
t <- table(result_pred, test$admit) # confusion matrix 이거 꼭 알기 예측 , 실제값
t
(77 + 11) / nrow(test) #0.7333333 73%의 분류 정확도를 보임
(t[1,1] + t[2,2])/ nrow(test)
sum(diag(t)) / nrow(test)

# 새값으로 분류 
new_data <- test[c(1:3),]
new_data <- edit(new_data)
new_data

new_pred <- predict(lgmodel,newdata= new_data, type="response")
new_pred
ifelse(new_pred > 0.5, '합격', '불합격')
