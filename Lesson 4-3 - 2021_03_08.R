## Lesson 4-3 ##

##########
# 3/8/21 #
##########

library(ggplot2)
xvals <- c(1:10,100)
yvals <- c(seq(2,20,2),0)
mycolors <- c(rep("orange",10),"green")

mydata <- data.frame(xvals=xvals,yvals=yvals,mycolors=mycolors)
g <- ggplot(mydata,aes(x=xvals,y=yvals)) + 
  geom_point(size=3,aes(color=mycolors)) + 
  geom_smooth(method="lm",se=FALSE)
g

g + xlim(1,10) 
g + xlim(5,100)

g + ylim(1,10)
g + ylim(0,5)

g + coord_cartesian(xlim=c(1,10),ylim=c(1,20))
g + coord_cartesian(xlim=c(90,110),ylim=c(-10,10))

library(plotly)
ggplotly(g)

g + scale_color_identity()

myvalues <- 1:20
library(ggplot2)
ggplot(NULL,aes(x=myvalues,
                y=myvalues,
                shape=myvalues)) +
  geom_point(size=5) +
  scale_shape_identity()


###########
# 3/12/21 #
###########

library(dplyr)
mystarwars <- mutate(starwars,
                     myspeciescolor=if_else(species=="Human",
                                            "blue",
                                            "green"))  #or use base R's ifelse!
ggplot(mystarwars,aes(x=height,
                      y=mass,
                      color=myspeciescolor)) +
  geom_point() +
  scale_color_identity()



p <- ggplot(Orange,aes(x=age,y=circumference))
p + geom_point()

p + geom_point(aes(color=Tree))

# Using scale_color_manual

p + geom_point(aes(color=Tree)) + 
  scale_color_manual(values=c("red","blue","green","yellow","purple"),
                     breaks=c(1,2,3,4,5),
                     name="My Trees")

# No names option
p + geom_point(aes(color=Tree)) + 
  scale_color_manual(values=c("red","blue","green","yellow","purple"),
                     breaks=c(1,2,3,4,5))

# No breaks option
p + geom_point(aes(color=Tree)) + 
  scale_color_manual(values=c("red","blue","green","yellow","purple"),
                     name="My Trees")

# No values option
p + geom_point(aes(color=Tree)) + 
  scale_color_manual(breaks=c(1,2,3,4,5),
                     name="My Trees")



##############
# facet_wrap #
##############

View(diamonds)
table(diamonds$color) #Or use dplyr's count()
table(diamonds$cut)
library(dplyr)
count(diamonds,color)


set.seed(2320)
diam <- ggplot(sample_n(diamonds,1000),
               aes(x=carat,y=price)) + 
  geom_point(alpha=0.75) +
  geom_smooth(se=FALSE)
diam

diam + facet_wrap(~cut)

diam + facet_wrap(color ~ cut)

diam + facet_wrap(cut ~ color, ncol=7)

?facet_wrap

##############
# facet_grid #
##############

diam + facet_grid(rows=vars(cut))

diam + facet_grid(cols=vars(color))

diam + facet_grid(cut ~ color)

diam + facet_grid(color ~ cut)


#############################
# facet_wrap vs. facet_grid #
#############################

g <- ggplot(mpg,aes(x=displ,y=hwy))
g + geom_point(alpha=0.3) + facet_grid(cyl~class)
g + geom_point(alpha=0.3) + facet_wrap(cyl~class) 


################
# grid.arrange #
################

library(gridExtra)
g1 <- ggplot(Orange,aes(x=factor(age),y=circumference)) + geom_boxplot()
g2 <- ggplot(Orange,aes(x=age,y=circumference)) + geom_point()
g3 <- ggplot(Orange,aes(x=circumference)) + geom_histogram(color="white")
g4 <- ggplot(Orange,aes(x=factor(Tree),y=circumference)) + geom_boxplot()

g1
g2

grid.arrange(g1, g2, g3, g4, ncol=2, nrow =2)

grid.arrange(g2, arrangeGrob(g3, g4, ncol=2), nrow = 2)

grid.arrange(g1, g2, g3, nrow = 3)

grid.arrange(g2, arrangeGrob(g3, g4, nrow=2), nrow = 1)

