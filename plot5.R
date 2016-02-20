# #Project work - Exploratory Data Analysis - Project2

rm(list=ls())
setwd("~/R/proj")
library(RDS)
library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# plot5.R
# Question 5
###########################################################
# How have emissions from motor vehicle sources changed 
# from 1999–2008 in Baltimore City(fips == "24510")?
###########################################################
vehicle <- grepl("Highway Veh", SCC$Short.Name,ignore.case = TRUE)
vehicle <- SCC[vehicle, ]
#dim(vehicle)
#View(vehicle)
NEI_SCC <- merge(NEI, vehicle, by = "SCC")
#dim(NEI_SCC)
yearly_emission <- aggregate(Emissions ~ year, NEI_SCC[NEI_SCC$fips=="24510",], sum)
barplot(height=yearly_emission$Emissions, names.arg=yearly_emission$year, xlab="Year", ylab="PM2.5 Emission",main="Yearwise Motor Vehicles PM2.5 Emission, Baltimore")
# Saving in graphic file png
dev.copy(png, file="plot5.png", width=480, height=480)
dev.off()

