##takes a directory of data files and a threshold for complete cases
##calculates the correlation between sulfate and nitrate for monitor locations 
##where the number of completely observed cases (on all variables) is greater than the threshold

#directory: the location of the csv files
#threshold: the number of completely pbserved observations
#return: a numeric vector of correlations
#note: do not round the result

corr <- function(directory, threshold = 0) {
  source("complete.R")
  source("obsFileName.R")
  observations <- complete(directory, 1:332)
  sulfate <- numeric()
  nitrate <- numeric()
  result <- numeric()
  for (i in observations$id[observations$nobs > threshold]) {
    filename <- obsFileName(directory, i)
    data <- read.csv(filename)
    result <- c(result, cor(data$sulfate, data$nitrate, use="complete.obs"))
  }
  result
}
