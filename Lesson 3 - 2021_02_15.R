##############
## Lesson 3 ##
##2/15/2021 ##
##############

library(readr)
twilight <- read_delim("~/STS 347/0_Spring 2021/Notes/Data for Notes/Lesson 3 - Age Data.txt", 
                       "\t", escape_double = FALSE, comment = "!", 
                       trim_ws = TRUE)
View(twilight)
#Note that RStudio picked out the read_delim function and added some options like comment= "!" to read it in!

#Investigate the new data set!
View(twilight)
is.data.frame(twilight)
str(twilight)
summary(twilight)
names(twilight)
is.tibble(twilight) #requires tibble library. Download it and then use library(tibble) to load it
is_tibble(twilight)



#This data file has commas as a delimeter (known as CSV = comma separated values).
library(readr)
Lesson_3_Temperature_Anomalies <- read_csv("~/STS 347/0_Spring 2021/Notes/Data for Notes/Lesson 3 - Temperature Anomalies.txt")
View(Lesson_3_Temperature_Anomalies)
#RStudio picks the read_csv function to read this file in.

#We can start at 1860, but the names get messed up.

library(readr)
Lesson_3_Temperature_Anomalies <- read_csv("~/STS 347/0_Spring 2021/Notes/Data for Notes/Lesson 3 - Temperature Anomalies.txt", skip = 10)
View(Lesson_3_Temperature_Anomalies)

##############
##2/17/2021 ##
##############

library(readxl)
bison <- read_excel("~/STS 347/0_Spring 2021/Notes/Data for Notes/Lesson 3 - bison.xlsx")
View(bison)

is.data.frame(bison)
library(tibble)
is.tibble(bison)
is_tibble(bison)
str(bison)

names(bison)

bison$`Northern herd spring calf ratio`

#Lesson 3 - Activity 1
#1
library(readxl)
bridges <- read_excel("~/STS 347/0_Spring 2021/Notes/Data for Notes/Lesson 3 - StatewideBridges.xls")
View(bridges)

#2
summary(bridges)

#3
hist(bridges$YEARBUILT)

#4
Alamance <- bridges[bridges$COUNTY=="ALAMANCE",]
#4a
length(Alamance$COUNTY)
#4b
min(Alamance$YEARBUILT)
#4c
max(Alamance$YEARBUILT)
#4d
table(Alamance$STRUCTURALLYDEFICIENT)


summary(Alamance$YEARBUILT)
?quantile

#There are multiple ways to do many tasks!
x <- seq(1,10)
median(x)
quantile(x,0.5)
mean(x,trim=0.5)

x <- 1:10
out <- summary(x)
out[2]
quantile(x,.25)

