# #Project work - Exploratory Data Analysis - Project2
# plot1.R
# Question 1
###########################################################
# Have total emissions from PM2.5 decreased in the United 
# States from 1999 to 2008?
###########################################################
rm(list=ls())
setwd("~/R/proj")
library(RDS)
library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#option1
yearly_emission <- aggregate(Emissions ~ year, NEI, sum)
barplot(height=yearly_emission$Emissions, names.arg=yearly_emission$year, xlab="Year", ylab="PM2.5 Emission",main="Yearwise PM2.5 Emission")
# Saving in graphic file png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

#option2
#dat <- NEI %>%   group_by(year) %>%   summarise(Emissions = sum(Emissions)) 
#dat <- as.data.frame(dat)
#plot(dat$year,dat$Emissions, type = "l")
#ggplot(dat, aes(x=year, y=Emissions)) + geom_line()

#barplot(height=dat$Emissions, names.arg=dat$year, xlab="Year", ylab="PM2.5 Emission",main="Yearwise PM2.5 Emission")
#dev.copy(png, file="plot1.png", width=480, height=480)
#dev.off()

