# load the dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "hpc.zip")
unzip("hpc.zip")
d <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings='?')
d <- subset(d, d$Date == '1/2/2007' | d$Date == '2/2/2007')

# create png
hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
