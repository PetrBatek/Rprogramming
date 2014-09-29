pollutantmean <- function(directory, pollutant, id = 1:332){
    data = read.csv(directory)
    if (pollutant == "sulfate")
        m = mean(data$sulfate, na.rm = TRUE)
    else if (pollutant == "nitrate")
        m = mean(data$nitrate, na.rm = TRUE)
    return(m)
}

Complete <- function(directory, id){
    c = rep(0,length(id))
    n = rep("",length(id))
    
    for(i in 1:length(n)){
        if(id[i] < 10)
            n[i] = paste("00",toString(id[i]), sep = "")
        else if ( 10 <= id[i] & id[i] < 100)
            n[i] = paste("0",toString(id[i]), sep = "")
        else
            n[i] = toString(id[i])
    }
    print(n)
    df = data.frame(id, nobs = rep(0,length(id)))
    poradi = 1
    for(i in n){
        
        count = 0
        temp = paste(i,".csv",sep = "")
        data = read.csv(paste(directory,temp,sep = ""))
        naSulfate = !is.na(data$sulfate)
        naNitrate = !is.na(data$nitrate)
        for(j in 1:length(naSulfate)){
            if (naSulfate[j] == TRUE & naNitrate[j] == TRUE){
                count = count + 1
            }
        }
        df$nobs[poradi] = count
        poradi = poradi + 1
    }
    
    return(df)
}