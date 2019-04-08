#This script assumes that the library "sqldf" has been installed
# Run the following script to install the sqldf library
# install.packages("sqldf") #uncomment and run this

#Load the sqldf library
library(sqldf)

#Read the rows where the date is 2/1/2007 or 2/2/2007. 
#This method will not require loading the data into a dataframe and subsetting it further.
df<-read.csv.sql("household_power_consumption.txt","select * from file where date in ('1/2/2007','2/2/2007')",header=TRUE,sep=";")

#Plot a histogram
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Copy the histogram to a file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

