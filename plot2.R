## Read the full dataset
data <- read.csv("C:/Users/PAYMON/data/exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, stringsAsFactors=F, quote="")

## Subset the data to February 1-2, 2007
data <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

## Change the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

## Set the file and parameters for the plot
png("plot2.png", width=480, height= 480)

## Draw a new plot
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")

## My original code had the previous 2 functions written in opposite order.
## However, the saved png file was blank.
## I followed this model for plots 2-4.

## Close the PNG device
dev.off()
