#관계형 데이터베이스와 연동
install.packages("rJava")
install.packages("DBI")
install.packages("RJDBC")
install.packages("RSQLite") #개인용 데이터베이스


library(rjava)
library(DBI)
library(RJDBC)
library(RSQLite)

#SQLite와 연결
conn <- dbConnect(RSQLite::SQLite(), ":memory:")
conn
mtcars #내장된 dataset
head(mtcars,2)


dbWriteTable(conn,"mytab",mtcars)
dbListTables(conn) #테이블의 목록 확인
dbListFields(conn,"mytab") #테이블의 칼럼 목록 확인인
query <- "select mpg, cyl, hp from mytab where mpg > 30"
goodAll <- dbGetQuery(conn,query)
goodAll

#원격 DB : maridDB
drv <- JDBC(driverClass = "org.mariadb.jdbc.Driver",
            classPath = "c:/work/mariadb-java-client-2.6.2.jar")
conn <- dbConnect(drv = drv, "jdbc:mysql://127.0.0.1:3306/test","root","123")
dbListTables(conn)

sql <- "select * from sangdata"
aaa <- dbGetQuery(conn,sql)
aaa
class(aaa)
aaa$sang
mean(aaa$su)
plot(aaa$dan)
table(aaa$sang)

aaa2 <- dbGetQuery(conn,"select code,sang, su as surang from sangdata where sang like '가죽%'")
aaa2

#레코드 추가
sql <- "insert into sangdata values(12,'아디다스',3,220000)"
dbSendUpdate(conn,sql)

df <- data.frame(code=13, sang='핸드크림',su=7, dan=5000)
df
dbSendUpdate(conn,"insert into sangdata values(?,?,?,?)",df$code,df$sang,df$su,df$dan)
dbGetQuery(conn,"select * from sangdata")

#레코드 수정
dbSendUpdate(conn,"update sangdata set sang=?, su=? where code=?",'비비크림',"11","13") 
dbGetQuery(conn,"select * from sangdata")

#레코드 삭제
dbSendUpdate(conn, "delete from sangdata where code=?","11")
dbGetQuery(conn,"select * from sangdata")
