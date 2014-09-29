pollutantmean <- function(directory, pollutant, id = 1:332){
    directory = paste("/home/petr2/Plocha/Coursera/R/",directory,"/",sep ="")
    v=vector()
    for (i in id){
        data = read.csv(paste(directory,formatC(i, width=3, flag="0"),".csv",sep = ""))
        if (pollutant == "sulfate")
            v = c(v,data$sulfate)
        else if (pollutant == "nitrate")
            v = c(v,data$nitrate)
        
    }
    return(mean(v, na.rm=TRUE))
}