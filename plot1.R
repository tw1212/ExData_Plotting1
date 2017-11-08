
## Import the header row so we can skip other rows later
header <- read.table('data/household_power_consumption.txt', nrows = 1, sep =';' , header = FALSE, stringsAsFactors = FALSE)

#  Read the data: skip the first 66,636 rows and import only 2,880 rows
#  This corrsponds to the data from 1/2/2007 and 2/2/2007
epc <- read.table   ("data/household_power_consumption.txt", sep = ";",header = TRUE,stringsAsFactors = FALSE,skip=66636,nrows=2880)

## Add column names from header
colnames(epc) <- unlist(header)

# cast the first column to Date
epc[,1] <- as.Date(epc[,1],"%d/%m/%Y")

# plot the histogram
hist(epc$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)",col="Red")

# save the device to a png file 
dev.copy(png,'plot1.png', width=480,height=480,units="px")

# close the device
dev.off()

