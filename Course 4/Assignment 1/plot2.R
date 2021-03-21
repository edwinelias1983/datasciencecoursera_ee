power <- read.table('household_power_consumption.txt', header = TRUE, sep = ";",stringsAsFactors = FALSE ,
                    quote = " ", na.strings = "?", skip = 66636, nrows = 2880)

colnames(power) <- c('Date','Time','GlobalActivePower', 'GlobalReactivePower','Voltage','GlobalIntensity', 'SubMetering1',
                    'SubMetering2','Submetering3')
power$Date2 <-strptime(paste(power$Date, power$Time), format = '%d/%m/%Y %H:%M:%S')
power$Date <-lubridate::dmy(power$Date)

png(filename = "plot2.png")
plot(power$Date2,power$GlobalActivePower, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()



  





