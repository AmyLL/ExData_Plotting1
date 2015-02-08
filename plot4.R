
# Read subet data created in readSubsetData.R and create Plot 4
data <- read.csv("./data.csv", na.strings = "?", colClasses = "character")

#put Date column in Date/Time format, change remainder to numeric
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
for (i in 3:9){data[,i] <- as.numeric(data[,i])}

#Plot 4 -------------------------------------------------------------------------

png(file = "plot4.png", bg = "transparent", height = 480, width = 480)
par(mfrow = c(2,2))
plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$Date, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$Date, data$Sub_metering_1, type = "l", ylim = y1, xlab = "", ylab = "Energy sub metering")
lines(data$Date, data$Sub_metering_2,type = "l", col = "red", ylim = y1, xlab = "", ylab ="")
lines(data$Date, data$Sub_metering_3, type = "l", col = "blue", ylim = y1, xlab = "", ylab = "")
legend("topright", bty = "n", col = c("black", "red", "blue"),lty = c("solid", "solid", "solid"), legend = names(data[,7:9]))
plot(data$Date, data$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()	
