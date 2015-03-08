f<-read.csv("household_power_consumption.txt",sep=";",na.strings = "?",header=TRUE,stringsAsFactors=FALSE)

f<-cbind(f,strptime(paste(f[,1],f[,2]), format="%d/%m/%Y %H:%M:%S"))
colnames(f)[10]<-"DateTime"


sub.df = subset(f, DateTime >= '2007-02-01' & DateTime < '2007-02-03')

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#with(airquality, {
#  plot(Wind, Ozone, main = "Ozone and Wind")
#  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
#  plot(Temp, Ozone, main = "Ozone and Temperature")
#  mtext("Ozone and Weather in New York City", outer = TRUE)
#})

with(sub.df,  {
  plot(sub.df$DateTime,sub.df$Global_active_power, xlab='',ylab='Global Active Power',type="l")
  plot(sub.df$DateTime,sub.df$Voltage, xlab='datetime',ylab='Voltage',type="l")
 
  with(sub.df,plot(DateTime,Sub_metering_1,type="n",xlab='',ylab="Energy sub metering"))
  with(sub.df,points(DateTime,Sub_metering_1,type='l',col="black"))
  with(sub.df,points(DateTime,Sub_metering_2,type='l',col="red"))
  with(sub.df,points(DateTime,Sub_metering_3,type='l',col="blue"))
  legend("topright", pch = "-",lwd=3, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  plot(sub.df$DateTime,sub.df$Global_reactive_power, xlab='datetime',ylab='Global_reactive_power',type="l")
  
})

#with(sub.df,plot(DateTime,Sub_metering_1,type="n",ylab="Energy sub metering"))
#with(sub.df,points(DateTime,Sub_metering_1,type='l',col="black"))
#with(sub.df,points(DateTime,Sub_metering_2,type='l',col="red"))
#with(sub.df,points(DateTime,Sub_metering_3,type='l',col="blue"))
#legend("topright", pch = "-",lwd=3, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


dev.off()