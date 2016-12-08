## assignment

# read data
electric_data <- read.table("household_power_consumption.txt",sep=';',header=TRUE)

# clean data
electric_data$Date <- as.Date(electric_data$Date,"%d/%m/%Y")
electric_data_filter <- filter(electric_data,(Date=='2007-02-01') | (Date =='2007-02-02'))
electric_data_filter <- mutate(electric_data_filter, datetimeStr =  paste(Date, Time))   
electric_data_filter$datetime <- strptime(electric_data_filter$datetimeStr , "%Y-%m-%d %H:%M:%S")

# plot data:
png('plot2.png')
with(electric_data_filter, plot(datetime, as.numeric((as.character(electric_data_filter$Global_active_power))), 
                                type='n',
                                xlab="",
                                ylab='Global Active Power (kilowatts)'))
with(electric_data_filter, lines(datetime, as.numeric((as.character(electric_data_filter$Global_active_power)))))
dev.off()