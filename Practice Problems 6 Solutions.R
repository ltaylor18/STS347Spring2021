#######################
# PRACTICE PROBLEMS 6 #
#######################


#1
library(ggplot2)
library(dplyr)
#install.packages("highlight")
library(gghighlight)
#install.packages("gapminder")
library(gapminder)

#2
View(gapminder)
names(gapminder)
str(gapminder)
head(gapminder)
# The data shows the life expectancy, population, and GDP 
# per capita for every five years from 1952 to 2007
# for all countries.

#3
# Review this resource: https://cran.r-project.org/web/packages/gghighlight/vignettes/gghighlight.html
?gghighlight

#4

#########
#Chunk A#
#########
g <- ggplot(gapminder, aes(x=year,
                           y=lifeExp, 
                           color=country)) +
  geom_line() 
g

# This graph is intense! It shows the change in life expectancy
# from 1952 to 2007 for all countries. It is almost entirely 
# a legend since there are so many countries.

#########
#Chunk B#
#########
g + guides(color=FALSE)

# The code guides(color=FALSE) omits the legend associated with the
# color mapping (thankfully!). However, now we don't know which
# line belongs to which country!

#########
#Chunk C#
#########
g + gghighlight(country %in% c("United States",
                               "Mexico",
                               "Canada"), 
                label_key=country)

# Well this is cool. We have now highlighted only the countries
# listed in the vector in the code. The label_key option tells
# ggplot to label the points with the associated value of the
# variable country.

g + gghighlight(country %in% c("United States",
                               "Mexico",
                               "Canada"), 
                label_key=continent)

# Now these three countries are labeled by the
# values of the continent variable associated with each of 
# these countries.

g + gghighlight(country %in% c("Korea, Dem. Rep.","Korea, Rep."),
                label_key=country)

#########
#Chunk D#
#########

g + gghighlight(min(lifeExp) < 25, 
                label_key=country)

# This highlights the countries that has a minimum life expectancy
# of less than 25 years. Only one country falls into this category: Rwanda.

gapminder %>% filter(country=="Rwanda") %>% summarize(minR = min(lifeExp))

#OR#

mygapminder <- filter(gapminder, country=="Rwanda")
summarize(mygapminder, minR = min(lifeExp))

#########
#Chunk E#
#########

g + gghighlight(max(gdpPercap),
                max_highlight=5)
# What if I change it to 2?
g + gghighlight(max(gdpPercap),
                max_highlight=2)
# Now only two countries are highlighted!
# It appears that max_highlight limits the number of objects
# that are labeled that meet the criteria that are listed.

# Using this code we can see the countries with the five highest
# gross domestic products!
head(arrange(gapminder,desc(gdpPercap)),13)
# An even better solution!
head(unique(arrange(gapminder,desc(gdpPercap))$country),5)
#########
#Chunk F#
#########

g + facet_wrap(~continent) + 
  guides(color=FALSE)
# The graph is created separately in a panel for each of the continents.
# There are five continents displayed.


#Chunk G
g + facet_wrap(~continent) + 
  gghighlight(max(lifeExp),
              label_key=country)

# The five countries with the highest life expectancy are highlighted.
# Notably, there are now only three continents displayed!

#Chunk H
g + facet_wrap(~continent) + 
  gghighlight(max(lifeExp),
              label_key=country,
              calculate_per_facet=TRUE)

#############
# Problem B #
#############

#5
#install.packages("Lahman")
library(Lahman)
View(Teams)

#6
century <- filter(Teams,yearID > 1900)

#7a
ggplot(filter(century,is.na(divID)==FALSE),
       aes(x=R,
           y=RA,
           color=divID)) +
  geom_point() +
  labs(x="Runs Scored", 
       y="Runs Allowed",
       title="Major League Baseball Team Seasons") +
  facet_wrap(~divID)  +
  scale_color_manual(name="Division",
                     values=c("red","purple","orange"))

#7b
ggplot(filter(century,is.na(divID)==FALSE),
       aes(x=R,
           y=RA,
           color=divID)) +
  geom_point() +
  labs(x="Runs Scored", 
       y="Runs Allowed",
       title="Major League Baseball Team Seasons") +
  facet_wrap(~divID)  +
  scale_color_manual(values=c("red","purple","orange"),
                     guide=FALSE) 

#7c
ggplot(filter(century,is.na(divID)==FALSE),
       aes(x=R,
           y=RA,
           color=divID)) +
  geom_point() +
  labs(x="Runs Scored", 
       y="Runs Allowed",
       title="Major League Baseball Team Seasons",
       color="Division") +
  facet_wrap(~divID)  +
  scale_color_manual(values=c("red","purple","orange")) +
  scale_y_continuous(breaks=seq(300,1100,100))

#8
ggplot(century,aes(x=R,
                   y=W,
                   color=lgID)) +
  geom_point() +
  labs(x="Runs Scored",
       y="Number of Wins",
       title="Major League Baseball Team Seasons") +
  facet_grid(divID~lgID) +
  scale_x_continuous(breaks=c(400, 600, 800, 1000))

#9
#Use facet_wrap instead!
ggplot(century,aes(x=R,
                   y=W,
                   color=lgID)) +
  geom_point() +
  labs(x="Runs Scored",
       y="Number of Wins",
       title="Major League Baseball Team Seasons") +
  facet_wrap(divID~lgID) +
  scale_x_continuous(breaks=c(400, 600, 800, 1000))

#10
ggplot(century,aes(x=R,
                   y=W)) +
  geom_point(color="blue") +
  gghighlight(W > 115,
              label_key=teamID,
              unhighlighted_params=list(color="red",
                                        shape=1,
                                        alpha=0.75))

#11
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
#     titlePanel("Practice Problems 6 - Central Limit Theorem and Empirical Rule"),
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
#            plotOutput("distPlot")
#         )
#     )
# )
# 
# server <- function(input, output) {
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
#                        linetype=2) 
#         
#     })
# }
# 
# shinyApp(ui = ui, server = server)
