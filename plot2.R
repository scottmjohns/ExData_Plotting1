# Load the data.table package
library("data.table")

# Read in raw data, make into a data table, then save Feb 1-2 2007 data 
# in data table valid_dates_DT
data <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')
DT <- data.table(data)
valid_dates_DT <- DT[Date %in% c("1/2/2007","2/2/2007")]

# x axis for is time
# y axis is a data field within valid_dates_DT
x <- strptime(paste(valid_dates_DT[,Date],valid_dates_DT[,Time]), "%d/%m/%Y %H:%M:%S")
y <-as.numeric(as.character(valid_dates_DT[,Global_active_power]))

# Draw plot and save as PNG
png('./plot2.png', width=480, height=480)
plot(x,y,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()