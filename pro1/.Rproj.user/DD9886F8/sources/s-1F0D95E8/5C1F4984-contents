# 산술, 관계, 논리 연산
no<- 7
no >= 2+2*2| no <5 %% 2
no >= 5 & no <= 2
no != 5

#if
x <-10; y <-5

if(x + y >= 10){
  cat("결과는", x+y)
  cat("\n 참일떄 수행")
}else{
  print("거짓일 떄 처리")
}

ifelse(x >= 5, 'good', 'bad')

#switch
switch('age', id='hong', age=33, name='홍길동')

a <- 1
switch(a, mean(1:10), sd(1:10))

#for
i <- 1:10
for(n in i){
  print(n)
}

for(n in i){
  if( n%%2==0){
    next
  }else{
    print(n)
  }
}

#while
i <- 0
while(i<10){
  i = i + 1
  print(i)
}
cat('while 수행 후 i : ', i)

i <-0
while(T){
  i = i+1
  print(i)
  if(i == 3)break
}
cat('while 수행 후 i : ', i)

#repeat
cnt <- 1
repeat{
  print(cnt)
  cnt = cnt + 2
  if(cnt > 10)break
}
