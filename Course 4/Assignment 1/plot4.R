power <- read.table('household_power_consumption.txt', header = TRUE, sep = ";",stringsAsFactors = FALSE ,
                    quote = " ", na.strings = "?", skip = 66636, nrows = 2880)

colnames(power) <- c('Date','Time','GlobalActivePower', 'GlobalReactivePower','Voltage','GlobalIntensity', 'SubMetering1',
                     'SubMetering2','Submetering3')
power$Date2 <-strptime(paste(power$Date, power$Time), format = '%d/%m/%Y %H:%M:%S')
power$Date <-lubridate::dmy(power$Date)


png(filename = "plot4.png")
par(mfrow = c(2,2))

#plot1
plot(power$Date2,power$GlobalActivePower, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")

#plot2
plot(x = power$Date2, y= power$Voltage, type = "l", xlab = "Dateime", ylab = "Voltage")

#plot3
plot(power$Date2, power$SubMetering1,type = "l", xlab = NA, ylab = "Energy Submetering")
lines(power$Date2, power$SubMetering2, type = "l", col= "red")
lines(power$Date2, power$Submetering3, type = "l", col= "blue")
legend("topright", lwd = 2, col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
plot(power$Date2, power$GlobalActivePower, type = "l", xlab = "Datetime", ylab = "Global_active_power")
dev.off()