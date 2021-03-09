###############################
#Practice Problems 1 Solutions#
###############################

#1
example(mean)
#a. x contains the number 0 through 10 and 50
#b. xm contains the mean of the numbers 0 through 10 and 50
#c. xm contains the value of 8.75 (as printed by R)

#2
#The trim function removes a portion of observations from each end of
#the data before calculating the mean. The median is the most extreme
#version of trimming!
help(mean)
?mean

#3
x <- 1:5
#The object x appears in the Environment tab as int [1:5] 1 2 3 4 5
rm(x)
#The object x is removed from the Environment tab
#We can't actually get the object x back, but we can re-run the code to
#re-create it by either re-typing it in the Console at the command prompt
#OR by putting the cursor on the Line 19 above and pressing run OR
#by placing the cursor at the command prompt in the Console and pressing
#the up arrow key until the line of code is recovered and pressing enter.

#4
data()
#There are some cool data sets in R!

data(ChickWeight) # part a
ChickWeight #part b
View(ChickWeight) # part c
?ChickWeight # part e

#a Add ChickWeight to the Environment (see the Environment tab)
#b Prints off the first 250 rows of the ChickWeight data set in the Console tab
#  This data set contains four variables: weight, Time, Chick, and Diet.
#c Opens a new tab by the R script showing the data in a spreadsheet
#d Runs the View(ChickWeight) command in the Console and opens the new tab showing
#  the data in a spreadsheet.
#e Opens the help file related to the data set

#f
require(graphics)
coplot(weight ~ Time | Chick, data = ChickWeight,
       type = "b", show.given = FALSE)
#This code creates a graph of the ChickWeight data in the Plots tab
#in the lower right panel.

########################
#5. The Yahtzee Problem#
########################

#a
set.seed(2320)

#b
dice <- 1:6

#c
?sample
myroll <- sample(dice,5,replace=TRUE)
myroll
# See below for answers to sub-questions.

#d
?unique
myroll2 <- unique(myroll)

#e
length(myroll2)
#There are often many solutions here. If you did this differently, share in the Forum!

#f
set.seed(27244)
dice <- 1:6
myroll <- sample(dice,5,replace=TRUE)
myroll
myroll2 <- unique(myroll)
length(myroll2)
# The set.seed function is setting a starting value for the random number
# generation mechanism in R. If we all have the same seed (2320) then our
# random number generators all start at the same "random" place. Technically,
# we are producing "psuedo-random" numbers. It is important to be able to
# reproduce research, so setting a seed is a good technique for allowing
# others a chance to replicate our results.


## Response to syntax issues:
# sample(5,dice,replace=TRUE) has the argument in the wrong order
# This would be okay if we re-wrote it as: sample(size=5,x=dice,replace=TRUE)

# sample(dice,5,replace=FALSE) will never allow for two different dice
# to have the same value. replace=FALSE allows each of the dice to be
# rolled any of the six possible values.

# SAMPLE(dice,5,TRUE) is a syntax error because R is case sensitive, so
# the function has to be spelled in all lower-case as sample.
