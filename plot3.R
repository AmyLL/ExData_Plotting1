
# Read subet data created in readSubsetData.R and create Plot 3

data <- read.csv("./data.csv", na.strings = "?", colClasses = "character")

#put Date column in Date/Time format, change remainder to numeric
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
for (i in 3:9){data[,i] <- as.numeric(data[,i])}

#Plot 3 ----------------------------------------------------------------------

y1 <- range(data$Sub_metering_1)  #range (0-38) -- set y axis limits
y2 <- range(data$Sub_metering_2)  #range (0 -2)
y3 <- range(data$Sub_metering_3)  #range (0-9)

png(file = "plot3.png", bg = "transparent", height = 480, width =480)
plot(data$Date, data$Sub_metering_1, type = "l", ylim = y1, xlab = "", ylab = "Energy sub metering")
lines(data$Date, data$Sub_metering_2,type = "l", col = "red", ylim = y1, xlab = "", ylab ="")
lines(data$Date, data$Sub_metering_3, type = "l", col = "blue", ylim = y1, xlab = "", ylab = "")
legend("topright", col = c("black", "red", "blue"),lty = c("solid", "solid", "solid"), legend = names(data[,7:9]))
dev.off()

