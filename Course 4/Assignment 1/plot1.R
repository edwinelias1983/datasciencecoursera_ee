url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dest <- "/Users/edwinelias/Desktop/R/PDSwR2/hw_1.zip"
download.file(url, destfile = dest, method = "curl", quiet = T)

# checking memory size 
# library(pryr)
mem_used()
object_size(hw_1.zip)
oject_size(power)


unzip(zipfile = 'hw_1.zip')                 
power <- read.table('household_power_consumption.txt', header = TRUE, sep = ";",stringsAsFactors = FALSE ,
                    quote = " ", na.strings = "?", skip = 66636, nrows = 2880)


#different manner to obtain the dates
#which(power$Date == "2007-02-01") #66637-67636
#which(power$Date == "2007-02-02") # 68077-69076
#power <- power[66637:69076,]  

colnames(power) <- c('Date','Time','GlobalActivePower', 'GlobalReactivePower','Voltage','GlobalIntensity', 'SubMetering1',
                     'SubMetering2','Submetering3')
colnames(power)

power$Date2 <-strptime(paste(power$Date, power$Time), format = '%d/%m/%Y %H:%M:%S')
power$Date <-lubridate::dmy(power$Date)
# lubridate from tiverse helps with dates

str(power)

png(filename = "plot1.png")
hist(power$GlobalActivePower,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
with(power, hist(power$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)" ,main = "Global Active Power"))
dev.off()


