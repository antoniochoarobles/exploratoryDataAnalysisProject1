tipoVariable <- c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")
datos<-read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=tipoVariable)
datosEjemplo<-datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

fechaHora<-strptime(paste(datosEjemplo$Date, datosEjemplo$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

activePower<-as.numeric(datosEjemplo$Global_active_power)

png("plot2.png",height=480, width=480)
plot(fechaHora, activePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")



dev.off()