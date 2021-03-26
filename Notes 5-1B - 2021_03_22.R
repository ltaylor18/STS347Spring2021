## Lesson 5-1B##

###########
# 3/22/21 #
###########

#Notes 5-1B

pt(1.28, df=24, lower.tail = TRUE)
pt(1.28,24,lower.tail=TRUE)
?pt

#Repeating probability from example through simulation

sum(myteststats < -0.90)/50000
pt(-0.90,14)

pt(1.28, 24)


pt(1.28, 24, lower.tail=FALSE)
1-pt(1.28,24)

#Example Table
#P(T12 < 2)
pt(2,12)

#P(T5 > - 0.5)
pt(-.5,5,lower.tail=FALSE)
1-pt(-.5,5)

#P(T99 > 1.28)
pt(1.28,99,lower.tail=FALSE)
1-pt(1.28,99)



set.seed(2320)
samp <- rnorm(1000,mean=250,sd=25)

xbar <- mean(samp)
s <- sd(samp)

t <- (xbar-250)/(s/sqrt(1000))

pt(t,999) #Correct
pnorm(t)  #Incorrect


###########
# 3/24/21 #
###########

pt(2.57058,5,lower.tail=FALSE)
1-pt(2.57058,5,lower.tail=TRUE)
1-pt(2.57058,5)

?pf
pf(1.3,12,6)
1-pf(1.3,12,6)

runif(10) #unif is the abbreviation in R for the Uniform distribution
?punif
?pchisq
?pbeta

qt(.975,12)
qnorm(.95)

###########
# 3/26/21 #
###########

# We looked at the code for the CLT applet
# All work done by students in Breakout Rooms

# Here are sample solutions to the F(3,56) distribution

myf <- rf(10000,3,56)

# F True SD calc!! 
num <- 2*56*56*(3+56-2)
denom <- 3*(56-2)^2*(56-4)
sqrt(num/denom)

library(ggplot2)
ggplot(NULL,aes(x=myf)) +
  geom_histogram(aes(y=..density..),
                 color="white")

mean(myf)
sd(myf)

mymatrix <- matrix(myf,nrow=1000)

mymeans <- apply(mymatrix,1,mean)

ggplot(NULL,aes(x=mymeans)) +
  geom_histogram(aes(y=..density..),
                 color="white")

mean(mymeans)
sd(mymeans)

truesd <- 0.887
truesd/sqrt(10)
