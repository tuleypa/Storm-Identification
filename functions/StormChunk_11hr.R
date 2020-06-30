## this function fills holes (0s) less than 11-hours within each storms The data provided is the 
# binary rain occurance data. The resulting data from this function represent the storm occurance 
# data; this includes occurences of rain-dry-rain. The temporal length of the break (dry period), 
# is defined within this function as 11

StormChunk_11hr <- function(PPT) {
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
  rain_sum6 <-
    vector(mode = "numeric", length = length(PPT))
  rain_sum7 <-
    vector(mode = "numeric", length = length(PPT))
  rain_sum8 <-
    vector(mode = "numeric", length = length(PPT))
  rain_sum9 <-
    vector(mode = "numeric", length = length(PPT))
  rain_sum10 <-
    vector(mode = "numeric", length = length(PPT))
  rain_sum11 <-
    vector(mode = "numeric", length = length(PPT))
  rain_sum12 <-
    vector(mode = "numeric", length = length(PPT))
  storm_occurrence <-
    vector(mode = "numeric", length = length(PPT))
  PPT0 <- as.numeric(as.character(PPT))
  PPT1 <- as.numeric(as.character(lead(PPT, 1)))
  PPT2 <- as.numeric(as.character(lead(PPT1, 1)))
  PPT3 <- as.numeric(as.character(lead(PPT2, 1)))
  PPT4 <- as.numeric(as.character(lead(PPT3, 1)))
  PPT5 <- as.numeric(as.character(lead(PPT4, 1)))
  PPT6 <- as.numeric(as.character(lead(PPT5, 1)))
  PPT7 <- as.numeric(as.character(lead(PPT6, 1)))
  PPT8 <- as.numeric(as.character(lead(PPT7, 1)))
  PPT9 <- as.numeric(as.character(lead(PPT8, 1)))
  PPT10 <- as.numeric(as.character(lead(PPT9, 1)))
  PPT11 <- as.numeric(as.character(lead(PPT10, 1)))
  rainhour1 <- PPT0 + PPT1 + PPT2 + PPT3 + PPT4 + PPT5 + PPT6 + PPT7 + PPT8 + PPT9 + PPT10 + PPT11
  rainhour2 <- lag(rainhour1, 1)
  rainhour3 <- lag(rainhour2, 1)
  rainhour4 <- lag(rainhour3, 1)
  rainhour5 <- lag(rainhour4, 1)
  rainhour6 <- lag(rainhour5, 1)
  rainhour7 <- lag(rainhour6, 1)
  rainhour8 <- lag(rainhour7, 1)
  rainhour9 <- lag(rainhour8, 1)
  rainhour10 <- lag(rainhour9, 1)
  rainhour11 <- lag(rainhour10, 1)
  rainhour12 <- lag(rainhour11, 1)
  #return(rainhour1)
  
  for(i in 1:nrow(Met_data_raw2)) {
    rs1 <- as.numeric(rainhour1[i] > 0)
    rs2 <- as.numeric(rainhour2[i] > 0)
    rs3 <- as.numeric(rainhour3[i] > 0)
    rs4 <- as.numeric(rainhour4[i] > 0)
    rs5 <- as.numeric(rainhour5[i] > 0)
    rs6 <- as.numeric(rainhour6[i] > 0)
    rs7 <- as.numeric(rainhour7[i] > 0)
    rs8 <- as.numeric(rainhour8[i] > 0)
    rs9 <- as.numeric(rainhour9[i] > 0)
    rs10 <- as.numeric(rainhour10[i] > 0)
    rs11 <- as.numeric(rainhour11[i] > 0)
    rs12 <- as.numeric(rainhour12[i] > 0)
    RS <- rs1 + rs2 + rs3 + rs4 + rs5 + rs6 + rs7 + rs8 + rs9 + rs10 + rs11 + rs12
    #print(RS)
    RS_1 <- as.numeric(RS == 12)
    #print(RS_1)
    rain_sum1[i] <- rs1
    rain_sum2[i] <- rs2
    rain_sum3[i] <- rs3
    rain_sum4[i] <- rs4
    rain_sum5[i] <- rs5
    rain_sum6[i] <- rs6
    rain_sum7[i] <- rs7
    rain_sum8[i] <- rs8
    rain_sum9[i] <- rs9
    rain_sum10[i] <- rs10
    rain_sum11[i] <- rs11
    rain_sum12[i] <- rs12
    storm_occurrence[i] <- RS_1
    R_Sum <- data.frame(Met_data_raw2, rain_sum1, rain_sum2, rain_sum3, rain_sum4, rain_sum5, rain_sum6, rain_sum7, rain_sum8, rain_sum9, rain_sum10, rain_sum11, rain_sum12, storm_occurrence)
    assign("RainHours", R_Sum, envir = .GlobalEnv) 
  }
  
}


