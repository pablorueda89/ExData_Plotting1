### PLOT 1

library(dplyr)
library(lubridate)

data_elec<-read.table(file="C:/Users/pdrs8/Desktop/Coursera/Exploratory Data Analysis/Project Week 1/ExData_Plotting1/household_power_consumption.txt",header = TRUE, sep=";")
time_elec<-as.data.frame(as.Date(strptime(data_elec$Date,format = ("%d/%m/%Y"))))
colnames(time_elec)<-"Date.1 "
DF_elec<-cbind(time_elec,data_elec)
DF<-select(DF_elec,-Date)
DF1<-complete.cases(DF)
DF2<-DF[DF1,]
DF2[,c(3:9)]<-sapply(DF2[,c(3:9)],as.numeric)
DF2<-filter(DF2,DF2$"Date.1" >= "2007-02-01" & DF2$"Date.1" <= "2007-02-02")


#Plot No.1

png(filename = "plot1.png",height =480,width = 480)
hist(DF2$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()

