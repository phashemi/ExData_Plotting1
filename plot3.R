## Read the full dataset
data <- read.csv("C:/Users/PAYMON/data/exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, stringsAsFactors=F, quote="")

## Subset the data to February 1-2, 2007
data <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

## Change the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

## Set the file name and parameters for the plot
png("plot3.png", width = 480, height = 480)

## Draw a new plot
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")

## Add lines to the plot
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")

## Develop the legend per the required specifications
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

## Close the PNG device
dev.off()
