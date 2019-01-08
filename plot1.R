setwd(("./ProgrAssignCourse4Week1/"))
if (!(file.exists("HPC.zip"))) {
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'HPC.zip')
  unzip('HPC.zip')
}
gap_fr<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings="?", stringsAsFactors=FALSE)
library(lubridate)
gap_fr$Date<-dmy(gap_fr$Date)
feb_gap_fr<-subset(gap_fr, Date<="2007-02-02"& Date>="2007-02-01")
png(file="plot1.png", width = 480, height = 480)
with(feb_gap_fr, hist(Global_active_power, col="red", main="Global Active Power",
                      xlab="Global Active Power (kilowatts)"))
dev.off()