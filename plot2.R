# First, read in the entire data set
allData <- read.csv("./household_power_consumption.txt", sep=";", na.strings = c("?"), colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# Subset to the two days we're interested in
projectData <- subset(allData, Date == '1/2/2007' | Date == '2/2/2007')
# Convert the 'Date' and 'Time' columns to an actual date/time
projectData$Date <- strptime(paste(projectData$Date, " ", projectData$Time), "%d/%m/%Y %H:%M:%S")
# Open a device stream to the plot 2 png file and plot a line plot on global active power/date to it
png(file="plot2.png")
with(projectData, plot(Date, Global_active_power, type="l", ylab = "Global active power (kilowatts)", xlab=""))
# Make sure to close the device in order to create the file
dev.off()