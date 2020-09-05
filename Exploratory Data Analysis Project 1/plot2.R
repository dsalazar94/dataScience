
####---------------- Exploratory Data Analysis Project  1 ----------------

## Plot 2

plot(household$Global_active_power~household$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

png("plot2.png", width=480, height=480)

dev.off()
