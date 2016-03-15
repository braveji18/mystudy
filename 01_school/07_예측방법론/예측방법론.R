
#############################################
## 2강 
#############################################
install.packages("tseries")
library(tseries)
setwd("D:/work_R/R-Project/07_예측방법론/")
gdpq.csv <- read.csv("gdpq.csv", header=TRUE)
head( gdpq.csv, n=10 )
gdp <- ts(gdpq.csv, start=1970, frequency=4   )
gdp
plot( gdp[,1]/1000, ylab="GDP(조)", xlab="연도", col="steelblue" )
lines( gdp[,2]/1000, col="red")

ww <- c(0.5, 1, 1, 1, 0.5)
gdpm5 <- filter(gdp, side=2, ww/sum(ww) )
head( gdpm5 )
dlgdp1 <- diff( (log(gdp)) )
dlgdp4 <- diff( (log(gdp)), 4 )

par( mfrow=c(1,1))
plot( gdp, main="GDP", ylab=" ", xlab="YEAR"  )
plot( gdpm5, main="GDPM5", ylab=" ", xlab="YEAR"  )
plot( dlgdp1, main="diff(log(GDP))", ylab=" ", xlab="YEAR"  )
plot( gdp, main="diff(log(GDP),4)", ylab=" ", xlab="YEAR"  )


#############################################
## 3강 예측 데이터의 기초분석1
#############################################
setwd("D:/work_R/R-Project/07_예측방법론/")
gdp <- read.csv( "gdpq.csv", header=TRUE )
gdp.o <- ts( gdp[ ,1]/1000, start=1970, frequency=4 )
gdp.sa <- ts( gdp[ ,2]/1000, start=1970, frequency=4 )
gdp.gr <- ts( ( gdp.sa - lag(gdp.sa, -1) )/lag(gdp.sa, -1) * 100 , 
              start=c(1970,2), frequency=4 )
plot( gdp.gr, ylab="경제성장률(전기대비)", 
      xlab="연도", col="steelblue", main="" )
abline( h=0, lty=2, col="gray")


hist(gdp.gr, breaks=12, col="lightblue", border="black", freq=FALSE,
     main="", xlab="", xlim=c(-10, 10))
lines( density(gdp.gr) )
shapiro.test( gdp.gr )

set.seed(1)
nn <- length( gdp.o )
wn <- ts( rnorm(nn), start=1970, frequency=4 ) 
plot( wn, main="", xlab="", ylab="", col="steelblue")
abline(h=0, lty=2, col="gray")
acf( wn, main="", col="steelblue")


set.seed(1)
nn <- length(gdp.sa)
sin <- ts( sin(1:nn/nn*12*pi), start=1970, frequency=4 )
plot( sin, main="", xlab="", ylab="", col="steelblue")
abline(h=0, lty=2, col="gray")
acf(sin, main="", col="steelblue" )  # 상관도표

plot( gdp.o, main="", xlab="", ylab="", col="steelblue" )
acf( gdp.o, main="", col="steelblue" )


gdp.o.diff_log <- diff(log(gdp.o))
plot( gdp.o.diff_log, main="", xlab="", ylab="", col="steelblue" )
acf( gdp.o.diff_log, main="", col="steelblue" )


gdp.o.diff_log_4 <- diff(log(gdp.o), 4)
plot( gdp.o.diff_log_4, main="", xlab="", ylab="", col="steelblue" )
acf( gdp.o.diff_log_4, main="", col="steelblue" )



Box.test(wn, lag=8, type="Ljung")
Box.test(sin, lag=8, type="Ljung")
Box.test(gdp.o, lag=8, type="Ljung")
Box.test(gdp.o.diff_log, lag=8, type="Ljung")
Box.test(gdp.o.diff_log_4, lag=8, type="Ljung")


#############################################
## 4강 예측 데이터의 기초분석2
#############################################
setwd("D:/work_R/R-Project/07_예측방법론/")

gdp <- read.csv( "gdpq.csv", header=TRUE )
gdp.o <- ts( gdp[ ,1]/1000, start=1970, frequency=4 )
gdp.sa <- ts( gdp[ ,2]/1000, start=1970, frequency=4 )
gdp.gr <- ts( ( gdp.sa - lag(gdp.sa, -1) )/lag(gdp.sa, -1) * 100 , 
              start=c(1970,2), frequency=4 )

set.seed(1)
nn <- length( gdp.o )
wn <- ts( rnorm(nn), start=1970, frequency=4 ) 

par( mfrow=c(2,1))
plot( wn, main="", xlab="", ylab="", col="steelblue")
abline( h=0, lty=2, col="gray" )
pacf( wn, main="", col="steelblue")


set.seed(1)
nn <- length(gdp.sa)
sin <- ts( sin(1:nn/nn*12*pi), start=1970, frequency=4 )
plot( sin, main="", xlab="", ylab="", col="steelblue")
abline( h=0, lty=2, col="gray")
pacf(sin, main="", col="steelblue")

plot( gdp.o, main="", xlab="", ylab="", col="steelblue")
pacf( gdp.o, main="", col="steelblue")

plot( diff(log(gdp.o)) , main="", xlab="", ylab="", col="steelblue")
pacf( diff(log(gdp.o)), main="", col="steelblue")


plot( wn, main="", xlab="", ylab="", col="steelblue")
abline(h=0, lty=2, col="gray" )
aa <- spectrum(wn, spans=c(3,3),  main="", col="steelblue")
plot( 1:80/40, aa$spec, type="1", ylim=c(0,10))

plot(sin, main="", xlab="", ylab="", col="steelblue")
abline( h=0, lty=2, col="gray")
pacf(sin, main="", col="steelblue")

sin1 <- ts( sin(1:nn/nn*12*pi), start=1970, frequency=4 )
sin2 <- ts( sin(1:nn/nn*36*pi), start=1970, frequency=4 )
plot( cbind(sin1,sin2), main="", xlab="", ylab="", col="steelblue" ) 
spectrum( cbind(sin1, sin2), spans=c(3,3), main="", col="steelblue"  )


plot(gdp.o, main="", xlab="", ylab="")
lines(gdp.sa, col=2)
spectrum(cbind(gdp.o, gdp.sa), spans=c(3,3), main="", col=1:2)


dlgdp1 = diff(log(gdp.o))
dlgdp2 = diff(log(gdp.o),4)
dlgdp  = cbind(dlgdp1,dlgdp2)
plot(dlgdp1, main="", xlab="", ylab="", col="steelblue")
lines(dlgdp2, col=2)
spectrum( na.omit(cbind(dlgdp1,dlgdp2)), spans=c(3,3), main="", col=c("steelblue", "red"))

#############################################
## 과제 
#############################################


#######  raw data 전처리
setwd("D:/work_R/R-Project/")
raw_gdp.csv <- read.csv( "raw_gdp.csv", quote = "\"", dec = ".",  header=TRUE )
raw_gdp.csv <- raw_gdp.csv[ , -5:-1]
raw_gdp.csv
raw_gdp_m.csv <-  t( raw_gdp.csv ) 
raw_gdp_m.csv <- gsub(",", "", raw_gdp_m.csv )
raw_gdp_m.csv
raw_gdp_m.csv <- as.numeric( raw_gdp_m.csv[,1] )
raw_gdp_m.csv

raw_gdp_s.csv <- read.csv( "raw_gdp_s.csv", quote = "\"", dec = ".",  header=TRUE )
raw_gdp_s.csv <- raw_gdp_s.csv[ , -5:-1]
raw_gdp_s.csv
raw_gdp_s_m.csv <-  t( raw_gdp_s.csv ) 
raw_gdp_s_m.csv <- gsub(",", "", raw_gdp_s_m.csv )
raw_gdp_s_m.csv
raw_gdp_s_m.csv <- as.numeric( raw_gdp_s_m.csv[,1] )
raw_gdp_s_m.csv

gdp.csv <- cbind(raw_gdp_m.csv, raw_gdp_s_m.csv )
colnames(gdp.csv) <- c("gdp", "gdps")
gdp.csv

####### 1. 시계열도표
install.packages("tseries")
library(tseries)
gdp <- ts(gdp.csv, start=1960, frequency=4   )
gdp
plot( gdp[,1]/1000, ylab="GDP(조)", xlab="연도", col="SeaGreen" )
lines( gdp[,2]/1000, col="Brown")

####### 2. 5분기 중심화 이동평균
ww <- c(0.5, 1, 1, 1, 0.5)
gdpm5 <- filter(gdp, side=2, ww/sum(ww) )
head( gdpm5 )

par( mfrow=c(2,1))
plot( gdpm5[,1]/1000, main="원계열 5분기 중심화 이동평균",   ylab="GDP(조)", xlab="연도", col="SeaGreen"  )
plot( gdpm5[,1]/1000, main="계절조정 5분기 중심화 이동평균", ylab="GDP(조)", xlab="연도", col="Brown"  )

par( mfrow=c(1,1))
plot( gdpm5[,1]/1000, main="5분기 중심화 이동평균",   ylab="GDP(조)", xlab="연도", , col="SeaGreen")
lines( (gdpm5[,2]/1000) + 3, col="Brown")

####### 3. 스펙트럼 
par( mfrow=c(2,1))
plot(gdp[,1], main="시계열그래프", ylab="GDP(조)", xlab="연도")
lines(gdp[,2], col=2)
spectrum(gdp, spans=c(3,3), main="스펙트럼", col=1:2)

####### 4.(1) 상관도표, 부분상관도표
gdp.s.log <- log(gdp[,2])
gdp.s.diff_log <- diff(gdp.s.log)

par( mfrow=c(2,2))
acf( gdp.s.log ,   main="log(GDP) 상관도표") # 상관도표
acf( gdp.s.diff_log , main="차분(log(GDP))  상관도표") # 상관도표

pacf( gdp.s.log, main="log(GDP) 부분상관도표")
pacf( gdp.s.diff_log , main="차분(log(GDP))  부분상관도표") # 상관도표


####### 4.(2) ADF(Augmented Dickey-Fuller) 검정
adf.test(gdp.s.log )
adf.test(gdp.s.diff_log )

#############################################
## 5강 
#############################################
# library(tseries)
nn = 176
arsim1 <- ts( arima.sim( list(order=c(1,0,0), ar=0.6), n=nn  ), start=1970, freq=4 )
arsim2 <- ts( arima.sim( list(order=c(1,0,0), ar=-0.6), n=nn  ), start=1970, freq=4 )

plot( arsim1, main="", xlab="", ylab="", col="steelblue"  )  
abline( h=0, lyt="2", col="gray")

plot( arsim2, main="", xlab="", ylab="", col="steelblue"  )  
abline( h=0, lyt="2", col="gray")

par(mfrow=c(2,1))
acf( arsim1, main="" )
pacf( arsim1, main="" )

acf( arsim2, main="" )
pacf( arsim2, main="" )

par( mfrow=c(2,1) )
spectrum( arsim1, spans=c(3,3), main="")
spectrum( arsim2, spans=c(3,3), main="")


masim1 <- ts( arima.sim( list(order=c(0,0,1), ma= 0.6), n=nn), start=1970, freq=4   ) 
masim2 <- ts( arima.sim( list(order=c(0,0,1), ma=-0.6), n=nn), start=1970, freq=4   ) 

par( mfrow=c(1,1) )
plot( masim1, main="", xlab="", ylab="", col="steelblue" ) 
abline( h=0, lty=2, col="gray" ) 

plot( masim2, main="", xlab="", ylab="", col="steelblue" ) 
abline( h=0, lty=2, col="gray" ) 

par( mfrow=c(2,1) )
acf( masim1, main="")
pacf( masim1, main="")


acf( masim2, main="")
pacf( masim2, main="")


par(mfrow=c(1,1))
spectrum(masim1, spans=c(3,3), main="")
spectrum(masim2, spans=c(3,3), main="")

armasim <- ts( arima.sim( list(order=c(1,0,1), ar=0.6, ma= 0.6), n=nn), start=1970, freq=4   ) 

plot( armasim, main="", xlab="", ylab="", col="steelblue" )
abline( h=0, lty=2, col="gray")

par(mfrow=c(2,1))
acf( armasim, main="" ) 
pacf( armasim, main="" ) 

par(mfrow=c(2,1))
spectrum( armasim, spans=c(3,3), main="" )


#############################################
## 6강 
#############################################
install.packages("TSA")
library( TSA )
set.seed(5)
tarsim <- tar.sim( n=176, Phi1=c(0, 0.7), Phi2=c(0, -0.9), p=1, d=1, sigma1=1, thd=0.5, sigma2=2 )$y
tarsim

plot( ts(tarsim, start=1970, frequency=4), xlab="", ylab="", col="steelblue"  )
lagplot( tarsim)

install.packages("tsDyn")
install.packages("sm")
library(tsDyn)
library(sm)

par(mfrow=c(1,2))
autopairs( tarsim, lag=1, type="regression" ) 
autopairs( tarsim, lag=2, type="regression" ) 


install.packages("fGarch")
library(fGarch)
set.seed(5)
spec <- garchSpec(model=list( alpha=c(0.5, 0.4), beta=0 ) )
garchsim <- garchSim(spec, n=176)

par(mfrow=c(1,1))
plot( ts(garchsim, start=1970, frequency=4), xlab="", ylab="", col="steelblue" )

par(mfrow=c(2,1))
acf( garchsim, main="" )
pacf( garchsim, main="" )

acf( garchsim^2, main="" )
pacf( garchsim^2, main="" )


#############################################
## 7강 
#############################################
library(tseries)

setwd("D:/work_R/R-Project/07_예측방법론")
gdp <- read.csv("gdpq.csv", header = TRUE)
gdp_o  <- ts(gdp[,1]/1000, start=1970, frequency=4)
gdp_sa <- ts(gdp[,2]/1000, start=1970, frequency=4)
gdp_gr <- ts((gdp_sa-lag(gdp_sa,-1))/lag(gdp_sa,-1)*100,  start=c(1970,2), frequency=4)

adf.test( log(gdp_sa) )
adf.test( diff(log(gdp_sa)) )


library(TSA)
set.seed(5)
y <- arima.sim(n=176, model=list(ar=0.6, ma=0.6)  )
lagplot(y)

ty <- tar.sim(n=176, Phi1=c(0,0.5), Phi2=c(0, -0.6), p=1, d=1, sigma1=1, thd = -1, sigma2=2)$y
lagplot(ty)

Keenan.test( y, order=4)
Keenan.test( ty, order=4)

install.packages("FinTS")
install.packages("quantmod")
library(FinTS)
library(TSA)
library(quantmod)

kospi <- getSymbols( "^KS11", auto.assign = FALSE)[,4]
kospi_r <- dailyReturn( kospi)
par( mfrow=c(1,1))
McLeod.Li.test( y = kospi_r)


par(mfrow=c(2,1))
plot(log(gdp_sa), ylab="log(GDP_SA)", xlab="", col="steelblue", main="")
plot(diff(log(gdp_sa)), ylab="diff(log(GDP_SA))", xlab="", col="steelblue", main="")

plot(log(gdp_o), ylab="log(GDP)", xlab="", col="steelblue", main="")
plot(diff(diff(log(gdp_o),1),4), ylab="diff(diff(log(GDP)),4)", xlab="", col="steelblue", main="")

par(mfrow=c(2,1))
acf(diff(diff(log(gdp_o)),4), main="" )
pacf(diff(diff(log(gdp_o)),4), main="")


#############################################
## 8강 
#############################################
library(tseries)

setwd("D:/work_R/R-Project/07_예측방법론")

fin <- ts( read.csv("kospi_n.csv", header=TRUE), start=1993, frequency=12  )
kospi <- fin[, 1]
er <- fin[, 2]
plot( diff(log(kospi)), ylab="종합주가지수", xlab="", col="steelblue", main="" )

par(mfrow=c(2,1))
acf( diff(log(kospi)), main=""  ) 
pacf( diff(log(kospi)), main=""  ) 


kospi_fit <- arima(log(kospi), order=c(1,1,0))
kospi_fit

kospi_fit2 <- arima(log(kospi), order=c(0,1,1))
kospi_fit2

library(forecast)
auto.arima(log(kospi))

# 과대적합 판단
kospi_fit = arima(log(kospi), order=c(1,1,1))
kospi_fit
kospi_fit = arima(log(kospi), order=c(0,1,2))
kospi_fit

#잔차
kospi_fit = Arima(log(kospi), order=c(0,1,1))
tsdiag(kospi_fit)


library(TSA)
library(tseries)
library(quantmod)
library(fGarch)

getSymbols("^KS11",from="1997-01-03",to="2014-8-31")
plot(KS11)
kospi =KS11$ KS11.Close
r.kospi =diff(log(kospi))
r.kospi1 = r.kospi[2:length(r.kospi)] 

plot(kospi, main="KOSPI")
plot(r.kospi, main="dlog KOSPI")

hist(r.kospi1, breaks=100, freq=FALSE, main ="", xlab="")
qqnorm(r.kospi1)
qqline(r.kospi1)
jarque.bera.test(r.kospi1)
kurtosis(r.kospi1)
skewness(r.kospi1)

par(mfrow=c(2,1))
acf(r.kospi, na.action = na.pass, main ="")
pacf(r.kospi, na.action = na.pass, main ="")

acf(r.kospi^2, na.action = na.pass, main ="")
pacf(r.kospi^2, na.action = na.pass, main ="")
McLeod.Li.test(y=r.kospi)

gg = garchFit(~arma(0,1)+garch(1,1),r.kospi1)
summary(gg)
plot(gg)

#############################################
## 9강 
#############################################



#############################################
## 10강 
#############################################
install.packages("mFilter")
library(mFilter)
library(tseries)

setwd("D:/work_R/R-Project/07_예측방법론")
gdp_d <- read.csv( "gdpq.csv", header=TRUE ) 
gdp <- ts( gdp_d[,1]/1000, start=1970, frequency=4 ) 
gdp_sa <- ts( gdp_d[,2]/1000, start=1970, frequency=4 ) 

plot(gdp, ylab="GDP", xlab="", col="steelblue")
lines( gdp_sa, col="red" ) 

# GDP 변동요인 분해
lgdp.hp <- mFilter( log(gdp_sa), filter="HP" )  # Hodrick-Prescott filter
gdp_t <- exp( lgdp.hp$trend )
gdpsam <- exp( (log(gdp_sa) + lag(log(gdp_sa), -1) + lag(log(gdp_sa), 1) ) /3 ) 
gdp_s <- gdp / gdp_sa * 100
gdp_i <- gdp_sa / gdpsam * 100
gdp_c <- gdpsam / gdp_t * 100

par(mfrow=c(2,2))
plot( gdp_t, main="추세변동요인", col="steelblue" )
plot( gdp_c, main="순환변동요인", col="steelblue" )
plot( gdp_s, main="계절변동요인", col="steelblue" )
plot( gdp_i, main="불규칙변동요인", col="steelblue" )


gdp.hw <- HoltWinters(gdp, seasonal="mult") 
gdpf <- predict(gdp.hw, 10)

par(mfrow=c(1,1))
plot(gdp, xlim=c(1970, 2016), ylim=c(0, 320), col="steelblue", ylab="GDP", xlab="" )
lines( gdpf, col="red" ) 

#############################################
## 11강 
#############################################
setwd("D:/work_R/R-Project/07_예측방법론")

library( tseries )
library(quantmod)
kospi <- getSymbols("^KS11", auto.assign=FALSE  )[, 4]
er <- getSymbols("KRW=X", auto.assign=FALSE  )[, 4]

pospi_r <- dailyReturn( kospi )
er_r <- dailyReturn( er )

fin1 <- merge(kospi, er)
plot( fin1[, 1], type="l", main="")
lines( fin1[, 2], col=2)

plot( as.matrix(fin1), xlab="종합주가지수", ylab="원/달러 환율" )
cor( na.omit( as.matrix(fin1)) ) 

gdp <- read.csv("gdpq.csv", header = TRUE)
gdp_o  <- ts(gdp[,1]/1000, start=1970, frequency=4)
gdp_sa <- ts(gdp[,2]/1000, start=1970, frequency=4)
gdp_gr <- ts((gdp_sa-lag(gdp_sa,-1))/lag(gdp_sa,-1)*100,  start=c(1970,2), frequency=4)
ccf(gdp_gr, lag(gdp_gr,-1), lag=12, main=" ")


bc <- ts( read.csv("bc.csv", header=TRUE), start=1970, frequency=12  ) 
ccf( bc[, 1], bc[, 2], lag=12, main="")

gdp_m <- ts( read.csv("gdp_m.csv", header=TRUE), start=1970, frequency=12 ) 
gdpm <- gdp_m[, 2]
ipim <- gdp_m[, 3]
gdp_m_gr <- ts((gdpm-lag(gdpm,-1))/lag(gdpm,-1)*100,  start=c(1980,2), frequency=4)
ipi_m_gr <- ts((ipim-lag(ipim,-1))/lag(ipim,-1)*100,  start=c(1980,2), frequency=4)

plot( as.numeric(ipi_m_gr), as.numeric(gdp_m_gr), xlab="제조업 산업생산자수", ylab="제조업 GDP"  ) 
abline( lm(gdp_m_gr~ipi_m_gr) , col=2 ) 

econ <- ts( read.csv("gdpr.csv", header=TRUE), start=2000, frequency=4  ) 
gdp_r <- econ[,4]
ipi_r <- econ[,5]
sbi_r <- econ[,6]

gr1 <- ts.union(gdp_r, ipi_r, sbi_r)
plot(gr1, main="", xlab="", ylab="")

gdp_r_lm <- lm(gdp_r~ipi_r+sbi_r, data=gr1)
summary(gdp_r_lm)

plot(gdp_r, col="steelblue", ylim=c(-2, 10), ylab="", xlab="" ) 
lines( ts(predict(gdp_r_lm), start=c(2001, 1), freq=4 ), col=2   ) 

#############################################
## 12강 
#############################################
setwd("D:/work_R/R-Project/07_예측방법론")

install.packages("orcutt")
library(car)
library(orcutt)

econ <- ts(read.csv("gdpr.csv", header=TRUE), start=2000, frequency=4)
gdp_r<-econ[,4]
ipi_r<-econ[,5]
sbi_r<-econ[,6]

gdp_r_lm <- lm( gdp_r~ipi_r + sbi_r, data=gr1) 
summary( gdp_r_lm )

plot( gdp_r, col="steelblue" , ylim=c(-2, 10), ylab="", xlab="" ) 
lines( ts( predict(gdp_r_lm), start=c(2001,1), freq=4), col=2 )

durbinWatsonTest( gdp_r_lm )

gdp_r_lm_co <- cochrane.orcutt(gdp_r_lm)
gdp_r_lm_co

library(forecast)
fit <- auto.arima(gdp_r, xreg=cbind(ipi_r, sbi_r) )
summary(fit)
tsdisplay(arima.errors(fit))

fcast <- forecast(fit, 
                  xreg=cbind( rep(mean(ipi_r[53:57], 4)), rep(mean(sbi_r[53:57]), 4) ), h=4
                  )
plot(fcast, main="")

fit1 <- Arima( gdp_r, xreg=cbind(ipi_r, sbi_r), order=c(1, 0,0) ) 
summary(fit1)
tsdisplay( arima.errors(fit1)  ) 
Box.test( residuals(fit1), type="Ljung" ) 
fcast1 <- forecast(fit1, xreg=cbind( rep(mean(ipi_r[53:57], 4)), rep(mean(sbi_r[53:57]), 4) ), h=4)
plot(fcast1)

#############################################
## 13강 
#############################################
setwd("D:/work_R/R-Project/07_예측방법론")

library(vars)

m1gdp <- read.csv("m1gdp.csv")
m1gdp
var <- VAR( m1gdp, p=4, type="const")
causality( var, cause="M1")
causality( var, cause="GDPSA")

irf.var <- irf(var, n.ahead=8, ortho=TRUE, boot=FALSE)
plot(irf.var)

fevd.var <- fevd(var, n.ahead=8, ortho=TRUE, boot=FALSE)
plot(fevd.var)

predict.var <- predict(var, n.ahead=12, ci=0.95)
plot(predict.var)

#############################################
## 14강 : 공적분분석
#############################################
setwd("D:/work_R/R-Project/07_예측방법론")

library(vars)

m1gdp <- read.csv("m1gdp.csv")
vecm <- ca.jo( m1gdp, type="trace", ecdet="const", K=4)
summary( vecm )

var.vecm <- vec2var( vecm, r=1)
var.vecm
predict.vecm <- predict( var.vecm, n.ahead=12, ci=0.95)
plot( predict.vecm )


#############################################
## 15강 
#############################################


#############################################
## END 
#############################################

