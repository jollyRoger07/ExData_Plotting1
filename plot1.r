##reading raw data
raw_data<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 

##reading subset
sub_data <- subset(raw_data, Date %in% c("1/2/2007","2/2/2007")) 

##changing data type to date format
sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y") 

##creating the plot
hist(sub_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     col="Red") 
dev.copy(png, file="plot1.png", height=480, width=480)