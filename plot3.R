# #Project work - Exploratory Data Analysis - Project2

rm(list=ls())
setwd("~/R/proj")
library(RDS)
library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# plot3.R
# Question 3
###########################################################
# Of the four types of sources indicated by the  type(point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions from 1999–2008 
# for Baltimore City (fips == "24510") ? Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
###########################################################
balti <- NEI[NEI$fips=="24510",] %>%   group_by(type,year) %>%   summarise(Emissions = sum(Emissions)) 
ggplot(balti, aes(x=year, y=Emissions, color=type)) + geom_line() +
  ggtitle("Source wise Emissions in  Baltimore City (24510) during(1999–2008)") + xlab("Year") + ylab("PM2.5 Emission")
# Saving in graphic file png
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

