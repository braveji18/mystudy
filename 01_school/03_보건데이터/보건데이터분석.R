## 보건데이터분석 

#자료입력 
흡연자 <- c(16, 6, 13, 9, 11, 3, 26, 5, 17, 4, 15, 3, 15, 8, 12, 3, 18, 6, 
         12, 0.24, 1, 16,5,21.8, 16.3, 23.4, 18.8)
흡연자
비흡연자 <- c(18.1, 6.0, 10.8, 11.0, 7.7, 17.9, 9.8, 5, 13.0, 18.9  )
비흡연자
# 정규성검정 : Sharpiro-Wik test
qqnorm(흡연자, main="흡연자")
qqline(흡연자, col="red")
shapiro.test(흡연자)

qqnorm(비흡연자, main="비흡연자")
qqline(비흡연자, col="red")
shapiro.test(비흡연자)

# 병렬상자그림
boxplot(흡연자, 비흡연자, col="yellow", names=c("흡연자", "비흡연자")  )

# 병렬바이올린그림
install.packages("vioplot")
library(vioplot)
vioplot(흡연자, 비흡연자, col="yellow", names=c("흡연자", "비흡연자")  )

# 두 모분산 비교(양측검정)
# 대립가설의 형태 
sd(흡연자);sd(비흡연자)
var.test(흡연자, 비흡연자)

# 두 모평균 비교(양측검정)-등분산 가정
t.test(흡연자, 비흡연자, var.equal=T)

t.test(흡연자, 비흡연자)
      


# 표3.6 혈압비교 자료의 짝지은 t-검정
# 자료입력
복용전혈압 <- c(90, 56, 49, 64, 65, 88, 62, 91, 74, 93, 55, 71, 54, 64, 54)
복용후혈압 <- c(72, 55, 56, 57, 62, 79, 55, 72, 73, 74, 58, 59, 58, 71, 61)
차이 <- 복용전혈압 - 복용후혈압 ; 차이 
# 정규성검정 : shapio-wilk test
qqnorm(차이)
qqline(차이, col='red')
shapiro.test(차이)

# 짝지은 표본의 평균 비교
mean(차이);sd(차이);
t.test(복용전혈압,복용후혈압, paired=T, alternative="greater")



## 혈청 항원의 농도면역이상의 대한 일원분산분석
자페아 <- c(755, 365, 820, 900, 170, 300, 325, 385, 380, 215, 400, 343, 415, 345, 410, 
            450, 225, 440, 400, 360, 435, 360 )
정상아 <- c(165, 390, 290, 435, 235, 345, 320, 330, 375, 345, 305, 220, 270, 355, 360,
            335, 305, 325, 245, 285, 370, 345, 345, 230, 370, 285, 315, 195, 270, 305,
            375, 220)
지진아 <- c(380, 510, 315, 715, 380, 390, 245, 155, 335, 295, 200, 105, 105, 245)
# 병렬상자 
boxplot(자페아,정상아,지진아, col="yellow", names=c("자페아","정상아","지진아") )
#병렬 바이올린그림
library(vioplot)
vioplot(자페아,정상아,지진아, col="yellow", names=c("자페아","정상아","지진아") )

#각 그룹의 평균
sapply( list(자페아,정상아,지진아), mean )

#각 그룹의 분산
sapply( list(자페아,정상아,지진아), var )
혈청항원농도 <- c(자페아,정상아,지진아)
혈청항원농도
length(자페아)
그룹 <- factor( rep( 1:3, c( length(자페아),length(정상아),length(지진아)  ) ) )
그룹

# 등분산성 검정 Fligner-Killeen Test
fligner.test(혈청항원농도~그룹)

# One-way ANOVA
일원분산분석 <- aov(혈청항원농도~그룹)
일원분산분석
summary(일원분산분석)

# 모형적합성검토-오차검토
par(mfrow=c(2,2))
plot(일원분산분석)

# average profile plot( 평균반응 프로파일그림) - 효과크기를 알 수 있는 그림
plot.design(혈청항원농도~그룹)

# 다중비교( multiple comparison ) : Tukey's honest significant differenecs
hsd=TukeyHSD(일원분산분석)
hsd
plot(hsd)

# 다중비교 : LSD TEST(최소유의차검정)
pairwise.t.test(혈청항원농도,그룹)

# 의보장구 사용 숙지시간을 이원분산분석하기
의보장구사용숙지시간자료 <- read.table("의보장구사용숙지시간차자료.txt", head=T) 
의보장구사용숙지시간자료
attach(의보장구사용숙지시간자료)

# two-way ANOVA
이원분산분석 <- aov(숙지시간~나이+방법)
이원분산분석
summary(이원분산분석)

# 모형적합성검토=오차검토
par( mfrow=c(2,2))
plot(이원분산분석)

# 다중비교:LSD test
pairwise.t.test(숙지시간,나이)
pairwise.t.test(숙지시간,방법)


# 호르몬처리후 혈액칼슘측정치를 이원분산분석
혈액칼슘자료 <- read.table("혈액칼슘자료.txt", header=T)
혈액칼슘자료
attach(혈액칼슘자료)
#two-way ANOVA
이원분산분석2 <- aov(혈액칼슘~성별*처리) 
이원분산분석2
summary(이원분산분석2)
par( mfrow=c(2,2))
plot(이원분산분석2)

# 다중비교 : LSD test
pairwise.t.test(혈액칼슘,성별)
pairwise.t.test(혈액칼슘,처리)


###################################################################
# 동질성 검정 - 비타민 C복용과 감기에 관한 이중 눈가림 연구
비타민효과=matrix(c(31,109,17,122),nrow=2,byrow=T)
비타민효과
dimnames(비타민효과) <- list(
                          비타민복용여부=c("대조군","처리군"),
                          감기여부=c("감기 걸림","감기 안 걸림") 
                        )
비타민효과
분할표_비타민효과=addmargins(비타민효과)
분할표_비타민효과
# 카이검정
chisq.test(비타민효과)
# 관찰도수
chisq.test(비타민효과)$observed
# 기대도수
chisq.test(비타민효과)$expected
# 피어슨잔차
chisq.test(비타민효과)$residuals



# Goodman과 Kruskal의 독립성 검정
눈색_머리색=matrix(c(1768,807,189,47,946,1387,746,53,115,438,288,16),nrow=3,byrow=T)
dimnames(눈색_머리색)=list(눈색=c("눈색 A1","눈색 A2","눈색 A3")
                      ,머리색=c("머리색 B1","머리색 B2","머리색 B3","머리색 B4"))
눈색_머리색
분할표_눈색_머리색=addmargins(눈색_머리색)
분할표_눈색_머리색
# 점차트
par(mfrow=c(1,2))
dotchart(눈색_머리색)
dotchart(t(눈색_머리색))
# 모자이크그림
mosaicplot(t(눈색_머리색))
#카이검정
chisq.test(눈색_머리색)
# 관찰도수
chisq.test(눈색_머리색)$observed
# 기대도수
chisq.test(눈색_머리색)$expected
# 피어슨잔차
chisq.test(눈색_머리색)$residuals

# 잘못 적용된 통계적 절차: 카이제곱검정
호지킨병_잘못된자료 <- matrix(c(41,44,33,52),nrow=2,byrow=T)
dimnames(호지킨병_잘못된자료) <- list(
                                  그룹=c("사례군","대조군"),
                                  편도적출여부=c("편도적출 유","편도적출 무") )
호지킨병_잘못된자료
분할표_호지킨병_잘못된자료=addmargins(호지킨병_잘못된자료)
분할표_호지킨병_잘못된자료
# 카이검정
chisq.test(호지킨병_잘못된자료,correct=F)
# 카이검정(연속성 수정)
chisq.test(호지킨병_잘못된자료)


# 올바른 통계적 절차: 카이제곱검정
호지킨병=matrix(c(26,15,7,37),nrow=2,byrow=T)
dimnames(호지킨병) <- list(
  그룹=c("사례군","대조군"),
  편도적출여부=c("편도적출 유","편도적출 무") )
호지킨병
분할표_호지킨병=addmargins(호지킨병)
분할표_호지킨병
# McNemar 검정
mcnemar.test(호지킨병,correct=F)
# McNemar 검정(연속성 수정)
mcnemar.test(호지킨병)


#바르샤바 소녀의 초경연령 예제
초경연령자료=read.table("바르샤바초경연령자료.txt",header=T)
초경연령자료
attach(초경연령자료)
확률=초경경험자/군의총수
# 나이별 초경비율 그리기
plot(평균연령, 확률)
# 로짓분석
로짓 <- glm(확률~평균연령,data=초경연령자료,family="binomial")
로짓 <- lm(확률~평균연령,data=초경연령자료)
summary(로짓)

plot(로짓)


## 오즈비
exp(coef(로짓))

###################################################################
# 공분산분석
install.packages("HH")
install.packages("lsmeans")
library(HH)
library(lsmeans)
혈당량자료 <- read.table("혈당량자료.txt", header=T)
혈당량자료
attach(혈당량자료)
# 회귀계수의 동일성 검정
모형1 <- aov(치료후혈당량~factor(치료법) * 초기혈당량, data=혈당량자료 ) 
summary(모형1)
ancova(치료후혈당량~치료법 * 초기혈당량, data=혈당량자료 )
# 일원공분산
모형2 <- lm(치료후혈당량~factor(치료법) + 초기혈당량, data=혈당량자료 ) 
summary(모형2)
ancova(치료후혈당량~치료법 + 초기혈당량, data=혈당량자료 )
# 공변량 효과 제어시 치료법의 효과 검정
모형3 <- lm(치료후혈당량~초기혈당량, data=혈당량자료 ) 
summary(모형3)
anova(모형3,모형2)
summary(aov(치료후혈당량~factor(치료법) + 초기혈당량, data=혈당량자료 ) )
summary(aov(치료후혈당량~factor(치료법), data=혈당량자료 ) )
# LSMEANS계산
lsmeans(모형2,~치료법)
# Tukey 다중비교 검정
모형2.lsm <- lsmeans(모형2, pairwise~factor(치료법), glhargs=list())
print(모형2.lsm, omit = 1)
plot(모형2.lsm[[2]])
# 모형적합성 검토
par(mfrow = c(2,2))
plot(모형2)


###################################################################
# 반복측정 자료분석
install.packages("lme4")
install.packages("multcomp")
library(lme4)
library(multcomp)
반복측정자료 <- read.table("반복측정분산분석.txt", header=T)
반복측정자료


boy_반복측정자료 <- 반복측정자료[반복측정자료$group=="Boy",  ]
girl_반복측정자료 <- 반복측정자료[반복측정자료$group=="Girl",  ]
boy_mean <- c( mean( boy_반복측정자료$age8 ),
               mean( boy_반복측정자료$age10 ),
               mean( boy_반복측정자료$age12 ),
               mean( boy_반복측정자료$age14 ) )
girl_mean <- c( mean( girl_반복측정자료$age8 ),
                mean( girl_반복측정자료$age10 ),
                mean( girl_반복측정자료$age12 ),
                mean( girl_반복측정자료$age14 ) )
g_range <- range(0, boy_mean, girl_mean)
plot(boy_mean, type="o", col="blue", ylim=g_range, 
     axes=FALSE, ann=FALSE)
axis(1, at=1:4, lab=c("age8","age10","age12","age14"))
axis(2, las=1, at=4*0:g_range[2])
box()
lines(girl_mean, type="o", pch=22, lty=2, col="red")
title(xlab="age", col.lab=rgb(0,0.5,0))
title(ylab="mean", col.lab=rgb(0,0.5,0))
legend(1, g_range[2], c("boy","girl"), cex=0.8, 
       col=c("blue","red"), pch=21:22, lty=1:2);


attach(반복측정자료)
반복측정자료$subject <-  factor( 반복측정자료$subject ) 
개체수 <- nrow(반복측정자료)
반복측정자료_LONG <- reshape(반복측정자료, idvar="subject", 
                        timevar="time",
                       v.names="Value",
                       varying=c("age8", "age10", "age12", "age14"), direction="long" )
반복측정자료_LONG$time <- rep( c(8, 10, 12, 14) , rep(개체수, 4) ) 
반복측정자료_LONG

attach(반복측정자료_LONG)
반복측정자료_lmer1 <- lmer(Value~group + time + group*time + (1|subject), 
                     data=반복측정자료_LONG, method="ML", na.action=na.omit )
summary(반복측정자료_lmer1)
cftest(반복측정자료_lmer1)
# 선형선 검토
par( mfrow=c(1,2))
절편 <- ranef(반복측정자료_lmer1)$subject[["(Intercept)"]]  
qqnorm(절편, main="Random Intercept")
qqline(절편, col="red")
잔차 <- residuals(반복측정자료_lmer1)
qqnorm(잔차, main="Residuals")
qqline(잔차, col="red")

# 등분산성 검토
plot(반복측정자료_lmer1)

#################################################################
## 생존분석

## 협심증 자료의 생명표
install.packages("KMsurv")
library(KMsurv)
협심증환자자료 <- read.table("D:/Work_R/R-Project/03_보건데이터/협심증환자자료.txt", header=T)
협심증환자자료
attach(협심증환자자료)
집단.사망 <- 협심증환자자료[ which(censor==1), ]
집단.사망
년 <- floor(집단.사망$time)
년
lt <- length(년)
년[ lt+1 ] = NA
집단.절단 <- 협심증환자자료[ which(censor==0), ]
집단.절단
사망 <- 집단.사망[,3]
사망
절단 <- 집단.절단[,3]
절단
합 <- 사망 + 절단 
합
생명표 <- lifetab(년, sum(합), 절단, 사망)
?lifetab
생명표
# 생명포를 이용한 생존함수 추정치
par( mfrow=c(1,2) )
plot( 년[1:length(년)-1 ], 생명표[,5], type="s", xlab="년", ylab="생존함수", ylim=c(0,1) )
plot( 년[1:length(년)-1 ], 생명표[,5], type="o", xlab="년", ylab="생존함수", ylim=c(0,1) )
# 생명표를 이용한 위험함수 추정치
par( mfrow=c(1,2) )
plot( 년[1:length(년)-1 ], 생명표[,7], type="s", xlab="년", ylab="위험함수", ylim=c(0,1) )
plot( 년[1:length(년)-1 ], 생명표[,7], type="o", xlab="년", ylab="위험함수", ylim=c(0,1) )


# 누적한계추정법
install.packages("survival")
library(survival)
신장이식환자료 <- read.table("D:/Work_R/R-Project/03_보건데이터/신장이식환자2.txt", header=T)
신장이식환자료
attach(신장이식환자료)
# 누적한계추정치(Kaplan-Meier추정치)
적합1 <- survfit( Surv(time, status)~1, data=신장이식환자료 ); summary(적합1)
# 사망시점의 사분위수 추정치와 그의 신뢰구간
quantile(적합1, probs=c(0.25, 0.5, 0.75), conf.int=T)
# 누적한계추정치와 95%신뢰구간그래프
par( mfrow=c(1,1) )
plot(적합1, xlab="시간", ylab="생존함수" )
legend(0.5, 0.2 , c("누적한계추정치", "95% 신뢰구간"), lty=c(1,2))


# 비모수적 방법을 이용한 생존함수의 비교
library(survival)
흑색종환자자료 <- read.table("D:/Work_R/R-Project/03_보건데이터/흑색종환자자료.txt", header=T)
흑색종환자자료
attach(흑색종환자자료)
#누적한계추정치(Kaplan-Meier추정치)
적합2 <- survfit( Surv(time, status)~x, data=흑색종환자자료 );summary(적합2 )
#누적한계추정치 비교 그래프
plot(적합2, xlab="시간",  ylab="생존함수", lty=c(1,2))
legend( 5, 0.2, c("CP처리그룹", "BCG처리그룹" ), lty=c(1,2) )
# 로그-순위 검정법( log-rank test)
survdiff( Surv(time, status)~x, data=흑색종환자자료 )
# Gehen-Wilcoxon 검정
survdiff( Surv(time, status)~x, rho=1, data=흑색종환자자료 )


library(survival)
data("veteran")
폐암환자자료 <- veteran
폐암환자자료
attach(폐암환자자료)
# 모수적 모형에 근거한 생존시간 분석
와이블 <- survreg( Surv(time, status)~age+karno+diagtime+factor(trt)+factor(celltype), 
                data=폐암환자자료, dist="weibull" )
summary(와이블)

install.packages("flexsurv")
library(flexsurv)
일반화감마분포 <- flexsurvreg( Surv(time, status)~age+karno+diagtime+factor(trt)+factor(celltype), 
                        data=폐암환자자료, dist="gengamma" )
일반화감마분포
와이블분포 <- flexsurvreg( Surv(time, status)~age+karno+diagtime+factor(trt)+factor(celltype), 
                        data=폐암환자자료, dist="weibull" )
와이블분포

plot(와이블분포, xlab="시간", ylab="생존함수")
lines(일반화감마분포, col="blue", lty=2)
legend("topright" , c("와이블분포", "일반화감마분포"), lty=1:2, col=c("red", "blue"))

# 준모수적 방법을 이용한 생존함수의 추정과 비교
library(survival)
data("veteran")
폐암환자자료 <- veteran
attach(폐암환자자료)
# Cox비례위험모형에 근거한 생존시간 분석
coxfit1 <- coxph( Surv(time, status)~age+karno+diagtime+factor(trt)+factor(celltype), 
                  data=폐암환자자료 ) 
summary(coxfit1)
# 생존함수 추정치
적합4 <- survfit(coxfit1)
summary(적합4)

# 생존함수 그래프
plot( survfit(coxfit1), xlab="시간", ylab="생존함수", xlim=c(0, 998.9) )
legend(500, 1.0 , c("누적한계추정치", "95% 신뢰구간"), lty=c(1,2) 

# 누적위험함수 그래프
H.hat <- -log(적합4$surv)
H.hat <- c( H.hat, tail(H.hat, 1) )
plot( c(적합4$time, 1100), H.hat , xlab="시간", ylab="누적위험함수", type="s" )

# 비례성 검토를 위한 로그-로그 그래프
coxfit2 <- coxph( Surv(time, status)~age+karno+diagtime+factor(trt)+factor(celltype), 
                  data=폐암환자자료 ) 
plot(survfit(coxfit2), fun="cloglog"  )







