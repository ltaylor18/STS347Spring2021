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
ggplot(NULL,aes(x=myvalues,
                y=myvalues,
                shape=myvalues)) +
  geom_point(size=5) +
  scale_shape_identity()

mystarwars <- mutate(starwars,
                     myspeciescolor=if_else(species=="Human",
                                            "blue",
                                            "green"))  #or use base R's ifelse!
ggplot(mystarwars,aes(x=height,
                      y=mass,
                      color=myspeciescolor)) +
  geom_point() +
  scale_color_identity()
