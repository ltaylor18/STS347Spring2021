######################
# PRACTICE PROBLEMS 3#
######################

##############
## Number 1 ##
##############

#part a
library(readxl)
bison <- read_excel("~/STS 347/0_Spring 2021/Notes/Data for Notes/Lesson 3 - bison.xlsx")
View(bison)
#Note - The only option I changed in the Import Tool was the name of the imported data file!

#part b
#Look at the data pop-up
#The default name is really long: "Northern herd spring calf ratio"

#part c
#type bison$ at command prompt (>) in console
#The variable appears in tick marks because there are spaces in the name:
bison$`Northern herd spring calf ratio`

#part d
names(bison)

#part e
names(bison) <- c("year","nhscr","chscr","pdsi","sweaccNH","sweaccCH","bisonNH","bisonCH","elk")
head(bison) #to verify

#part f
library(dplyr)
bison <- rename(bison,yr=year,NHbison=bisonNH,CHbison=bisonCH)
head(bison) #to verify

#part g.i
summary(bison) #mean=12822

#part g.ii
#15 missing values

#part g.iii
mean(bison$elk) #mean=NA

#part g.iv
#It appears that the presence of missing values causes the mean function
#not to perform the calculation.

#part g.v
?mean
mean(bison$elk,na.rm=TRUE) #mean = 12821.71

#part g.vi
summarize(bison,elkmean=mean(elk,na.rm=TRUE)) #12822

#part g.vii
length(bison$elk) #length is 36

#part g.viii
#No there are 36 rows in the data, but many missing values for the elk

#part g.ix
length(bison$elk,na.rm=TRUE)
#This option does not work for the length function! Boo!
?length #And there doesn't appear to be a similar argument for length()

#part g.x
sum(!is.na(bison$elk)) #There are 21 non-missing values (and 15 missing values)
summary(bison$elk) #To verify!

#part g.xi
cor(bison$NHbison,bison$elk,use="pairwise.complete.obs")
#strong, positive relationship (as bison herd size increase, the elk herd size also increases)

#part g.xii
plot(bison$NHbison,bison$elk)
library(ggplot2)
ggplot(bison,aes(x=NHbison,y=elk)) + geom_point()

#part g.xiii
bison <- mutate(bison,ratio=elk/NHbison)
View(bison) #To verify!

bison$ratio2 <- bison$elk/bison$NHbison
View(bison) #To verify!

##############
## Number 2 ##
##############

#part a
library(palmerpenguins)
penguins2 <- penguins

#part b
View(penguins2)
str(penguins2)
head(penguins2)
summary(penguins2)

#part c
table(penguins2$species,penguins2$island)

#part d
count(penguins2, species)
count(penguins2,species,island)


#part e
gentoo <- penguins2[penguins2$species=="Gentoo",]


#part f
library(dplyr)
adelie <- filter(penguins2,species=="Adelie")

#part g
names(penguins2)

#part h
#Answers will vary. Here are some possible solutions:
mypenguinsubset1 <- select(penguins2,starts_with("bill"))
mypenguinsubset2 <- select(penguins2,one_of("bill_length_mm","bill_depth_mm"))
mypenguinsubset3 <- select(penguins2,bill_length_mm:bill_depth_mm)
mypenguinsubset4 <- select(penguins2,contains("bill"))

#part i
penguinsNoMissing <- filter(mypenguinsubset1,!is.na(bill_length_mm),!is.na(bill_depth_mm))
summary(penguinsNoMissing) #Will report number of NA's if any
#compare to this:
summary(mypenguinsubset1) #There were two NA values for each variable.

#part j
library(ggplot2)
myscatter <- ggplot(penguins2,aes(x=bill_length_mm,y=bill_depth_mm,col=species))
myscatter + geom_point()

#part k
myhist <- ggplot(penguins2,aes(x=body_mass_g,fill=island))
myhist + geom_histogram(color="white")

#part l
set.seed(6493) #switching it up to my office extension! :)
mysample <- sample_n(penguins2,50,replace=FALSE)
mybox <- ggplot(mysample,aes(x=bill_length_mm,y=species))
mybox + geom_boxplot() + coord_flip()

#Alternatively, in one line of code:
ggplot(mysample,aes(x=bill_length_mm,y=species)) + geom_boxplot() + coord_flip()

