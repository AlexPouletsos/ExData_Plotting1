##########
# Plot 1 #
##########

#household_power_consumption.txt must be in working directory

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

hpcSub <- subset(hpc,Date %in% c("1/2/2007","2/2/2007")) #Extract data for Feb,1,2007 & Feb,2,2007

Date_Format <- as.Date(hpcSub$Date, format = "%d/%m/%Y") #Reformat date column
DateTime <- as.POSIXct(paste(Date_Format,hpcSub$Time))
hpcSub <- cbind(DateTime,hpcSub)

#Making the Plot

png(filename = "plot1.png", height=480, width=480)

hist(as.numeric(as.character(hpcSub$Global_active_power)),
        main="Global Active Power", xlab="Global Active Power (kilowatts)",
        col="red")

dev.off()
