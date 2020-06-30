## Read all of the scripts which contain the functions used within this function
source("functions/stormchunk_2hr.r")
source("functions/stormchunk_3hr.r")
source("functions/stormchunk_4hr.r")
source("functions/stormchunk_5hr.r")
source("functions/stormchunk_6hr.r")
source("functions/stormchunk_7hr.r")
source("functions/stormchunk_8hr.r")
source("functions/stormchunk_9hr.r")
source("functions/stormchunk_10hr.r")
source("functions/stormchunk_11hr.r")
source("functions/stormchunk_12hr.r")


## the function which chooses the function for the user to apply to the data provided. The data 
# provided is the binary rain occurance data. The resulting data from these functions represent the 
# storm occurance data; this includes occurences of rain-dry-rain. The temporal length of the break 
# (dry period), is defined within this function by the user and is calculated within the 
# recommended_storm_break function on the storm_break_calculator.R script.
Storm_break_filler <- function(PPT, break_length) {
  if(break_length == 2) {
    result = StormChunk_2hr(PPT)
  } else if(break_length == 3) {
    result = StormChunk_3hr(PPT)
  } else if(break_length == 4) {
    result = StormChunk_4hr(PPT)
  } else if(break_length == 5) {
    result = StormChunk_5hr(PPT)
  } else if(break_length == 6) {
    result = StormChunk_6hr(PPT)
  } else if(break_length == 7) {
    result = StormChunk_7hr(PPT)
  } else if(break_length == 8) {
    result = StormChunk_8hr(PPT)
  } else if(break_length == 9) {
    result = StormChunk_9hr(PPT)
  } else if(break_length == 10) {
    result = StormChunk_10hr(PPT)
  } else if(break_length == 11) {
    result = StormChunk_11hr(PPT)
  } else if(break_length == 12) {
    result = StormChunk_12hr(PPT)
  } else (
    result ="storm break must be whole numbers between 2 and 12 hours"
  )
  return(result)
}

