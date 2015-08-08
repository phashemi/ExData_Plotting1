## Read the full dataset
data <- read.csv("C:/Users/PAYMON/data/exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, stringsAsFactors=F, quote="")

## Subset the data to February 1-2, 2007
data <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

## Change the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

## Set the file name and parameters for the plot
png("plot4.png", width = 480, height = 480)

## Divide the plot into four subplots using par(mfrow)
par(mfrow=c(2,2)) 

## Draw the plot on the top left
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 

## Draw the plot on the top right
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")   

## Draw the plot, add lines, and a legend on the bottom left
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 

## Draw the plot on the bottom right
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  

## Close the PNG device
dev.off()
