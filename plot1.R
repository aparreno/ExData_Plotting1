#load data
df <- read.table('household_power_consumption.txt', sep=";", na.strings="?", header=TRUE) 
#convert Date column to date objects
df$Date <- as.Date(df$Date, "%d/%m/%Y")
# subset the data frame to the required days
data <- subset(df, Date>='2007/02/01' & df$Date<='2007/02/02')
#convert Time column to time objects
data$Time <- strptime(data$Time, "%H:%M:%S")
#open png file
png(file="plot1.png")
#set figure background
par(bg="transparent")
#plot the histogram
hist(data$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     col="red", 
     main="Global Active Power")
# close device
dev.off()

