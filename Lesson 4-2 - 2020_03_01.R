##############
# Lesson 4-2 #
##############
# 2021-03-01 #
##############

?Orange
View(Orange)
head(Orange)

library(ggplot2)
p <- ggplot(Orange,aes(x=age,y=circumference,color=Tree))
p + geom_point() + 
  labs(title="Scatterplot of Circumference by Age",
       subtitle="By L. Taylor",
       x="Age (Days since 12/31/1968)",
       y="Circumference (mm)",
       color="Tree ID", #What did this change?
       caption="STS 347, Notes 4-2") +
  scale_color_brewer(palette="Dark2")


library(RColorBrewer)
display.brewer.all(colorblindFriendly = T)

p + geom_point() + 
  labs(title="Scatterplot of Circumference by Age",
       subtitle="By L. Taylor",
       x="Age (Days since 12/31/1968)",
       y="Circumference (mm)",
       color="Tree ID", #What did this change?
       caption="STS 347, Notes 4-2") +
  scale_color_brewer(palette="BuPu")

p + geom_point() + 
  labs(title="Scatterplot of Circumference by Age",
       subtitle="By L. Taylor",
       x="Age (Days since 12/31/1968)",
       y="Circumference (mm)",
       color="Tree ID", #What did this change?
       caption="STS 347, Notes 4-2") +
scale_color_viridis_d(option = "E")


#Example 1
ggplot(Orange,aes(x=age,
                  y=circumference,
                  color=Tree)) +
  geom_point() +
  geom_line() +
  scale_color_brewer(palette="Dark2") +
  labs(title="Example 1")

#Example 2
ggplot(Orange,aes(x=age,
                  y=circumference)) +
  geom_point(aes(color=Tree)) +
  geom_line() +
  scale_color_brewer(palette="Dark2") +
  labs(title="Example 2")

#Example 3
ggplot(Orange,aes(x=age,
                  y=circumference)) +
  geom_point() +
  geom_line(aes(color=Tree)) +
  scale_color_brewer(palette="Dark2") +
  labs(title="Example 3")

#Changing more aesthetics example:
#Example
ggplot(Orange,aes(x=age,y=circumference))+
  geom_point(color="gold",
             size=5,
             alpha=0.5,
             shape=23,
             fill="firebrick3")+
  geom_line(linetype=3)

##############
# 2021-03-03 #
##############

library(ggplot2)
library(dplyr)

View(storms)

fiona <- filter(storms,name=="Fiona",status=="tropical storm")
fiona <- mutate(fiona,stormlength=6*(1:length(fiona$name)))
ggplot(fiona,aes(x=stormlength,
                 y=wind,
                 size=ts_diameter,
                 color=factor(ts_diameter))) + 
  geom_point() +
  labs(x="Storm Duration",
       y="Wind speed",
       size="Tropical \n Storm \n Diameter") +
  scale_color_brewer(palette="Dark2") +
  guides(color=FALSE)

# Note: Last class I mentioned that the biggest 
# challenge I have with ggplot is the legends.
# Here's the link where I found how to turn off the
# color legend: 
# https://intellipaat.com/community/4093/turning-off-some-legends-in-a-ggplot

#Chunk 1
#A
ToothGrowth2 <- ToothGrowth
#B
ToothGrowth2$dose2 <- factor(ToothGrowth$dose)
#C
str(ToothGrowth2)

#Chunk 2
t <- ggplot(ToothGrowth2,aes(x=supp,y=len))

#Chunk 3
t + geom_boxplot()

#Chunk 4
t + geom_boxplot(fill="blue")

#Chunk 5
t + geom_boxplot(aes(color=supp))
t + geom_boxplot(color=c("red","blue"))

#Chunk 6
t + geom_boxplot(color="turquoise")

#Chunk 7
t + geom_boxplot(aes(color=supp),show.legend=FALSE)

#Chunk 8
t + geom_boxplot(aes(color=dose2))

#Chunk 9
t + geom_boxplot() + facet_wrap(~dose2)

#Chunk 10
t3 <- ggplot(ToothGrowth2,aes(x=dose2,y=len,fill=supp))
t3 + geom_boxplot()

#Chunk 11
t1 <- ggplot(ToothGrowth2,aes(x=dose,y=len))
t1 + geom_boxplot()

t2 <- ggplot(ToothGrowth2,aes(x=dose2,y=len))
t2 + geom_boxplot()

#Chunk 12
p <- ggplot(mpg, aes(class, hwy))

#Chunk 13
p + geom_boxplot()

#Chunk 14
p + geom_boxplot() + geom_jitter(width = 0.2)

#Chunk 15
p + geom_boxplot() + coord_flip()
ggplot(mpg,aes(hwy,class)) + geom_boxplot()

#Chunk 16
p + geom_boxplot(notch = TRUE)
p + geom_boxplot(varwidth = TRUE)
p + geom_boxplot(fill = "white", colour = "#3366FF")

#Chunk 17
p + geom_boxplot(outlier.colour = "red", outlier.shape = 1)





#Texas Housing One Possible Solution
fig <- ggplot(txhousing,aes(x=factor(year),
                            y=sales,
                            fill=factor(year)))
fig + 
  geom_boxplot(show.legend=FALSE, 
               outlier.color="red", 
               outlier.alpha=0.2) +
  labs(x="Year",
       y="Number of Sales",
       title="Texas Housing Sales",
       subtitle="2000-2015",
       caption="Source: R data.") +
  coord_flip()


##############
# 2021-03-05 #
##############

