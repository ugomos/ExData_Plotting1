plot2 <- function() {
        if(!file.exists('household.zip')){
                url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
                download.file(url,destfile = "household.zip")
        }
        unzip("houseold.zip")
        data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")
        data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
        start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
        end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
        data2<-data[start:end,]
        
        png(filename="plot2.png", width=480, height=480)
        plot(data2$DateTime, as.numeric(as.character(data2$Global_active_power)), type='l',ylab="Global Active Power (Kilowatts)", xlab="")
        dev.off()
}