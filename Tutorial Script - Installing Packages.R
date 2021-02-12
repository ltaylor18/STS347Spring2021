#In this video, I am going to tell you about packages and
#libraries in R and how to install them.

#Let's consider Gossett's sleep data from Notes 2.
View(sleep)

#Notice that the sleep data set lists patients
#1-10 and their measurements for group 1 and 
#then lists patients 1-10 and their measurements
#for group 2.

#A great function for ordering the data by one
#of the variables is arrange.
#However, the arrange function isn't part of the
#base installation of R on your computer.

#The code we would like to run is:
mysleepdata <- arrange(sleep,ID)
mysleepdata

?arrange
?seq

#In order to use the arrange function, we need
#to install the library or package that contains
#this function (and many others).
#If you are into board games, you can think of
#libraries or packages as "expansion packs" for R

#Click on Tools
#Select: Install Packages
#Type the package name (dplyr)
#Click Install

#The dplyr package is now downloaded to your computer,
#but we have to tell R/RStudio to use it by running
#the following line of code:

library(dplyr)

#Now we are ready to run our code!
mysleepdata <- arrange(sleep,ID)
mysleepdata

#In Notes 3, we will learn how to use some dplyr
#tools for data management.
#The dplyr package is one of the recent updates to the
#R language in the past few years. It's pretty awesome!

#Lastly, let me show you how you can easily get help 
#using dplyr:

#Click on the Help menu
#Select: Cheatsheets
#Select: Data Transformation with dplyr

#Alternatively, Google "dplyr cheatsheet"

