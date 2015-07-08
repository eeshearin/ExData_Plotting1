plot1 <- function(filename) {
	hpc <- read.csv(as.character(filename), sep = ";")
	library(dplyr)
	hpc2 <- filter(hpc, Date=="1/2/2007" | Date=="2/2/2007")
	hist(as.numeric(hpc2$Global_active_power), col = "red", xlab = "Global Active 		Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
	}
