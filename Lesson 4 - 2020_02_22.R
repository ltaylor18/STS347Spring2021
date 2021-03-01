##############
# Lesson 4-1 #
##############
# 2021-02-22 #
##############

library(ggplot2)
head(mtcars)

library(gridExtra)


# Make 4 simple graphics:
g1 <- ggplot(mtcars, aes(x = mpg)) + geom_density(fill = "lightblue") + theme_bw()
g2 <- ggplot(mtcars, aes(x = hp, y = mpg, color = factor(am))) + 
  geom_point() + 
  labs(x = "Horsepower", y = "Miles per gallon", color = "Transmission")
g3 <- ggplot(mtcars, aes(x = factor(cyl), y = wt)) + 
  geom_boxplot(fill = "maroon") + 
  labs(x = "Cylinders", y=  "Weight") + 
  theme_classic()
g4 <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am))) + 
  geom_bar() + 
  scale_fill_viridis_d(option = "E")


# Show the 4 plots on the same page
grid.arrange(g1, g2, g3, g4, ncol = 2, nrow = 2)

g1
g2
g3
g4
grid.arrange(g2, arrangeGrob(g3, g4, ncol=2), nrow = 2)
grid.arrange(g1, g2, g3, nrow = 3)
grid.arrange(g2, arrangeGrob(g3, g4, ncol=2), nrow = 1)
grid.arrange(g2, arrangeGrob(g3, g4, nrow=2), nrow = 1)

##############
# 2021-02-24 #
##############

# Link for Google Slides: https://docs.google.com/presentation/d/1qKlbnwg1oCRTJdV59xPMULGa-tveLzSwv2PmCBX1dLk/edit?usp=sharing

library(ggplot2)
p <- ggplot(Orange,aes(x=age,y=circumference))
p
p + geom_point()

#2
p <- ggplot(Orange,aes(x=age,y=circumference,color="purple"))
p + geom_point()

#3
p <- ggplot(Orange,aes(x=age,y=circumference))
p + geom_point(color="green")

#4
p <- ggplot(Orange,aes(x=age,y=circumference,color=Tree))
p + geom_point()



# Following up on forum questions related to attach
names(ChickWeight)
Chick
ChickWeight$Chick
attach(ChickWeight)
Chick
detach(ChickWeight)
Chick

# Also, I am curious about the 157 and 164 for number of sevens
# and would love to see your different solutions posted in the forums.

##############
# 2021-02-26 #
##############

#Example
library(ggplot2)
myplot <- ggplot(mtcars,aes(x=wt,y=mpg))
myplot + geom_point()

#Boxplot
ggplot(ToothGrowth,aes(x=supp,y=len)) + geom_boxplot()

ggplot(ToothGrowth,aes(x=supp,y=len)) + 
  geom_boxplot() + 
  geom_point()

mygraph <- ggplot(ToothGrowth,aes(x=supp,y=len))
mygraph + geom_boxplot()

mygraph + geom_point()
mygraph + geom_boxplot() + geom_point()

mygraph +
  geom_boxplot() +
  geom_point() +
  coord_flip()

mygraph +
  geom_boxplot(fill="green") +
  geom_point(color="blue") +
  coord_flip()

#Diamonds in breakout rooms - see Google slides
ggplot(diamonds,aes(x=price,y=cut)) +
  geom_boxplot()


#mtcars boxplot example:
ggplot(mtcars,aes(x=mpg,y=cyl)) + 
  geom_boxplot()


ggplot(mtcars,aes(x=mpg,group=cyl)) + 
  geom_boxplot()

#Histograms

ggplot(diamonds,aes(x=price)) + 
  geom_histogram()

ggplot(diamonds,aes(x=price)) + 
  geom_histogram(bins=20)

ggplot(diamonds,aes(x=price)) + 
  geom_histogram(bins=20,
                 color="white")


ggplot(diamonds,aes(x=price)) + 
  geom_histogram(bins=20,
                 color="red")

#We can make it look pretty too!
ggplot(diamonds,aes(x=price)) + 
  geom_histogram(bins=20,
                 color="red",
                 fill="purple")

##############
# 2021-03-01 #
##############

# See my "just for fun" code!

library(ggplot2)
ggplot(diamonds,aes(x=cut)) +
  geom_bar()

ggplot(diamonds,aes(x=cut)) +
  geom_bar(fill="purple") #turn bars purple

ggplot(diamonds,aes(x=cut,fill=color)) +
  geom_bar()

Majors <- c("A&S", "Bus", "Comm", "Edu", "Other")
Count <- c(2894, 2046, 1374, 257, 591)
Elon <- data.frame(Majors, Count)

ggplot(Elon, aes(x = Majors, y = Count)) +
  geom_col()

ggplot(Elon, aes(x = Majors, y = Count, fill=Majors)) +
  geom_col()

ggplot(Elon, aes(x = Majors, y = Count)) +
  geom_col(aes(fill=Majors))
