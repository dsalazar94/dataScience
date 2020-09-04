
####---------------- Exploratory Data Analysis Project  1 ----------------

####---- Cleaning data

household <- read.table("Test Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric'
                               ,'numeric','numeric'))

head(household)


## Format date

household$Date <- as.Date(household$Date, "%d/%m/%Y")

head(household)

## Filter data from the dates 2007-02-01 and 2007-02-02. 

household <- subset(household,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

head(household)

## Remove incomplete values

household <- household[complete.cases(household),]

head(household)

## For plot 2 is necessary to combine date and time column

dateTime <- paste(household$Date, household$Time)

dateTime <- setNames(dateTime, "DateTime")

household <- household[ ,!(names(household) %in% c("Date","Time"))]

household <- cbind(dateTime, household)

household$dateTime <- as.POSIXct(dateTime)


####---- Making Plots

## Plot 1

hist(household$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.off()

## Plot 2

plot(household$Global_active_power~household$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()

## Plot 3

with(household, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

## Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(household, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()

