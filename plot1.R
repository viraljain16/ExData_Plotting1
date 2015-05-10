##Set working directory in R to where you have saved the 'household_power_consumption.txt' file

##read the text file data in to a variable
powercons <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")

##subset the data to include only the two days 1/2/2007 and 2/2/2007
dat <- rbind(powercons[powercons$Date=="1/2/2007",3], powercons[powercons$Date=="2/2/2007",3])

##use png function to create a file that can save the plot image
png (file="plot1.png", width=480, height=480)

##use hist function to create the histogram
hist(dat, col="red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power")

##close the png file and connection
dev.off()
