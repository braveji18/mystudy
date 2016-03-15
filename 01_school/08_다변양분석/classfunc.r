#----------------------------------------------------------------------#
# Function to calculate Fisher's Classification coefficients #
# This code follows the formulas in Legendre and Legendre's Numerical Ecology (1998) #
#----------------------------------------------------------------------#
classfunc.lda <- function(x, groups){
x.lda <- lda(groups ~ ., as.data.frame(x))
gr <- length(unique(groups)) ## groups might be factors or numeric
v <- ncol(x) ## variables
m <- x.lda$means ## group means
w <- array(NA, dim = c(v, v, gr))

# 중간내용없음
# ..........

for(i in 1:gr) {
ni <- subgr.len[i]
class.func[1, i] <- -0.5 * t(m[i,]) %*% iV %*% (m[i,]) + log(ni / tot.len)
class.func[2:(v+1) ,i] <- iV %*% (m[i,])
}
x.lda$class.func <- class.func
return(x.lda)
}