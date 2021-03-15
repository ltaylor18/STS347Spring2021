## Lesson 5-1A ##

###########
# 3/15/21 #
###########

mynorms <- rnorm(1000)
ggplot(NULL,aes(x=mynorms)) +
  geom_histogram(color="white")

?rt
myt <- rt(1000,19)
ggplot(NULL,aes(x=myt)) +
  geom_histogram(color="white")
