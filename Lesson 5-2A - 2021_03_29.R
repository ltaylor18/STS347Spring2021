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
