##Set working directory in R to where you have saved the 'household_power_consumption.txt' file.

##read the text file data in to a variable
powercons <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")

##subset the data to include only the two days 1/2/2007 and 2/2/2007
dat <- rbind(powercons[powercons$Date=="1/2/2007",], powercons[powercons$Date=="2/2/2007",])

##create a DateTime variable
dat$DateTime <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

##use png function to create a file that can save the plot image
png (filename = "plot2.png", width = 480, height = 480)

##use plot function to create the plot
plot(dat$DateTime,dat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab="")

##close the png file and connection
dev.off()
