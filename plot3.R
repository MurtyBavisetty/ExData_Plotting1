## Project1 - Plot3
## The following script is pretty much common to each of the plots
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

x <- as.POSIXct(paste(data2$Date, data2$Time), format ="%Y-%m-%d %H:%M:%S")

data2 <- cbind(DateTime = x, data2)

## Plot all the 4 sub plots under the same plot and save as plot3
with (data2, {
  plot(DateTime, Global_reactive_power, type="l", ylab = "Global_reactive_power", 
                                                              xlab = "datetime", type ="n")
  plot(DateTime, Sub_metering_1, type="l", ylab = "Energy Submetering", xlab = "") ## default color is black
  plot(DateTime, Sub_metering_2, type="l", ylab = "Energy Submetering", col="red")
  plot(DateTime, Sub_metering_3, type="l", ylab = "Energy Submetering", col="blue")

 legend("topright", col=c("black","red", "blue"), legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
 legend("topright", pch = 1, col=c("black","red", "blue"), legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
} )
## copy the image to as follows and save to plot3.png as follows

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
