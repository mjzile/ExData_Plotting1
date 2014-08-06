# set working directory to location of file 

setwd("~/R/Explore Data/exdata-data-household_power_consumption")

#assuming the dataset is downloaded to the current working directory

power <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE) 
# convert date and time 
power$Date <- as.Date(power$Date,  "%d/%m/%Y")


#subset days of interest 
subsetdata <- subset(power, Date == "2007-02-01")
subsetdata2 <- subset(power, Date == "2007-02-02")

#group data back together 
fullsubset <- rbind(subsetdata, subsetdata2)
# concatenate date and time for plot 
fullsubset$DayTime <- as.POSIXct(paste(fullsubset$Date, fullsubset$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")


#set file name and size 
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(fullsubset$DayTime, fullsubset$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(fullsubset$DayTime, fullsubset$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

plot(fullsubset$DayTime, fullsubset$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(fullsubset$DayTime, fullsubset$Sub_metering_2,  col= "red")
lines(fullsubset$DayTime, fullsubset$Sub_metering_3,  col= "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))  

plot(fullsubset$DayTime, fullsubset$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()