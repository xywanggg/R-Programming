## looping on the command line
# lapply: loop over a list and evaluate a function on each element
# sapply: same as lapply but try to simplify the result
# apply: apply a function over the margins of an array
# tapply: apply a function over subsets of a vector
# mapply: multivariate version of lapply
# an auxiliary function split is also useful, partiularly in conjunction with lapply


##lapply
#takes three arguments: 1)a list x; 2) a function; 3)other arguments
str(lapply)  #function (X, FUN, ...) 

x<-list(a=1:5,b=rnorm(10))
lapply(x,mean)

x<-1:4
lapply(x,runif)
lapply(x,runif,min=0,max=10)

##sapply
#will try to simplify the result of lapply if possible
#if the result is a list where every element is length 1, then a vector is retruned
#if the result is a list where every element is a vector of the same length(>1), a matrix is returned
#if it cannot figure thing out, a list is returned
str(sapply)  #function (X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)

x<-list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
lapply(x,mean)
sapply(x,mean)

##apply
#used to evaluate a function over the margins of an array
#it is most often used to apply a function to the rows or columns of a matrix
#it can be used with general arrays
#it is not really faster than writing a loop, but it works in one line
str(apply)  #function (X, MARGIN, FUN, ...)  
#x is array
#margin is an integer vector indicating which margins should be "retained"

x<-matrix(rnorm(15),3,5)
apply(x,2,mean)
apply(x,1,sum)
#rowsums=apply(x,1,sum)
#rowmeans=apply(x,1,mean)
#colsums=apply(x,2,sum)
#colmeans=apply(x,2,mean)

apply(x,1,quantile,probs=c(0.25,0.75))

a<-array(rnorm(2*2*10),c(2*2*10))
apply(a,c(1,2),mean)
rowMeans(a,dims=2)

##mapply
#is a multivariate apply of sorts which applies a function in parallel over a set of arguments
str(mapply) 
#function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)  
#MoreArgs is a list of other arguments to FUN
#SIMPLIFY indicates whether the result should be simplified

list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
mapply(rep,1:4,4:1) #same result

##tapply
#is used to apply a function over subsets of a vector
str(tapply)
#function (X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE) 
#x is a vector
#INDEX is a factor or a list of factors

x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10)
tapply(x,f,mean)
tapply(x, f, mean, simplify = FALSE)
tapply(x,f,range)

##split
#takes a vector or other objects and splits it into groups determined by a factor or list of factors
str(split) #function (x, f, drop = FALSE, ...)  
#x is a vector or list or data frame
#f is a factor (or coerced to one) or a list of factors
#drop indicates whether empty factors levels should be dropped

x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10)
split(x,f)
lapply(split(x,f),mean)

#splitting a data frame
library(datasets) 
head(airquality)
s<-split(airquality,airquality$Month)
lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm=TRUE))

#splitting on more than one level
x<-rnorm(10)
f1<-gl(2,5)
f2<-gl(5,2)
f1
f2
interaction(f1,f2)
str(split(x,list(f1,f2)))
str(split(x,list(f1,f2),drop=TRUE))



