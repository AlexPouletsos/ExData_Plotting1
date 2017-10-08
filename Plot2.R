##########
# Plot 2 #
##########

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

hpcSub <- subset(hpc,Date %in% c("1/2/2007","2/2/2007")) #Extract data for Feb,1,2007 & Feb,2,2007

Date_Format <- as.Date(hpcSub$Date, format = "%d/%m/%Y") #Reformat date column
DateTime <- as.POSIXct(paste(Date_Format,hpcSub$Time))
hpcSub <- cbind(DateTime,hpcSub)

#Making the plot

with(hpcSub, plot(hpcSub$DateTime, as.numeric(as.character(Global_active_power)),
        type="l",
        main="Global Active Power",
        xlab="", ylab="Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png")
dev.off()
