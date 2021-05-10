##################################
# Practice Problems 11 Solutions #
##################################

#Problem A - for() loops

#1. 
# Code with error:
for(i in seq(5,25,5)){
  x <- rnorm(30,i,1)
  mymeans[i] <- mean(x)
}

#a. The object mymeans must be created prior to the 
# for loop in order to store each calculation in it.

#b.
# One solution: Create the object mymeans before 
# the for loop.
mymeans <- NULL
for(i in seq(5,25,5)){
  x <- rnorm(30,i,1)
  mymeans[i/5] <- mean(x) #use i/5 to get the most ideal output.
}
mymeans #Need to run this line of code to see the output.

# Second solution: Remove the [i] to create mymeans as a scalar.
# Then, print the object mymeans each time.
# Note: This is not an ideal solution because you can't
# do anything with your calculation. But, it would make 
# the code run without error.

for(i in seq(5,25,5)){
  x <- rnorm(30,i,1)
  mymeans <- mean(x)
  print(mymeans)
}

#c.
# Explanation of first solution:
# The code creates the object mymeans which is empty (NULL).
# The for loop uses an index called i which takes on the values
# of 5, 10, 15, 20, and 25 (a sequence from 5 to 25 by increments
# of 5). For each value of i, the loop will generate the object x
# which contains 30 random observations generated from a Normal
# distribution with a mean of i and a standard deviation of 1.
# The mean of the values is calculated and stored in the i/5th 
# entry of the mymeans vector.

# Explanation of second solution:
# The for loop uses an index called i which takes on the values
# of 5, 10, 15, 20, and 25 (a sequence from 5 to 25 by increments
# of 5). For each value of i, the loop will generate the object x
# which contains 30 random observations generated from a Normal
# distribution with a mean of i and a standard deviation of 1.
# The mean of the values is calculated and stored in the scalar
# object, mymeans. The value of mymeans for that iteration is
# printed each time.

#2.

for(i in c(10,20)){
  for(j in c(2,4,6)){
    myoutput <- rnorm(i,0,j)
    mymean <- mean(myoutput)
    print(paste("The mean for Setting, i= ",
                i,
                " j= ",
                j,
                ", is ",
                mymean,
                sep=""))
  }
  mysd <- mean(myoutput)
  print(paste("The standard deviation for Setting, i= ",
              i,
              " j= ",
              j,
              ", is ",
              mysd,
              sep=""))
}


#3.

set.seed(2320)
dice <- 1:6
myrolls <- matrix(sample(dice,20,replace=TRUE),nrow=10)
mysums <- apply(myrolls,1,sum)
mysums

set.seed(2320)
dice <- 1:6
myrolls <- matrix(sample(dice,20,replace=TRUE),nrow=10)
mysums <- NULL
for(i in 1:10){
  mysums[i] <- sum(myrolls[i,])
}
mysums

#4.
teststats <- NULL
mypvalues <- NULL
for(i in 1:1000){
  mydata <- rf(30,3,19)
  teststats[i] <- (mean(mydata)-19/17)/(sd(mydata)/sqrt(30))
  mypvalues[i] <- 2*pt(abs(teststats[i]),29,lower.tail=FALSE)
}

mycount <- sum(mypvalues <= 0.05)/1000
mycount

library(ggplot2)
myx <- seq(min(teststats),
           max(teststats),
           0.01)
myy <- dt(myx,29)
ggplot(NULL,aes(x=teststats)) + 
  geom_histogram(aes(y=..density..),color="white") +
  geom_line(aes(x=myx,y=myy),color="red")

#5. 
# Original Problem
myresults <- replicate(10,
                       t.test(rchisq(30,8),
                              rnorm(30,8,4),
                              alternative="two.sided",
                              var.equal=FALSE)$p.value
)

# Using a for() loop, Solution #1
myresults <- NULL
for(m in 1:10){
  myresults[m] <- t.test(rchisq(30,8),
                         rnorm(30,8,4),
                         alternative="two.sided",
                         var.equal=FALSE)$p.value
}

# Using a for() loop, Solution #2
myresults <- NULL
for(k in 1:10){
  x1 <- rchisq(30,8)
  x2 <- rnorm(30,8,4)
  myresults[k] <- t.test(x1,
                         x2,
                         alternative="two.sided",
                         var.equal=FALSE)$p.value
}

#Problem B - writing functions
#6. 
mysimulation <- function(nsim=10,n=30,std=5,loc=0.95){
  output <- replicate(nsim,
                      t.test(rnorm(n,100,std),
                             mu=100,
                             alternative="two.sided",
                             conf.level=loc)$conf.int[1:2])
  output <- t(output)
  
  check <- output[,1] <= 100 & output[,2] >= 100
  prop <- sum(check)/nsim
  mystatement <- paste("The proportion of intervals containing the true mean is ",
                       round(prop,3)*100,
                       "%.",
                       sep="")
  print(mystatement)
}

#a.
mysimulation(nsim=1000,n=30,std=5,loc=0.95)
# The percent is very close to our level of confidence, 95%!

#b.
mysimulation(nsim=1000,n=10,std=15,loc=0.99)
# The percent is very close to our level of confidence, 99%!

#c.
# The capture rate should be close to the level of confidence,
# so I would expect a capture rate close to 87%!

#d. 
# If we change mu=100 to mu=105, then we would be randomly
# generating data from a population with a mean of 100 still
# based on the rnorm() code, but we would be testing the following
# hypotheses: H0: mu=105 vs. Ha: mu != 105. Changing the hypotheses
# only changes the test statistic and p-value, not the confidence
# interval. So I would expect the capture rate to still be close to
# 87% since we are randomly generating our data from a population
# with a mean of 100 and our check statement is verifying that our
# confidence interval contains 100.

#e.
mysimulation2 <- function(nsim=10,n=30,std=5,loc=0.95,munull=100,mutrue=100){
  output <- replicate(nsim,
                      t.test(rnorm(n,mutrue,std), #updated
                             mu=munull, #updated
                             alternative="two.sided",
                             conf.level=loc)$conf.int[1:2])
  output <- t(output)
  
  check <- output[,1] <= mutrue & output[,2] >= mutrue
  prop <- sum(check)/nsim
  mystatement <- paste("The proportion of intervals containing the true mean ",
                       round(prop,3)*100,
                       "%.",
                       sep="")
  print(mystatement)
}

mysimulation2(nsim=10000,n=45,std=10,loc=0.87,mutrue=100,munull=105)
# I got 86.5%!

#7.
myfunc <- function(n=30){
teststats <- NULL
mypvalues <- NULL
for(i in 1:1000){
  mydata <- rf(n,3,19) #sample size
  teststats[i] <- (mean(mydata)-19/17)/(sd(mydata)/sqrt(n)) #sample size
  mypvalues[i] <- 2*pt(abs(teststats[i]),n-1,lower.tail=FALSE) #df=sample size-1
}

mycount <- sum(mypvalues <= 0.05)/1000
print(mycount) #updated

library(ggplot2)
myx <- seq(min(teststats),
           max(teststats),
           0.01)
myy <- dt(myx,n-1) #df=sample size - 1
ggplot(NULL,aes(x=teststats)) + 
  geom_histogram(aes(y=..density..),color="white") +
  geom_line(aes(x=myx,y=myy),color="red")
}

# This simulation draws data from an F distribution and performs
# a t-test. Recall that one of the assumptions of the t-test
# is that our data is randomly selected from a **Normal** population.
# We violated that assumption in our simulation.

myfunc(5) # The t(4) distribution doesn't quite capture the shape 
# of the distribution of the test statistics. It looks like
# the curve is underestimating the histogram in the left tail!
# We also detected significant p-values more often 
# (about 13% of the time in my simulation) than we 
# should have (5%). So more Type I Errors than we should have.
myfunc(30) # Same observations, but the Type I Error rate is closer to 10%
myfunc(100) # The t(99) curve looks like a better match to the histogram
# of all of the test statistics. The observed Type I Error rate of about
# 5.8% in my simulation is much closer to the 5% Type I Error rate
# we anticipated.
