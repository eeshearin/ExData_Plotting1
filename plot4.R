plot4 <- function(filename) {
			
### get and subset data
hpc <- read.csv("hpc.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
library(dplyr)
h <- filter(hpc, Date == "1/2/2007" | Date == "2/2/2007")

### convert dates
h$Date <- as.Date(h$Date, format = "%d/%m/%Y")
dt <- paste(h$Date, h$Time)
h$dt <- as.POSIXct(dt)

### construct file
png(filename = "plot4.png")
par(mfcol = c(2,2))

### construct plot 1
with(h, plot(dt, Global_active_power, xlab = " ", ylab = "Global Active Power", type = "n"))
lines(h$dt, h$Global_active_power)

### construct plot 2
with(h, plot(dt, Sub_metering_1, xlab = " ", ylab = "Energy sub metering", type = "n"))
lines(h$dt, h$Sub_metering_1, col = "black")
lines(h$dt, h$Sub_metering_2, col = "red")
lines(h$dt, h$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3"))

### construct plot 3
with(h, plot(dt, Voltage, xlab = "datetime", ylab = "Voltage", type = "n"))
lines(h$dt, h$Voltage)

### construct plot 4
with(h, plot(dt, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power ", type = "n"))
lines(h$dt, h$Global_reactive_power)

dev.off()
}
