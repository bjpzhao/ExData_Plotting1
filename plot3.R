## Plot 3

## Reading data from the dates 2007-02-01 and 2007-02-02
## by counting the row number on where the dates start and end using 'read table'
data <- read.table("./data/household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637, nrow = 2880)

## Get the column headers
initial <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", nrow = 5)
header <- colnames(initial)
colnames(data) <- header

## Convert the Date and Time variables to Data/Time classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
with(data,{plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2~Datetime, col = "red")
lines(Sub_metering_3~Datetime, col = "blue")})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off