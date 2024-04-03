for (i in 1:5) print(i^2)
for (i in 1:5) print(i**2)
j <- k <- 0
for (i in 1:5) {
  j <- j+1
  k <- k+i*j
  print(i+j+k) }
#for
fac1 <- function(x) {
  f <- 1
  if (x<2) return (1)
  for (i in 2:x) {
    f <- f*i}
  f }
print(sapply(0:5,fac1))
#while
fac2 <- function(x) {
  f <- 1
  t <- x
  while(t>1) {
    f <- f*t
    t <- t-1 }
  return(f) }

print(sapply(0:5,fac2))
#repeat
fac3 <- function(x) {
  f <- 1
  t <- x
  repeat {
    if (t<2) break
    f <- f*t
    t <- t-1 }
  return(f) }
print(sapply(0:5,fac3))
print(cumprod(1:5))
fac4 <- function(x) max(cumprod(1:x))
print(max(cumprod(1:0)))
print(sapply(0:5,fac4))
fac5 <- function(x) gamma(x+1)
print(sapply(0:5,fac5))
print(sapply(0:5,factorial))

# 2.10.1 Creating the binary representation of a number

binary <- function(x) {
  i <- 0
  string <- numeric(32)
  while(x>0) {
    string[32-i]< -x %% 2
    x <- x%% 2
    i <- i+1 }
  first <- match(1,string)
  string[first:32] }
print(sapply(15:16,binary))

fibonacci <- function(n) {
  a <- 1
  b <- 0
  while(n>0)
  {swap <- a
  a <- a+b
  b <- swap
  n <- n-1 }
  b }
print(sapply(1:10,fibonacci))

# 2.10.2 Loop avoidance

z <- ifelse (y < 0, -1, 1)

data <- read.table("C:\\Users\\ankit19.gupta\\OneDrive - Reliance Corporate IT Park Limited\\Desktop\\Practice_Code\\R_Practice\\TheRbook\\Chapter2\\worms.txt",header=T)
attach(data)
ifelse(Area>median(Area),"big","small")
y <- log(rpois(20,1.5))
print(y)
print(ifelse(y<0,NA,y))

# 2.10.3 The slowness of loops

x <- runif(10000000)
system.time(max(x))
pc <- proc.time()
cmax <- x[1]
for (i in 2:10000000) {
  if(x[i]>cmax) cmax <- x[i] }
proc.time()-pc

# 2.10.4 Do not ‘grow’ data sets by concatenation or recursive function calls

test1 <- function(){
  y <- 1:100000
}

test2 <- function(){
  y <- numeric(100000)
  for (i in 1:100000) y[i] <- i
}
test3 <- function(){
  y <- NULL
  for (i in 1:100000) y <- c(y,i)
}
system.time(test1())
system.time(test2())
system.time(test3())

# 2.10.5 Loops for producing time series

next.year <- function(x) lambda * x * (1 - x)
lambda <- 3.7
next.year(0.6)

N <- numeric(20)
N[1] <- 0.6
for (t in 2:20) N[t] <- next.year(N[t-1])
plot(N,type="l")

