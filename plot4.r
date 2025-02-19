##reading the raw data
raw<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, 
               stringsAsFactors=F, comment.char="", quote='\"')

##extraction of subset
sub <- subset(raw, Date %in% c("1/2/2007","2/2/2007"))

##chnaging data type of date and time
sub$Date <- as.Date(sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub$Date), sub$Time)
sub$Datetime <- as.POSIXct(datetime)

##creating graphs for plotting
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(sub, {plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
           plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
           plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
           lines(Sub_metering_2~Datetime,col='Red') 
           lines(Sub_metering_3~Datetime,col='Blue')
           legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
           plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")})
dev.copy(png, file="plot4.png", height=480, width=480)