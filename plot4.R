
source(file="./getData.R")


df_name <- "powerConsumption"

if((exists(df_name)) && (is.data.frame(get(df_name)))){
  print("data frame exists")
} else {
  powerConsumption <- readData(wd="./")
}
##Plot 4
png(file="ExData_Plotting1/plot4.png", width = 480, height = 480, units="px")
par(mfrow = c(2,2))
plot(powerConsumption$Global_active_power ~powerConsumption$dateTime, type = "l", ylab = "Global Active Power", xlab="")

plot(powerConsumption$Voltage~ powerConsumption$dateTime, xlab="datetime", ylab="Voltage", type="l")

plot(powerConsumption$Sub_metering_1 ~powerConsumption$dateTime, type = "n", ylab="Energy sub metering", xlab ="")
lines(powerConsumption$Sub_metering_1 ~powerConsumption$dateTime, type = "l")
lines(powerConsumption$Sub_metering_2 ~powerConsumption$dateTime, type = "l", col= "red")
lines(powerConsumption$Sub_metering_3 ~powerConsumption$dateTime, type = "l", col= "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty = 1, bty="n")


with(powerConsumption, plot(Global_reactive_power~dateTime, xlab="datetime", type="l"))
dev.off()