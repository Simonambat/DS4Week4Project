# #Project work - Exploratory Data Analysis - Project2

rm(list=ls())
setwd("~/R/proj")
library(RDS)
library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# plot6.R
# Question 6
###########################################################
# Compare emissions from motor vehicle sources in Baltimore City (fips=="24510") with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?
###########################################################
# Filter the data by Highway Vehicles
vehicle <- grepl("Highway Veh", SCC$Short.Name,ignore.case = TRUE)
vehicle <- SCC[vehicle, ]
#dim(vehicle)
#View(vehicle)
NEI_SCC <- merge(NEI, vehicle, by = "SCC")
#dim(NEI_SCC)

# Filter by California and Baltimore city
dat <- NEI[NEI$fips=="24510"|NEI$fips=="06037",] %>%   group_by(fips,year) %>%   summarise(Emissions = sum(Emissions)) 

ggplot(dat, aes(x=year, y=Emissions, color=fips)) + geom_line() +
    ggtitle("Vehicle Emissions in California (06037) and Baltimore City (24510)") + xlab("Year") + ylab("PM2.5 Emission")
# Saving in graphic file png
dev.copy(png, file="plot6.png", width=480, height=480)
dev.off()

