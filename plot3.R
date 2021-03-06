get_data <- read.table("C:/Users/Dell/Desktop/coursera/household_power_consumption.txt",skip=1,sep=";")
names(get_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
get_datetime <- subset(get_data,get_data$Date=="1/2/2007" | get_data$Date =="2/2/2007")
get_datetime$Time <- strptime(get_datetime$Time, format="%H:%M:%S")
get_datetime[1:1440,"Time"] <- format(get_datetime[1:1440,"Time"],"2007-02-01 %H:%M:%S")
get_datetime[1441:2880,"Time"] <- format(get_datetime[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(get_datetime$Time,get_datetime$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(get_datetime,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(get_datetime,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(get_datetime,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")