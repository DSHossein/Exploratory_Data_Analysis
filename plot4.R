#load the data to a data frame
df=read.csv('./data/household_power_consumption.txt',sep = ';')

#change the class of Date column to Date
df=transform(df,Date=as.Date(Date,"%d/%m/%Y"))
#subsetting the data based on two different Dates
Date1<-as.Date('2007/02/01')
Date2<-as.Date('2007/02/02')
df <- df[df$Date >= Date1 & df$Date <= Date2,]

#Adding Datetime column that easily concatanate date and time
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

#plot4

par(mfcol=c(2,2))
plot(as.numeric(df$Global_active_power)~df$Datetime, type="l",
     ylab="Global Active Power ", xlab="")

with(df,
     { plot(as.numeric(Sub_metering_1)~Datetime, type="l",
            ylab="Energy sub metering", xlab="")
       
       lines(as.numeric(Sub_metering_2)~Datetime,col='red')
       lines(as.numeric(Sub_metering_3)~Datetime,col='blue')
     }) 
     
plot(as.numeric(df$Voltage)~df$Datetime, type="l",
     ylab="Voltage", xlab="datetime")
plot(as.numeric(df$Global_reactive_power)~df$Datetime, type="l",
     ylab="Global_rective_Power ", xlab="datetime")


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
