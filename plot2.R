## Plot 2

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

## Plot 2
plot(data$Global_active_power~data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Saving to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off
