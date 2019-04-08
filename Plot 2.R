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

#Plot the graph
plot(df$DateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Copy the image and save it to a file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()