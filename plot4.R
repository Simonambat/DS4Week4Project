# #Project work - Exploratory Data Analysis - Project2

rm(list=ls())
setwd("~/R/proj")
library(RDS)
library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# plot4.R
# Question 4
###########################################################
# Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999–2008?
###########################################################

# Filter coal related items in SCC
coal <- grepl("Coal", SCC$Short.Name,ignore.case = TRUE)
coal <- SCC[coal, ]
#dim(coal)
NEI_SCC <- merge(NEI, coal, by = "SCC")
#dim(NEI_SCC)

coal_emission <- aggregate(Emissions ~ year, NEI_SCC, sum)
barplot(height=coal_emission$Emissions, names.arg=coal_emission$year, xlab="Year", ylab="PM2.5 Emission",main="Yearwise Coal related PM2.5 Emissionin US")
# Saving in graphic file png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

