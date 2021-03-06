###############
## Lesson 7  ##
## Functions ##
## 4/30/21   ##
###############

for(i in 1:5) {print(i)}

#What if I wanted to print the numbers 1-10
for(i in 1:10) {print(i)}


#Define the function
myprint <- function(num=5){
  for(i in 1:num){print(i)}
}

myprint()
# uses the default value of num, which is 5

?rnorm #let's observe the default values of this function

#Do we have to use default values, NO!
#Define the function
myprint2 <- function(num){
  for(i in 1:num){print(i)}
}

myprint2()


myprint(num=2)
myprint(2)

myprint(3)

out <- myprint(2) #myprint doesn't actually return any objects!
out


args(myprint)
args(rnorm)
myprint

rnorm


head(trees)



MyMean <-  function(X) { 
  S <- sum(X) 
  L <- length(X) 
  M <- S/L 
  m <- c("Mean is: ", M) 	#creates a character string   
  newS <- paste("Sum is: ", S)  #what does paste do?
  newL <- paste("Length is: ", L)
  print(newS) #What is the default output?
  print(newL, quote=FALSE) #What does quote=FALSE do?
  print(m, quote=FALSE) #Did we get the same output?  
  X  #what happens to whatever you list last?
}#end function

args(MyMean)

MyMean(trees$Volume)

out <- MyMean(trees$Volume)
out


#Try on your own example:
MyTrim <- function(datavar){
  xmax <- max(datavar)
  xmin <- min(datavar)
  S <- sum(datavar) - xmax - xmin
  L <- length(datavar) - 2
  M <- S/L
  M
}

MyTrim(trees$Volume)
MyTrim(datavar=trees$Volume)

mytrimmedmean <- MyTrim(trees$Volume)
mytrimmedmean

##############
## 5/3/21   ##
##############

Errors <- function(samples=1000,samplesize=30,munull=0,mutrue=0){
  set.seed(2320)
  mydata <- rnorm(samples*samplesize,mutrue)
  data.mat <- matrix(mydata,nrow=samples,ncol=samplesize)
  mypvals <- NULL
  for(i in 1:samples){
    out <- t.test(data.mat[i,],alternative="two.sided",mu=munull)
    mypvals[i] <- out$p.value 
  }
  
  sum(mypvals <= 0.05)/samples
  
}

Errors()
Errors(5000,20)
Errors(5000,20,1)
Errors(5000,10,0,0.5) #Simulate 5000 samples of size 10 from a pouplation with a true mean of 0.5 and test the hypotheses H0: mu=0 vs. Ha: mu != 0

out <- NULL
myseq <- seq(10,50,10)
for(i in myseq){
  out[i/10] <- Errors(samples=5000,samplesize=i,munull=0,mutrue=0.5)
}
out

# We could write more efficient code by putting the sequence in the for() loop
out <- NULL
for(i in seq(10,50,10)){
  out[i/10] <- Errors(samples=5000,samplesize=i,munull=0,mutrue=0.5)
}
out


# Returns the last objected listed!
myoutput <- Errors()
myoutput

# We want to return multiple objects, let's use a list!
x <- 1:5
m <- matrix(1:25,nrow=5)
mylist <- list(x,m,sleep)
mylist
mylist2 <- list(myseq=x,mymat=m,mydata=sleep)
mylist2


##############
## 5/5/21   ##
##############

x <- 1:5
m <- matrix(1:25,nrow=5)
mylist <- list(x,m,sleep)
mylist
mylist[[1]]
mylist[1]
mylist[[1]][3] #prints out the third element of the 1st object in mylist
names(mylist)
mylist2 <- list(myseq=x,mymat=m,mydata=sleep)
mylist2
mylist2$myseq
mylist2$myseq[3]
names(mylist2)


MyTrim <- function(datavar){
  xmax <- max(datavar)
  xmin <- min(datavar)
  S <- sum(datavar) - xmax - xmin
  L <- length(datavar) - 2
  M <- S/L
  M
  output <- list(mymax=xmax,mymin=xmin,S=S, L=L, M=M)
  return(output)
}

mydata <- rnorm(100)

MyTrim(mydata)
out <- MyTrim(mydata)
out$mymax
out$M


out <- MyTrim(mtcars$mpg)
out

mymax <- out$mymax


# For you to try solutions:
#a.a.
myvec <- 1:5
#a.b.
mysum <- sum(myvec)
#b.
MySum <- function(value)
{
  myvec <- 1:value
  mysum <- sum(myvec)
  mysum
}
#c.
MySum(2)
MySum(5)
MySum(100)


#Exercise #2
TwoDice <- function(N){
  mysums <- replicate(N,sum(sample(1:6,2,replace=TRUE)))
  mysums
}

TwoDice(10)
out <- TwoDice(10)
sum(out==7)/10
table(out)
hist(out,freq=TRUE,breaks=1:12)  #you only need $mysum if you returned a list

library(ggplot2)
ggplot(NULL,aes(x=out)) + geom_histogram(color="white")

nsims <- 5000
TwoDice(nsims)
out <- TwoDice(nsims)
sum(out==7)/nsims
table(out)
hist(out,freq=TRUE,breaks=1:12)  #you only need $mysum if you returned a list
ggplot(NULL,aes(x=out)) + geom_histogram(color="white")
#7 is the most likely sum of two dice!

TwoDice2 <- function(N){
  mysums <- replicate(N,sum(sample(1:6,2,replace=TRUE)))
  hist(out,freq=TRUE,breaks=1:12)
  mysums
}

TwoDice2(nsims)
