##reading raw data
data_table <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, 
                       check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##extracting subset
data_sub <- subset(data_table, Date %in% c("1/2/2007","2/2/2007"))

##changing data type format of date and time
data_sub$Date <- as.Date(data_sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

#creating the plot
with(data_sub, {plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
                lines(Sub_metering_2~Datetime,col='Red')
                lines(Sub_metering_3~Datetime,col='Blue')})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
