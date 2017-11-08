
## Import the header row so we can skip other rows later
header <- read.table('data/household_power_consumption.txt', nrows = 1, sep =';' , header = FALSE, stringsAsFactors = FALSE)

#  Read the data: skip the first 66,636 rows and import only 2,880 rows
#  This corrsponds to the data from 1/2/2007 and 2/2/2007
epc <- read.table   ("data/household_power_consumption.txt", sep = ";",header = TRUE,stringsAsFactors = FALSE,skip=66636,nrows=2880)

## Add column names from header
colnames(epc) <- unlist(header)

## add a new column to combine Date and Time
require(dplyr)
epc<-mutate(epc, Date_Time = as.POSIXct(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S"))

## Get a subset of the data to plot
metering <- select(epc, Date_Time, Sub_metering_1:Sub_metering_3)

plot(metering$Date_Time,metering$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")

# Plot Sub_metering_1
lines(metering$Date_Time,metering$Sub_metering_1)
# Plot Sub_metering_2
lines(metering$Date_Time,metering$Sub_metering_2, col="red")
# Plot Sub_metering_3
lines(metering$Date_Time,metering$Sub_metering_3, col="blue")

## Add the legend
legend("topright", lty = 1,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# save the device to a png file 
dev.copy(png,'plot3.png', width=480,height=480,units="px")

# close the device
dev.off()

