household <- read.csv("./household_power_consumption.txt",sep=";",na.strings='?',header=TRUE,colClasses = c("character",rep("factor",1),rep("numeric",7)))
Data<-household[household$Date %in% c("1/2/2007","2/2/2007"),]
par(mfrow = c(2, 2))

plot(strptime(paste(Data$Date,Data$Time),"%d/%m/%Y %H:%M:%S"),Data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")

plot(strptime(paste(Data$Date,Data$Time),"%d/%m/%Y %H:%M:%S"),Data$Voltage,ylab="Voltage",xlab="datetime",type="l")

plot(strptime(paste(Data$Date,Data$Time),"%d/%m/%Y %H:%M:%S"),
     Data$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(strptime(paste(Data$Date,Data$Time),"%d/%m/%Y %H:%M:%S"),Data$Sub_metering_2,col="red")
lines(strptime(paste(Data$Date,Data$Time),"%d/%m/%Y %H:%M:%S"),Data$Sub_metering_3,col="blue")
legend(cex=0.7,"topright", lty=c(rep(1,3)), col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(strptime(paste(Data$Date,Data$Time),"%d/%m/%Y %H:%M:%S"),Data$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")

dev.copy(png, file = "plot4.png")  ## copy the plot to a PNG file
dev.off()  ## close PNG device