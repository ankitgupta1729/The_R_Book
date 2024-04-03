print(log(42/7.3))
print(1.2e3)
print(1.2e-2)
print(3.9+4.5i)
z <- 3.5-8i
print(Re(z))
print(Im(z))
print(Mod(z))
print(Arg(z))
print(Conj(z))
print(is.complex(z))
print(as.complex(8))
print(floor(5.7))
print(ceiling(5.7))
rounded <- function(x) floor(x+0.5)
print(rounded(5.7))
print(rounded(5.4))
print(trunc(5.7)) # closest integer to x between x and 0, e.g. trunc(1.5) = 1, trunc(–1.5) = –1;
#trunc is like floor for positive values and like ceiling for negative values
print(trunc(-5.7))
print(round(5.7,0))
print(round(5.5,0))
print(round(5.4,0))
print(round(-5.7,0))
print(signif(12345678,4))
print(signif(12345678,5))
print(signif(12345678,6))
print(3^2 / 2)
print(log(10))
print(exp(1))
print(log10(6))
print(log(9,3)) #log to the base 3 of 9
print(factorial(5))
print(choose(4,2))
print(gamma(1/2)) # gamma function
print(lgamma(1/2)) # natural log of gamma function
print(runif(5)) # generates n random numbers between 0 and 1 from a uniform distribution
print(cos(0)) # cosine of x in radians
print(acos(0)) # inverse cosine of x in radians
print(acosh(2+3i)) # inverse hyperbolic trigonometric transformations of real or complex numbers
print(cos(pi/2))
print(119 %/% 13) # integer coefficient of 119/13
print(119 %% 13) # remainder of 119/13
print(15421 %% 7 == 0) # ‘double equals’ to test for equality
print(x <-5) # assignment for objects
print(5 ->x) # assignment for objects
x <- c(5,3,7,8)
print(is.integer(x))
print(is.numeric(x))
x <- c(5,3,7,8)
x <- as.integer(x)
print(is.integer(x))
print(as.integer(5.7))
print(as.integer(-5.7))
as.integer(5.7 -3i)
gender <- factor(c("female", "male", "female", "male", "female"))
print(class(gender))
print(mode(gender))
data <- read.table("C://Users/ankit19.gupta/Desktop/testdfR.txt",header = TRUE, sep = ",")
attach(data)
print(head(data))
print(is.factor(FirstName))
print(levels(FirstName))
print(nlevels(FirstName))
print(length(levels(FirstName)))
data <- read.table("C://Users/ankit19.gupta/Desktop/daphnia.txt",header = T)
attach(data)
print(head(data))
print(is.factor(Water))
print(levels(Detergent))
print(nlevels(Detergent))
print(length(levels(Detergent)))
