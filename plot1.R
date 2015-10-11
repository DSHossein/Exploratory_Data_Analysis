
#load the data to a data frame
df=read.csv('./data/household_power_consumption.txt',sep = ';')

#change the class of Date column to Date
df=transform(df,Date=as.Date(Date,"%d/%m/%Y"))
#subsetting the data based on two different Dates
Date1<-as.Date('2007/02/01')
Date2<-as.Date('2007/02/02')
df <- df[df$Date >= Date1 & df$Date <= Date2,]

#plot1
hist(as.numeric(df$Global_active_power),col='red',xlab = 'Global Active Power(kilowats)',main = 'Global Active Power')
dev.copy(png,file='plot1.png',height=480, width=480)
dev.off()
