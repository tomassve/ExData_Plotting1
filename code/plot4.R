# Create plot4 in Course Project 1/Exploratory Data Analysis
# Author: Tomas Svensson

# Initialization
dateOfIntrest <- c("1/2/2007", "2/2/2007")
srcFile <- "../data/household_power_consumption.txt"
plotFile <- "../figure/plot4.png"
Sys.setlocale("LC_ALL","C")

# Load data if not already done
if (!exists("dataAlreadyLoaded")) {
  # Data downloaded on Sat Jun 07 09:19:26 2014 from:
  #   "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

  
  # Read local file
  data <- read.csv2(srcFile, dec=".", na.strings="?")
  
  # Get relevant subset
  data <- subset( data, Date %in% dateOfIntrest )
  
  # Convert to DateTime class
  data$DateTime <- strptime(with(data, paste(Date,Time)),"%d/%m/%Y %H:%M:%S")
  
  # Avail loading and converting next time
  dataAlreadyLoaded <-TRUE;
}

# Open plot device
png(filename=plotFile, bg = "transparent", width=480, height=480)

# Create plot
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data, {
  plot(DateTime, Global_active_power, type="l" , 
                  xlab="", ylab="Global Active Power")
  
  plot(DateTime, Voltage, type="l", xlab="datetime" )
  
  plot(DateTime, Sub_metering_1, type="l", col="black" , 
       xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1), col = c("black","red","blue"))
  
  plot(DateTime, Global_reactive_power, type="l", xlab="datetime" )
  
})


dev.off()
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) + 0.1, oma = c(0,0,0,0))