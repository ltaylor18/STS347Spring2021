##############
# Notes 5-2B #
#   4/9/21   #
##############

library(palmerpenguins)
View(penguins)
library(ggplot2)
ggplot(penguins,aes(x=species,y=bill_length_mm)) + geom_boxplot()


aov(bill_length_mm ~ species, data=penguins)

out <- aov(bill_length_mm ~ species, data=penguins)
out
anova(out) 

plot(out)


out2 <- lm(penguins$bill_length_mm ~ penguins$species)   
anova(out2)
plot(out2)

# Two-Way ANOVA

b12 <- c(rep(0,6),rep(5,6))
antib <- rep(
  c(rep(0,3),rep(40,3)),
  2)
weight <- c(1.3, 1.19, 1.08, 
            1.05, 1, 1.04, 
            1.26, 1.21, 1.19, 
            1.52, 1.56, 1.54)

pigs <- data.frame(b12=factor(b12),   
                   antib=factor(antib), 
                   weight=weight)

###############
#   4/12/21   #
###############

aov(data=pigs, weight~b12 + antib + b12*antib) 
out.twoway<-aov(data=pigs, weight~b12 + antib + b12*antib) 

summary(out.twoway)

#mtcars data
head(mtcars)
?mtcars
names(mtcars)
View(mtcars)
str(mtcars)
mean(mtcars$mpg)
summary(mtcars)

cor(mtcars$mpg,mtcars$wt)
cor(mtcars$wt,mtcars$mpg)

library(ggplot2)
g <- ggplot(mtcars,aes(x=wt,y=mpg)) +
  geom_point()
g

lm(mtcars$mpg ~ mtcars$wt)
#OR
lm(mpg ~ wt, data=mtcars)

g + geom_smooth(method="lm")
g + geom_smooth(method="lm",
                se=FALSE)

out <- lm(mtcars$mpg ~ mtcars$wt)
summary(out)


lm(mtcars$mpg ~ mtcars$wt - 1)

g + geom_abline(intercept=0,
                slope=5.292)

lm(mtcars$mpg ~ 1)
g + geom_abline(intercept=20.09,
                slope=0)
mean(mtcars$mpg)


out2 <- lm(mtcars$mpg ~ mtcars$wt + mtcars$hp)
out2
summary(out2)

plot(out2)
