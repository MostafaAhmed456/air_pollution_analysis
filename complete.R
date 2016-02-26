complete<- function(directory,id = 1:332) {
    direct<-paste(getwd(),directory,sep="/")
    files_list<-as.character(list.files(direct))
    list_of_file_paths<-paste(direct,files_list,sep="/")
    complete_cases<-c()
	j <- 1 
    for(x in id)
        {
          current_file<-read.csv(list_of_file_paths[x],header=T,sep=",")
         # complete_data<- sum(complete.cases(current_file))
          complete_cases[j] <- sum(complete.cases(current_file))
          j <- j + 1		  
        }
        result <- data.frame(id = id, nobs = complete_cases)
		return(result)
		
		
}