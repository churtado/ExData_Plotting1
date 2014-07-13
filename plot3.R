plot3 <- function(filename){
  #plot3("household_power_consumption.txt")
  
  #Reading the data
  powerCon<-read.table(filename, header=TRUE, sep=";", dec=".", na.string="?")
  
  #Preparing the data
  powerCon$Datetime <- strptime(paste(powerCon$Date,powerCon$Time), "%d/%m/%Y %H:%M:%S")
  powerCon$Date<-as.Date(powerCon$Date,"%d/%m/%Y")
  powerCon <- powerCon[powerCon$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
  powerCon <- powerCon[complete.cases(powerCon$Sub_metering_1),]
  powerCon <- powerCon[complete.cases(powerCon$Sub_metering_2),]
  powerCon <- powerCon[complete.cases(powerCon$Sub_metering_3),]
  
  #Plotting the data
  png(file = "plot3.png", width=480, height=480)
  plot(powerCon$Datetime, powerCon$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
  lines (powerCon$Datetime, powerCon$Sub_metering_2, type = "l", col = "red")
  points (powerCon$Datetime,powerCon$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  dev.off()
  
}