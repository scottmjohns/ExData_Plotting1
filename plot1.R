# Load the data.table package
library("data.table")

# Read in raw data, make into a data table, then save Feb 1-2 2007 data 
# in data table valid_dates_DT
data <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')
DT <- data.table(data)
valid_dates_DT <- DT[Date %in% c("1/2/2007","2/2/2007")]

# Data to be collected in histogram; convert from factors to numbers
x<-as.numeric(as.character(valid_dates_DT[,Global_active_power]))

# Draw plot and save as PNG
png('./plot1.png', width=480, height=480)
hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()