##########
# Plot 3 #
##########

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

hpcSub <- subset(hpc,Date %in% c("1/2/2007","2/2/2007")) #Extract data for Feb,1,2007 & Feb,2,2007

Date_Format <- as.Date(hpcSub$Date, format = "%d/%m/%Y") #Reformat date column
DateTime <- as.POSIXct(paste(Date_Format,hpcSub$Time))
hpcSub <- cbind(DateTime,hpcSub)

#Making the plot

png(filename = "plot3.png", height=480, width=480)

with(hpcSub, plot(hpcSub$DateTime, as.numeric(as.character(Sub_metering_1)),
        type="l", main="Global Active Power", xlab="",
        ylab="Global Active Power (kilowatts)",col="black"))
        lines(hpcSub$DateTime, as.numeric(as.character(hpcSub$Sub_metering_2)), col="red")
        lines(hpcSub$DateTime, as.numeric(as.character(hpcSub$Sub_metering_3)), col="blue")
        legend("topright",legend=names(hpc[7:9]),col=c("black","red","blue"),lty = 1,cex=.7)

dev.off()