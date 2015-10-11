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
png(file="plot3.png")
#set figure background
par(bg="transparent")
#plot the graphic
with(data, plot(data$Time, data$Sub_metering_1, 
                type="n",
                ylab="Energy sub metering",
                xlab = ""))
with(data, lines(data$Time, data$Sub_metering_1))
with(data, lines(data$Time, data$Sub_metering_2, col="red"))
with(data, lines(data$Time, data$Sub_metering_3, col="blue"))

#set legend
legend("topright", col = c("black","red", "blue"), lty = "solid",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# close device
dev.off()
