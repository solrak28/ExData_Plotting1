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

#Creating the plot 1 into a png file
png(filename = "plot1.png", width = 480, height = 480)
hist(household5$Global_active_power, breaks = 13,
                xlab = "Global Active Power (kilowatts)", 
                main = "Global Active Power", col = "red")
dev.off()
