#set locale to english
Sys.setlocale(category="LC_TIME", locale="C")
#load data
df <- read.table('household_power_consumption.txt', sep=";", na.strings="?", header=TRUE) 
#convert Date column to date objects
df$Date <- as.Date(df$Date, "%d/%m/%Y")
# subset the data frame to the required days
data <- subset(df, Date>='2007/02/01' & df$Date<='2007/02/02')
#convert Time column to POSIXlt objects
data$timetemp <- paste(data$Date, data$Time) 
data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")
#open png file
png(file="plot2.png")
#set figure background
par(bg="transparent")
#plot the graphic
plot(data$Time, data$Global_active_power, 
     ylab="Global Active Power (kilowatts)",
     type = "l",
     xlab = "")
# close device
dev.off()
