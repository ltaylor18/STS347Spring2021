#Lesson 4-1 2021-02-22

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
