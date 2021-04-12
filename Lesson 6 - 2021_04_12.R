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

