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
