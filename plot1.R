source(file="./getData.R")


df_name <- "powerConsumption"

if((exists(df_name)) && (is.data.frame(get(df_name)))){
  print("data frame exists")
} else {
  powerConsumption <- readData(wd="./")
}

##Plot 1

png(file="ExData_Plotting1/plot1.png", width = 480, height = 480, units="px")
hist(powerConsumption$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()