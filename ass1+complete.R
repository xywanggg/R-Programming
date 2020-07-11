##reads a directory full of files and reports the number of completely observed cases in each data file

#directory: a character vector of length 1 indicating
#the location of the csv files
#id: the monitor ID numbers to be used
#return: a data frame of the form:
#id nobs
#1  117
#2  1041
#...
#where id is the monitor id number
#and nobs is the number of complete cases

complete <- function(directory, id = 1:332) {
  comp <- data.frame(id=numeric(), nobs=numeric())
  for (i in id) {
    filename <- obsFileName(directory, i)
    data <- read.csv(filename)
    comp <- rbind(comp, data.frame(id=i, nobs=nrow(data[complete.cases(data), ])))
  }
  comp
}
