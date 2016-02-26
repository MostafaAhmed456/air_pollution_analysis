source("complete.R")
correlation<- function(directory,threshold=0)
{
    direct<-paste(getwd(),directory,sep="/")
    files_list<-as.character(list.files(direct))
    list_of_file_paths<-paste(direct,files_list,sep="/")
	complete_data<-complete("specdata", 1:332)
	nobs<-complete_data$nobs
	complete_data_file_ids<-complete<-complete_data$id[nobs>threshold]
	correlation_vector<-rep(0,length(complete_data_file_ids))
	files_list<-as.character(list.files(direct))
    list_of_file_paths<-paste(direct,files_list,sep="/")
	x<-1
	for ( i in complete_data_file_ids)
	{
	   current_file <- read.csv(list_of_file_paths[i], header=T, sep=",")
	   correlation_vector[x] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
	   x <- x+ 1
	}
    final_result<-correlation_vector
	return(final_result)
}	
	
	