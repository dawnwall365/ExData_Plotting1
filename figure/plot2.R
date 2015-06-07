setwd("D:/My RDocuments/coursera/cour4project1")
house_power <- read.table("D:/My RDocuments/coursera/cour4project1/household_power_consumption.txt",header = TRUE,sep = ';')
#house_power$Time <- strptime(house_power$Time,"%H:%M:%S")
house_power$Date <- as.Date(house_power$Date,"%d/%m/%Y")
str(house_power)
head(house_power)
tail(house_power)
from = as.Date("2007-02-01", format="%Y-%m-%d")
to = as.Date("2007-02-02", format="%Y-%m-%d")
a <- strptime("2007-02-02 23:21:00","%Y-%m-%d %H:%M:%S")
house_power_sub <-house_power[((house_power$Date >= from) & (house_power$Date <= to)),]
head(house_power_sub)
str(house_power_sub)
## Manipulate the hpc data
x <- strptime(paste(house_power_sub[,1], house_power_sub [,2]), format = "%Y-%m-%d %H:%M:%S")
house_power_sub <-house_power_sub[,-2]
house_power_sub[,1] <-as.POSIXct(x)
house_power_sub[,2] <- as.numeric(house_power_sub[,2])
#plot 2

png(filename="plot2.png", width=480, height=480)
plot(house_power_sub[,1], house_power_sub[,2], type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()