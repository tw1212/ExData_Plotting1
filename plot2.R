
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

# plot a line graph
plot(epc$Date_Time, epc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",col="black")

# save the device to a png file 
dev.copy(png,'plot2.png', width=480,height=480,units="px")

# close the device
dev.off()

