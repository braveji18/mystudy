


##########################################
## 6장 

# 데이터 
ex <- data.frame( 
      sex=c("남", "남","여","남","남","여","남","여","남","남","여","여","여","남","남")
  , salary=c(163, 162, 157, 172, 161, 162, 165, 158, 159, 160, 161, 165, 168, 170, 170)
  )

# 모평균 검정
t.test( ex$salary , alternative=c("greater"), mu=160)

# 두 모평균 비교
var.test( ex$salary[ex$sex=="남"], ex$salary[ex$sex=="여"], alternative=c("two.sided")  )

t.test( ex$salary[ex$sex=="남"], ex$salary[ex$sex=="여"], alternative=c("two.sided"), mu=0, var.equal=TRUE )


# 데이터
taja <- data.frame(
  before=c(52, 60, 63, 43, 46, 56, 62, 50)
  , after=c(58, 62, 62, 48, 50, 55, 68, 57)  
  )

# 대응비교 
t.test( taja$before, taja$after, alternative=c("less"), mu=0, paired=TRUE )
