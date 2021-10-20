# Data Frames : 구조화된 데이터 오브젝트다. 
# 데이터베이스의 테이블 구조와 유사, 칼럼 단위로 type이 달라도 됨
# - 가장 많이 사용되는 객체 타입
# - 데이터프레임과 행렬은 모두 2차원 데이터이지만 다음과 같은 점이 다르다.
#
#데이터프레임의 각 열은 서로 다른 자료형이 될 수 있다.
# 데이터프레임은 열 이름, 행 이름을 가질 수 있다.
# - 생성 함수 : data.frame(열이름1=요소, 열이름2=요소, …)
# - 처리 함수 : apply(), str(), ncol(), nrow(), summary() ...

# vector로 데이터프레임 작성
no <- c(1,2,3)
name <- c('hong', 'lee','kim')
pay <- c(250,300,350)
df <- data.frame(bunho=no, irum=name, imkum=pay)
df
ls(df)
is(df)
mode(df)
df2 <- data.frame(no, name, pay)
df2

df <- data.frame(irum=c('james','oscar','tom'), nai=c(27,25,35), row.names = c('one','two','three'))
head(df,2)
df
nrow(df)
ncol(df)
summary(df) #요약 통계계
rownames(df)
colnames(df)

head(iris,2)

#matrix로 데이터프레임 작성
m <- matrix(c(1,'hong',150,1,'lee',350,3,'kim',550), 3, by=T)
m
mdf <- data.frame(m)
mdf


m <- matrix(1:6, nrow = 3)
m
mdf <- data.frame(m)
colnames(mdf) <- c('c1','c2')
mdf
typeof(mdf)

mdf$c1
mdf['c1']
mdf[,2]
mdf[1,2]

mdf[1:2, 1:2]

#조건 지정
mdf[mdf$c1 ==2,]
subset(mdf, c1 == 2)

mdf[mdf$c1 == 2 & mdf$c2 == 5, ]
subset(mdf,c1==2, select = c(1,2))

mdf$c2 <- ifelse(mdf$c2 == 4, NA, mdf$c2)
mdf
summary(mdf)
mean(mdf$c1)
mean(mdf$c2) #NA
mean(mdf$c2, na,rm=T)

# 행 또는 열 추가
mdf

mdfr <- rbind(mdf, c(10,11))
mdfr

mdfc <- cbind(mdf, c3=c('a', 'b', 'c'), c4=c('a1','b2','c3'))
mdfc

# 열 삭제
mdfc[, 'c1'] <- NULL
mdfc

#행 삭제
mdfr
mdfr <- mdfr[-1, ]
mdfr

#txt 파일을 이요하여 data.frame 작성
txtdf <- read.table("https://raw.githubusercontent.com/pykwon/Test-datas-for-R/master/emp.txt", header= T)
txtdf

csvdf <- read.csv("emp2.csv", header=F, col.names = c('번호','이름','월급'))
csvdf

#data.frame으로 파일 저장
df <- data.frame(eng=c(90,80,70),mat=c(50,60,70), class=c(1,2,3))
df
gewd()
getwd
getwd()

save(df,file = 'C:/work/rsou/pro1/df1.rda')
rm(df)
df
load('C:/work/rsou/pro1/df1.rda')
df

install.packages("data.table")
library(data.table)
dt <- as.data.table(csvdf)
dt

dt2 <- data.table(bun=c(1,2), irum=c('tom', 'john'))
dt2

#dataFrame 결합
height <- data.frame(id=c(1,2,2), h=c(180,175,178))
weight <- data.frame(id=c(1,2,2), w=c(80,75,88))
weight
height

merge(height,weight)
merge(height,weight, by.x='id',by.y='id')
merge(height,weight, all=TRUE)

#참고 : 키보드로 자료입력
#scan() 함수 사용
n <- scan()
sum(1:n)

#edit() 함수 사용
df1 <-data.frame()
df1
df1 <- edit(df1)
df1
