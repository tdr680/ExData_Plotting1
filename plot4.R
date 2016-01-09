# load the dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "hpc.zip")
unzip("hpc.zip")
unlink("hpc.zip")
d <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings='?')
d <- subset(d, d$Date == '1/2/2007' | d$Date == '2/2/2007')

# handle date and time
library(lubridate)
d$DateTime <- dmy(d$Date) + hms(d$Time)

par(mfrow=c(2,2))
plot(d$DateTime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power", main="")
plot(d$DateTime, d$Voltage, type="l", xlab="datetime", ylab="Voltage", main="")
plot(d$DateTime, d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", main="", col="black")
lines(d$DateTime, d$Sub_metering_2, col="red")
lines(d$DateTime, d$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), bty = "n", lty=1, col=c('black', 'red', 'blue'))
plot(d$DateTime, d$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", main="")
dev.copy(png, file = "plot4.png")
dev.off()
