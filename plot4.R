tipoVariable <- c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")
datos<-read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=tipoVariable)
datosEjemplo<-datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

fechaHora<-strptime(paste(datosEjemplo$Date, datosEjemplo$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

activePower<-as.numeric(datosEjemplo$Global_active_power)
reactivePower <- as.numeric(datosEjemplo$Global_reactive_power)
voltage <- as.numeric(datosEjemplo$Voltage)
subMetering1 <- as.numeric(datosEjemplo$Sub_metering_1)
subMetering2 <- as.numeric(datosEjemplo$Sub_metering_2)
subMetering3 <- as.numeric(datosEjemplo$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(fechaHora, activePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(fechaHora, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(fechaHora, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(fechaHora, subMetering2, type="l", col="red")
lines(fechaHora, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(fechaHora, reactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()