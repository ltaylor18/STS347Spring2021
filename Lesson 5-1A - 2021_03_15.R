## Lesson 5-1A ##

###########
# 3/15/21 #
###########

mynorms <- rnorm(1000)
ggplot(NULL,aes(x=mynorms)) +
  geom_histogram(color="white")

?rt
myt <- rt(1000,19)
ggplot(NULL,aes(x=myt)) +
  geom_histogram(color="white")

###########
# 3/19/21 #
###########

mynorms <- rnorm(1000)
library(ggplot2)
ggplot(NULL,aes(x=mynorms)) +
  geom_histogram(color="white")

mean(mynorms)
sd(mynorms)
?rnorm

mynorms2 <- rnorm(5000,150,25)
mynorm3 <- rnorm(5000,sd=25,mean=150)
ggplot(NULL,aes(x=mynorms2)) +
  geom_histogram(color="white")
mean(mynorms2)
sd(mynorms2)

# Super-imposing the probability density function
# on the histogram
mynorms <- rnorm(1000)
myx <- seq(-3,3,.01)
myy <- dnorm(myx)

ggplot(NULL,aes(x=mynorms)) +
  geom_histogram(aes(y=..density..),color="white") +
  geom_line(aes(x=myx,y=myy),color="red",size=2)


# for 100,000 observations
mynorms <- rnorm(100000)
myx <- seq(-3,3,.01)
myy <- dnorm(myx)

ggplot(NULL,aes(x=mynorms)) +
  geom_histogram(aes(y=..density..),color="white") +
  geom_line(aes(x=myx,y=myy),color="red",size=2)


pnorm(2)-pnorm(1)


pnorm(2)
pnorm(2,lower.tail=FALSE)

# They add to 1!
pnorm(2) + pnorm(2,lower.tail=FALSE)


mynewnorm <- rnorm(100000,0,1)
sum(mynewnorm >= 1 & mynewnorm <= 2)/100000

# Example

# Method 1
pnorm(1.96,lower.tail=FALSE)
1-pnorm(1.96)

# Method 2
mynewnorm <- rnorm(100000,0,1)
sum(mynewnorm > 1.96)/100000
sum(mynewnorm >= 1.96)/100000


###########
# 3/22/21 #
###########


# Proof of t-distribution

# 1. Since we can't generate an infinite number of random samples,
# Let's settle for generating 50,000 samples of size 15 from a 
# Normal Distribution matching the population our soda sample
# came from (I'll use the mean=12 and sd=0.1),

mysamples <- replicate(50000,rnorm(15,12,0.1))

# Each column of mysamples represents one replication of my
# soda experiment of observing 15 cans.
dim(mysamples)
mysamples[,1] #check out the first sample in the first column

# 2. Calculate the t-test statistic for each column of my data.

# Find the mean and standard deviation of each sample of 15 observations
mymeans <- apply(mysamples,2,mean)
length(mymeans) #we get 50,000 x-bars!
mysds <- apply(mysamples,2,sd)
# Calculate t for each sample of 15 observations
myteststats <- (mymeans - 12)/(mysds/sqrt(15))
length(myteststats)


# 3. Observe the distribution of my calculated test statistics

library(ggplot2)
ggplot(NULL,aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white")

# 4. Super-impose the t-14 distribution on the histogram 
# of test statistics and generate a QQ-Plot to compare
# the test statistics to the Normal distribution.

myx <- seq(-4,4,.01)
myy <- dt(myx,14)
ggplot(NULL, aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white") +
  geom_line(aes(x=myx,y=myy),color="red") +
  labs(title="50,000 t Test Statistics Compared to t-14 curve")

ggplot(NULL,aes(sample=myteststats)) +
  stat_qq() +
  geom_qq_line(distribution=stats::qnorm)

# 5. Until 1901, statisticians used the Normal Distribution
# to model the sampling distribution of this test statistic.
# How "bad" was that? Well, here' I've added the Normal
# Distribution's probability density function in blue. 
# What do you think?

myx <- seq(-4,4,.01)
myy <- dt(myx,14)
mynormy <- dnorm(myx)
ggplot(NULL, aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white") +
  geom_line(aes(x=myx,y=myy),color="red") + 
  geom_line(aes(x=myx,y=mynormy),color="blue",linetype=2)


#Is it a big difference between Z and T?

pnorm(1.96, lower.tail=FALSE)

pt(1.96,4,lower.tail=FALSE)

pt(1.96,9,lower.tail=FALSE)

pt(1.96,19,lower.tail=FALSE)

pt(1.96,29,lower.tail=FALSE)



