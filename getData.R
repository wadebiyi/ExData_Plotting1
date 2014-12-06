getFile <- function(wd="./") {
  setwd(wd)
  print(paste("Current Directory is",getwd()))
  ##File is missing, download file
  if (!file.exists("household_power_consumption.zip")){
    print("file not present: needs to download file")
    #     download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
    #                   destfile = "household_power_consumption.zip", 
    #                   method = "curl", 
    #                   extra = "--insecure")
  }
}



readData <- function(wd="./"){
  
  require(lubridate)
  require(sqldf)
  getFile(wd)
  
  tab5rows <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, nrows = 5, sep=";", stringsAsFactors = FALSE)
  classes <- sapply(tab5rows, class)
  
  dt <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, sep=";", stringsAsFactors = FALSE, na.strings="?", colClasses=classes)
  
  powerConsumption <- sqldf("select * from dt where Date = '1/2/2007' OR Date = '2/2/2007'")
  
  
  
  powerConsumption$dateTime <- with(powerConsumption, dmy_hms(paste(Date, Time)))
  
  return(powerConsumption)
}