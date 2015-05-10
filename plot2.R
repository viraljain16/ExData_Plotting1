##Set working directory in R to where you have saved the 'household_power_consumption.txt' file.
powercons <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")
dat <- rbind(powercons[powercons$Date=="1/2/2007",], powercons[powercons$Date=="2/2/2007",])
dat$DateTime <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
png (filename = "plot2.png", width = 480, height = 480)
plot(dat$DateTime,dat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
