# get the data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql("household_power_consumption.txt",mySql)
head(myData)

# get the new "date type" column
DateTime<-paste(myData$Date, myData$Time)
myData$MergedDate = strptime(DateTime, "%d/%m/%Y %H:%M:%S")

# set the language to English
Sys.setlocale("LC_TIME", "en_US")

# plot plot2.png
png("plot2.png",width=480,height=480)
plot(myData$MergedDate,myData$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()