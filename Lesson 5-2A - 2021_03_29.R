# Notes 5-2A
# 3/29/2021

?t.test

# As written in notes!
myvalues <- rnorm(50,50,5)
t.test(x=myvalues,   
       alternative="two.sided",
       mu=100,
       conf.level=0.95)

#H0: mu = 100
#Ha: mu != 100

# Example 1
# What I intended to say in notes!
set.seed(2320)
myvalues <- rnorm(50,100,5) #Use mu=100
t.test(x=myvalues,   
       alternative="two.sided",
       mu=100,
       conf.level=0.95)

#H0: mu = 100
#Ha: mu != 100

sd(myvalues)
pt(-1.49,49)

# Example 2

library(palmerpenguins)
View(penguins)

t.test(penguins$bill_length_mm,
       alternative="greater",
       mu=43,
       conf.level=0.90)


#############
# 3/31/2021 #
#############

# With a p-value of 0.00097, there is convincing/significant 
# evidence to suggest (that Ha is true)
# the population mean bill length is greater than 43 mm.

t.test(penguins$bill_length_mm,
       alternative="two.sided",
       mu=43,
       conf.level=0.90)

# We are 90% confident that population mean bill length 
# is between 43.44 and 44.41 mm.

out <- t.test(x=myvalues, alternative="two.sided",mu=100,conf.level=0.95)
out
summary(out)
names(out)
out$statistic
out$p.value
out[1]

# Example 3

#What happens for different levels of confidence
loc <- c(0.90,0.95,0.99)
ci <- matrix(rep(NA,6),nrow=3,ncol=2)
out1 <- t.test(x=myvalues, alternative="two.sided",mu=100,conf.level=loc[1])
out2 <- t.test(x=myvalues, alternative="two.sided",mu=100,conf.level=loc[2])
out3 <- t.test(x=myvalues, alternative="two.sided",mu=100,conf.level=loc[3])

ci[1,] <- out1$conf.int[1:2]
ci[2,] <- out2$conf.int[1:2]
ci[3,] <- out3$conf.int[1:2]

#How wide are the intervals?
diff <- ci[,2] - ci[,1]
diff

#Where are they centered?
apply(ci,1,mean)
mean(myvalues) # The sample mean!!


# Examples 4

#######################################
#What happens if we change sample size?
#######################################
set.seed(2320)
myvalues10 <- rnorm(10,100,1)
myvalues30 <- rnorm(30,100,1)
myvalues100 <- rnorm(100,100,1)
loc <- c(0.90,0.95,0.99)
ci <- matrix(rep(NA,6),nrow=3,ncol=2)
out1 <- t.test(x=myvalues10, alternative="two.sided",mu=100,conf.level=loc[1])
out2 <- t.test(x=myvalues30, alternative="two.sided",mu=100,conf.level=loc[1])
out3 <- t.test(x=myvalues100, alternative="two.sided",mu=100,conf.level=loc[1])

ci[1,] <- out1$conf.int[1:2]
ci[2,] <- out2$conf.int[1:2]
ci[3,] <- out3$conf.int[1:2]
ci

#How wide are the intervals?
diff <- ci[,2] - ci[,1]
diff

#Where are they centered?
apply(ci,1,mean)
mean(myvalues10)
mean(myvalues30)
mean(myvalues100)


############
# 4/2/2021 #
############

#Let's explore the concept of XX% confidence!
nsim <- 1000
n <- 30
std <- 5
loc <- 0.95

output <- replicate(nsim,
                    t.test(rnorm(n,100,std),
                           mu=100,
                           alternative="two.sided",
                           conf.level=loc)$conf.int[1:2])
# replicate repeatedly generates 30 random data values
# from a Normal distribution with a mean of 100
# and calculates the 95% confidence interval
output

output <- t(output) # t = transpose (flips the object)
output

check <- output[,1] <= 100 & output[,2] >= 100
sum(check)/nsim # percent of intervals that contained
                # the true mean of 100


# Creating a graph of level of confidence
#Let's explore the concept of XX% confidence!
nsim <- 100
n <- 30
std <- 5
loc <- 0.95

output <- replicate(nsim,
                    t.test(rnorm(n,100,std),
                           mu=100,
                           alternative="two.sided",
                           conf.level=loc)$conf.int[1:2])
# replicate repeatedly generates 30 random data values
# from a Normal distribution with a mean of 100
# and calculates the 95% confidence interval
output

output <- t(output) # t = transpose (flips the object)
output

check <- output[,1] <= 100 & output[,2] >= 100
sum(check)/nsim # percent of intervals that contained
# the true mean of 100

library(ggplot2)
mydata <- data.frame(row=1:length(output[,1]),
                     point.estimate=apply(output,1,mean),
                     lower.bound=output[,1],
                     upper.bound=output[,2],
                     check=check)
g <- ggplot(mydata,aes(x=row,
                       y=point.estimate,
                       ymin=lower.bound,
                       ymax=upper.bound)) +  
  geom_pointrange() + 
  coord_flip() +
  geom_hline(yintercept=100) +
  labs(title=paste("Simulation of",loc*100,"% confidence"),
       subtitle=paste("Captured:",sum(check),"out of",nsim, "simulations"),
       x="",
       y="Confidence Intervals")
plot(g)

# paired t-tests

t.test(extra~group,paired=TRUE,data=sleep)

library(dplyr)
sleep.sorted <- arrange(sleep,ID)

#base
extra1 <- sleep.sorted$extra[sleep.sorted$group == 1]
#dplyr
extra2 <- select(filter(sleep.sorted,group==2),extra)
extra2 <- sleep.sorted$extra[sleep.sorted$group == 2]

diff <- extra1-extra2

mysleep <- data.frame(extra1,extra2,diff)
mysleep <- rename(mysleep,extra2=extra,
                  diff=extra.1)


t.test(diff,data=mysleep) # 212 way of calculating
# the difference yourself!

# What's wrong with my code?
# I used dplyr to make extra2 and it is not a vector!
# The arguments of t.test must be vectors!
t.test(extra1,extra2,paired=TRUE)
is.vector(extra2)

diff2 <- extra2 - extra1 #reverse the order of subtraction!
t.test(diff2)

mean(mysleep$diff)
sd(mysleep$diff)
mean(diff2)
sd(diff2)

############
# 4/7/2021 #
############

# Warm-up follow-up
x <- 1:10
y <- seq(10,100,10)
z <- rep("R Rules",10)

mydata <- data.frame(x,y,z)
mydata

# Forum follow-up
# What are myx and myy?

library(ggplot2)

# What does Beta(3,1) distribution look like?
# Let's generate some random data!
mybeta <- rbeta(1000,3,1)
ggplot(NULL) + 
  geom_histogram(aes(x=mybeta,
                     y=..density..),
                 color="white")

# Let's superimpose the curve in steps!
# The graph goes from
min(mybeta)
# to
max(mybeta)
# So I need to calculate the dbeta 
# function across this range.

myx <- seq(min(mybeta),max(mybeta),0.01)
# myx is a sequence that starts at the smallest
# observed x value and goes up by 0.01
# until it reaches the max x value
head(myx) # first 6 values
tail(myx) # last 6 values

# At each x value, we need to calculate the
# height of the Beta(3,1) density curve
myy <- dbeta(myx,3,1)
head(myy)
tail(myy)

# So what did we just calculate? We calculated the 
# x and y coordinates that define the Beta density 
# curve.

ggplot(NULL) + 
  geom_histogram(aes(x=mybeta,
                     y=..density..),
                 color="white") +
  geom_point(aes(x=myx,
                 y=myy),
             color="red")

# However, we like to see this as a smooth line.
# So instead of using geom_point, we have R
# connect the dots for us using geom_line.
# That is why a finer grid of myx values create
# a smoother line.

ggplot(NULL) + 
  geom_histogram(aes(x=mybeta,
                     y=..density..),
                 color="white") +
  geom_line(aes(x=myx,
                 y=myy),
             color="red")

# Note: There are other ways to do this, but I like
# the connection this makes to remind us that the
# d+distribution function calculates the height
# of the density function.


# Two-independent samples t-tests (continued)

# Make the data file to work with!
library(dplyr)
library(palmerpenguins)  
mypenguins <- select(filter(penguins,species != "Chinstrap"),
                     species,
                     bill_length_mm)

# preview it!
mypenguins[c(1:6,271:276),]

adelie <- select(
  filter(mypenguins,
         species=="Adelie"),
  bill_length_mm)
gentoo <- select(
  filter(mypenguins,
         species=="Gentoo"),
  bill_length_mm)

head(adelie)
head(gentoo)

# First column of table in notes:

# In SAS:
# proc ttest data=mypenguins;
# class species;
# var bill_length_mm;
# run;

t.test(bill_length_mm ~ species,
       data=mypenguins)

# Equal variance
t.test(bill_length_mm ~ species,
       data=mypenguins,
       var.equal=TRUE)

# How might you determine whether to use
# the equal variance or unequal variance test?

# Compare the sample variances!
summarize(filter(adelie,!is.na(bill_length_mm))
                 ,myvar=var(bill_length_mm))
summarize(filter(gentoo,!is.na(bill_length_mm))
          ,myvar=var(bill_length_mm))

# Draw side-by-side boxplots!
# Perform the Equal Variance F-test!



# Second column of table in notes:

t.test(adelie$bill_length_mm,
       gentoo$bill_length_mm)

#What about a reversed order?
t.test(gentoo$bill_length_mm,
       adelie$bill_length_mm)

# Equal variance
t.test(adelie$bill_length_mm,
       gentoo$bill_length_mm,
       var.equal=TRUE)

# Example - simulated data

set.seed(6493)
x1 <- rnorm(100,100,5)
x2 <- rnorm(20,100,15)
var(x1)  
var(x2)
t.test(x1,x2,var.equal=TRUE)
t.test(x1,x2,var.equal=FALSE)
val=c(x1,x2)
grp=c(rep("A",100),rep("B",20)) 
mydata <- data.frame(val,grp)
ggplot(mydata,aes(x=grp,y=val)) +    
  geom_boxplot()


############
# 4/9/2021 #
############


# Swap SDs
library(ggplot2)
set.seed(6493)
x1 <- rnorm(100,100,15) # swapped
x2 <- rnorm(20,100,5) # swapped
var(x1)  
var(x2)
t.test(x1,x2,var.equal=TRUE)
t.test(x1,x2,var.equal=FALSE)
val=c(x1,x2)
grp=c(rep("A",100),rep("B",20)) 
mydata <- data.frame(val,grp)
ggplot(mydata,aes(x=grp,y=val)) +    
  geom_boxplot()

# Same SD
set.seed(6493)
x1 <- rnorm(100,100,15) # both 15
x2 <- rnorm(20,100,15)
var(x1)  
var(x2)
t.test(x1,x2,var.equal=TRUE)
t.test(x1,x2,var.equal=FALSE)
val=c(x1,x2)
grp=c(rep("A",100),rep("B",20)) 
mydata <- data.frame(val,grp)
ggplot(mydata,aes(x=grp,y=val)) +    
  geom_boxplot()

# Larger n
set.seed(6493)
x1 <- rnorm(100,100,5)
x2 <- rnorm(100,100,15) # n2=100
var(x1)  
var(x2)
t.test(x1,x2,var.equal=TRUE)
t.test(x1,x2,var.equal=FALSE) # correct test!
val=c(x1,x2)
grp=c(rep("A",100),rep("B",100)) # n2=100
mydata <- data.frame(val,grp)
ggplot(mydata,aes(x=grp,y=val)) +    
  geom_boxplot()


# What if we do two-independent samples t-test 
# when data is really paired?

# Note: I fixed extra2 above so that it was a vector!

t.test(extra1,extra2,paired=TRUE) #correct analysis
t.test(extra1,extra2) #incorrect analysis
