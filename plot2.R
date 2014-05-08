## Read source data - could be made more efficient by only reading required data
mydata <- read.csv("household_power_consumption.txt", sep=";")

## Coerce to required data types
mydata$Time <- strptime(paste(mydata$Date, mydata$Time), format="%d/%m/%Y%H:%M:%S")
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
mydata$Global_reactive_power <- as.numeric(as.character(mydata$Global_reactive_power))
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3))
mydata$Voltage <- as.numeric(as.character(mydata$Voltage))

## Subset to required date range
mydata <- subset(mydata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Plot 2
png(file="plot2.png", width=480, height=480)
with(mydata, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()