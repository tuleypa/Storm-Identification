## Install Packages
#install.packages("uuid")
#install.packages("zoo")
library("uuid")
library("dplyr")
library("tidyr")
library("zoo")
library("ggplot2")




## functions
source("functions/storm_begining.r")
source("functions/Storm_break_filler.r")




## Read your initial dataset.
# For this script, each record of the data must represent hourly meterologic observations
# Met_data_raw <-
#   read.csv("data/VCR_LTER_Hourly_Weather/whour15.csv", header = TRUE)
source("functions/Read_data.r")
Met_data_raw <- dt1


## Create a new column names RAIN that is the raw precipitation values.
Met_data_raw$RAIN <- as.numeric(as.character(Met_data_raw$PPT))




## Filter the STATION field to only HOG2 and converting average windspeed (AVG_WS) to numeric
Met_data_raw2 <- Met_data_raw %>%
  filter(STATION == "HOG2", YEAR == 2015) %>%
  mutate(AVG_WS = as.numeric(as.character(AVG_WS))) %>%
  select(YEAR, MONTH, DAY, TIME, AVG_WS, RAIN)




## Adding Unique identifyers to each record
for (a in 1:nrow(Met_data_raw2)) {
  Met_data_raw2$UID[a] <- UUIDgenerate(use.time = NA)
}




## Here we use the raw met- precipitation data and a threshold to note the presence and absence of
# rain. I recommend a threshold of 0.01-inch or 0.254-mm of rain
Met_data_raw2$PPT <- cut(
  Met_data_raw2$RAIN,
  breaks = c(-Inf, 0.245, Inf),
  labels = c("0", "1")
)




# Open the file storm_break_calculator.r to calculate the recommended storm hour break period.
# The value obtained from storm_break_calculator.r printed to the console can be rounded to the
# nearest whole number and then used in the following code chunk.




## This function fills holes between rain bursts of a given size. The user provides the given size
# (or can calcuate it from the commented out chunk just above) and puts it into the function as well
# as the storm PPT data to calculate storm occurance. Storm breaks which are coded for here are
# 2-12hours. Try changing the input and comparing the results of this package.
Storm_break_filler(Met_data_raw2$PPT, 6)




## Finding the begining of each storm, name the storm, and then rejoin the name to the dataset
storm_begining(RainHours$storm_occurrence, RainHours$UID)

RainHours_naming <- RainHours_mod %>%
  select(UID, Storm_Start) %>%
  filter(Storm_Start == 1) %>%
  mutate(Storm_Name = row_number())

RainHours_mod_name <-
  left_join(RainHours_mod,
            RainHours_naming,
            by = "UID",
            copy = FALSE)




## Turning the 0's into NA so that we can use the function na.locf(), Last Observation Carried
# Forward, and the tidy-fill function to replace the NA values with the last numeric value
RainHours_mod_name$S_beg_NA <- RainHours_mod_name$Storm_Name
RainHours_mod_name$S_beg_NA[RainHours_mod_name$Storm_Start.x == 0] <-
  NA
Stormhours <- RainHours_mod_name %>%
  filter(storm_occurrence == 1)

Stormhours$Storm_Name_full <- na.locf(Stormhours$S_beg_NA)

Storm_records <- Stormhours %>%
  mutate(Storm_Name_full = S_beg_NA) %>%
  fill(Storm_Name_full)


##summarization of storm records, here we are just calcuating the storm duration, hours each storm
# occured. Then I plotted a simple histogram to display the how frequent temporally-short storms are
# and how infrequent temporally-long storms are.
##In the future we can re link the Storm_records to the raw dataset and summarize greater
# observations of each storm.

Storm_summarization <- Storm_records %>%
  group_by(Storm_Name_full) %>%
  summarise(duration = length(Storm_Name_full))


View(Storm_summarization)

ggplot(Storm_summarization, aes(Storm_summarization$duration)) + geom_histogram(bin = 1) #+
  #labs(x = "Storm duration", y = "frequency")


