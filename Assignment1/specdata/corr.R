corr = function(directory, threshold = 0,id = 1:332){
    names = paste(formatC(id, width=3,flag="0"),".csv",sep="")
    correlation = vector()
    for (i in id){
        data = read.csv(paste(paste("/home/petr2/Plocha/Coursera/R/",directory,"/",sep=""),names[i],sep=""))
        df = complete(data)
        if(thresh(df,threshold)){
            correlation = c(correlation,cor(data$sulfate,data$nitrate,use="pairwise.complete.obs"))
        }
    }
    return (correlation)
}

complete = function(data){
    comp = (!is.na(data$sulfate) & !is.na(data$sulfate))
    nComp = sum(comp)
    df = data.frame(id = data[4][1,1], nobs = nComp, overall = nrow(data))        
    return(df)
}

thresh = function(df,threshold){
    return (df$nobs>threshold)
}