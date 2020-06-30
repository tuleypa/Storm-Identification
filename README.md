# Storm-Identification README

By Philip Tuley
Created 06/30/2020
tuleyphilip@gmail.com
Github: tuleypa

With this repository, hourly precipitation data can be summarized into a list of precipitation events. The resulting list will include a numeric storm name alongside the duration of each storm. Storms duration is defined by the American Meteorological Society as a regime of precipitation. This is a hindsight classification written for an area which experiences hurricanes and nor’easters, as well as stagnant coastal fronts. The research site is undeveloped and includes a single meteorological station for the region. This project makes up for the low distribution of recording stations by aggregating storms based on their occurrence and the average wind speed during precipitation events.

This repository contains 2 script files: Storm_identification.R and storm_break_calculator.R. The latter is an optional approach to identify what threshold of non-precipitation we can reasonably include between bursts of rain and still consider this event a single storm. Temporally, this thought of a storm looks like: rain-dry-rain. 

Within storm_break_calculator.R, there are 4 images of the example included with this code. The example region is the Virginia barrier island complex (seen in the image Regional_extent). Regional_extent also shows the location of the meteorological station where the example data was collected. Note that the island furthest from the meteorological station is to the south. In the image Max_Dist_feature we show this distance; it is ~45km. To calculate a reasonable length of a precipitation-break between rain bursts, we will measure this distance to the furthest regional feature and divide it by the average windspeed during precipitation events. I have additionally coded in an optional buffer length the used can add into storm_break_calculator.R. This buffer adds to the distance to the furthest regional feature (seen in image Max_Dist_buff) before dividing it by the average windspeed during precipitation events. 

The code of storm_break_calculator.R calculates the average wind speed during precipitation events (which is defined within the Storm_identification.R script). Then two functions for converting distance to km and converting to km/hr. Alternatively, these distance units are not important as long as they are the same and the windspeed is out of hours. In this example dataset we are using km and m/s. These functions quickly convert the m/s to km/hr. Finally, The recommended_storm_break function takes the output from each of the previous two functions (and the optional buffer unit) and divides (dist. / speed) to get hours. The recommended hours for the Virginia barrier island complex region example is 6.09422-hours or ~6-hours. For the Storm_identification.R script we will use 6-hours. If one did not wasnt to aggregate storms, 0-hours shoudl be used. 

In the Storm_identification.R script the data is introduced, manipulated into a structure that will run better with the rest of the script, and ran through a series of algorithms and functions to reduce the dataset to a simple 2 field table of storm name and duration. 

Throughout the Storm_identification.R script and affiliated scripts in the functions folder, there are a I have used the ?as.numeric(as.character())? code that can be seen in line 32. This takes the data field within the parentheses and converts it to a character, then numeric. This conversation was not used/needed for the dummy data I have created but may serve as essential for alternative data obtained. 

This code was trained on data from the Virginia Coast Reserve (VCR), a site in conjunction with the Long-Term Ecological Research (LTER) project. Being such, the sourced script Read_data originated from the VCR LTER and is used to download the data used. Below this data is cited.

Porter, J., D. Krovetz, W. Nuttle and J. Spitler. 2020. Hourly Meteorological Data for the Virginia Coast Reserve LTER 1989-present. Virginia Coast Reserve Long-Term Ecological Research Project Data Publication knb-lter-vcr.25.41 (doi:doi:10.6073/pasta/06db7a25a4f157f514def6addcdfdd53).



A description of the functions included in this project

conversion_to_km - Input a numeric value and distance unit (meters, feet, kilometers, miles, nautical miles). This function multiplies the value by a programed conversion interval then returns a value which is in kilometers.

Conversion_km_per_hr - This function utilizes two functions (conversion_to_hr and conversion_to_km2). Much like conversion_to_km function, both of the functions within this function require the user to input the unit(meters, feet, kilometers, miles, nautical miles and second, minuet, hour, respectively). The conversion_to_hr and conversion_to_km2 return a conversion interval which are used in the Conversion_km_per_hr function along with the initial value. The equation within Conversion_km_per_hr is: value x (conversion_to_hr / conversion_to_km2). The returned value is in km/hr. 

recommended_storm_break ? Input the result from conversion_to_km, Conversion_km_per_hr, and the optional buffer value described above. Note, if a buffer is not being used the buffer value must be entered as 0.

storm_begining ? This function shifts the dataset around so that the first occurrence of precipitation for every group of precipitation (storm) will be lables within a new column as a ?1?, where all other records within the column are ?0? or ?NA?.

Storm_break_filler ? Input into this function are the rain presence data (?PPT? which is binary, 1 represents rain and 0 dry) and a whole number threshold of the max number of hours of dry period between rain burst which will be included in this dataset. This threshold is calculated in the recommended_storm_break function within the storm_break_calculator.R script. This function uses the StormChunk_xhr functions, where x = threshold value to create a new dataset with the final list of storm occurrence data. 

StormChunk_2hr to StormChunk_12hr ? This includes the functions StormChunk_2hr, StormChunk_3hr, StormChunk_4hr, StormChunk_5hr, StormChunk_6hr, StormChunk_7hr, StormChunk_8hr, StormChunk_9hr, StormChunk_10hr, StormChunk_11hr, and StormChunk_12hr. Within these functions the input PPT data is shifted and summed a few times to fill the gaps (0s) of dry within the definition of a storm provided to the Storm_break_filler function. 


