print(peas <- c(4, 7, 6, 5, 6, 7))
print(class(peas))
print(length(peas))
print(mean(peas))
print(min(peas))
print(max(peas))
print(quantile(peas))
print(quantile(peas, seq(0,1, by = 0.25))) # how values are calculated ?
print(quantile(peas, seq(0,1, by = 0.10)))
peas <- scan() # write it in console and put enter two times when you are done 
print(peas)
print(peas[4])
pods <- c(2,3,6)
print(peas[pods])
print(peas[-2]) #dropping the 2nd value from the vector
print(peas[-length(peas)])
# function to remove smallest two and largest two values from a vector
trim <- function(x) sort(x)[-c(1,2,length(x)-1,length(x))]  
print(trim(peas))
print(sort(peas)[3])
print(peas[1:3])
print(peas[seq(2,length(peas),2)])
print(peas[1:length(peas) %% 2 == 0])
y <- 4.3
z <- y[-1]
print(length(z))
(counts <- c(25,12,7,4,6,2,1,0,2))
names(counts) <- 0:8 # naming counts varible to 0,1,..so on so that there will be 25 zeros, 12 ones,..so on to counts
print(counts)
#table() function in R Language is used to create a
#categorical representation of data with variable name and the frequency in the form of a table.
(st <- table(rpois(2000,2.3)))
print(as.vector(st))
x <- 0:10
print(sum(x))
print(sum(x<5)) #counts up the number of cases that pass the logical condition ‘x is less than 5’.
print(sum(x[x<5]))
# summing 3 largest elements
y <- c(8,3,5,7,6,6,8,9,2,3,9,4,10,4,11)
sum(rev(sort(y))[1:3])
# Note that we have not changed the vector y in any way, nor have we created any new space-consuming
# vectors during intermediate computational steps
x <- c(2,3,4,1,5,8,2,3,7,5,7)
## indices where maximum and minimum are there
# slow way to do it
print(which(x == max(x)))
print(which(x == min(x)))
# quicker way
print(which.max(x))
print(which.min(x))
