tipoVariable <- c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")
datos<-read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=tipoVariable)
datosEjemplo<-datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

fechaHora<-strptime(paste(datosEjemplo$Date, datosEjemplo$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

activePower<-as.numeric(datosEjemplo$Global_active_power)
subMetering1 <- as.numeric(datosEjemplo$Sub_metering_1)
subMetering2 <- as.numeric(datosEjemplo$Sub_metering_2)
subMetering3 <- as.numeric(datosEjemplo$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(fechaHora, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(fechaHora, subMetering2, type="l", col="red")
lines(fechaHora, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()