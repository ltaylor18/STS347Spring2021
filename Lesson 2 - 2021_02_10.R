#Lesson 2 - 2/10/2021

?rnorm
help(rnorm)

?rt

statement <- "Hello World"
height <- 72
mylogic <- TRUE
mylogic2 <- "TRUE"

length(statement)
length(height)
length(mylogic)
length(mylogic2)

is.character(statement)
is.character(height)
is.character(mylogic)
is.character(mylogic2)

is.logical(mylogic)
is.logical(mylogic2)

#what type of object is height
#star typing is.n...
is.numeric(height)


mylogic3 <- true

mylogic4 <- T
is.logical(mylogic4)

is.vector(statement)


# Example #1
a <- c(11, 13, 15, 1, 9, 7, 7, 10)
b <- seq(5,10,1)

a[3]
a[1] <- 8
a
#Print the second element of b
b[2]
a[3:6]
subset <- a[3:6]
subset
a[c(1,5,7)]
c(3:10)
3:10
seq(3,10)
seq(3,10,2)
a[-3]
x <- rep(4,10)
x
is.numeric(x)
is.character(x)
is.logical(x)
is.vector(x)


#Matrices

vec1 <- 1:4
vec2 <- 5:8

rbind(vec1,vec2) #binds the vectors together as rows
mymatrix <- rbind(vec1,vec2)
mymatrix
dim(mymatrix)


2*mymatrix

cbind(vec1,vec2) #binds the vectors together as columns vec1 vec2
