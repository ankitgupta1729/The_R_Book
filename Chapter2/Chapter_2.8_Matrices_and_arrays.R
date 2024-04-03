y <- 1:24
dim(y) <- c(2,4,3)
print(y)
dim(y) <- c(3,2,4)
print(y)
X <- matrix(c(1,0,0,0,1,0,0,0,1),nrow=3)
print(X)
print(class(X))
print(attributes(X))
print(X)
vector <- c(1,2,3,4,4,3,2,1)
V <- matrix(vector,byrow=T,nrow=2)
print(V)
dim(vector) <- c(4,2)
print(is.matrix(vector))
print(vector)
vector <- t(vector)
print(vector)

## 2.8.2 Naming the rows and columns of matrices

X <- matrix(rpois(20,1.5),nrow=4)
print(X)

rownames(X) <- rownames(X,do.NULL=FALSE,prefix="Trial.")
print(X)

drug.names <- c("aspirin", "paracetamol", "nurofen", "hedex", "placebo")
colnames(X) <- drug.names
print(X)

dimnames(X) <- list(NULL,paste("drug.",1:5,sep=""))
print(X)

## 2.8.3 Calculations on rows or columns of the matrix
print(mean(X[,5]))
print(var(X[4,]))
print(rowSums(X))
print(colSums(X))
print(rowMeans(X))
print(colMeans(X))
print(apply(X,2,mean)) # 2 stands for column and 1 stands for rows
print(apply(X,1,mean)) # 2 stands for column and 1 stands for rows
#You might want to sum groups of rows within columns,
#and rowsum (singular and all lower case, in contrast to rowSums, above) is a very efficient function for this. In this example, we want to group together
#row 1 and row 4 (as group A) and row 2 and row 3 (group B). Note that the grouping vector has to have length
#equal to the number of rows:
group=c("A","B","B","A")
print(rowsum(X, group))
#You could achieve the same ends (but more slowly) with tapply or aggregate:
print(tapply(X, list(group[row(X)], col(X)), sum))
#Note the use of row(X) and col(X), with row(X) used as a subscript on group.  
print(aggregate(X,list(group),sum))
#Suppose that we want to shuffle the elements of each column of a matrix independently. We apply the
#function sample to each column (margin number 2) like this:
print(apply(X,2,sample))
print(apply(X,2,sample))
# 2.8.4 Adding rows and columns to the matrix
X <- rbind(X,apply(X,2,mean))
X <- cbind(X,apply(X,1,var))
print(X)
#Note that the number of decimal places varies across columns, with one in columns 1 and 2, two in columns
#3 and 4, none in column 5 (integers) and five in column 6. The default in R is to print the minimum number
#of decimal places consistent with the contents of the column as a whole.
#Next, we need to label the sixth column as ‘variance’ and the fifth row as ‘mean’:

colnames(X) <- c(1:5,"variance")
rownames(X) <- c(1:4,"mean")
print(X)

# 2.8.5 The sweep function
matdata <- read.table("C:\\Users\\ankit19.gupta\\OneDrive - Reliance Corporate IT Park Limited\\Desktop\\Practice_Code\\R_Practice\\TheRbook\\The-R-Book\\Data\\sweepdata.txt")
#First, you need to create a vector containing the parameters that you intend to sweep out of the matrix. In this
#case we want to compute the four column means:
(cols <- apply(matdata,2,mean))
#Now it is straightforward to express all of the data in matdata as departures from the relevant column
#means:
print(sweep(matdata,2,cols))
#Note the use of margin = 2 as the second argument to indicate that we want the sweep to be carried out
#on the columns (rather than on the rows). A related function, scale, is used for centring and scaling data in
#terms of standard deviations.

#Alternatively,
(col.means <- matrix(rep(cols,rep(10,4)),nrow=10))
print(matdata-col.means)

#Suppose that you want to obtain the subscripts for a column-wise or a row-wise sweep of the data. Here
#are the row subscripts repeated in each column:
 
print(apply(matdata,2,function (x) 1:10))
#Here are the column subscripts repeated in each row
print(t(apply(matdata,1,function (x) 1:4)))
#Here is the same procedure using sweep:
print(sweep(matdata,1,1:10,function(a,b) b))
print(sweep(matdata,2,1:4,function(a,b) b))

#2.8.6 Applying functions with apply, sapply and lapply

#The apply function is used for applying functions to the rows or columns of matrices or dataframes. For
#example, here is a matrix with four rows and six columns:

(X <- matrix(1:24,nrow=4))
## Note that placing the expression to be evaluated in parentheses (as above) causes the value of the result to be
#printed on the screen.

#Often you want to apply a function across one of the margins of a matrix. Margin 1
#refers to the rows and margin 2 to the columns. Here are the row totals (four of them):
print(apply(X,1,sum))
#and here are the column totals (six of them):
print(apply(X,2,sum))
#Note that in both cases, the answer produced by apply is a vector rather than a matrix. You can apply
#functions to the individual elements of the matrix rather than to the margins. The margin you specify influences
#only the shape of the resulting matrix.
print(X)
print(apply(X,1,sqrt))
print(apply(X,2,sqrt))
print(apply(X,1,sample))
print(apply(X,1,function(x) x^2+x))
#This is an anonymous function because the function is not named.

#If you want to apply a function to a vector (rather than to the margin of a matrix) then use sapply .
#Here is the code to generate a list of sequences from 1:3 up to 1:7:

print(sapply(3:7, seq))
#The function sapply is most useful with complicated iterative calculations. The following data show decay
#of radioactive emissions over a 50-day period, and we intend to use non-linear least squares (see p. 715) to
#estimate the decay rate a in y = exp(–ax):

sapdecay <- read.table("C:\\Users\\ankit19.gupta\\OneDrive - Reliance Corporate IT Park Limited\\Desktop\\Practice_Code\\R_Practice\\TheRbook\\The-R-Book\\Data\\sapdecay.txt",header=T)
attach(sapdecay)
names(sapdecay)
#We need to write a function to calculate the sum of the squares of the differences between the observed (y)
#and predicted (yf) values of y, when provided with a specific value of the parameter a:

sumsq <- function(a,xv=x,yv=y)
{ 
  yf <- exp(-a*xv)
sum((yv-yf)^2) 
}

#We can get a rough idea of the decay constant, a, for these data by linear regression of log(y) against x, like
#this:

print(lm(log(y)~x))
a <- seq(0.01,0.2,.005)
#Now we can use sapply to apply the sum of squares function for each of these values of a (without writing
#a loop), and plot the deviance against the parameter value for a:
# plot(a,sapply(a,sumsq),type="l")
# a[min(sapply(a,sumsq))==sapply(a,sumsq)]
# plot(x,y)
# xv <- seq(0,50,0.1)
# lines(xv,exp(-0.055*xv))

# Here is the same procedure streamlined by using the optimize function. Write a function showing how
# the sum of squares depends on the value of the parameter a:
#   fa <- function(a) sum((y-exp(-a*x))ˆ2)
# Now use optimize with a specified range of values for a, here c(0.01,0.1), to find the value of a that
# minimizes the sum of squares:
#   optimize(fa,c(0.01,0.1))
# $minimum
# [1] 0.05538411
# $objective
# [1] 0.01473559
# The value of a is that minimizes the sum of squares is 0.055 38 and the minimum value of the sum of squares
# is 0.0147.

# What if we had chosen a different way of assessing the fit of the model to the data? Instead of minimizing
# the sum of the squares of the residuals, we might want to minimize the sum of the absolute values of the
# residuals. We need to write a new function to calculate this quantity:
#   fb <- function(a) sum(abs(y-exp(-a*x)))
# Then we use optimize as before:
#   optimize(fb,c(0.01,0.1))
# $minimum
# [1] 0.05596058
# $objective
# [1] 0.3939221
# The results differ only in the fourth digit after the decimal point, and you could not choose between the
# two methods from a plot of the model. Sums of squares are not the only way of doing statistics, just the
# conventional way.

## 2.8.7 Using the max.col function

#The task is to work out the number of plots on which a species is dominant in the Park Grass dataframe.
#This involves scanning each row of a matrix and reporting on the column number that contains the maximum
#value.
data <- read.table("C:\\Users\\ankit19.gupta\\OneDrive - Reliance Corporate IT Park Limited\\Desktop\\Practice_Code\\R_Practice\\TheRbook\\The-R-Book\\Data\\pgfull.txt",header=T)
attach(data)
names(data)
#The species names are represented by two-letter codes (so, for example, ‘AC’ is Agrostis capillaris). We
#define the dominant as the species that has the maximum biomass on a given plot. The first task is to create a
#dataframe that contains only the species abundances (we do not want the plot numbers, or the treatments, or
#                                                     the values of any covariates). For the Park Grass data, the first 54 columns contain species abundance values,
#so we select all of the rows in the first 54 columns like this:
species <- data[,1:54]
#Now we use the function max.col to go through all of the 89 rows, and for each row return the column
#number that contains the maximum biomass:
print(max.col(species))
#To get the identity of the dominant, we then extract the name of this column, using the index returned by
#max.col as a subscript to the object called names(species):
print(names(species)[max.col(species)])
#Finally, we use table to count up the total number of plots on which each species was dominant. The code
#looks like this:
print(table(names(species)[max.col(species)]))
print(length(table(names(species)[max.col(species)])))
#So the number of species that were present in the system, but never attained dominance was
print(length(names(species))-length(table(names(species)[max.col(species)])))
#There is no such function as ‘min.col’, but you can easily emulate it by using max.col with the negatives
#of your data. It makes no sense to do it with this example, because several species are absent from every plot,
#and the function would just pick one of the absent species at random. But, anyway,
print(max.col(-species))
#picks out the identity (the column number) of one of the zeros from each row of the dataframe. In a case
#where there was a unique minimum in each row, then this would find it.

##2.8.8 Restructuring a multi-dimensional array using aperm
# There are circumstances where you may want to reorder the dimensions of an array
data <- array(1:24, 2:4)
#The second argument to the array function specifies the number of levels in dimensions 1, 2, and 3 using
#the sequence-generator 2:4 to produce the numbers 2, 3 and 4.(24=2*3*4)
print(data)
#There are four sub-tables, each with 2 rows and 3 columns. Now we give names to the factor levels
#in each of the three dimensions: these are called the dimnames attributes and are allocated as lists
#like this:
dimnames(data)[[1]] <- list("male","female")
dimnames(data)[[2]] <- list("young","mid","old")
dimnames(data)[[3]] <- list("A","B","C","D")
print(dimnames(data))
print(data)
#Suppose, however, that we want the four income groups (A–D) to be the columns in each of the sub-tables,
#and the separate sub-tables to represent the two genders. This is a job for aperm. We need to specify the
#order ‘age then income then gender’ in terms of the order of their dimensions (row, column, sub-table, namely 2 then 3 then 1) like this:
 
new.data <- aperm(data,c(2,3,1))
print(new.data)                                                                              


