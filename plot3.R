source(file="./getData.R")


df_name <- "powerConsumption"

if((exists(df_name)) && (is.data.frame(get(df_name)))){
  print("data frame exists")
} else {
  powerConsumption <- readData(wd="./")
}

##Plot 3

png(file="ExData_Plotting1/plot3.png", width = 480, height = 480, units="px")

plot(powerConsumption$Sub_metering_1 ~powerConsumption$dateTime, 
     type = "n", ylab="Energy sub metering", xlab ="")
lines(powerConsumption$Sub_metering_1 ~powerConsumption$dateTime, type = "l")
lines(powerConsumption$Sub_metering_2 ~powerConsumption$dateTime, type = "l", col= "red")
lines(powerConsumption$Sub_metering_3 ~powerConsumption$dateTime, type = "l", col= "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty = 1)

dev.off()