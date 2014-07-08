# Load the data.table package
library("data.table")

# Read in raw data, make into a data table, then save Feb 1-2 2007 data 
# in data table valid_dates_DT
data <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')
DT <- data.table(data)
valid_dates_DT <- DT[Date %in% c("1/2/2007","2/2/2007")]

# x axis for all four plots is time
# y axes are different data fields within valid_dates_DT
# third plot charts three different data sets (y31 y32 y33), 
# distinguished by color
x <- strptime(paste(valid_dates_DT[,Date],valid_dates_DT[,Time]), "%d/%m/%Y %H:%M:%S")
y1 <-as.numeric(as.character(valid_dates_DT[,Global_active_power]))
y2 <-as.numeric(as.character(valid_dates_DT[,Voltage]))
y31 <-as.numeric(as.character(valid_dates_DT[,Sub_metering_1]))
y32 <-as.numeric(as.character(valid_dates_DT[,Sub_metering_2]))
y33 <-as.numeric(as.character(valid_dates_DT[,Sub_metering_3]))
y4 <-as.numeric(as.character(valid_dates_DT[,Global_reactive_power]))

# Draw plots and save as PNG
png('./plot4.png', width=480, height=480)
par(mfrow=c(2,2), oma=c(0.5,0.5,1,0.5), mar=c(4,4,1,1))
plot(x,y1,type="l", xlab="", ylab="Global Active Power")
plot(x,y2,type="l", xlab="datetime", ylab="Voltage")
plot(x,y31,type='n', xlab="", ylab="Energy sub metering")
points(x,y31,type="l",col="black")
points(x,y32,type="l",col="red")
points(x,y33,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty="n", cex=1.0, lty=c(1,1,1), col=c("black", "red", "blue"))
plot(x,y4,type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()