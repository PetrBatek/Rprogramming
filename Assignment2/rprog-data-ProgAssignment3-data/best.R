best = function(state,outcome){ 
        if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))){
            stop("invalid outcome")
        }
    
        allHospitals = read.csv("outcome-of-care-measures.csv", colClasses = "character")
        if(!(state %in% allHospitals[,7])){
            stop("invalid state")
        }
        
        outcomeHospitals = (allHospitals[,7] == state)
        data = allHospitals[outcomeHospitals,]
        
        if (outcome == "heart attack"){
            data[,11] = as.numeric(data[,11])
            m = min(data[,11], na.rm =TRUE)
            inds = which(data[,11] == m)
            names = data[inds,2]
            sort(names)
            return(names[1])
        }
        else if (outcome == "heart failure"){   
            data[,17] = as.numeric(data[,17])
            m = min(data[,17], na.rm =TRUE)
            inds = which(data[,17] == m)
            names = data[inds,2]
            sort(names)
            return(names[1])
        }
        else if (outcome == "pneumonia"){
            data[,23] = as.numeric(data[,23])
            m = min(data[,23], na.rm =TRUE)
            inds = which(data[,23] == m)
            names = data[inds,2]
            sort(names)
            return(names[1])
        }

}