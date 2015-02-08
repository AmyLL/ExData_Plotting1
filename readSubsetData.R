
#Read initial data, change date to date format and subset to only necessary rows
#Save as *.csv file for use in graphing to work with smaller data set

require(data.table)
require(lubridate)
filename <- "household_power_consumption.txt"

c1 <- fread(filename, select = c(1))
s1 <- as.Date(c1$Date, format("%d/%m/%Y"))
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
kr <- grep(date1, s1)   #rows with date 2007-02-01 length = 1440
kr2 <- grep(date2,s1)   #rows with dtae 2007-02-02
kr[1]		#1st row = 66637
krLast <- kr[1] + length(kr) -1  #last row = 68076
kr2[1]       #1st row = 68077
kr2Last <- kr2[1] + length(kr2) - 1     #last row = 69516
totRows <- kr2Last - kr[1]           #total rows to read = 2897

#read file of designated rows

dataNames <- read.csv2(filename, nrows = 1, header = TRUE)
dataNames <- names(dataNames)
data1 <- read.csv2(filename, skip = kr[1], nrows = totRows, col.names = dataNames)

#write table to file for further analysis
write.csv(data1, file = "data.csv", row.names = FALSE)
