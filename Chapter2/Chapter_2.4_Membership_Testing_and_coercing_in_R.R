lv <- c(TRUE,FALSE,TRUE)
print(is.logical(lv))
class(lv)
print(levels(lv))
print(fv <- as.factor(lv))
print(is.factor(fv))
print((nv <- as.numeric(lv)))
print(as.numeric(factor(c("a","b","c"))))
print(as.numeric(c("a","b","c")))
print(as.numeric(c("a","4","c")))
geometric <- function(x){
  if(!is.numeric(x)) stop ("Input must be numeric")
  exp(mean(log(x))) }
print(geometric(c("a","b","c")))
print(geometric(c(1,2,3)))
geometric <- function(x){
  if(!is.numeric(x)) stop ("Input must be numeric")
  if(min(x)<=0) stop ("Input must be greater than zero")
  exp(mean(log(x))) }
print(geometric(c(2,3,0,4)))
print(geometric(c(10,1000,10,1,1)))
A <- 1:10
B <- c(2,4,8)
print(A * B)
##
