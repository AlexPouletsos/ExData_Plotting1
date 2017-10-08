##########
# Plot 4 #
##########

#household_power_consumption.txt must be in working directory

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

hpcSub <- subset(hpc,Date %in% c("1/2/2007","2/2/2007")) #Extract data for Feb,1,2007 & Feb,2,2007

Date_Format <- as.Date(hpcSub$Date, format = "%d/%m/%Y") #Reformat date column
DateTime <- as.POSIXct(paste(Date_Format,hpcSub$Time))
hpcSub <- cbind(DateTime,hpcSub)

#Making the plot

png(filename = "plot4.png", height=480, width=480) #saves png file to working directory

par(mfrow=c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

#Top Left
with(hpcSub, plot(hpcSub$DateTime, as.numeric(as.character(Global_active_power)),
        type="l",
        xlab="", ylab="Global Active Power"))

#Top Right
with(hpcSub, plot(hpcSub$DateTime, as.numeric(as.character(Voltage)),
        type="l",
        xlab="datetime", ylab="Voltage"))

#Bottom Left
with(hpcSub, plot(hpcSub$DateTime, as.numeric(as.character(Sub_metering_1)),
        type="l", xlab="",
        ylab="Energy sub metering",col="black"))
        lines(hpcSub$DateTime, as.numeric(as.character(hpcSub$Sub_metering_2)), col="red")
        lines(hpcSub$DateTime, as.numeric(as.character(hpcSub$Sub_metering_3)), col="blue")
        legend("topright",legend=names(hpc[7:9]),col=c("black","red","blue"),lty = 1,bty="n")

#Bottom Right
with(hpcSub, plot(hpcSub$DateTime, as.numeric(as.character(Global_reactive_power)),
        type="l",
        xlab="datetime", ylab="Global_reactive_power"))

dev.off()
