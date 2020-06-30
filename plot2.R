### PLOT 2


library(dplyr)
library(lubridate)

data_elec<-read.table(file="C:/Users/pdrs8/Desktop/Coursera/Exploratory Data Analysis/Project Week 1/ExData_Plotting1/household_power_consumption.txt",header = TRUE, sep=";")
DF1<-complete.cases(data_elec)
DF2<-data_elec[DF1,]

b<- as.data.frame(as.POSIXct(as.character(paste(DF2$Date, DF2$Time)), format="%d/%m/%Y %H:%M:%S"))
colnames(b)<-"Time.1"
DF3<-cbind(b,DF2)

#DF2$Time<-as.POSIXct(DF2$Time,format="%H:%M:%S")
DF3$Date<-as.Date(strptime(DF3$Date,format = ("%d/%m/%Y")))


DF3[,c(4:10)]<-sapply(DF3[,c(4:10)],as.numeric)
DF3<-filter(DF3,DF3$Date >= "2007-02-01" & DF3$Date<= "2007-02-02")




png(filename = "plot2.png",height =480,width = 480)
plot(DF3$Global_active_power~DF3$Time.1,type = "l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()



