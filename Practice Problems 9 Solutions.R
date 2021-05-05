#################################
# Practice Problems 9 Solutions #
#################################

# Shiny App Code for Problem A
# # Exploring level of confidence
# 
# library(shiny)
# 
# ui <- fluidPage(
# 
#     titlePanel("Exploring Level of Confidence"),
# 
#     sidebarLayout(
#         sidebarPanel(
#             sliderInput("n",
#                         "Sample Size:",
#                         min = 1,
#                         max = 50,
#                         value = 30),
#             numericInput("std",
#                          "Standard Deviation:",
#                          value=5),
#             radioButtons("loc",
#                          "Level of Confidence",
#                          choiceNames=c("90%", "95%", "99%"),
#                          choiceValues=c(.90,.95,.99))
#         ),
# 
#         mainPanel(
#             textOutput("mytext"),
#            plotOutput("myplot")
#         )
#     )
# )
# 
# server <- function(input, output) {
#     
#     output$mytext <- renderText({
#         nsim <- 1000
#         n <- input$n
#         std <- input$std
#         loc <- as.numeric(input$loc)
#         
#         output <- replicate(nsim,
#                             t.test(rnorm(n,100,std),
#                                    mu=100,
#                                    alternative="two.sided",
#                                    conf.level=loc)$conf.int[1:2])
#         output <- t(output)
# 
#         check <- output[,1] <= 100 & output[,2] >= 100
#         myprop <- sum(check)/nsim
# 
#         paste("In 1000 simulations of samples of size ",
#               input$n,
#               " drawn from this population, ",
#               myprop*100,
#               "% contained the population mean of 100.",
#               sep="")
#         
# 
#     })
# 
#     output$myplot <- renderPlot({
#         std <- input$std
#         mu <- 100
#         
#         myx <- seq(mu-3*std,mu+3*std,.01)
#         myy <- dnorm(myx,mu,std)
#         
#         ggplot(NULL,aes(x=myx,
#                         y=myy)) + 
#             geom_line(color="red",
#                       size=2) +
#             labs(title="Population Distribution")
#     })
# }
# 
# shinyApp(ui = ui, server = server)

################################################
### Problem B. Two-independent sample t-test ###
################################################


myresults <- replicate(10,
                       t.test(rchisq(30,8),
                              rnorm(30,8,4),
                              alternative="two.sided",
                              var.equal=FALSE)$p.value
                       )
#5.
# Explain what the code does!

#6a-c.
# The mean of the Chi-Sq(df=8) and Normal(8,4) distributions
# are both 8. So the null hypothesis is true. We should 
# expect large p-values (insufficient evidence of a difference).
# However, it should be noted that the normality assumption 
# is clearly not true for the Chi-Sq(df=8) distribution, which is
# right-skewed and not Normal!

#7. 
myresults <- replicate(10000,
                       t.test(rchisq(30,8),
                              rnorm(30,8,4),
                              alternative="two.sided",
                              var.equal=FALSE)$p.value
)

sum(myresults < 0.01)/10000
sum(myresults < 0.05)/10000
sum(myresults < 0.10)/10000

# When we use alpha=0.01 (or 0.05 or 0.10) we are setting our
# Type I Error rate to be 1% (or 5% or 10%, respectively). 
# That means our threshold for making a Type I Error rate is
# controlled by the significance level, alpha, that we use.
# In this simulation we knew that the null hypothesis was true
# based on the way we simulated our data. Therefore, we expected
# that about 1% of our tests when using an alpha of 0.01 would
# incorrectly yield small p-values (less than 0.01) and lead 
# us to commit a Type I Error. We observed this to be true.
# In one run of my simulation I observed a Type I Error rate of
# 87/10000 = 0.0087, which is quite close to 0.01.
# We also see that the simulated Type I Error rates for 5% and 10%
# were close in our simulation as well.

# It seems like the violation of the normal distribution 
# does not impact the test! Our Type I Error rates were approximately
# equal to what we would have expected!



#8. 
myresults <- replicate(10000,
                       t.test(rchisq(30,8),
                              rnorm(30,10,4), #change mean!
                              alternative="two.sided",
                              var.equal=FALSE)$p.value
)
# We are now simulated data where the two-sided alternative hypothesis
# is true. The means of my populations are 8 and 10 now, which means
# the populations means are not equal. 

# Therefore, I would anticipate getting small p-values which would 
# lead me to conclude that there is sufficient evidence of a difference.


sum(myresults < 0.01)/10000
sum(myresults < 0.05)/10000
sum(myresults < 0.10)/10000

# In #7, I anticipated getting large p-values because the null
# hypothesis was true --- the population means were equal (both were 8).
# In that case, I only observe approximately alpha*100% of my
# tests incorrectly yielding a small p-value.
# Now when the alternative hypothesis is true (population means are 8 
# and 10, respectively) we see that a lot more of our tests are
# are correctly rejecting the null hypothesis! In one run of my 
# simulation, 47.73% of my iterations correctly rejected the null
# hypothesis at the 0.05 level. (That's not much better than a coin
# toss but the reason for this is partially illustrated by the 
# next exercise.)


#9. 
myresults <- replicate(10000,
                       t.test(rchisq(30,8),
                              rnorm(30,12,4), #change mean!
                              alternative="two.sided",
                              var.equal=FALSE)$p.value
)


sum(myresults < 0.01)/10000
sum(myresults < 0.05)/10000
sum(myresults < 0.10)/10000

# The proportion of times that our t-tests come to the correct conclusion 
# (that is, they have small p-values indicating a difference in population
# means) is much greater in this simulation where the population means are
# 8 and 12 than when the population means were only 2 units apart (8 and 10).

#10.
# a.	TRUE. When performing a t-test where the underlying populations 
# have very different population means, we should correctly detect 
# a difference more often than when the underlying populations have 
# more similar population means.

## As seen in #8 and #9, when the difference in population means 
## increased, more tests correctly detected it with small p-values.

# b.	TRUE. If two random samples of size 100 are drawn from the same 
# population (so µ1 = µ2), it is possible that our hypothesis test could 
# lead us to incorrectly reject the null hypothesis.

## When we obtain a small p-value, it is always possible that we are
## committing a Type I Error. We limit Type I Errors by choosing smaller
## levels of significance, alpha.

# As the population means become more different 8 vs. 10 and then 8 vs. 12,
# we observe the more of our tests correctly detect the difference by
# yielding small p-values.

# It appears that the violation of the Normal distribution (we specifically
# generated data for our first sample from a Chi-square distribution with
# df=8 which is highlight right skewed) didn't seem to impact the tests
# ability to detect a difference.

#11.
# Based on my Shiny App, I observe that when the two populations
# have the same mean and the sample size is small that the Type I Error
# rate is #########################################

###############################################
### Problem C. ANOVA and the F-distribution ###
###############################################

#12. 
pf(5.297,1,8,lower.tail=FALSE)

#13.
qf(0.95,1,8)

###################################
### Problem D. Regression line. ###
###################################

#14.
out <- lm(mtcars$mpg ~ mtcars$wt)

#15.
names(out)
out$coefficients
myintercept <- out$coefficients[1]
myslope <- out$coefficients[2]

#16.
library(ggplot2)
g <- ggplot(mtcars,aes(x=wt,y=mpg)) +
  geom_point()
g
#Proof that they are the same line!
g + geom_abline(slope=myslope,
                intercept=myintercept,
                color="red",
                size=3) +
  geom_smooth(method="lm",
              se=FALSE,
              size=2)
# The blue line is right on top of the red line.
# This helps me see that the two lines are the same.
# Further, the red line comes from using the slope 
# and y-intercept from fitting the model with the lm
# function. Mirroring this, we use method="lm" in 
# the geom_smooth layer. Both are using lm!

#17.
g + geom_smooth(method="lm",
              se=FALSE,
              size=2) +
  geom_abline(slope=myslope,
              intercept=myintercept,
              color="red",
              size=3) 
# We can't see the blue line that is added on first,
# because the second line that is added on in red
# is a thicker line and covers up the previous layer!
