# load the file which is located in the current directory
file <-'household_power_consumption.txt'
data <- read.csv(file, header=TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.')

# subset the data from dates 2007-02-01 and 2007-02-02
subset_data <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

# acquire the numeric data for Sub_metering and format the date
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subMetering1 <- as.numeric(subset_data$Sub_metering_1)
subMetering2 <- as.numeric(subset_data$Sub_metering_2)
subMetering3 <- as.numeric(subset_data$Sub_metering_3)

# plot the graph
png('plot3.png', width = 480, height = 480)
plot(datetime, subMetering1, type = 'l',xlab = '', ylab = 'Energy sub metering', col = 'black')
lines(datetime, subMetering2, type = 'l', col = 'red')
lines(datetime, subMetering3, type = 'l', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, lwd = 3, col = c('black', 'red', 'blue'))
dev.off()