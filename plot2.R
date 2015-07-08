plot2 <- function(filename) {
	
### get and subset data
hpc <- read.csv("hpc.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
install.packages("dplyr")
library(dplyr)
h <- filter(hpc, Date == "1/2/2007" | Date == "2/2/2007")

### convert dates
h$Date <- as.Date(h$Date, format = "%d/%m/%Y")
dt <- paste(h$Date, h$Time)
h$dt <- as.POSIXct(dt)

### construct plot
png(filename = "plot2.png")
with(h, plot(dt, Global_active_power, xlab = " ", ylab = "Global Active Power (kilowatts)", type = "n"))
lines(h$dt, h$Global_active_power)
axis(side = 1, at = c("2007-02-01 00:00:0", "2007-02-02 00:00:0", "2007-02-03 00:00:0"), labels = c("Thu", "Fri", "Sat"))
dev.off()
}
