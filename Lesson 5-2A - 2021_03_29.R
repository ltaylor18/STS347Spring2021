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

# With a p-value of 0.0097, there is ____ evidence to suggest
# _____________________________.

t.test(penguins$bill_length_mm,
       alternative="two.sided",
       mu=43,
       conf.level=0.90)

# We are ___% confident that ____________________ 
# is between 43.44 and 44.41 mm.