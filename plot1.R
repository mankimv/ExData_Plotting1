setwd(("./ProgrAssignCourse4Week1/"))
gap_fr<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings="?", stringsAsFactors=FALSE)
library(lubridate)
gap_fr$Date<-dmy(gap_fr$Date)
feb_gap_fr<-subset(gap_fr, Date<="2007-02-02"& Date>="2007-02-01")
png(file="plot1.png")
with(feb_gap_fr, hist(Global_active_power, col="red", main="Global Active Power",
                      xlab="Global Active Power (kilowatts)"))
dev.off()