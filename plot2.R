# #Project work - Exploratory Data Analysis - Project2

rm(list=ls())
setwd("~/R/proj")
library(RDS)
library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# plot2.R
#Question2
###########################################################
# Have total emissions from PM2.5 decreased in the
# Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
###########################################################
#option1
# Baltimore city, Maryland, fips =="24510"
#yearly_emission <- aggregate(Emissions ~ year, NEI[NEI$fips=="24510",], sum)
#barplot(height=yearly_emission$Emissions, names.arg=yearly_emission$year, xlab="Year", ylab="PM2.5 Emission",main="Yearwise PM2.5 Emission, Maryland")
#dev.copy(png, file="plot2.png", width=480, height=480)
#dev.off()

#option2
dat <- NEI[NEI$fips=="24510",] %>%   group_by(year) %>%   summarise(Emissions = sum(Emissions)) 
#dat <- as.data.frame(dat)
#plot(dat$year,dat$Emissions, type = "l")
#ggplot(dat, aes(x=year, y=Emissions)) + geom_line()
barplot(height=dat$Emissions, names.arg=dat$year, xlab="Year", ylab="PM2.5 Emission",main="Yearwise PM2.5 Emission, Baltimore City")
# Saving in graphic file png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

