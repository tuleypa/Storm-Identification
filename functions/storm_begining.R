##this function shifts and catigorizes the columns to identify the first record of a storm, this record
# is the begining of the storm. 
storm_begining <- function(rs1, UID){
  Storm_begin1 <- lag(rs1)
  Storm_begin2 <- rs1 - Storm_begin1
  Storm_Start <- vector(mode = "numeric", length = length(RainHours$UID))
  for(i in 1:nrow(RainHours)){
    S_Begin_id <- as.numeric(rs1[i] == 1) 
    #print(S_Begin_id)
    S_Begin_id2 <- as.numeric(Storm_begin1[i] == 0) 
    #print(S_Begin_id2)
    S_Begin_id3 <- as.numeric((sqrt(S_Begin_id)*(S_Begin_id2)) == 1)
    #print(S_Begin_id3)
    Storm_Start [i] <- S_Begin_id3
    S_beg <- data.frame(RainHours, Storm_Start)
    assign("RainHours_mod", S_beg, envir = .GlobalEnv) 
  }
  return(S_Begin_id3)
}
