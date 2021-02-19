#Lesson 3 - Subsetting/Sorting/Organizing Data
View(ChickWeight)
?ChickWeight
str(ChickWeight)
names(ChickWeight)

chick1 <- ChickWeight[1:12,]


chick2 <- ChickWeight[ChickWeight$Chick==2,]

#OR

library(dplyr)
chick3 <- filter(ChickWeight,Chick==3)

#Examples of logical comparisons
chickdata <- filter(ChickWeight,Chick <= 4)
chickdata2 <- ChickWeight[ChickWeight$Chick <= 4,]

chickdata3 <- filter(ChickWeight,Time <= 2, Diet %in% 1:2)
chickdata4 <- ChickWeight[ChickWeight$Time <= 2 & ChickWeight$Diet %in% 1:2,]

#Examples of helpful functions in dplyr
#filter
filter(ChickWeight,Chick!=1)

#group_by
chickdata5 <- group_by(ChickWeight,Diet)
summarize(chickdata5,mymeans=mean(weight))
str(chickdata5)
str(ChickWeight)
chickdata5 <- ungroup(chickdata5)

#arrange
chickdata6 <- arrange(chickdata5,Time)
View(chickdata6)

chickdata7 <- arrange(chickdata5,desc(Time))

chickdata8 <- arrange(chickdata5,desc(Time),weight)

#rename
chickdata9 <- rename(ChickWeight,chickies=Chick,timepoint=Time,mass=weight,feed=Diet)




















#Example solution
library(dplyr)
myChicks <- filter(ChickWeight,Time==0,Diet==1)
View(myChicks)
myChicks <- arrange(myChicks,desc(weight))
myChicks <- rename(myChicks,time=Time,chick=Chick,diet=Diet)
myChicks[max(length(myChicks[1])),1]

#Using piping! (%>%)
myChicks2 <- ChickWeight %>% filter(Time==0,Diet==1) %>% arrange(desc(weight)) %>% rename(time=Time,chick=Chick,diet=Diet)



#Lesson 3 - Activity 3

#Chunk 1
library(dplyr)
data(mtcars)
mtcars2 <- mtcars
?mtcars

#Chunk 2
summary(mtcars2) #base
summarize(mtcars2) #dplyr
summarise(mtcars2) #dplyr

#Chunk 3
summary(mtcars$mpg) #base
summarize(mtcars2,mymean=mean(mpg)) #dplyr

#Chunk 4
summarize(mtcars2,mysd=sd(mpg))

#Chunk 5
summarize(mtcars2,
          mymin=min(mpg),
          myq1=quantile(mpg,.25),
          mymed=median(mpg),
          mymean=mean(mpg),
          myq3=quantile(mpg,.75),
          mymax=max(mpg))

#Chunk 6
auto <- filter(mtcars2,am==0)
manual <- filter(mtcars2,am==1)
View(auto)
View(manual)

#Chunk 7
summarize(mtcars2,n())
summarize(auto,n())
summarize(manual,n())

#Chunk 8
example <- filter(mtcars2,hp < 150)
arrange(example,hp)
View(example)


#Chunk 9
example <- arrange(example,hp)
example[1,]      # HERE
example <- arrange(example,desc(hp))
example[1,]      # HERE

summary(example$hp) #To verify!

#Chunk 10
example2 <- filter(mtcars,gear < 4 & carb==1)
example2 <- filter(mtcars,gear < 4, carb==1)

#Chunk 11
example3 <- filter(mtcars,gear < 4 | carb==1)

#Chunk 12
#Write code to determine how many 
#observations are in example2 and example3
summarize(example2,n())
length(example3[,1])
dim(example3)

#Chunk 13
chunk13 <- filter(mtcars,cyl %in% c(4,8))

#Chunk 14
#Make another copy of mtcars!
mtcars3 <- mtcars
group_by(mtcars3,gear) #A
View(mtcars3) #B
summarize(mtcars3,mean1=mean(mpg)) #C


#Chunk 15
mymtcars <- group_by(mtcars3,gear) 
View(mymtcars)
summarize(mymtcars,mean1=mean(mpg)) 

#Chunk 16
summarize(mymtcars,mysd=sd(hp))

#Chunk 17
ungroup(mymtcars)
summarize(mymtcars,mean=mean(hp))


#Chunk 18
mymtcars <- ungroup(mymtcars)
summarize(mymtcars,mean=mean(hp))

#Chunk 19
mtcars2$mpquart <- mtcars2$mpg/4 #base
mtcars2 <- mutate(mtcars2,mpquart2 = mpg/4) #dplyr
View(mtcars2)

