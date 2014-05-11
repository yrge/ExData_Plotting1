install.packages("sqldf")
require ("sqldf")
# get the data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql("household_power_consumption.txt",mySql)
head(myData)

# get the new "date type" column
DateTime<-paste(myData$Date, myData$Time)
myData$MergedDate = strptime(DateTime, "%d/%m/%Y %H:%M:%S")

# plot the plot1.png
png("plot1.png",width=480,height=480)
hist(myData$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()