##calculates the mean of a pollutant across a specified list of monitors

#directory: contains monitors' particulate matter data 
#pollutant: sulfate or nitrate
#'id': given a vector monitor ID numbers
#returns the mean of the pollutant across all of the monitors
#ignoring any missing values coded as NA.

pollutantmean <- function(directory, pollutant, id = 1:332) {
  source("obsFileName.R")
  allData <- numeric()
  for (i in id) {
    filename <- obsFileName(directory, i)
    data <- read.csv(filename)
    if (pollutant == "sulfate") {
      allData <- c(allData, data$sulfate)
    } else if (pollutant == "nitrate") {
      allData <- c(allData, data$nitrate)
    }
  }
  mean(allData, na.rm=TRUE)
}
