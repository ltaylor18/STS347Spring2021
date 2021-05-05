#################################
# Practice Problems 7 Solutions #
#################################

#1a.
1-pnorm(1.96)
1-pnorm(1.96,0,1)
pnorm(1.96,lower.tail=FALSE)
pnorm(1.96,0,1,lower.tail=FALSE)
# The area under the Normal distribution is 1. Since the default
# shading is to the left, 1-pnorm(1.96) finds the area to the right
# of 1.96. This is similar to using the option of lower.tail=FALSE
# to tell R to find the right tail. Additionally, the default mean
# and standard deviation are 0 and 1, respectively, for the Normal
# distribution in R. This is the Standard Normal distribution!

#1b.i.
qnorm(0.025) #The 2.5th percentile is -1.96!
qnorm(0.975) #The 97.5th percentile is 1.96!
qnorm(0.5) #The 50th percentile is the mean --- 0!
qnorm(0.5,0,10) #The 50th percentile is the mean --- 0!
qnorm(0.5,100,15) #The 50th percentile is the mean --- 100!
# The q functions calculate quantiles (percentiles). So the
# argument provided is a probabity or area under the curve.
# The default shading is to the left!

#1b.ii.
# d stands for density. This function calculates the height
# of the probability density function.

#1b.iii.
rnorm(10) #Calculates 10 random values from Normal with mean=0,sd=1
rnorm(10,100,15) #Calculates 10 random values from Normal with mean=100,sd=15
# The r functions generate random values from that distribution.

#1c.
# The d function calculates values from the probability density function.
# To verify:
1/(sqrt(2*pi))*exp(-1.5^2/2)
dnorm(1.5)
# We get the same thing! :)

#1d.
?rnorm
# The default mean is 0 and the default standard deviation is 1.
# This is the Standard Normal distribution!

#2. 
set.seed(2320)
x <- rbeta(1000,3,44)
ggplot(NULL,aes(x=x)) + 
  geom_histogram(aes(y=..density..),
                 color="white")

min(x)
max(x)
myseq <- seq(min(x),max(x),.001)
myy <- dbeta(myseq,3,44)

ggplot(NULL,aes(x=x)) + 
  geom_histogram(aes(y=..density..),
                 color="white") +
  geom_line(aes(x=myseq,y=myy),color="red")

#2c.
set.seed(2320)
x <- rbeta(50000,3,44)
ggplot(NULL,aes(x=x)) + 
  geom_histogram(aes(y=..density..),
                 color="white")

min(x)
max(x)
myseq <- seq(min(x),max(x),.001)
myy <- dbeta(myseq,3,44)

ggplot(NULL,aes(x=x)) + 
  geom_histogram(aes(y=..density..),
                 color="white") +
  geom_line(aes(x=myseq,y=myy),color="red")

#2d.
?rbeta
#Population Mean
3/(3+44)
#Mean of my simulated data
mean(x)

#2e.
?rbeta
#Population variance
(3*44)/((3+44)^2*(3+44+1))
#Variance of my simulated data
var(x)

#3.
set.seed(2320)
mynorms <- rnorm(1000)

myseq <- seq(min(mynorms),max(mynorms),.01)
myy <- dnorm(myseq)

ggplot(NULL,aes(x=mynorms)) +
  geom_histogram(aes(y=..density..),
                 color="white") +
  geom_line(aes(x=myseq,y=myy),
            color="red",
            size=2)

#4
set.seed(2320)
myt <-rt(1000,19)

myseq <- seq(min(myt),max(myt),.01)
myy <- dt(myseq,19)
ggplot(NULL,aes(x=myt)) +
  geom_histogram(aes(y=..density..),
                 color="white") +
  geom_line(aes(x=myseq,y=myy),
            color="red",
            size=2)

#5
# The dbeta, dnorm, and dt functions are used because these functions
# calculate the probability density function at each of the x values
# supplied by the myseq vector. So we are calculating the height of
# the curve at each x-value and using geom_line to connect all those
# points to draw the smooth curve associated with the equation for 
# the probability density functions.


#6
# Updated code from notes.

# Proof of t-distribution

# 1. Since we can't generate an infinite number of random samples,
# Let's settle for generating 50,000 samples of size 10 from a 
# Normal Distribution matching the population our soda sample
# came from (I'll use the mean=12 and sd=0.1),

mysamples <- replicate(50000,rnorm(10,12,0.1)) ##UPDATE##

# Each column of mysamples represents one replication of my
# soda experiment of observing 10 cans.
dim(mysamples)

# 2. Calculate the t-test statistic for each column of my data.

# Find the mean and standard deviation of each sample of 15 observations
mymeans <- apply(mysamples,2,mean)
mysds <- apply(mysamples,2,sd)
# Calculate t for each sample of 15 observations
myteststats <- (mymeans - 12)/(mysds/sqrt(10)) ##UPDATE##

# 3. Observe the distribution of my calculated test statistics

library(ggplot2)
ggplot(NULL,aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white")

# 4. Super-impose the t-14 distribution on the histogram 
# of test statistics and generate a QQ-Plot to compare
# the test statistics to the Normal distribution.

myx <- seq(-4,4,.01)
myy <- dt(myx,9)  ##UPDATE##
ggplot(NULL, aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white") +
  geom_line(aes(x=myx,y=myy),color="red") +
  labs(title="50,000 t Test Statistics Compared to t-9 curve") ##UPDATE##

ggplot(NULL,aes(sample=myteststats)) +
  stat_qq() +
  geom_qq_line(distribution=stats::qnorm)

# 5. Until 1901, statisticians used the Normal Distribution
# to model the sampling distribution of this test statistic.
# How "bad" was that? Well, here' I've added the Normal
# Distribution's probability density function in blue. 
# What do you think?

myx <- seq(-4,4,.01)
myy <- dt(myx,9) ##UPDATE##
mynormy <- dnorm(myx)
ggplot(NULL, aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white") +
  geom_line(aes(x=myx,y=myy),color="red") + 
  geom_line(aes(x=myx,y=mynormy),color="blue",linetype=2)




##################################################
# PRACTICE PROBLEMS 7 - SHINY APP CODE SOLUTIONS #
##################################################
# Method 1         #
# Without Reactive #
####################
# 1. In order to run this code, it will need to be copy and pasted
# into a Shiny app file. 
# 2. Once you have pasted this code into a Shiny app, you can
# remove all of the comments (#) by highlighting the entire text,
# then pressing CTRL+SHIFT+C (or using the Comment/Uncomment Lines 
# menu option under the Code tab in the menu)

# library(shiny)
# 
# ui <- fluidPage(
#     
#     titlePanel("Practice Problems 7 - Central Limit Theorem and Empirical Rule"),
#     
#     sidebarLayout(
#         sidebarPanel(
#             sliderInput("sampsize",
#                         "Sample Sizes:",
#                         min = 1,
#                         max = 100,
#                         value = 30),
#             numericInput("popmean",
#                          "Population mean:",
#                          value=275),
#             numericInput("popsd",
#                          "Population standard deviation:",
#                          value=50)
#         ),
#         
#         mainPanel(
#             textOutput("mysummary"),
#             plotOutput("distPlot")
#         )
#     )
# )
# 
# server <- function(input, output) {
#     
#     output$mysummary <- renderText({
#         sampsize <- input$sampsize
#         popmean <- input$popmean
#         popsd <- input$popsd
#         threesdbelow <- popmean - 3*popsd/sqrt(sampsize)
#         threesdabove <- popmean + 3*popsd/sqrt(sampsize)
#         twosdbelow <- popmean - 2*popsd/sqrt(sampsize)
#         twosdabove <- popmean + 2*popsd/sqrt(sampsize)
#         onesdbelow <- popmean - popsd/sqrt(sampsize)
#         onesdabove <- popmean + popsd/sqrt(sampsize)
#         
#         set.seed(2320)
#         mymeans <- replicate(1000,mean(rnorm(sampsize,
#                                              mean=popmean,
#                                              sd=popsd)))
#         
#         threesd <- sum(mymeans >= threesdbelow & mymeans <= threesdabove)/1000
#         twosd <- sum(mymeans >= twosdbelow & mymeans <= twosdabove)/1000
#         onesd <- sum(mymeans >= onesdbelow & mymeans <= onesdabove)/1000
#         
#         paste(onesd*100,
#               "% of sample means were within one standard deviation of the population mean, and  ",
#               twosd*100,
#               "% of sample means were within two standard deviations of the population mean, and  ",
#               threesd*100,
#               "% of sample means were within three standard deviations of the population mean.",
#               sep="")
#         
#     })
#     
#     output$distPlot <- renderPlot({
#         sampsize <- input$sampsize
#         popmean <- input$popmean
#         popsd <- input$popsd
#         threesdbelow <- popmean - 3*popsd/sqrt(sampsize)
#         threesdabove <- popmean + 3*popsd/sqrt(sampsize)
#         twosdbelow <- popmean - 2*popsd/sqrt(sampsize)
#         twosdabove <- popmean + 2*popsd/sqrt(sampsize)
#         onesdbelow <- popmean - popsd/sqrt(sampsize)
#         onesdabove <- popmean + popsd/sqrt(sampsize)
#         
#         set.seed(2320)
#         mymeans <- replicate(1000,mean(rnorm(sampsize,
#                                              mean=popmean,
#                                              sd=popsd)))
#         myrandom <- data.frame(mymeans=mymeans)
#         ggplot(myrandom,aes(x=mymeans)) +
#             geom_histogram(color="white") +
#             geom_vline(xintercept=popmean,
#                        color="red",
#                        size=2) +
#             geom_vline(xintercept=c(threesdbelow,threesdabove),
#                        color="blue",
#                        size=2,
#                        linetype=2) +
#             geom_vline(xintercept=c(twosdbelow,twosdabove),
#                        color="blue",
#                        size=2,
#                        linetype=2) +
#             geom_vline(xintercept=c(onesdbelow,onesdabove),
#                        color="blue",
#                        size=2,
#                        linetype=2) +
#             coord_cartesian(xlim=c(popmean - 3*popsd,popmean + 3*popsd))
#         
#     })
# }
# 
# shinyApp(ui = ui, server = server)

##################################################
# PRACTICE PROBLEMS 7 - SHINY APP CODE SOLUTIONS #
##################################################
# Method 2      #
# With Reactive #
#################
# 1. In order to run this code, it will need to be copy and pasted
# into a Shiny app file. 
# 2. Once you have pasted this code into a Shiny app, you can
# remove all of the comments (#) by highlighting the entire text,
# then pressing CTRL+SHIFT+C (or using the Comment/Uncomment Lines 
# menu option under the Code tab in the menu)

# library(shiny)
# 
# ui <- fluidPage(
#     
#     titlePanel("Practice Problems 7 - Central Limit Theorem and Empirical Rule"),
#     
#     sidebarLayout(
#         sidebarPanel(
#             sliderInput("sampsize",
#                         "Sample Sizes:",
#                         min = 1,
#                         max = 100,
#                         value = 30),
#             numericInput("popmean",
#                          "Population mean:",
#                          value=275),
#             numericInput("popsd",
#                          "Population standard deviation:",
#                          value=50)
#         ),
#         
#         mainPanel(
#             textOutput("mysummary"),
#             plotOutput("distPlot")
#         )
#     )
# )
# 
# server <- function(input, output) {
#     
#     datagen <- reactive({
#         sampsize <- input$sampsize
#         popmean <- input$popmean
#         popsd <- input$popsd
#         threesdbelow <- popmean - 3*popsd/sqrt(sampsize)
#         threesdabove <- popmean + 3*popsd/sqrt(sampsize)
#         twosdbelow <- popmean - 2*popsd/sqrt(sampsize)
#         twosdabove <- popmean + 2*popsd/sqrt(sampsize)
#         onesdbelow <- popmean - popsd/sqrt(sampsize)
#         onesdabove <- popmean + popsd/sqrt(sampsize)
#         
#         set.seed(2320)
#         mymeans <- replicate(1000,mean(rnorm(sampsize,
#                                              mean=popmean,
#                                              sd=popsd)))
#         mymeans
#     })
#     
#     output$mysummary <- renderText({
#         
#         mymeans <- datagen()
#         
#         sampsize <- input$sampsize
#         popmean <- input$popmean
#         popsd <- input$popsd
#         threesdbelow <- popmean - 3*popsd/sqrt(sampsize)
#         threesdabove <- popmean + 3*popsd/sqrt(sampsize)
#         twosdbelow <- popmean - 2*popsd/sqrt(sampsize)
#         twosdabove <- popmean + 2*popsd/sqrt(sampsize)
#         onesdbelow <- popmean - popsd/sqrt(sampsize)
#         onesdabove <- popmean + popsd/sqrt(sampsize)
#         
#         threesd <- sum(mymeans >= threesdbelow & mymeans <= threesdabove)/1000
#         twosd <- sum(mymeans >= twosdbelow & mymeans <= twosdabove)/1000
#         onesd <- sum(mymeans >= onesdbelow & mymeans <= onesdabove)/1000
#         
#         paste(onesd*100,
#               "% of sample means were within one standard deviation of the population mean, and  ",
#               twosd*100,
#               "% of sample means were within two standard deviations of the population mean, and  ",
#               threesd*100,
#               "% of sample means were within three standard deviations of the population mean.",
#               sep="")
#         
#     })
#     
#     output$distPlot <- renderPlot({
#         sampsize <- input$sampsize
#         popmean <- input$popmean
#         popsd <- input$popsd
#         threesdbelow <- popmean - 3*popsd/sqrt(sampsize)
#         threesdabove <- popmean + 3*popsd/sqrt(sampsize)
#         twosdbelow <- popmean - 2*popsd/sqrt(sampsize)
#         twosdabove <- popmean + 2*popsd/sqrt(sampsize)
#         onesdbelow <- popmean - popsd/sqrt(sampsize)
#         onesdabove <- popmean + popsd/sqrt(sampsize)
#         
#         mymeans <- datagen()
#         
#         myrandom <- data.frame(mymeans=mymeans)
#         ggplot(myrandom,aes(x=mymeans)) +
#             geom_histogram(color="white") +
#             geom_vline(xintercept=popmean,
#                        color="red",
#                        size=2) +
#             geom_vline(xintercept=c(threesdbelow,threesdabove),
#                        color="blue",
#                        size=2,
#                        linetype=2) +
#             geom_vline(xintercept=c(twosdbelow,twosdabove),
#                        color="blue",
#                        size=2,
#                        linetype=2) +
#             geom_vline(xintercept=c(onesdbelow,onesdabove),
#                        color="blue",
#                        size=2,
#                        linetype=2) +
#             coord_cartesian(xlim=c(popmean - 3*popsd,popmean + 3*popsd))
#         
#     })
# }
# 
# shinyApp(ui = ui, server = server)

