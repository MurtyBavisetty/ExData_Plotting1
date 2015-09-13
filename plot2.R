## Project1 - Plot2
## The following script is pretty much common to each of the pla
## Install and load the necessary packages
setwd("datasciencecoursera/R")
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

## Prepare Date and Time for the Time column and prepend it as DateTime column into the data2 frame
#x <- paste(data2$Date, data2$Time)
#strptime(x, "%y-%m-%d %H:%M:%S")

x <- as.POSIXct(paste(data2$Date, data2$Time), format ="%Y-%m-%d %H:%M:%S")

data2 <- cbind(DateTime = x, data2)
## The following plot shows the second plot and save it as plot2.png
plot(weekdays(data2$DateTime), data2$Global_active_power, ylab = "Global Active Power (kilowatts)")

## copy the image to as follows and save to plot2.png as follows

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
