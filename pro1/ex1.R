kbs <- 9
print(kbs)
kbs <- 7
print(kbs)
kb.s <- 5
print(kb.s)
kb_s <- 5
print(kb_s)

a <- 10
b <- 20
(c <- a + b) #print() 처리됨
#주석

#데이터 유형: numeric(integer,double), character, logical,complex, NA, NaN,Factor, closure ...
mbc <- 11
object.size(mbc)
typeof(mbc)
typeof(3)
typeof(3.14)
is(mbc) #데이터 유형 출력
mbc2 <- as.integer(mbc) #형 변환
typeof(mbc2)
is(mbc2)
mbc3 <- 11L #정수화
is(mbc3)

ss <- '홍길동'
is(ss)
print(ss)
cat(ss)
cat(ss[1])
cat(ss[0]) #인덱스 1부터 시작

b <- TRUE
b <- T
is(b)
is.logical(b)

z <- 5.3 - 3i
is(z)

aa <- NA  #결측갑(값이 입력되지 않은 상태)
is(aa)
is.na(aa)
is.na(z)
typeof(aa)

Inf #무한대
bb <- NaN # Not a Number 수학적으로 정의 되어있지 않은 값 
is(bb)
0 / 0
0 * Inf
Inf + Inf
Inf -Inf

NULL # 값이 없음

sum(2, 3)
sum(2,3,NULL) #NULL은 값으로 인식안함. 무시
sum(2,3,NA) #NA는 값으로 인식함.
sum(2,3,NA, na.rm = T) #N 값은 제거하고 계산
sum(2,3,NaN) #NaN는 값으로 인식함.

sbs <- c('second','first','third','second')
sbs
cat('sbs는 ' ,sbs)
print('sbs는 ', sbs) #에러: 인수는 하개만 출력. 주로 함수 내에서 사용
typeof(sbs)
sbs2 <- as.factor(sbs)
sbs2
levels(sbs2)
is(sbs2)
typeof(sbs2)
summary(sbs2) #레벨의 빈도 수
plot(sbs2)

f <- function(){
  return('good')
}
f
f()
typeof(f)

# 자료형, 자료구조 확인 함수
# mode: 데이터 성격
# class : 데이터 자료구조 성격
# type of : 자료형

a <- 5
cat(mode(a), class(a), typeof(a))

a <- '5'
cat(mode(a), class(a), typeof(a))

cat(mode(f), class(f), typeof(f))

ls() #현재 사용 중인 변수 객체 목록을 확인
ls.str()

a
rm(a) # 변수 삭제
a
rm(list=ls()) #현재 사용 중인 모든 변수 삭제
ls()

a <- 1
rm(a)
a
gc() # 사용이 종료된 객체가 계속 점유한 메모리를  해제함

getwd() #작업경로(디렉토리) 확인

# package(데이타 + 함수 + 알고리즘 꾸러미, R 지원 객체, 메소드, 함수들을 모아놓은 컬렉션 ) 사용
available.packages() #사용 가능한 패키지가 나온다.
dim(available.packages()) #18286개의 패키지(package)를 지원

#plyr 라이브러리 사용
install.packages("plyr")
library('plyr')

help('plyr')

base::cat('abc')
pri
remove.packages("plyr")

#기본 datasets 제공
data()
Nile #나일강 범람 시계열 데이터 
head(Nile, 5)
tail(Nile, 5)

hist(Nile, freq =F)
lines(density(Nile))

#도움말
help(mean)
x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))

? mean
? mean
