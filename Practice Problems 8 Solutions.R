###################################
## Practice Problems 8 Solutions ##
###################################

#############
# Problem A #
#############
########################
# Normality Assumption #
########################

#1a. 
# Side Note: the mean of the Chi-square distribution is equal to 
# its degrees of freedom
# Proof by simulation:
values <- rchisq(50000,12)
mean(values)
# Verify in the help file:
?rchisq

#1b.
# Proof of t-distribution
# Update to take samples from Chi-Square (df=12) distribution

mysamples <- replicate(50000,rchisq(15,12)) ##UPDATE
mymeans <- apply(mysamples,2,mean)
mysds <- apply(mysamples,2,sd)
# Calculate t for each sample of 15 observations
myteststats <- (mymeans - 12)/(mysds/sqrt(15))

# t vs. Z (Standard Normal) curve
myx <- seq(-4,4,.01)
myy <- dt(myx,14)
mynormy <- dnorm(myx)
library(ggplot2)
ggplot(NULL, aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white") +
  geom_line(aes(x=myx,y=myy),color="red") + 
  geom_line(aes(x=myx,y=mynormy),color="blue",linetype=2) +
  labs(title="50,000 t Test Statistics Compared to t-14 curve")

#2.
# Proof of t-distribution
# Update to take samples from Chi-Square (df=12) distribution
# Update sample size to 10

mysamples <- replicate(50000,rchisq(10,12)) ##UPDATE
mymeans <- apply(mysamples,2,mean)
mysds <- apply(mysamples,2,sd)
# Calculate t for each sample of 15 observations
myteststats <- (mymeans - 12)/(mysds/sqrt(10)) ##UPDATE

# t vs. Z (Standard Normal) curve
myx <- seq(-4,4,.01)
myy <- dt(myx,9) ##UPDATE
mynormy <- dnorm(myx)
library(ggplot2)
ggplot(NULL, aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white") +
  geom_line(aes(x=myx,y=myy),color="red") + 
  geom_line(aes(x=myx,y=mynormy),color="blue",linetype=2) +
  labs(title="50,000 t Test Statistics Compared to t-9 curve") ##UPDATE

# The t-curve seems to be a good description of the distribution of
# the t-test statistic still!

#3.
# Proof of t-distribution
# Update to take samples from Chi-Square (df=12) distribution
# Update sample size to 5

mysamples <- replicate(50000,rchisq(5,12)) ##UPDATE
mymeans <- apply(mysamples,2,mean)
mysds <- apply(mysamples,2,sd)
# Calculate t for each sample of 15 observations
myteststats <- (mymeans - 12)/(mysds/sqrt(5)) ##UPDATE

# t vs. Z (Standard Normal) curve
myx <- seq(-4,4,.01)
myy <- dt(myx,4) ##UPDATE
mynormy <- dnorm(myx)
library(ggplot2)
ggplot(NULL, aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white") +
  geom_line(aes(x=myx,y=myy),color="red") + 
  geom_line(aes(x=myx,y=mynormy),color="blue",linetype=2) +
  labs(title="50,000 t Test Statistics Compared to t-4 curve") ##UPDATE

# The t-curve seems to be a good description of the distribution of
# the t-test statistic still!

#4a.
# In #1-3, we generated our data from the Chi-square distribution,
# which is skewed right. We clearly violated the assumption of normality.
# However, our test statistic still seemed to be well-defined by the
# t-distribution with n-1 degrees of freedom.

#4b. 
# Extending my answer to part a, I also observe that even for really
# small sample sizes like 5, 10, and 15, that the distribution of the
# test statistic is still really well-described by the t-distribution
# with n-1 degrees of freedom. Therefore, it seems from this example
# that requiring a sample size of 30 may be a bit extreme!

#############
# Problem B #
#############
###################################
# Distribution of sample variance #
###################################

#5.

# Method #1 will be illustrated here and Method #2 will be illustrated in #6
mydata <- rnorm(20000,100,5)
mydata <- matrix(mydata,nrow=1000)
myvar <- apply(mydata,1,var) #Use 1 because I filled in samples as rows
mycalc <- 19*myvar/25
myx <- seq(min(mycalc),max(mycalc),.01)
mychi <- dchisq(myx,19)
ggplot(NULL,aes(x=mycalc)) +
  geom_histogram(aes(y=..density..),color="white") +
  geom_line(aes(x=myx,y=mychi),color="red",size=2)

# The Chi-Square (19) distribution fits this graph beautifully.
# We finally see something that doesn't follow a bell-shaped distribution! :)

#6. 
#Method #2 - Using replicate!

mydata <- replicate(1000,rnorm(9,75,4))
myvar <- apply(mydata,2,var) #Use 2 because replicate filled in samples as columns
mycalc <- 8*myvar/16  #Update n and s
myx <- seq(min(mycalc),max(mycalc),.01)
mychi <- dchisq(myx,8)  #Update n
ggplot(NULL,aes(x=mycalc)) +
  geom_histogram(aes(y=..density..),color="white") +
  geom_line(aes(x=myx,y=mychi),color="red",size=2)

# The Chi-Square (8) distribution fits this graph beautifully as well.
# We see that if we repeated calculate this statistic over and over again
# that the statistic will have a skewed distribution that is described
# by the Chi-Square distribution.


#############
# Problem C #
#############
#############################
# Why the n-1 instead of n? #
#############################

#7.
mydata <- replicate(1000,rnorm(10,100,5))

#8.
realvar <- apply(mydata,2,var)

#9.
fakevar <- 9*realvar/10

#10.
mean(realvar)
mean(fakevar)
# The true population variance is 25 (5^2). 
# The mean of the realvar (real variance calculation with n-1) is
# closer to 25.

#11. 
myvars <- c(realvar,fakevar)
myind <- c(rep("Real",1000),rep("Fake",1000))
mydata <- data.frame(myvars=myvars,myind=myind)

#12.
ggplot(mydata,aes(x=myvars,y=myind)) + geom_boxplot() +
  geom_vline(xintercept=25,color="red")
# Both statistics have a skewed distribution and neither are
# very well centered at 25, but it looks like the calculation
# with n in the denominator is shifted further to the left
# and tends to underestimate the population variance.

#13.
ggplot(mydata,aes(x=myvars)) + geom_histogram(color="white") +
  facet_grid(~myind) + geom_vline(xintercept=25,color="red")
