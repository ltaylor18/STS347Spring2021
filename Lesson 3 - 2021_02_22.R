#Lesson 3 - 2021-02_22

#Read in bridges data:

library(readxl)
bridges <- read_excel("~/STS 347/0_Spring 2021/Notes/Data for Notes/Lesson 3 - StatewideBridges.xls")
View(bridges)

Alamance <- bridges[bridges$COUNTY=="ALAMANCE",]
head(Alamance)
table(Alamance$COUNTY)
unique(Alamance$COUNTY)
#Duplicated with dplyr

library(dplyr)
Alamance2 <- filter(bridges,COUNTY=="ALAMANCE")


mycounties <- c("ALAMANCE","GUILFORD")
AG <- filter(bridges,COUNTY %in% mycounties)

#Example 1

AG <- mutate(AG,age1=2021-YEARBUILT)
AG$age2 <- 2021-AG$YEARBUILT

AG$bridgeAge = 2021 - AG$YEARBUILT

#Example 2
AG <- arrange(AG,desc(age1))
#Some ways to see our answer:
View(AG)
AG[1,]$COUNTY #What is the issue with this?
AG[1,]$age1 #What is the issue with this?
AG[AG$age1==max(AG$age1),]$COUNTY
AG[AG$age1==max(AG$age1),]$age1
filter(AG,age1==max(age1))

#Getting summary statistics by groups:
diet1 <- filter(ChickWeight,Diet==1)
diet2 <- filter(ChickWeight,Diet==2)
diet3 <- filter(ChickWeight,Diet==3)
diet4 <- filter(ChickWeight,Diet==4)
mean(diet1$weight)
mean(diet2$weight)
mean(diet3$weight)
mean(diet4$weight)

summarize(group_by(ChickWeight,Diet),mean(weight))
#Ok, so maybe dplyr is superior to base R...

#Example
summarize(group_by(AG,COUNTY),mean(age1))
mean(filter(AG,COUNTY=="ALAMANCE")$age1)
mean(filter(AG,COUNTY=="GUILFORD")$age1)


mean(AG$age1) #Doesn't produce the mean by groups.
