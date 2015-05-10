##Set working directory in R to where you have saved the 'household_power_consumption.txt' file.
powercons <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")
dat <- rbind(powercons[powercons$Date=="1/2/2007",3], powercons[powercons$Date=="2/2/2007",3])
png (file="plot1.png", width=480, height=480)
hist(dat, col="red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power")
dev.off()
