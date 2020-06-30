## Identifying the best Storm-break threshold for your dataset (OPTIONAL)
##    This section assums your meterologic data is hourly.


#install.packages("magick")
library("magick")

source("functions/conversion_to_km.r")
source("functions/Conversion_km_per_hr.r")
source("functions/recommended_storm_break.r")


## The following images display the region of interest for the provided test dataset.
# These images are provided to demonstrait the importance of spatial resolution in recognition of storms
# on the regional scale. The recomended break in precipitation (between rain bursts) should be equal
# to the maxumum distsance to regional features from the meterologic station devided by the average
# windspeed during storm events. A small buffer can be added to the value of the maxumum distsance to
# regional features to account for variateion in storm speed.

Eastern_Shore = image_read("images/Eastern_Shore.tif")
Regional_extent = image_read("images/Regional_extent.tif")
Max_Dist_feature = image_read("images/Max_Dist_feature.tif")
Max_Dist_buff = image_read("images/Max_Dist_buff.tif")
image_scale(Eastern_Shore, "500")
image_scale(Regional_extent, "500")
image_scale(Max_Dist_feature, "500")
image_scale(Max_Dist_buff, "500")


##  FIRST: calculating the average windspeed from rain presence dataset
avg_ws <- Met_data_raw2 %>%
  filter(PPT == "1") %>% ## rain = rain_presence ***
  summarise(avg_ws1 = mean(AVG_WS)) ## windspeed = windspeed ***

##  SECOND: Conversion to km and km/hr
##          These formulas may be needed to put your "max distance to feature" and "average windspeed"
##          vlaues into the same units.


max_feature_dist_km <-
  conversion_to_km(45, "km") ## the max_feature_dist cas measured for this example as 45-km
avg_ws_km_hr <-
  conversion_to_km_per_hr(avg_ws, "m", "s") ## Add value then distance units and time units

##  THIRD: Compouting hourly stormthreshold

recommended_storm_break(avg_ws_km_hr, max_feature_dist_km, 0) ##avg_ws_km_hr (above), max_feature_dist_km, buff

# For the Virginia barrier island complex region the recommended storm hour break is 6.09422 hours (6-hr)

