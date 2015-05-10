##Set working directory in R to where you have saved the 'household_power_consumption.txt' file.

##read the text file data in to a variable
powercons <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")

##subset the data to include only the two days 1/2/2007 and 2/2/2007
dat <- rbind(powercons[powercons$Date=="1/2/2007",], powercons[powercons$Date=="2/2/2007",])

##create a DateTime variable
dat$DateTime <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

##use png function to create a file that can save the plot image
png (filename = "plot4.png", width = 480, height = 480)

##set the plot structure so it can host four plots together
par(mfrow=c(2,2))

##create the plots
plot(dat$DateTime,dat$Global_active_power,type="l",ylab="Global Active Power", xlab="")
plot(dat$DateTime,dat$Voltage,type="l",ylab="Voltage", xlab="datetime")
with(dat,plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab="", type = "n"))
with(dat,lines(DateTime, Sub_metering_1, type = "l"))
with(dat,lines(DateTime, Sub_metering_2, type = "l", col="red"))
with(dat,lines(DateTime, Sub_metering_3, type = "l", col="blue"))
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dat$DateTime,dat$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")

##close the png file and connection
dev.off()