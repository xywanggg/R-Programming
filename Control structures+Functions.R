
######## if/ else

if(x>3){
  y<-10
}else{
  y<-0
}

y<-if(x>3){
  10
} #else if(<condition2>){ do sth different } 
# else { do sth different}



####### for

x<-c("a","b","c","d")
for (i in 1:4) {
  print(x[i])
}

for (i in seq_along(x)){
print(x[i])
}

for (letter in x){
  print(letter)
}

for (i in 1:4) print(x[i])


######## while

count<-0
while(count<5){
  print(count)
  count<-count+1
}

#more than one condition
z<-5
while (z>=3 && z<=10) {
  print (z)
  coin<-rbinom(1,1,0.5)
  
  if(coin==1){ ##random walk
    z<-z+1
  } else {
      z<-z-1
    }
}

######### repeat  next  break

#repeat initiates an infinite loop;
#the only way to exit a repeat loop is to call break
x0<-1
tol<-1e-3
repeat{
  x1<-1.1
  if(abs(x1-x0)<tol){
    break
  }else{
    x0<-x1
  }
}

#next is used to skip an iteration of a loop
#return signals that a function should exit and return a given value
for (i in 1:25) {
  if (i <=20){
    next #skip the first 20 iterations
  }else{ 
    print (i) # do something here
    }
}


######### function
#can be passed as arguments to other functions
#can be nested
add2<-function(x,y){
  x+y
}
add2(4,4)

above10<-function(x){
  use<-x>10
  x[use]
}
x<-1:20
above10(x)

above <-function(x,n){
  use<-x>n
  x[use]
}
above(x,12)

columnmean<-function(y,removeNA=TRUE){
  nc<-ncol(y)
  means<-numeric(nc)
  for(i in 1:nc){
    means[i]<-mean(y[,i],na.rm=removeNA)
  }
  means #return
}
