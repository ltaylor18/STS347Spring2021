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

