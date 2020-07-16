##generating random numbers
#rnorm: generate random normal variates with a given mean and standard deviation
#dnorm: evaluate the normal probability density and a point
#pnorm: evaluate teh cumulative distribution function for a normal distribution
#rpois: generate random poisson variates with a given rate

#r: random number generation
#d: density
#p: cumulative distribution
#q: quantile 

dnorm(x,mean=0,sd=1,log=FALSE)
pnorm(q,mean=0,sd=1,lower.tail = TRUE,log.p=FALSE)
qnorm(p,mean=0,sd=1,lower.tail = TRUE,log.p=FALSE)
rnorm(n,mean=0,sd=1)

##Generating normal distribution data
set.seed(1)
x<-rnorm(10)
x<-rnorm(10,20,2)
summary(x)

##Generating poisson data
rpois(10,1)
rpois(10,20)

ppois(2,2) ##cumulative distribution
ppois(4,2) #Pr<=4

##Generating random numbers from a linear model
#y=0.5+2x+e
set.seed(20)
x<-rnorm(100)
e<-rnorm(100,0,2)
y<-0.5+2*x+e
summary(y)
plot(x,y)

#x is binary
set.seed(10)
x<-rbinom(100,1,0.5)
e<-rnorm(100,0,2)
y<-0.5+2*x+e
summary(y)
plot(x,y)

##Generating random numbers from a generalized linear model
#log mu=0.5+0.3x
set.seed(1)
x<-rnorm(100)
log.mu<-0.5+0.3*x
y<-rpois(100,exp(log.mu))
summary(y)
plot(x,y)

##Random Sample
set.seed(1)
sample(1:10,4)
sample(letters,4)

sample(1:10) #permutation
sample(1:10,replace=TRUE) #with repalcement

