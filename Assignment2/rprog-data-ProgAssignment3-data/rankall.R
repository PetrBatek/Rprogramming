rankall = function(outcome, num = "best")
{
    if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))){
        stop("invalid outcome")
    }
    
    if (num == "best")
        num = 1
    data = read.csv("outcome-of-care-measures.csv")
    state = data$State
    state = unique(state)
    state = sort(state)
    hospital = vector()
    for (s in state)
    {
        names = vector()
        hospitalState = data.frame()
        hospInState = vector()
        pom = 0
        hospInState = (data[,7] == s)
        hospitalState = data[hospInState,]
        
        if (outcome == "heart attack")
        {
            hospitalState[,11] = as.numeric(hospitalState[,11])
            hospitalState = hospitalState[!is.na(hospitalState[,11]),]
            hospitalState = hospitalState[order(hospitalState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, hospitalState$Hospital.Name),]
            names = hospitalState[,2]
            if (num == "worst")
            {
                pom = length(hospitalState[,2])
                hospital = append(hospital,as.character(names[pom]))
            }   
            else
                hospital = append(hospital,as.character(names[num]))
        }
        
        else if (outcome == "heart failure")
        {
            hospitalState[,17] = as.numeric(hospitalState[,17])
            hospitalState = hospitalState[!is.na(hospitalState[,17]),]
            hospitalState = hospitalState[order(hospitalState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, hospitalState$Hospital.Name),]
            names = hospitalState[,2]
            if (num == "worst")
            {
                pom = length(hospitalState[,2])
                hospital = append(hospital,as.character(names[pom]))
            }   
            else
                hospital = append(hospital,as.character(names[num]))
        }
        else if (outcome == "pneumonia")
        {
            hospitalState[,23] = as.numeric(hospitalState[,23])
            hospitalState = hospitalState[!is.na(hospitalState[,23]),]
            hospitalState = hospitalState[order(hospitalState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, hospitalState$Hospital.Name),]
            names = hospitalState[,2]
            if (num == "worst")
            {
                pom = length(hospitalState[,2])
                hospital = append(hospital,as.character(names[pom]))
            }   
            else
                hospital = append(hospital,as.character(names[num]))
        }
    }
    dfOut = data.frame(hospital,state)
    return(dfOut)
}