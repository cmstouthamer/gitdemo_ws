#final project- we work with the combined_gapMinder.tsv file in the output folder.
#Write an Rmd script to load the data file, select all the data for that country
#(hint, use the subset() function), and use ggplot make a three scatter plots 
#(one for each country) that has year on the x-axis and GDP on the y axis. 
#Make sure you load all the libraries you might need (ggplot2, reshape2, etc). 
#Describe any trends you see for each country using markdown text.

#load libraries:

library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
library("plyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
library("reshape2", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
library("ggthemes", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")

#Load data into a variable:
data.in <- read.delim(file = "output/combined_gapMinder.tsv", header = TRUE, sep='\t')

#subset the three countries that I want
data.sub <- subset(data.in, country == 'Afghanistan'|country=='Brazil'|country=='China')

#Here is an alternative to the method above.
data.sub <- subset(data.in, country %in% c('Afghanistan','Brazil','China')) 

#plot x axis year and y axis gdp per capita with each country in a seperate plot

myplot <- ggplot(data = data.sub, aes(x = year, y = gdpPercap, color = country)) + 
  geom_point(size = 3) +
  facet_grid(country ~ .)
summary(myplot)
myplot







