pollutantmean <- function(directory,y="sulfate", id = 1:332) {
    direct<-paste(getwd(),directory,sep="/")
    files_list<-as.character(list.files(direct))
    list_of_file_paths<-paste(direct,files_list,sep="/")
    collected_mean<-c()
    for(x in id)
        {
          current_file<-read.csv(list_of_file_paths[x],header=T,sep=",")
          remove_na<-current_file[!is.na(current_file[,y]),y]
          collected_mean <- c(collected_mean,remove_na)
        }
    final_mean<-mean(collected_mean) 
}