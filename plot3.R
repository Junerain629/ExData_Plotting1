# Coursera Data Science -- Exploratory Data Analysis
# Course Project 1
## the R script that plots the Plot 3


# specify where the input file locates with respect to the work directory
fileURL <- "./data/household_power_consumption.txt"

# read only subsetted data ( 2007-02-01 to 2007-02-02 ). It started at the original line No. 66637 and there are in total 2880 lines.
# missing values in dataset are encoded as "?"
data <- read.table(fileURL, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, skip=66636, nrow=2880)
# get the original header
headerInfo <- read.table(fileURL, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, nrow=1)
# assign the header back to the subsetted dataset
names(data) <- names(headerInfo)


# turn on the graphics device PNG
png(filename="plot3.png")

# convert Date & Time
# use library "lubridate"
library(lubridate)

data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

# combine Date & Time for the plot
data$DateTime <- data$Date + data$Time

# plot
with(data, plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l"))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, 
       col=c("black", "red", "blue")
       )

# turn off device
dev.off()