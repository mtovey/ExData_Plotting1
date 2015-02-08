# First, read in the entire data set
allData <- read.csv("./household_power_consumption.txt", sep=";", na.strings = c("?"), colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# Subset to the two days we're interested in
projectData <- subset(allData, Date == '1/2/2007' | Date == '2/2/2007')
# Open a device stream to the plot 1 png file and plot a histogram on global active power to it
png(file="plot1.png")
with(projectData, hist(Global_active_power, col="red", main="Global Active Power", xlab = "Global active power (kilowatts)"))
# Make sure to close the device in order to create the file
dev.off()
