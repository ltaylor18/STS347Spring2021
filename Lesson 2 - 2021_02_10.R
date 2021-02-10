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


m <- matrix(nrow = 2, ncol = 3)   # empty matrix
m

y <- matrix(1:12, nrow=3, ncol=4)	# a 3 by 4 matrix
y

# create a 2 x 2 matrix with labels – then fill in matrix 
cells <- c(1,26,24,68) 
rnames <- c("R1", "R2") 
cnames <- c("C1", "C2") 
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE, 
                     dimnames=list(rnames, cnames)) 
mymatrix 

#Example #2 For you to try
mymatrix <- matrix(cells, nrow=2, 
                   ncol=2, byrow=FALSE)

dim(mymatrix) 

y <- matrix(1:10, ncol=2)
y

w <- matrix(1:10, nrow=2)
w

w[2,4]

y[,2]

y[2,]

w[1,c(4,5)]

z <- matrix(rep(10, 9), 3, 3)
z

#Data Frames
mydata <- data.frame(exam = 1:4, grade = c(85, 90, 89, 97))
is.data.frame(mydata)
mydata
nrow(mydata)
ncol(mydata)

# ANY IDEAS ON WHAT WILL HAPPEN IF YOU RUN THE CODE BELOW?
mynewdata <- data.frame(exam = 1:3, grade = c(85, 90, 89, 97))


#Example #3 For you to try
data(sleep)

View(sleep)

#write code to access the help files 
#for sleep.

summary(sleep)
extra
sleep$extra
#write code to print the ID variable.

attach(sleep)
extra
sleep$extra[sleep$ID == 1]

#Write code to print all the values of 
#extra from treatment group 1 only.



#Write code to summary the variable extra 
#for treatment group 1 only.



extra1 <- sleep$extra[sleep$group == 1]
extra2 <- sleep$extra[sleep$group == 2]
diff <- extra2-extra1

t.test(diff)
#Run the code from the second example in
#the sleep help file after “prolongations”
sleep[[1]]
sleep[1]
is.vector(sleep[[1]])
is.vector(sleep[1])
str(sleep[1])
is.data.frame(sleep[1])
sleep[1,1]
sleep[1,2]
sleep[1,3]
sleep[2,3]

a <- 3
b <- c("red","white","blue")
c <- matrix(1:12,nrow=3)
mylist <- list(a,b,c,sleep)
mylist

mylist[[1]]
mylist[[2]]
mylist[[2]][1]
mylist[[4]]$extra
mylist[[3]][2,3]

#What will happen here?
myvec <- c(5, "Laura", 7.9)