
# Read subet data created in readSubsetData.R and create Plot 1

data <- read.csv("./data.csv", na.strings = "?", colClasses = "character")

#put Date column in Date/Time format, change remainder to numeric
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
for (i in 3:9){data[,i] <- as.numeric(data[,i])}

#Plot 1 --------------------------------------------------------------------
png(file = "plot1.png", bg = "transparent", height = 480, width = 480)
hist(data[,3], xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red",
	main = "Global Active Power")
main = "Global Active Power"
dev.off()
