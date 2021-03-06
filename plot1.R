
## Project1 - Plot1
## The following script is pretty much common to each of the pla
## Install and load the necessary packages
setwd("datasciencecoursera/R")
install.packages("data.table")
library(data.table)

## Read the entire file into data frame. I have enough space to read this file.

setwd("~/datasciencecoursera/ExploratoryDataAnalysis")
data1 <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings ="?")

## Change the Date type from String to Date
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

## Save the data for the two dates in the question to a separate data frame (data2) for analysis and plots

data2 <- subset(data1, subset = (Date >="2007-02-01" & Date <= "2007-02-02"))

## Remove the data1 from the workspace as we do not need the full data set any more
rm(data1)

## =================================================================================
## The following code is specific to each of the plots requested in the project

## Plot the histogram for plot1 by specifying all the parameters as follows

hist(data2$Global_active_power, col = "red", main = "Golbal Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## copy the image to as follows and save to plot1.png as follows

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

