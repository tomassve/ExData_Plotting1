# Create plot1 in Course Project 1/Exploratory Data Analysis
# Author: Tomas Svensson

# Initialization
dateOfIntrest <- c("1/2/2007", "2/2/2007")
srcFile <- "../data/household_power_consumption.txt"
plotFile <- "../figure/plot1.png"

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
with(data, {
  hist(Global_active_power, col="red", main = "Global Active Power",
                xlab="Global Active Power (kilowatts)")
})

dev.off()