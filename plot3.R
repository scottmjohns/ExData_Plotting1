# Load the data.table package
library("data.table")

# Read in raw data, make into a data table, then save Feb 1-2 2007 data 
# in data table valid_dates_DT
data <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')
DT <- data.table(data)
valid_dates_DT <- DT[Date %in% c("1/2/2007","2/2/2007")]

# x axis is time
# y axes are different data fields within valid_dates_DT
# plot charts three different data sets (y1 y2 y3), 
# distinguished by color
x <- strptime(paste(valid_dates_DT[,Date],valid_dates_DT[,Time]), "%d/%m/%Y %H:%M:%S")
y1 <-as.numeric(as.character(valid_dates_DT[,Sub_metering_1]))
y2 <-as.numeric(as.character(valid_dates_DT[,Sub_metering_2]))
y3 <-as.numeric(as.character(valid_dates_DT[,Sub_metering_3]))

# Draw plot and save as PNG
png('./plot3.png', width=480, height=480)
plot(x,y1,type='n', xlab="", ylab="Energy sub metering")
points(x,y1,type="l",col="black")
points(x,y2,type="l",col="red")
points(x,y3,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()