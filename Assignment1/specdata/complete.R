complete <- function(directory, id = 1:332){
    n = length(id)
    m = rep(0,n)
    temp = rep("",n)
    for(i in 1:n){
        if(id[i] < 10)
            temp[i] = paste("/00",toString(id[i]), sep = "")
        else if ( 10 <= id[i] & id[i] < 100)
            temp[i] = paste("/0",toString(id[i]), sep = "")
        else
            temp[i] = paste("/",toString(id[i]), sep = "")
    }
    print(n)
    df = data.frame(id, nobs = rep(0,length(id)))
    poradi = 1
    for(i in temp){
        
        count = 0
        t = paste(i,".csv",sep = "")
        data = read.csv(paste(paste("/home/petr2/Plocha/Coursera/R/",directory,sep=""),t,sep=""))
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