# MariaDB의 jikwon 테이블을 사용. 근무년수에 대한 연봉을 이용하여 회귀분석 모델 작성

library(rJava)
library(DBI)
library(RJDBC)

drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver", classPath = "c:/work/mariadb-java-client-2.6.2.jar")
conn <- dbConnect(drv,"jdbc:mysql://127.0.0.1:3306/test","root","123")
conn

query <- "select substr(jikwon_ibsail,1,4) from jikwon"
jik_ibsail <- dbGetQuery(conn,query)
jik_ibsail
typeof(jik_ibsail)
jik_ibsail <- as.numeric(unlist(jik_ibsail))
typeof(jik_ibsail)

install.packages("lubridate")
library(lubridate)
now_year <- year(Sys.time()) # 시스템이 가진 년도
now_year
jik_workyear <- now_year - jik_ibsail 
cat('근무 년수 : ', jik_workyear)

query <- "select jikwon_pay from jikwon"
jik_pay <- dbGetQuery(conn,query)
jik_pay
typeof(jik_pay)
jik_pay <- as.numeric(unlist(jik_pay))
typeof(jik_pay)

jik_data <- data.frame(jik_workyear, jik_pay)
head(jik_data,5)

cor(jik_data$jik_workyear, jik_data$jik_pay) # 0.9196725

model <- lm(formula = jik_pay ~ jik_workyear, data = jik_data)
model #절편과 기울기값 1105.3         583.3
summary(model) # p-value: 6.943e-13 <0.05이므로 의미있는 모델. 유의한 모델

cat('R-squared: ' , summary(model)$r.squared) # 0.8457975
cat('model p-value: ', anova(model)$'Pr(>F)'[1]) #model p-value:  6.942657e-13

plot(jik_data$jik_workyear, jik_data$jik_pay, xlim = c(0,20), ylim = c(1000,15000))
abline(model, col='blue',lwd=2)

jik_pay_pred_func <- function(){
  cat('근무년수 입력:')
  work_year = scan()
  predPay = predict(model, data.frame(jik_workyear = work_year))
  cat('근무년수 : ',work_year, '\n')
  cat('예상연봉 : ',predPay, '\n')

  plot(jik_data$jik_workyear, jik_data$jik_pay, xlim = c(0,20), ylim = c(1000,15000))
  abline(model, col='blue',lwd = 2)
  points(work_year,round(predPay), col='red', lwd = 5, pch = 23)
}

jik_pay_pred_func()
#근무년수 : 4
#예상년봉 : 3438.472