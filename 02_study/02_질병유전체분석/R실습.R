

################################################
# R의 패키지 설치 및 사용
################################################
# 패키지는 한번만 설치하면 됨.
# 사용할때는 library 명령어로 로딩함.
install.packages( "devtools" )
library(devtools)
install_github( "genomicsclass/dagdata" )


################################################
# R 기초 학습
################################################
# R에서 R을 학습하는 패키지
install.packages( "swirl" )
library( swirl )
swirl()

# R을 웹에서 배우는 사이트
http://tryr.codeschool.com/
  

################################################
# R로 데이터를 읽어오기
################################################
getwd()
setwd("D:/Work_R/R-Project/99_ipython/02_질병유전체분석")

dat <- read.table( "femaleMiceWeights.csv", header=T, sep = "," )
head( dat )

dat <- read.csv( "femaleMiceWeights.csv" )
head( dat )

# git에서 직접적으로 데이터 읽기
install.packages( "downloader" )
library( downloader )
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- tempfile()
filename
download( url , destfile=filename )
dat <- read.csv( filename )
head( dat )


# 패지키에 있는 데이터 읽어오기
dir <- system.file( package="dagdata" )
dir
list.files( dir )
list.files( file.path(dir, "extdata") )
filename <- file.path( dir, "extdata/femaleMiceWeights.csv" )
filename
dat <- read.csv( filename )
head( dat )


# 엑셀파일 일기 : R 버전 3.1.3 이상 필요
install.packages( "xlsx" )
install.packages( "rJava" )
library(xlsx)
dat <- read.xlsx( "femaleMiceWeights.xlsx" )
head( dat )

# DB 연결에서 데이터 읽기
install.packages("RJDBC")
library(RJDBC) # 자바가 설치된 모든 PC
drv <- JDBC("com.mysql.jdbc.Driver",
            "/etc/jdbc/mysql-connector-java-3.1.14-bin.jar",
            identifier.quote="`")
conn <- dbConnect(drv, "jdbc:mysql://localhost/test", "user", "pwd")

###################################################
# R의 데이터 타입 (Data Types)
###################################################

# vectors (numerical, character, logical)
# 벡터안의 모든 값은 같은 종류여야 함.
a <- c(1,2,5.3,6,-2,4) # numeric vector
a
b <- c("one","two","three") # character vector
b
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) #logical vector
c

# matrices
# 2차원 vector
y<-matrix(1:20, nrow=5, ncol=4, byrow=TRUE ) # 5 x 4 numeric matrix
y

# arrays
# 메트릭스랑 비슷한데, 2차원(dimensions)이상을 가질 수 있음.

# lists
# python의 dictionary와 거의 유사
# 자바의 HashMap와 유사
# 이름과 값을 같이 설정이 가능하고, 이름을 안 써도 가능
w <- list(name="Fred", mynumbers=a, mymatrix=y, age=5.3)
w

# fators
# 카테고리 데이터형식
gender <- c( rep("male",20), rep("female", 30) ) 
gender <- c( "male", "male", "male", "male", "male", "male", "male", "male", "male", 
             "female", "female","female","female","female","female","female","female","female"
             ) 
gender <- factor(gender) 
gender


# dataframe
# DB의 table과 비슷
# read.csv()와 read.xlsx()함수가 반환하는 데이터형식
d <- c(1,2,3,4)
e <- c("red", "white", "red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)
mydata <- data.frame(d,e,f)
mydata
names(mydata) <- c("ID","Color","Passed") # variable names
mydata


###################################################
# 데이터 요약(summary)과 데이터 내부 구조 파악(str)
###################################################
tmp_data <- c( 1 ,1, 1 , 2, 3, 3, 4 ,5 ,6 ,7 ,8 )  # vector
summary( tmp_data  )  
str( tmp_data  )
names( tmp_data )
class( tmp_data )

n_data = rnorm( 10 ,  mean = 2, sd = 3) # 평균: 2, 분산:3인 정규분포에서 데이터 10개 임의추출
n_data
summary( n_data  )
str( n_data  )
names( n_data )
class( n_data )


rats <- data.frame( id = paste0("rat", 1:10 )
                    , sex = factor( rep(c("female", "male"), each=5) )
                    , weight = c( 2, 4, 1, 11, 18, 12, 7, 12, 19, 20 )
                    , length = c(100, 105, 115, 130, 95, 150, 165, 180, 190, 175) 
)
rats
summary( rats )

summary( rats$weight )
str( rats)


###################################################
# 두개의 dataframe을 조인
# match, merge
###################################################
ratsTable <- data.frame( id=paste0( "rat", c(6, 9, 7, 3, 5, 1, 10, 4, 8, 2) )
                         , secretID = 1:10 )
ratsTable
cbind(rats, ratsTable)  # wrong!!

match( ratsTable$id, rats$id)
rats[ match( ratsTable$id, rats$id), ]
cbind( rats[ match( ratsTable$id, rats$id), ], ratsTable  ) 

# 위의 명령어들을 단축
ratsMerged <- merge(rats, ratsTable, by.x = "id", by.y = "id" )
ratsMerged [ order( ratsMerged$secretID ),   ] 

###################################################
# 그룹별로 분석하기
# split, tapply, and dplyr libary
###################################################
sp <- split(rats$weight, rats$sex)
sp
class(sp)
lapply( sp, mean)

# 위의 명령어들을 단축
tapply( rats$weight, rats$sex, mean)


###################################################
# 모집단의 분포
###################################################
library(devtools)
install_github('rafalib', 'ririzarr')
library(rafalib)

show_plot <- function( r_data ) {
  mypar2(2,2)   # =>  par(mfrow=c(2,2)) 
  plot( r_data )
  boxplot( r_data )
  hist( r_data )
  shist( r_data )
  mypar2(1,1)
}

show_plot( rbinom(100, 1000, 1/2 )  )  # 이항분포 : 시행 : 1000,  비율 : 1/2
show_plot( rpois(100, lambda = 0.5)  ) # 포아송분포 : 평균 0.5
show_plot( runif(100, min = 0, max = 10)  ) # 균등분포 
show_plot( rexp(100, rate = 2)  ) # 지수분포 :  평균이 1/2인 지수분포에서 10개의 난수 발생
show_plot( rnorm(100, 0, 1)  ) # 정규분포 : 평균 0 , 분산 : 1

###################################################
# 확률변수
###################################################
# 전체 암컷쥐의 몸무게( 모수로 가정 )
library( downloader )
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- "femaleControllsPopulation.csv"
if( !(file.exists(filename) ) )  download(url, destfile=filename)
population <- read.csv(filename)
population

summary(population)
boxplot(population)

# 12개를 임의추출
control <- sample( population[,1] , 12 )
mean( control )

# 20번을 시도
n <- 20
sample_means <- vector("numeric", n)
for(i in 1:n ) {
  control <- sample( population[,1] , 12 )
  sample_means[i] <-  mean( control )
}
sample_means
# 추출할때 마다 값이 변경하기 때문에 모수에서 12개의 임의추출한 control(암컷쥐의 몸무게)은 확률변수(X) 라고 말할수 있음.
# control의 표본평균은 통계량


###################################################
# 귀무가설( Null distribution )
###################################################
# 실험으로 의해서 쥐의 몸무게가 무거워짐을 보여줌.
# 대조군(정상적인 먹이를 준 쥐)은 (+0.2 ± 0.1 g; P < 0.001) 이고, 
# 처리군(고지방 먹이를 준 쥐)은 (+1.6 ± 0.1 g)이므로 처리군이 몸무게가 늘었음.

# 실험한 데이터 읽기
dat=read.csv("femaleMiceWeights.csv")
dat

control <- dat[ 1:12, 2 ]  # 대조군
control
treatment <- dat[ 13:24, 2] # 처리군
treatment
mean( treatment ) 
mean( control ) 
diff <- mean(treatment) - mean(control)
diff

# 3.020833 차이는 정말로 의미있는 차이인가 ?????

# Null distribution : 모수에서 임의의 값을 샘플을 했을때와 다르지 않다. 
# 기존 상식과 동일,  변화가 없다. 등등.
n <- 10000
null <- vector("numeric",n)
for(i in 1:n){
  control <- sample(population[,1],12)
  treatment <- sample(population[,1],12)
  null[i] <- mean(treatment) - mean(control)
}
mean( null>=diff)

# 위의 상동
mean(null)
summary( null )
null_diff <-  null >= diff 
head( null_diff ) 
length(null_diff[null_diff==TRUE])
length(null_diff)
length(null_diff[null_diff==TRUE])  / length(null_diff)



###################################################
# t-분포
###################################################
# 모집단에서 임의로 추출한 표본의 평균의 분포

# 17번을 시도
n <- 17
sample_means <- vector("numeric", n)
for(i in 1:n ) {
  control <- sample( population[,1] , 12 )
  sample_means[i] <-  mean( control )
}
sample_means
hist( sample_means )


###################################################
# 중심극한 정리(Central Limit Theorem, CLT) 
###################################################
# 평균이 μ 이고 분산이 σ2 인 모집단으로부터 추출한 크기가 n인 
# 확률표본의 표본평균 X¯는 n이 증가할수록 모집단의 분포유형에 
# 상관없이 근사적으로 정규분포 N(μ,σ/n)을 따른다.

# 중심극한정리에 의하면 모집단의 분포가 연속형이든, 이산형이든, 또는 한쪽으로 치우친 형태이든 간에 
# 표본의 크기가 클수록 표본평균의 분포는 근사적으로 정규분포에 근접

CLT.plot <- function(r.dist, n, ...) {
  
  means <- double() # 0으로 초기화
  
  # 사이즈 n의 샘플을 500회 생성하여 표본평균을 계산
  for(i in 1:1000) means[i] = mean(r.dist(n,...))
  
  # 표본평균을 표준화
  std.means <- scale(means)
  
  # 플롯의 파라메터 설정(2개의 플롯을 한 화면에)
  par(mfrow=c(1,2))
  
  # 히스토그램과 표본의 밀도  # , ylim=c(, 0.5)
  hist(std.means, prob=T, col="light grey",
       border="grey", main=NULL )
  lines(density(std.means))
  box()
  
  # 표준정규분포 곡선
  curve(dnorm(x,,1), -3, 3, col='red', add=T)
  
  # Q-Q plot
  qqnorm(std.means, main="", cex=0.8)
  abline(,1,lty=2,col="red")
  par(mfrow=c(1,1))
}


show_plot( rchisq(50, n = 10, df = 1 )  ) 
# 카이제곱 분포
CLT.plot(rchisq, n = 1,df = 1)
CLT.plot(rchisq, n = 10, df = 1)
CLT.plot(rchisq, n = 100, df = 1)
CLT.plot(rchisq, n = 1000, df = 1)


# 이항분포
CLT.plot(rbinom, n=10, size=10, p = 0.5)
CLT.plot(rbinom, n=50, size=10, p = 0.5)
CLT.plot(rbinom, n=100, size=10, p = 0.5)
CLT.plot(rbinom, n=1000, size=10, p = 0.5)

# t-분포
CLT.plot( rt, n=1, df=5 )
CLT.plot( rt, n=10, df=5 )
CLT.plot( rt, n=100, df=5 )
CLT.plot( rt, n=100, df=5 )


###################################################
# Central Limit Theorem in practice
###################################################
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- tempfile()
download(url,destfile=filename)
dat <- read.csv(filename)
head(dat)
dat

# 모집단
hfPopulation <- dat[dat$Sex=="F" & dat$Diet=="hf",3]
head( hfPopulation )
controlPopulation <- dat[dat$Sex=="F" & dat$Diet=="chow",3]
head( controlPopulation )

mu_hf <- mean(hfPopulation)
mu_control <- mean(controlPopulation)
print(mu_hf - mu_control)

x<-controlPopulation
N<-length(x)
popvar <- mean((x-mean(x))^2)
identical(var(x),popvar)

# var() 에서는  n-1 로 나누어줌.
identical(var(x)*(N-1)/N, popvar)

popvar <- function(x) mean( (x-mean(x))^2)  # 모집단의 분산
popsd <- function(x) sqrt(popvar(x))   # 모집단의 표준편차

# 표본추출방법
N <- 12
hf <- sample(hfPopulation,N)
control <- sample(controlPopulation,N)

#  샘플을 3개씩 뽑아서 평균의 차를 10번 시도
replicate( 10, 
           mean(sample(hfPopulation,3))-mean(sample(controlPopulation,3))
)

# 표본을 3, 12, 25, 50씩 추출하는것을  10,000번 반복
Ns <- c(3,12,25,50)
B <- 10000 #number of simulations
res <-  sapply(Ns,function(n){
  replicate( B, 
             mean(sample(hfPopulation,n))-mean(sample(controlPopulation,n))
            )
})
head( res )
summary( res )
boxplot( res )


library(rafalib)
mypar2(2,2)
for(i in seq(along=Ns)){
  title <- paste("N=",Ns[i],"Avg=",signif(mean(res[,i]),3),"SD=",signif(popsd(res[,i]),3)) ##popsd defined above
  qqnorm(res[,i],main=title)
  qqline(res[,i],col=2)
}
mypar2(1,1)


###################################################
# t-tests in practice
###################################################
# t 검정통계량과 p-value을 실험데이터를 통해서 확인

getwd()
setwd("D:/Work_R/R-Project/99_ipython/02_질병유전체분석")

# 데이터 다시 다운로드
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if (!file.exists(filename)) download(url,filename)
dat <- read.csv(filename)
head(dat) ##quick look at the data 
dat

# 대조군과 처리군의 인덱스 추출
controlIndex <- which(dat$Diet=="chow")
controlIndex
treatmentIndex <- which(dat$Diet=="hf")
treatmentIndex

# 대조군과 처리군의 평균의 차이를 계산 
control <- dat[controlIndex,2]
treatment <- dat[treatmentIndex,2]
diff <- mean(treatment)-mean(control)
print(diff)

# 표준에러(SE) : 확율변수의 분포에서 모여지는 표준편차
control_se <- sd(control)/sqrt(length(control))
control_se
treatment_se <- sd(treatment)/sqrt(length(treatment))
treatment_se

se <- sqrt( var(treatment)/length(treatment) + var(control)/length(control) )
tstat <- diff/se  # diff <- mean(treatment) - mean(control)
# E( x + y ) = E(x) + E(y),         E( x - y )   = E(x) - E(y)
# VAR( x + y )= VAR(x) + VAR(y),    VAR( x - y ) = VAR(x) + VAR(y)

# 표본의수가 20개가 넘으면 대략적으로 정규분포를 따름.
righttail <- 1-pnorm(abs(tstat))  # 우측검정
lefttail <- pnorm(-abs(tstat))    # 좌측검정 
pval <- lefttail + righttail      # 양측검정
print(pval)


# QQ-Plot을 그려서 treatment와 control의 정규성을 확인해보자.
library(rafalib)
mypar2(1,2)
qqnorm(treatment);qqline(treatment,col=2)
qqnorm(control);qqline(control,col=2)
mypar2(1,1)

# 정규성을 만족하지 못하기 때문에 실제 t.test()에서 차이가 있을것 같음.

# t.test()로 확인하기
dat <- read.csv(filename)
controlIndex <- which(dat$Diet=="chow")
treatmentIndex <- which(dat$Diet=="hf")
control <- dat[controlIndex,2]
treatment <- dat[treatmentIndex,2]
t.test(treatment,control)








