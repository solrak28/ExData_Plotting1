#Reading the whole dataset
household <- read.table("household_power_consumption.txt", header = T, 
                stringsAsFactors = F, dec = ".", 
                sep = ";", na.strings = "?")

#Subsetting the 2-day period requested to do the plots
household2 <- household[household$Date == "1/2/2007", ]
household3 <- household[household$Date == "2/2/2007", ]
household4 <- rbind(household2, household3)
newdate <- as.POSIXct(paste(household4$Date, household4$Time), 
                format="%d/%m/%Y %H:%M:%S")
household5 <- cbind(household4, newdate)

#Creating the plot 4 into a png file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(household5$newdate, household5$Global_active_power, type = "l", 
                xlab = "", ylab = "Global Active Power")
plot(household5$newdate, household5$Voltage, type = "l", xlab = "datetime",
                ylab = "Voltage")
plot(household5$newdate, household5$Sub_metering_1, type = "n", xlab = "",
                ylab = "Energy sub metering")
lines(household5$newdate, household5$Sub_metering_1)
lines(household5$newdate, household5$Sub_metering_2, col = "red")
lines(household5$newdate, household5$Sub_metering_3, col = "blue")	
legend("topright", lty = 1, bty = "n", cex = 0.7, 
                col = c("black", "red", "blue"), 
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(household5$newdate, household5$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
