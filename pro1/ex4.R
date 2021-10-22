#도수 분표표 - 범주형 중 명목형 자료 : gender, bloodtype

df <- read.csv("testdata/ex_studentlist.csv")
df

#table() 함수로 분할표 작성
freq <- table(df$gender, df$bloodtype) # gender, bloodtype 빈도 수

freq <- table(df$bloodtype)
freq # 3 3 4 5

#상대도수
rfreq <- prop.table(freq)
rfreq #0.2000000 0.2000000 0.2666667 0.3333333

rtable <- rbind(freq, rfreq)
rtable

rtable <- addmargins(rtable, margin =2)
rtable