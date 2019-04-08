#This script assumes that the library "sqldf" has been installed
# Run the following script to install the sqldf library
# install.packages("sqldf") #uncomment and run this

#Load the sqldf library
library(sqldf)

#Read the rows where the date is 2/1/2007 or 2/2/2007. 
#This method will not require loading the data into a dataframe and subsetting it further.
df<-read.csv.sql("household_power_consumption.txt","select * from file where date in ('1/2/2007','2/2/2007')",header=TRUE,sep=";")

#Add the column "DateTime" by combining the date and time columns together
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

#Create a layout with 2 rows and 2 columns for the graph
par(mfrow = c(2, 2)) 

#Plot the first graph
plot(df$DateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plot the second graph
plot(df$DateTime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot the third graph for sub metering 1 in black (default)
plot(df$DateTime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
#Draw the lines for sub metering 2 in red
lines(df$DateTime, df$Sub_metering_2, type="l", col="red")
#Draw the lines for sub metering 3 in blue
lines(df$DateTime, df$Sub_metering_3, type="l", col="blue")
#Put the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Plot the fourth graph
plot(df$DateTime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Copy the image and save it to a file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
