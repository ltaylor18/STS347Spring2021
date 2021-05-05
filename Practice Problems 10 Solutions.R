###################################
# Practice Problems #10 Solutions #
###################################

# Problem A. Diamonds

library(dplyr)
library(ggplot2)

#1.
set.seed(2320)
mydiamonds1 <- sample_n(diamonds,500,replace=FALSE)

#2.
ggplot(mydiamonds1,aes(x=cut,y=price)) + geom_boxplot()

#3.
out3 <- aov(mydiamonds1$price ~ mydiamonds1$cut)
summary(out3)

#4.
mydiamonds1 <- mutate(mydiamonds1,lnprice=log(price))

#5.
ggplot(mydiamonds1,aes(x=cut,y=lnprice)) + geom_boxplot()
# Wow, these look so much more symmetric and potentially 
# Normally distributed.

#6. 
out6 <- aov(lnprice ~ cut, data=mydiamonds1)
summary(out6)

# With a p-value of 0.175, there is not sufficient evidence
# to suggest that the population mean price varies based on cut.

#7.
# Cool. 
# The log-transformation was critical to detecting a difference here.

#8.
TukeyHSD(out6)
plot(TukeyHSD(out6))
# We only detect a difference between the mean log-price for the
# Ideal cut and Premium cut as the confidence interval for mu1-mu2
# is -0.69 to -0.09. Since the interval is entirely negative, we 
# conclude evidence the the mean log-price is greater for the Premium
# cut by between 0.09 and 0.69 units ($?). Additionally, the p-value
# for the test of a difference in the population mean log-price between
# Ideal and Premium cut diamonds is 0.0037, which is significant!

#9.
mydiamonds2 <- filter(diamonds,cut=="Ideal",color=="E",clarity=="VVS1") 
summarize(mydiamonds2,n())

#10a.
lm(price ~ carat + depth + table + x + y + z, data=mydiamonds2)

#10b. 
out10 <- lm(price ~ carat + depth + table + x + y + z, data=mydiamonds2)
summary(out10)

#10c.
# Just delete it!!
out10c <- lm(price ~ carat + depth + table + x + y , data=mydiamonds2)
summary(out10c)

#10d.
plot(out10c)  
# Look at the third plot labeled Normal Q-Q.
# There is a severe S-shape to this data, which leads me to doubt that
# the Normal assumption has been met.

#11.
mydiamonds2 <- mutate(mydiamonds2,lnprice=log(price))
out11 <- lm(lnprice ~ carat + depth + table + x + y , data=mydiamonds2)
plot(out11) 
# Look at the third plot labeled Normal Q-Q.
# In general the first 2/3 of the points look much more in line with
# the Normal quantiles. There was much improvement on the Normality
# assumption. There may be a transformation of an explanatory variable
# that could help with the remaining issues in this Q-Q Plot.

#12.
# What happens if we fit the model from ANOVA using the lm function?
out12 <- lm(price ~ cut, data=mydiamonds1)
summary(out12)
# Observe that the overall F test statistic is shown on the last line
# of the output and is F=1.591. The p-value is 0.1755.
# Looking back at the output from #3, I observe that the F test statistic
# was 1.591 with a p-value of 0.175. Cool!

#13
# Copy and paste this code into a Shiny App file and remove the comments
# run it:




# # Practice Problems #10 
# # Applet for Type I Errors and Power of Two-Independent Samples T-Test
# 
# library(shiny)
# 
# ui <- fluidPage(
# 
#     
#     titlePanel("Practice Problems #10"),
# 
#     sidebarLayout(
#         sidebarPanel(
#             h4("This applet generates data from a Chi-Square distribution
#                with degrees of freedom and sample size determined below.
#                A random sample is also generated from a Normal distribution
#                with a mean of 8 and standard deviation of 4 with size determine
#                below. The applet will perform 1000 replications of drawing 
#                samples and conducting a two-independent sample t-test. The
#                applet reports the number of tests that detected a difference
#                in the population mean at the 0.05 level."),
#             sliderInput("size",
#                         "Size of each sample:",
#                         min = 2,
#                         max = 100,
#                         value = 30),
#             numericInput("df",
#                          "Degrees of freedom for Chi-Square distribution:",
#                          value=8),
#             h4("Note: When this value is set to 8, both samples are drawn from
#                populations with a mean of 8.")
#         ),
# 
#         mainPanel(
#            textOutput("mytext")
#         )
#     )
# )
# 
# 
# server <- function(input, output) {
# 
#     output$mytext <- renderText({
#         myresults <- replicate(1000,
#                                t.test(rchisq(input$size,input$df),
#                                       rnorm(input$size,8,4),
#                                       alternative="two.sided",
#                                       var.equal=FALSE)$p.value
#         )
#         
#         prop <- sum(myresults <= 0.05)/1000
#         perc <- round(prop*100,2)
#         
#         detection = if_else(input$df==8,"incorrectly","correctly")
#         
#         paste("Out of 1000 replications of drawing ",
#         input$size, 
#         " observations from a Chi-Square distribution with ",
#         input$df, 
#         " degrees of freedom and ",
#         input$size, 
#         " observations from a Normal distribution with a mean of 8 and standard deviation of 4, we ",
#         detection,
#         " detected a difference at the 0.05 significance level in population means in ",
#         perc, 
#         "% of our two-independent samples t-test that correctly assumed equal variances.",
#         sep="")
#     })
# }
# 
# shinyApp(ui = ui, server = server)


