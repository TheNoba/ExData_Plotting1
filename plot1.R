household <- read.csv("./household_power_consumption.txt",sep=";",na.strings='?',header=TRUE,colClasses = c("character",rep("factor",1),rep("numeric",7)))
GlobalActivePower<-household[household$Date %in% c("1/2/2007","2/2/2007"),]
hist(GlobalActivePower$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")

dev.copy(png, file = "plot1.png")  ## copy the plot to a PNG file
dev.off()  ## close PNG device