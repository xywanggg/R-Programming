##3 Ranking hospitals by outcome in a state

rankhospital <- function(state, outcome, num = "best") { 
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
  
  ## Return hospital name in that state with the given rank 30-day death rate
  if (num=="best") {
    head(data$"Hospital.Name", 1)
  } else if (num=="worst") {
    tail(data$"Hospital.Name", 1)
  } else {
    data$"Hospital.Name"[num]
  }
}
