## this function fills holes (0s) less than 4-hours within each storms The data provided is the 
# binary rain occurance data. The resulting data from this function represent the storm occurance 
# data; this includes occurences of rain-dry-rain. The temporal length of the break (dry period), 
# is defined within this function as 4

StormChunk_4hr <- function(PPT) {
  rain_sum1 <-
    vector(mode = "numeric", length = length(PPT))
  rain_sum2 <-
    vector(mode = "numeric", length = length(PPT))
  rain_sum3 <-
    vector(mode = "numeric", length = length(PPT))
  rain_sum4 <-
    vector(mode = "numeric", length = length(PPT))
  rain_sum5 <-
    vector(mode = "numeric", length = length(PPT))
  storm_occurrence <-
    vector(mode = "numeric", length = length(PPT))
  PPT0 <- as.numeric(as.character(PPT))
  PPT1 <- as.numeric(as.character(lead(PPT, 1)))
  PPT2 <- as.numeric(as.character(lead(PPT1, 1)))
  PPT3 <- as.numeric(as.character(lead(PPT2, 1)))
  PPT4 <- as.numeric(as.character(lead(PPT3, 1)))
  rainhour1 <- PPT0 + PPT1 + PPT2 + PPT3 + PPT4
  rainhour2 <- lag(rainhour1, 1)
  rainhour3 <- lag(rainhour2, 1)
  rainhour4 <- lag(rainhour3, 1)
  rainhour5 <- lag(rainhour4, 1)
  #return(rainhour1)
  
  for(i in 1:nrow(Met_data_raw2)) {
    rs1 <- as.numeric(rainhour1[i] > 0)
    rs2 <- as.numeric(rainhour2[i] > 0)
    rs3 <- as.numeric(rainhour3[i] > 0)
    rs4 <- as.numeric(rainhour4[i] > 0)
    rs5 <- as.numeric(rainhour5[i] > 0)
    RS <- rs1 + rs2 + rs3 + rs4 + rs5
    #print(RS)
    RS_1 <- as.numeric(RS == 5)
    #print(RS_1)
    rain_sum1[i] <- rs1
    rain_sum2[i] <- rs2
    rain_sum3[i] <- rs3
    rain_sum4[i] <- rs4
    rain_sum5[i] <- rs5
    storm_occurrence[i] <- RS_1
    R_Sum <- data.frame(Met_data_raw2, rain_sum1, rain_sum2, rain_sum3, rain_sum4, rain_sum5, storm_occurrence)
    assign("RainHours", R_Sum, envir = .GlobalEnv) 
  }
  
}


