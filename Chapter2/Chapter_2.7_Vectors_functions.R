y <- c(8,3,5,7,6,6,8,9,2,3,9,4,10,4,11)
print(mean(y))
print(range(y))
#This is Tukey’s famous five-number summary: the minimum, the lower hinge, the median, the upper hinge
#and the maximum (the hinges are explained on p. 346).
print(fivenum(y))
counts <- rnbinom(10000,mu=0.92,size=1.1)
print(counts[1:30])
print(table(counts))
data<-read.table("temperatures.txt",header=T)
attach(data)
print(names(data))
print(tapply(temperature,month,mean)) #monthly average
print(tapply(temperature,month,var)) #monthly variance
print(tapply(temperature,month,min)) #monthly minima
print(tapply(temperature,month,function(x) sqrt(var(x)/length(x)))) #standard error calculation
print(tapply(temperature,list(yr,month),mean)[,1:6])
#You can see at once that January
#(month 1) 1993 was exceptionally warm and January 1987 exceptionally cold.
print(tapply(temperature,yr,mean,na.rm=TRUE))
print(tapply(temperature,yr,mean,trim=0.2))
data<-read.table("pHDaphnia.txt",header=T)
print(names(data))
print(aggregate(Growth.rate~Water,data,mean)) #one to one
print(aggregate(Growth.rate~Water+Detergent,data,mean)) # one to many
print(aggregate(cbind(pH,Growth.rate)~Water+Detergent,data,mean)) # many to many
data <- read.table("daphnia.txt",header=T)
attach(data)
names(data)
print(tapply(Growth.rate,Detergent,mean))
print(tapply(Growth.rate,list(Water,Daphnia),median))
y <- c(8,3,5,7,6,6,8,9,2,3,9,4,10,4,11)
which(y>5)
print(y[y>5])
print(length(y))
print(length(y[y>5]))
xv <- rnorm(1000,100,10)
# finding closest value to 108 in xv
print(which(abs(xv-108)==min(abs(xv-108))))
print(xv[which(abs(xv-108)==min(abs(xv-108)))])
# we can write a function to return the closest value to a specified value (sv) in any vector (xv):
closest <- function(xv,sv){
  xv[which(abs(xv-sv)==min(abs(xv-sv)))] }
print(closest(xv,108))

# Sorting, ranking and ordering
houses <- read.table("houses.txt",header=T)
attach(houses)
names(houses)
ranks <- rank(Price)
sorted <- sort(Price)
ordered <- order(Price)
view <- data.frame(Price,ranks,sorted,ordered)
print(view)
# Fractional ranks indicate ties. There are two 188s in Price and their ranks are 8 and 9. Because they are tied,
# each gets the average of their two ranks (8 + 9)/2 = 8.5
print(Location[order(Price)])
print(Location[rev(order(Price))])
## Understanding the difference between unique and duplicated

names <- c("Williams","Jones","Smith","Williams","Jones","Williams")
print(table(names))
print(unique(names))
print(duplicated(names)) # scan from left to right and see whether it is repeated or not till now
print(names[!duplicated(names)])
salary <- c(42,42,48,42,42,42)
print(mean(salary))
print(salary[!duplicated(names)])
print(mean(salary[!duplicated(names)]))

# Looking for runs of numbers within vectors
(poisson <- rpois(150,0.7))
print(rle(poisson)) #rle means run length encoding
# find the longest run frequency
print(max(rle(poisson)[[1]]))
# find the longest run index
print(which(rle(poisson)[[1]]==7))
print(rle(poisson)[[2]][40]) # the longest run was of zeros
# function to return the length of the run and its value for any vector:
run.and.value <- function (x) {
    a <- max(rle(poisson)[[1]])
    b <- rle(poisson)[[2]][which(rle(poisson)[[1]] == a)]
    cat("length = ",a," value = ",b, "\n")}
run.and.value(poisson)
# Sets: union, intersect and setdiff
setA <- c("a", "b", "c", "d", "e")
setB <- c("d", "e", "f", "g")
print(union(setA,setB))
print(intersect(setA,setB))
print(setdiff(setA,setB))
print(setdiff(setB,setA))
# it should be the case that setdiff(setA,setB) plus intersect(setA,setB) plus setdiff(
# setB,setA) is the same as the union of the two sets
print(all(c(setdiff(setA,setB),intersect(setA,setB),setdiff(setB,setA))==
            union(setA,setB)))
#There is also a built-in function setequal for testing if two sets are equal:
print(setequal(c(setdiff(setA,setB),intersect(setA,setB),setdiff(setB,setA)),
           union(setA,setB)))
print(setA %in% setB)
print(setB %in% setA)
#Using these vectors of logical values as subscripts, we can demonstrate, for instance, that setA[setA                                                                      %in% setB] is the same as intersect(setA,setB):
print(setA[setA %in% setB])
