#####################
#Practice Problems 4#
#####################

#######
## 1 ##
#######

#Set-up
beatles <- data.frame(name=c("John","George","Ringo","Paul"),
                      ageatfirstalbum=c(23,20,23,21),
                      drTfave=c("yes","no","no","yes"))

nkotb <- data.frame(name=c("Jon","Jordan","Joey","Donnie","Danny"),
                    yearofbirth=c(1968,1970,1972,1969,1969),
                    drTfave=c("NO","YES","YES","NO","NO"))

nkotbHeight <- data.frame(name=c("Jon","Jordan","Danny","Joey"),
                          height=c(71,71,68,70))

#part a
nkotb2 <- data.frame(name=nkotb$name,ageatfirstalbum=1986-nkotb$yearofbirth)

#part b
library(dplyr)
beatles <- mutate(beatles,band="The Beatles")
nkotb <- mutate(nkotb,band="New Kids on the Block")

#part c
updatenkotb <- full_join(nkotb,nkotb2,by="name")
updatenkotb <- select(updatenkotb,-yearofbirth)

#part d
bothbands <- union(beatles,updatenkotb)
bothbands2 <- bind_rows(beatles,updatenkotb)

#part e
count(bothbands,drTfave)
#This reports no and NO as different values and yes and YES as different values.

#part f
bothbands <- mutate(bothbands,drTfave=toupper(drTfave))

#part g.i
left_join(nkotb,nkotbHeight,by="name") #this is the first image shown in the assignment
left_join(nkotbHeight,nkotb,by="name") #this is the second image shown in the assignment
#A left_join will incorporate all of the observations from the data set
#listed on the left in the function arguments and then include additional 
#variables for those rows from the data set listed on the right.
#This is why in the first example all of the members of New Kids on the Block
#are included since they were all in the nkotb data set. The additional variable from
#nkotbHeight is included for each of these members.
#For the second example, only Jon, Jordan, Danny, and Joey are in the data set
#nkotbHeight which is listed on the left, so only additional variables from the data 
#set on the right (nkotb) are added into this data.
#In each of these examples, the variables are displayed in the order they
#appear in the data set on the left and then additional variables from the data
#on the right are included.


#part g.ii
right_join(nkotb,nkotbHeight,by="name") #this is the second image shown in the assignment
right_join(nkotbHeight,nkotb,by="name") #this is the first image shown in the assignment
#Change the words left/right in every instance of the previous answer
#to get the explanation for right_join!

#part g.iii
semi_join(nkotb,nkotbHeight,by="name") #this is the first image shown in the assignment
anti_join(nkotb,nkotbHeight,by="name") #this is the second image shown in the assignment
#A semi_join only includes rows that appear in both data sets. 
#In this case, only Jon, Jordan, Danny, and  Joey appear in both data sets.
#Further, only the variables from the first data set listed are included.
#An anti_joing only includes rows from the first data set that do not
#have a partner row in the second data set. Since Donnie was not in the
#nkotbHeight data set, he is the only member included in this join.
#Further, only the variables from the first data set listed are included.

#######
## 2 ##
#######
library(palmerpenguins)
library(ggplot2)
i <- ggplot(penguins,aes(x=bill_length_mm,y=bill_depth_mm,color=species,shape=18)) 
i + geom_point(size=3) + 
  geom_smooth(method="lm",se=FALSE) + scale_shape_identity() + 
  labs(x="Bill Length",
       y="Bill Depth",
       title="Bill Length vs. Bill Depth",
       subtitle="Palmer's Penguin Data")+
  scale_color_brewer(palette="Dark2")

#######
## 3 ##
#######

i <- ggplot(penguins,aes(x=bill_length_mm,y=bill_depth_mm,shape=18,color=species)) 
i + geom_point(size=2) + 
  geom_smooth(method="lm",se=FALSE) + 
  scale_shape_identity() + 
  labs(x="Bill Length",
       y="Bill Depth",
       title="Bill Length vs. Bill Depth",
       subtitle="Palmer's Penguin Data") +
  facet_wrap(~species) +
  scale_color_brewer(palette="Dark2")

#######
## 4 ##
#######

i <- ggplot(penguins,aes(x=bill_length_mm,y=bill_depth_mm,shape=17))
i + geom_point(aes(color=species),size=3) + 
  geom_smooth(method="lm",se=FALSE) + 
  scale_shape_identity() + 
  labs(x="Bill Length",
       y="Bill Depth",
       title="Bill Length vs. Bill Depth",
       subtitle="Palmer's Penguin Data") +
  scale_color_brewer(palette="Dark2")

#######
## 5 ##
#######

library(gridExtra)
v2 <- ggplot(mpg,aes(x=hwy,y=cty)) + 
  geom_point() + 
  facet_wrap(~year) + 
  labs(x="Highway MPG",
       y="City MPG",
       title="Miles Per Gallon based on Year")
v3 <- ggplot(mpg,aes(x=trans,y=cty)) + 
  geom_boxplot() + 
  labs(x="Transmission",
       y="City MPG",
       title="City MPG based on Transmission")
v4 <- ggplot(mpg,aes(x=cty)) + 
  geom_histogram(bins=30,color="white",fill="green") + 
  labs(x="City MPG",title="Distribution of City MPG")
v5 <- ggplot(mpg,aes(x=hwy)) + 
  geom_histogram(bins=30,color="white",fill="purple") + 
  labs(x="Highway MPG",
       title="Distribution of Highway MPG")
grid.arrange(v2,v3,arrangeGrob(v4,v5,nrow=1),nrow=3)
