f<-read.csv("household_power_consumption.txt",sep=";",na.strings = "?",header=TRUE,stringsAsFactors=FALSE)

f<-cbind(f,strptime(paste(f[,1],f[,2]), format="%d/%m/%Y %H:%M:%S"))
colnames(f)[10]<-"DateTime"


sub.df = subset(f, DateTime >= '2007-02-01' & DateTime < '2007-02-03')

png("plot3.png", width=480, height=480)

with(sub.df,plot(DateTime,Sub_metering_1,type="n",ylab="Energy sub metering"))
with(sub.df,points(DateTime,Sub_metering_1,type='l',col="black"))
with(sub.df,points(DateTime,Sub_metering_2,type='l',col="red"))
with(sub.df,points(DateTime,Sub_metering_3,type='l',col="blue"))
legend("topright", pch = "-",lwd=3, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


dev.off()