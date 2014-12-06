source(file="./getData.R")


df_name <- "powerConsumption"

if((exists(df_name)) && (is.data.frame(get(df_name)))){
  print("data frame exists")
} else {
  powerConsumption <- readData(wd="./")
}

##Plot 2

png(file="ExData_Plotting1/plot2.png", width = 480, height = 480, units="px")
plot(powerConsumption$Global_active_power ~powerConsumption$dateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()