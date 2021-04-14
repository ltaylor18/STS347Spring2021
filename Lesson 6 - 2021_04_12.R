###########
# Notes 6 #
# 4/12/21 #
###########

x <- rnorm(30,0,1)
pval <- t.test(x,
               alternative="two.sided",
               mu=100)$p.value
library(dplyr)

#Side note:
out <- t.test(x,
              alternative="two.sided",
              mu=100)
out$p.value


if(pval < 0.05) {print("Results are significant at the 0.05 level.")}
if(pval > 0.05) {print("Results are not significant at the 0.05 level.")}
if(pval == 0.05) {print("The p-value equals 0.05, the significance level.")}


pval <- 0.06
if(pval < 0.05) {print("Results are significant at the 0.05 level.")}
if(pval > 0.05) {print("Results are not significant at the 0.05 level.")}
if(pval == 0.05) {print("The p-value equals 0.05, the significance level.")}



if(pval < 0.05){
  print("Results are significant at the 0.05 level.")
} else{
  print("Results are not significant at the 0.05 level.")
}


if(pval < 0.05){
  print("Results are significant at the 0.05 level.")
} else if(pval > 0.05){
  print("Results are not significant at the 0.05 level.")
} else {
  print("The p-value equals 0.05, the significance level.")
}


###########
# 4/14/21 #
###########


# Warm-up 
#0. Load the palmerpenguins and dplyr data sets.
library(palmerpenguins)
library(dplyr)

# 1. Filter the data set using the dplyr filter() function so that
# only Adelie penguins from the island of Dream are included.
# Fix the typos in this line of code to create this data set.
mypenguins <- filter(penguins,species=Adelie,island=Dream)

# Correction:
mypenguins <- filter(penguins,species=="Adelie",island=="Dream")

# 2. Generate a scatterplot to show the relationship between 
# Y=bill_length_mm and X=body_mass_g
# Note: In the real world, the explanatory variable is often the
# easier variable to measure. Body mass requires getting a penguin
# to walk across a scale, whereas bill length requires constraining
# a penguin to measure it.
library(ggplot2)
ggplot(mypenguins,aes(x=body_mass_g,y=bill_length_mm)) +
  geom_point()


# 3. Fit the least-squares regression line to the data and 
# and print out a summary of the analysis that includes p-values.
out <- lm(bill_length_mm ~ body_mass_g, data=mypenguins)
summary(out)

# 4. Type out$ and determine an appropriate conclusion to this
# statement print out the estimated y-intercept and slope
# for the regression line. Then use [1] and [2] to store the
# y-intercpet into an object called myint and the slope into
# an object called myslope. Note: You could manually type the
# values into the objects myint and myslope if you can't figure
# this out, but in the real-world, we should write code that 
# doesn't depend on us hand-typing any values from our analysis!

out$coefficients
myint <- out$coefficients[1]
myslope <- out$coefficients[2]
attributes(out)

# 5. We could use geom_smooth to manually add this line to our
# data set, but let's use one of our favorite tricks by doing 
# the following:
# a. Create a vector which goes from the smallest body mass
# in the data to the largest body mass in the data and increments by 1. Store this
# into an object called myx. Note, you will need to use the na.rm option
# to calculate your min and max since the data contains missing values.

x1 <- min(penguins$body_mass_g,na.rm=TRUE)
#Other group solutions:
x1 <- min(penguins[,6], na.rm=T)
x1 <- min(mypenguins$body_mass_g)

x2 <- max(penguins$body_mass_g,na.rm=TRUE)

# b. For each value in the object you created in part (a),
# multiply by the value of myslope and add the value of myint.
# Store these into an object called myy.

y1 <- myslope*x1 + myint
y2 <- myslope*x2 + myint

# c. Use the geom_line layer to add the regression line that
# you calculated in parts a & b to your scatterplot. This should
# be similar to how you added the density function to your
# histograms.

ggplot(mypenguins,aes(x=body_mass_g,y=bill_length_mm)) +
  geom_point() +
  geom_segment(x=x1,xend=x2,y=y1,yend=y2,color="red")



#Method 4
if_else(pval < 0.05, 
        "Results are significant at the 0.05 level.",
        "Results are not significant at the 0.05 level.",
        "Missing p-value.")

pval

# Method 5
case_when(pval < 0.05 ~ "Results are significant at the 0.05 level.",
          pval > 0.05 ~ "Results are not significant at the 0.05 level.",
          pval == 0.05 ~ "The p-value equals 0.05, the significance level.")

