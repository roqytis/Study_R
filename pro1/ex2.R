# 자료 구조 : Vector, Matrix, Array, List, DataFrame

# Vector : 1차원 배열 형태의 자료구조 (동일한 형태의 자료만 저장됨). 가장 작은 데이터 타입
# - 벡터는 같은 자료형의 데이터를 정해진 갯수만큼 모아놓은 것이다. 
# - 생성 함수 : c(), seq(), rep()
# - 처리 함수 : setdiff(), intersect(), union() ...

year <- 2021
is(year)
typeof(year)
is.vector(year)
typeof(as.integer(year))

? seq
seq(from=1, to=5)
seq(1, 5)
seq(1, 10, 2) 
seq(1, 10, length.out = 4)

rep(1:3, 3)
rep(1:3, each=3)


c(1,2,3,5)

vec <- c(10, 20, 30, -10, -20)
vec
c(1:20)

x <- c(1,3,5)
y <- c(1:3, 1:3)
x; y

c(1,3,5.5,6, F, T, 'abc')  # 동일한 형태의 데이만 저장.  정수 < 실수 < 문자

age <- c(10, 20, 30)
age
names(age) <- c('오공', '팔계', '오정')  # 벡터에 칼럼명 부여
age
age <- c(age, 40)
age

age[1]   # 슬라이싱
age[1:3]

age <- NULL
age

# 벡터 연산
a <- 1:3
a + 5

b <- 4:6
a
b
a + b
a - b
a * b
a / b

a[4] <- 2
a
b
union(a, b)  # 합집합 : 중복 X
c(a, b)   # 합집합 : 중복 O
b[4] <- 2
b
setdiff(a, b)  # 차집합
intersect(a, b)


# Matrices : 2차원의 dataset 이다. 이는 매트릭스 함수에 벡터를 제공함으로써 만들 수 있다.
# 동일 데이터 타입을 갖는 2차원 배열(행렬 구조).
# 선형대수학 정리 http://kipid.tistory.com/entry/Linear-Algebra
# - 생성 함수 : dim(), matrix(), rbind(), cbind()
# : matrix: 긴 벡터를 잘라서 행렬로 변환
# : d: 여러 개의 벡터를 좌우로 붙여서 행렬로 변환
# : rbindcbin: 여러 개의 벡터를 위아래로 붙여서 행렬로 변환
# - 처리함수 : apply()

a <- 1:8
dim(a) <- c(2, 4) # 벡터 값을 2행 4열의 매트릭스로 만듦
a
typeof(a)
class(a)

#m <- matrix(1:5)
#m <- matrix(1:9, nrow = 3)  # 열부터 채움
#m <- matrix(1:9, nrow = 3, byrow = T)  # 행부터 채움
#m <- matrix(1:10, 2)
m <- matrix(1:10, 3)
m
dim(m)

m[1,]  # 슬라이싱
m[, 3]
m[2, 3]
m[1, c(2:4)]
m[, -1]  # 1열을 제외한 나머지 여집합
m[-1, -1]

m
rownames(m) <- c('r1', 'r2', 'r3')
colnames(m) <- c('c1', 'c2', 'c3', 'c4')
m
length(m)
NROW(m)


# matrix 계산
a <- matrix(c(1,2,3,4),2,2)
a
b <- matrix(5:8, 2, 2)
b

a + b
a - b
a * b
a / b 

a %*% b  # 행렬곱

diag(3)

a
t(a)  # 행렬 전환 : 전치

a
solve(a)
solve(solve(a))

# 행 또는 열 결합
x1 <- c(5, 40, 50:52)
x1
x2 <- c(30, 5, 6:8)
x2
aa <- rbind(x1, x2)  # 행 묶음
aa
cbind(x1, x2)

# apply 함수 : 함수를 실행하는 함수
x <- matrix(c(1:9), nrow = 3, ncol = 3)
x
apply(x, 1, max)   # 1:행기준, 2:열기준
apply(x, 1, min)
apply(x, 2, mean)

func <- function(x){
  x + c(5, 10, 15)
}

apply(x, 1, func)


# Arrays : matrix는 2차원에 한정되지만 arrays는 어떠한 차원으로도 만들 수 있다. 
# 동일 데이터 타입을 갖는 다차원 배열. (활용도는 다소 낮다)
# - matrix는 행과 열을 갖는 2차원 자료구조다.
# - Array는 행과 열, page를 갖는 3차원 자료구조다.
# - 생성 함수 : array(data, dim)

#arr2 <- array(1:12)
#arr2 <- array(1:12, dim=c(6, 2))
arr2 <- array(1:12, dim=c(3, 2, 2))
arr2
dim(arr2)  # 3 2 2   행, 열, 면

arr2[,,1]  #1면
arr2[,1,1] #1면 1열   
arr2[1,,1] #1면 1행 
arr2[1,1,1]#1면 1행 1열


# List : 서로 다른 타입의 데이터를 기억할 수 있다.
# - 성격이 다른 데이터(벡터, 행렬, 데이터프레임 등 모든 데이터)의 기억이 가능,
# c의 구조체, java의 레코드형 기억장소와 유사
# - 생성 함수 : list()
# - 처리 함수 : unlist(), lapply(), sapply()

li <- list("1","tom",95,"2","james",85)
li
class(li)
unli <- unlist(li)
unli

num <- list(c(1:5), c(6:10), c("a",'b','c'))
num
num[1]
class(num[1])  # "list"
num[[1]]
class(num[[1]])  # "integer"
num[[1]][2]

member <- list(name='hong', age=22)
member
member$name
#help
