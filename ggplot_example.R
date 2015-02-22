#ggplot learning code
#Corinne Stouthamer
#cmstouthamer@gmail.com
#Feb 22.2014
#we installed a number of packages

library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
library("plyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
library("reshape2", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
library("ggthemes", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")

myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + 
  geom_point(aes(shape = Species), size = 3)
summary(myplot)
myplot

#why aes(shape = Species)?  Because aes always deals with when you want to label 
#from within the data. The below plot works as well:

myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species, shape = Species)) + 
  geom_point(size = 3)
summary(myplot)
myplot

d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]

myplot <- ggplot(data = d2, aes(x = carat, y = price, color = color)) + 
  geom_point(size = 2)
summary(myplot)
myplot

#MASS is a preloaded dataset
#btw is birthrate

library(MASS)
myplot2 <- ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()
myplot2
summary(myplot2)
#we say factor(race) because race was entered as a number, but we don't want this
#to be a continuous variable.
#The summary variable will tell us what exactly ggplot is doing with each geom, aes etc

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  facet_grid(. ~ Species)

#or facet_wrap(~ Species)

#how to make them stacked
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  facet_grid(Species ~ .)

df <- melt(iris, id.vars = "Species") #transform a category into a variable
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Set1")
#This plots the summary statistic (Average? we don't know) for each measure, binned
#by species. 












