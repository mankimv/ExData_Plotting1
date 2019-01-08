setwd("./ProgrAssignCourse4Week1/")
if (!(file.exists("HPC.zip"))) {
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'HPC.zip')
  unzip('HPC.zip')
}
gap_fr<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings="?", stringsAsFactors=FALSE)
library(lubridate)
gap_fr$Date<-dmy(gap_fr$Date)
gap_fr$DateTime <- paste(gap_fr$Date, gap_fr$Time)
gap_fr$DateTime<-strptime(gap_fr$DateTime, format="%Y-%m-%d %H:%M:%S")
feb_gap_fr<-subset(gap_fr, Date<="2007-02-02"& Date>="2007-02-01")
png(file="plot3.png", width = 480, height = 480)
with(feb_gap_fr, plot(DateTime, Sub_metering_1,  type="l",
                      xlab="", ylab="Energy Submetering"))
par(new=TRUE)#instead of starting a new plot, superimposing 2nd graph on the existing plot
with(feb_gap_fr, plot(DateTime, Sub_metering_2,  type="l",
                      col="red", axes = FALSE, xlab = "", ylab = "",
                      ylim=c(0,max(feb_gap_fr$Sub_metering_1))))#preserving the scale of y-axis
par(new=TRUE)#instead of starting a new plot, superimposing 3rd graph on the existing plot
with(feb_gap_fr, plot(DateTime, Sub_metering_3,  type="l",
                      col="blue", axes = FALSE,xlab = "", ylab = "",
                      ylim=c(0,max(feb_gap_fr$Sub_metering_1))))#preserving the scale of y-axis
legend("topright", lty = 1, col=c("black", "blue", "red"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()