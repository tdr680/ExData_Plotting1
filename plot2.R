# load the dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "hpc.zip")
unzip("hpc.zip")
d <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings='?')
d <- subset(d, d$Date == '1/2/2007' | d$Date == '2/2/2007')

# handle date and time
library(lubridate)
d$DateTime <- dmy(d$Date) + hms(d$Time)

plot(d$DateTime, d$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", main="", type="l")
dev.copy(png, "plot2.png")
dev.off()
