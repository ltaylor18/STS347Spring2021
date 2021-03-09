###############################
#Practice Problems 2 Solutions#
###############################

####
#1 #
####

pi < 3.14
#This line of code does not produce output.
#It only assigns the value of 3.14 to the object pi (a numeric scalar!)
pi #This will print out output in the console

####
#2 #
####
p <- c(10,20,30,40)

####
#3 #
####
p2 <- p-1

####
#4 #
####
p3 <- 4.89*p

####
#5 #
####
p[-1] #deletes the first element of p
p[5] #this would print the 5th element of p if there was one. since there isn't, it prints NA (missing value)
p[c(1,2)] #prints the 1st and 2nd elements of p

####
#6 #
####
y <- 5+7 #assigns the value of 5+7 to the object y
5+7 #immediately evalutes sum of 5+7

####
#7 #
####
c(1,2,3,4,5)
seq(1,5)
1:5

####
#8 #
####
c(1,2,3,4) + c(0,10)
#R recycles the shorter vector! So the results are 1+0, 2+10, 3+0, 4+10

####
#9 #
####
happy <- 4 #R assigns the value of 4 to happy. happy appears in our enivonrment!

####
#10#
####
num_vect <- c(0.5, 55, -10, 6)
tf <- num_vect < 1
tf # tf is a logical vector contain TRUE if the value is less than 1 and FALSE if greater than or equal to 1

####
#11#
####
num_vect < 1
#The TRUE/FALSE results are immediately printed.

####
#12#
####
myvector <- 1:100
myvector[myvector <= 5 & myvector >= 95] #There are no values in myvector that are simultaneously <= 5 and >= 95!
myvector[myvector <= 5 | myvector >= 95] #Prints all of the values in myvector that are either <= 5 or >= 95!
myvector[myvector <= 5 & myvector <= 95] #Prints all of the values in myvector that are simultaneously <= 5 and <= 95, which would only be numbers <= 5!
myvector[myvector <= 5 | myvector <= 95] #Prints all of the values in myvector that are either <= 5 or <= 95, which would be all numbers <= 95!

# & is AND, | is OR

####
#13#
####
c("Hello","World!")

####
#14#
####
paste(1:3,c(4,5,6,7),sep= " ")
#I thought this was kind of surprising! :)

####
#15#
####
c(1:3, c(4,5,6,7))
#Concatenates together both vectors into one vector

####
#16#
####
x <- c(1, NA, 5, NA) 
x*3
#Missing values (NA) produce missing values (NA) in calculations.

####
#17#
####
sqrt(-1) #NaN
sqrt(100) 
sqrt(-25) #NaN
log(-10) #NaN
log(NA) 
1/0

####
#18#
####
set.seed(2320)
dice <- 1:5
myrolls <- sample(dice,2000,replace=TRUE)
craps <- matrix(myrolls,nrow=1000)
head(craps) #This is just a GREAT function to preview the first six rows!
dim(craps)
?apply 
#The first argument of apply is the object you want to apply a function to.
#The second argument of apply is whether you want to apply a function to the rows (1) or columns (2)
#The third argument of apply is what function you want applied to the rows/columns
mysum <- apply(craps,1,sum) #apply the sum function to each row of the craps matrix
#mysum is a numeric vector that will contain the sum of each roll of two dice (represented by the rows of the craps matrix)
sevens <- (mysum == 7)
sum(sevens) #since TRUE=1 and FALSE=0, we can just sum the sevens vector to count how many sevens there were
sum(sevens)/1000
#Since you used the same seed as me (2320), we should all get the same estimate 165/1000=0.165

####
#19#
####

#First, download the data file from Moodle to your computer
#Click on Environment tab (it may be your default tab in top, right pane)
#Click on Import Dataset
#Select From text (readr)
#Browse to the appropriate file location on your computer and select it
#Change the option Name to IMDB (or manually change it in the code after you copy/paste)
#Copy and paste the code into your R script and run it.

library(readr)
IMDB <- read_csv("~/STS 347/0_Spring 2021/Notes/Data for Notes/IMDB_Movie_Database.csv")
View(IMDB)

#Get the names of the variables
names(IMDB)
#Some methods for finding out how many movies are in the database 
dim(IMDB)
length(IMDB$title)
summary(IMDB)

#Length of longest movie
max(IMDB$length)
summary(IMDB$length)

#This solution is dependent on me knowing the maximum length
IMDB$title[IMDB$length==1100]
#A better solution would have R determine the longest length
IMDB$title[IMDB$length==max(IMDB$length)]
