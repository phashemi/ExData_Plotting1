## Read the full dataset
data <- read.csv("C:/Users/PAYMON/data/exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, stringsAsFactors=F, quote="")

## Subset the data to February 1-2, 2007
data <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

## Draw a new histogram plot
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Save the histogram to a PNG file named "plot1.png" with a width of 480 X 480
dev.copy(png, file = "plot1.png", width=480, height=480)

## Close the PNG device
dev.off()
