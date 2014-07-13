plot1 <- function(filename){
  #plot1("household_power_consumption.txt")
  
  #Reading the data
  powerCon<-read.table(filename, sep=";",header=TRUE)
  
  #Preparing the data
  powerCon$Date<-as.Date(powerCon$Date,"%d/%m/%Y")
  powerCon <- powerCon[powerCon$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
  powerCon<-subset(powerCon, powerCon$Global_active_power!="?")
  powerCon$Global_active_power <- as.numeric(levels(powerCon$Global_active_power)[powerCon$Global_active_power])

  #Plotting the data
  png(file = "plot1.png", width=480, height=480)
  hist(powerCon$Global_active_power, col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power",)
  dev.off()
  
}