## Plot 4

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

## Creat 2x2 frame
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))

## Plot 4
with(data, {
        plot(Global_active_power~Datetime, type = "l", ylab = "Global Active Power", xlab = "")
        plot(Voltage~Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2~Datetime, col = "red")
        lines(Sub_metering_3~Datetime, col = "blue")
        legend("topleft", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})

## Saving to file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off