setwd(choose.dir())

##1 Plot the 30-day mortality rates for heart attack
outcome<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
head(outcome)
ncol(outcome)  ##number of columns
nrow(outcome)  ##number of rows
outcome[,11]<-as.numeric(outcome[,11])
hist(outcome[,11])


##2 Finding the best hospital in a state

best <- function(state, outcome) { 
  ## Read outcome data
  if (outcome == "heart attack") {
    outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  } else if (outcome == "heart failure") {
    outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  } else if (outcome == "pneumonia") {
    outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  }
  else {
    stop("invalid outcome")
  }
  data <- read.csv("outcome-of-care-measures.csv", stringsAsFactors=FALSE)
  
  ## Check that state and outcome are valid
  if (!state %in% data$State) {
    stop("invalid state")
  }
  ##sort data
  data <- data[data$State==state,]
  data[,outcome] <- suppressWarnings(as.numeric(data[,outcome]))
  data <- data[order(data[outcome], data$"Hospital.Name"),]
  as.character(data$"Hospital.Name"[!is.na(data[outcome])])  
  
  ## Return hospital name in that state with lowest 30-day death rate
  head(data$"Hospital.Name", 1)
}


