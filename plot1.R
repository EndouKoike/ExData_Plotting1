## store data set (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
## in working directory and then read txt file directly from R (without manually unzipping)
## for the only two days that course project 1 requests (1/2/2007 & 2/2/2007).

data <- subset(read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), 
        header=T, quote="\"", sep=";", stringsAsFactors = F), Date == "1/2/2007" | Date == "2/2/2007")

## covert Date & Time columns to correct format.
data <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))
data <- transform(data, Time = strptime(Time, "%H:%M:%S"))

## covert Global_active_power as numeric for the plot.
data <- transform(data, Global_active_power = as.numeric(Global_active_power))

## prepare a png file with certain name and dimensions course project 1 requests.
png(file="plot1.png",width=480,height=480)

## create historgram plot with the properties that course project 1 requests.
hist(data$Global_active_power,main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

## closing the png device.
dev.off()