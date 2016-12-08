## assignment

# read data
electric_data <- read.table("household_power_consumption.txt",sep=';',header=TRUE)

# clean data
electric_data$Date <- as.Date(electric_data$Date,"%d/%m/%Y")
electric_data_filter <- filter(electric_data,(Date=='2007-02-01') | (Date =='2007-02-02'))
electric_data_filter <- mutate(electric_data_filter, datetimeStr =  paste(Date, Time))   
electric_data_filter$datetime <- strptime(electric_data_filter$datetimeStr , "%Y-%m-%d %H:%M:%S")

# plot data:
png('plot1.png')
hist(as.numeric((as.character(electric_data_filter$Global_active_power))), main='Global Active Power',col='red', xlab='Global Active Power (kilowatts)')
dev.off()