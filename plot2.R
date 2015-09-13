# load the file which is located in the current directory
file <-'household_power_consumption.txt'
data <- read.csv(file, header=TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.')

# subset the data from dates 2007-02-01 and 2007-02-02
subset_data <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

# acquire the numeric data for global_active_power and format the date
Global_active_power <- as.numeric(subset_data$Global_active_power)
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png('plot2.png', width = 480, height = 480)
plot(datetime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()