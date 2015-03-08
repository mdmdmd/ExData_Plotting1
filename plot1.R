f<-read.csv("household_power_consumption.txt",sep=";",na.strings = "?",header=TRUE,stringsAsFactors=FALSE)

f<-cbind(f,strptime(paste(f[,1],f[,2]), format="%d/%m/%Y %H:%M:%S"))
colnames(f)[10]<-"DateTime"


sub.df = subset(f, DateTime >= '2007-02-01' & DateTime < '2007-02-03')

png("plot1.png", width=480, height=480)
hist(sub.df$Global_active_power,xlab='Global Active Power(kilowatts)',main='Global Active Power',col = "red", font = 3)
dev.off()