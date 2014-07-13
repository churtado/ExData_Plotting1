plot2 <- function(filename){
  #plot2("household_power_consumption.txt")
  
  #Reading the data
  powerCon<-read.table(filename, header=TRUE, sep=";", dec=".", na.string="?")
  
  #Preparing the data
  powerCon$Datetime <- strptime(paste(powerCon$Date,powerCon$Time), "%d/%m/%Y %H:%M:%S")
  powerCon$Date<-as.Date(powerCon$Date,"%d/%m/%Y")
  powerCon <- powerCon[powerCon$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
  powerCon <- powerCon[complete.cases(powerCon$Global_active_power),]

  
  #Plotting the data
  png(file = "plot2.png", width=480, height=480)
  with(powerCon, plot(Datetime,Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab=""))
  dev.off()
  
}