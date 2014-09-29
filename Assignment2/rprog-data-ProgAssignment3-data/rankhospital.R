rankhospital = function(state,outcome, num = "best"){ 
    if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))){
        stop("invalid outcome")
    }
    
    allHospitals = read.csv("outcome-of-care-measures.csv", colClasses = "character")
    if(!(state %in% allHospitals[,7])){
        stop("invalid state")
    }
    
    outcomeHospitals = (allHospitals[,7] == state )
    data = allHospitals[outcomeHospitals,]
    ##rank = c(1:length(data))
    if ( num == "best")
        num = 1
        
    
    if (outcome == "heart attack"){
        data[,11] = as.numeric(data[,11])
        data = data[!is.na(data[,11]),]
        data = data[order(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, data$Hospital.Name),]
        if (num == "worst")
            num = length(data[,2])
        names = data[,2]
        return(names[num])
    }
    else if (outcome == "heart failure"){
        data[,17] = as.numeric(data[,17])
        data = data[!is.na(data[,17]),]
        data = data[order(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, data$Hospital.Name),]
        if (num == "worst")
            num = length(data[,2])
        names = data[,2]
        return(names[num])
    }
    else if (outcome == "pneumonia"){
        data[,23] = as.numeric(data[,23])
        data = data[!is.na(data[,23]),]
        data = data[order(data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, data$Hospital.Name),]
        if (num == "worst")
            num = length(data[,2])
        names = data[,2]
        return(names[num])
    }
    
}