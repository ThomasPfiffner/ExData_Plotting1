## assignment

# read data
electric_data <- read.table("household_power_consumption.txt",sep=';',header=TRUE)

# clean data
electric_data$Date <- as.Date(electric_data$Date,"%d/%m/%Y")
electric_data_filter <- filter(electric_data,(Date=='2007-02-01') | (Date =='2007-02-02'))
electric_data_filter <- mutate(electric_data_filter, datetimeStr =  paste(Date, Time))   
electric_data_filter$datetime <- strptime(electric_data_filter$datetimeStr , "%Y-%m-%d %H:%M:%S")

# plot data:
png('plot3.png')
with(electric_data_filter, plot(datetime, Sub_metering_1, 
                                type='n',
                                xlab="",
                                ylab='Energy sub metering',
                                ylim=c(0,40)))
with(electric_data_filter, lines(datetime, as.numeric(as.character(Sub_metering_1))))
with(electric_data_filter, lines(datetime, as.numeric(as.character(Sub_metering_2)), col='red'))
with(electric_data_filter, lines(datetime, Sub_metering_3, col='blue'))
legend("topright", col =c("black", "red", "blue"), pch=c(NA,NA,NA),lty=c(1,1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
dev.off()