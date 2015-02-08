
# Read subet data created in readSubsetData.R and create Plot 2

data <- read.csv("./data.csv", na.strings = "?", colClasses = "character")

#put Date column in Date/Time format, change remainder to numeric
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
for (i in 3:9){data[,i] <- as.numeric(data[,i])}

#Plot 2 ---------------------------------------------------------------------
png(file = "plot2.png", bg = "transparent", height = 480, width = 480)
plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
