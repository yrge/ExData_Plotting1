# get the data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql("household_power_consumption.txt",mySql)
head(myData)

# get the new "date type" column
DateTime<-paste(myData$Date, myData$Time)
myData$MergedDate = strptime(DateTime, "%d/%m/%Y %H:%M:%S")

# set the language to English
Sys.setlocale("LC_TIME", "en_US")

# plot4.png
png("plot4.png",width=480,height=480)
# use mfcol to arrange the plot sequence
par(mfcol=c(2,2))
# define the marginal
par(mar=c(4,4,2,2))
# first plot 
plot(myData$MergedDate,myData$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
# second plot 
plot(myData$MergedDate,myData$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(myData$MergedDate,myData$Sub_metering_2,col="red")
lines(myData$MergedDate,myData$Sub_metering_3,col="blue")
legend("topright",cex=0.7, lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# third plot 
plot(myData$MergedDate,myData$Voltage,type="l",col="black",xlab="datetime",ylab="Voltage")
# fourth plot 
plot(myData$MergedDate,myData$Global_reactive_power,type="l",col="black",xlab="datetime",ylab="Global_reactive_power")
dev.off()