
# set working directory to location of file 

setwd("~/R/Explore Data/exdata-data-household_power_consumption")

#assuming the dataset is downloaded to the current working directory

power <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE) 

# convert date and time 
power$Date <- as.Date(power$Date,  "%d/%m/%Y")
power$Time <- strptime(power$Time,  "%H:%M:%S")

#subset days of interest 
subsetdata <- subset(power, Date == "2007-02-01")
subsetdata2 <- subset(power, Date == "2007-02-02")

#group data back together 
fullsubset <- rbind(subsetdata, subsetdata2)

#set file name and size 
png(filename="plot1.png", width=480, height=480)

hist(fullsubset$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
