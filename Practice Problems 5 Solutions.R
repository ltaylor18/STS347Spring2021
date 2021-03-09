#######################
# PRACTICE PROBLEMS 5 #
#######################

#############
# Problem A #
#############
#1
set.seed(2320)
dice <- 1:6
myrolls <- sample(dice,2000,replace=TRUE)
craps <- matrix(myrolls,ncol=2)
dim(craps)
mysum <- apply(craps,1,sum)
sevens <- (mysum==7)
is.logical(sevens)
sum(sevens)
sum(sevens)/1000

#2
myseq <- 1:1000

#3
x <- 1:5
myout <- cumsum(x)
myout #each entry is the cumulative sum of every entry before it in the vector x

mycumulsum <- cumsum(sevens)
#Let's see if it worked:
mysum[1:15] #the first seven is in the seventh roll
sevens[1:15] #sevens is TRUE in the seventh position
mycumulsum[1:15] #mycumulsum is 0 until the seventh position when it becomes a 1 
#mycumulsum stays a 1 until the second seven occurs in the 15th roll.

#4
mycumulative <- mycumulsum/myseq

#5
mydata <- data.frame(myseq=myseq,mycumulative=mycumulative)

#6
library(ggplot2)
ggplot(mydata,aes(x=myseq,y=mycumulative)) +
  geom_point()

#7
mycumulative[c(1,5,50,500,750,1000)]

#8
# There is a lot of variability in the proportion of rolls that led to a sum of 7.
# However, as we repeat our simulation more and more times, the proportion of rolls
# that led to a sum of 7 seems to stabilize.

#9
ggplot(mydata,aes(x=myseq,y=mycumulative)) +
  geom_point() +
  geom_hline(yintercept=1/6,color="red")

#10
# The Law of Large Number states that if we repeat a probability experiment
# a large number of times, then the proportion of times an event is observed
# will approach the true probability of observing that event. In this simulation,
# we are repeating the probability experiment of rolling two die and looking at 
# their sum. We repeated this 1000 times and the proportion of times we observed
# a 7 should approach the true probability of getting a sum of 7.

#11
set.seed(2320)
dice <- 1:6
myrolls <- sample(dice,20000,replace=TRUE) #20000 instead of 2000
craps <- matrix(myrolls,ncol=2)
mysum <- apply(craps,1,sum)
sevens <- (mysum==7)
sum(sevens)/10000 #10000 instead of 1000
myseq <- 1:10000 #10000 instead of 1000
mycumulsum <- cumsum(sevens)
mycumulative <- mycumulsum/myseq
mydata <- data.frame(myseq=myseq,mycumulative=mycumulative)
ggplot(mydata,aes(x=myseq,y=mycumulative)) +
  geom_point() +
  geom_hline(yintercept=1/6,color="red")
mycumulative[10000] #Based on 10000 simulations of rolling two dice, we estimate
#the probability of rollng two die that sum to 7 to be 0.1746

#############
# Problem B #
#############

#12
set.seed(2320)
mymeans <- replicate(1000,mean(rnorm(30,mean=500,sd=10)))

#13
library(ggplot2)
myrandom <- data.frame(mymeans=mymeans)
ggplot(myrandom,aes(x=mymeans)) +
  geom_histogram(color="white")
#This graph appears to be centered around 500.
mean(mymeans) #Whoa, that's close to 500!
min(mymeans)
max(mymeans)

#14
set.seed(2320)
mymeans <- replicate(1000,mean(rnorm(30,mean=275,sd=50)))
myrandom <- data.frame(mymeans=mymeans)
ggplot(myrandom,aes(x=mymeans)) +
  geom_histogram(color="white")
#14a
#This graph appears to be centered around 275 and is more 
#spread out than the previous distribution of sample means in 13.
#14b & c
ggplot(myrandom,aes(x=mymeans)) +
  geom_histogram(color="white") +
  geom_vline(xintercept=275,color="red",size=2) +
  geom_vline(xintercept=c(275-3*9.129,275+3*9.129),color="blue",size=2) +
  geom_text(label="Three standard \n deviations below mean",x=255,y=75,color="blue") +
  geom_text(label="Three standard \n deviations above mean",x=295,y=75,color="blue")
#Yes, almost all observed sample means were within three standard
#deviations. It only appears that one sample mean was more than three
#standard deviations away (above, specifically) the mean.

#15
set.seed(2320)
mymeans <- replicate(1000,mean(rnorm(100,mean=275,sd=50)))
myrandom <- data.frame(mymeans=mymeans)
ggplot(myrandom,aes(x=mymeans)) +
  geom_histogram(color="white") +
  geom_vline(xintercept=275,color="red",size=2) +
  geom_vline(xintercept=c(260,290),color="blue",size=2) +
  geom_text(label="Three standard \n deviations below mean",x=265,y=75,color="blue") +
  geom_text(label="Three standard \n deviations above mean",x=285,y=75,color="blue")
#15a
sum(mymeans >= 270 & mymeans <= 280)/1000
#15b
sum(mymeans >= 265 & mymeans <= 285)/1000
#15c
sum(mymeans >= 260 & mymeans <= 290)/1000

#16
# The Central Limit Theorem states that for sufficiently large sample
# sizes (generally considered greater than 30), if we repeatedly
# take samples from a population and calculate the mean of those samples
# then the distribution of the sample means will be approximately
# normally distributed with a mean that matches the population from
# which our samples were drawn and a standard deviation that is equal 
# to the population standard deviation divided by the square root of
# the sample size (sigma/sqrt(n)). In the above examples, we repeatedly
# drew samples from a normal population and observed that the distribution
# of sample means was normally distributed (bell-shaped). Further,
# the sample means all appeared to be centered at the mean of the 
# population from which they were drawn. Even further, we observed 
# how the standard deviation played a role in the spread of our graphs.
# 
# The Empirical Rule (also known as the 68-95-99.7 Rule) states that 
# approximately 68% of bell-shaped
# data should fall within one standard deviation of our mean. In 15a,
# we found that 66.7% of our data was within 1 standard deviation.
# The Empirical Rule also states that approximately 95% and 99.7% of 
# bell-shaped data should fall within 2 and 3 standard deviations, 
# respectively. We observed 95.2% and 99.6%, respectively. Exercise 15
# illustrated the Empirical Rule!

#############
# Problem C #
#############

#17
#Original Code:
ggplot(mtcars,aes(x=mpg,fill=cyl)) + geom_histogram() +    
  scale_fill_brewer(palette="Dark2")

#Correction:
ggplot(mtcars,aes(x=mpg,fill=factor(cyl))) + geom_histogram() +    
  scale_fill_brewer(palette="Dark2")


