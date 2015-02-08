# First, read in the entire data set
allData <- read.csv("./household_power_consumption.txt", sep=";", na.strings = c("?"), colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# Subset to the two days we're interested in
projectData <- subset(allData, Date == '1/2/2007' | Date == '2/2/2007')
# Convert the 'Date' and 'Time' column to an actual date/time
projectData$Date <- strptime(paste(projectData$Date, " ", projectData$Time), "%d/%m/%Y %H:%M:%S")
# Open a device stream to write the 4 plots to, then set mfcol for the device
png(file="plot4.png")
par(mfcol=c(2,2))
# First plot (top left), same as plot 1 but with an adjusted title
with(projectData, plot(Date, Global_active_power, type="l", ylab = "Global Active Power", xlab=""))
# Second plot (bottom left), same as plot 3 but with adjusted legend
with(projectData,plot(Date,Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
# Add points for sub metering 1, 2 and 3, with the same colors as the example to the plot
with(projectData, points(Date, Sub_metering_1, type="l", col="black"))
with(projectData, points(Date, Sub_metering_2, type="l", col="red"))
with(projectData, points(Date, Sub_metering_3, type="l", col="blue"))
# Now, add a legend with the three line colors to the plot
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1, bty="n")
# Third plot (top right), voltage against date/time
with(projectData, plot(Date, Voltage, type="l", ylab = "Voltage", xlab="datetime"))
# Fourth plot (bottom right), global reactive power against date/time
with(projectData, plot(Date, Global_reactive_power, type="l", xlab="datetime"))
# Make sure to close the device in order to create the file
dev.off()