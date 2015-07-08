plot3 <- function(filename) {
		
### get and subset data
hpc <- read.csv("hpc.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
library(dplyr)
h <- filter(hpc, Date == "1/2/2007" | Date == "2/2/2007")

### convert dates
h$Date <- as.Date(h$Date, format = "%d/%m/%Y")
dt <- paste(h$Date, h$Time)
h$dt <- as.POSIXct(dt)

### construct plot
png(filename = "plot3.png")
with(h, plot(dt, Sub_metering_1, xlab = " ", ylab = "Energy sub metering", type = "n"))
lines(h$dt, h$Sub_metering_1, col = "black")
lines(h$dt, h$Sub_metering_2, col = "red")
lines(h$dt, h$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3"))
dev.off()
}
