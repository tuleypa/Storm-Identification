## Function to convert feet, meters, nautical mile, and miles to kilometers. 
# Note, units but be in quotes. 

## Converstion to km
conversion_to_km2 <- function(dist_unit){
  if (dist_unit == "km" || dist_unit == "kilometer" || dist_unit == "kilometers") {
    km = 1
  } else if (dist_unit == "m" || dist_unit == "meters") {
    km = 0.001
  } else if (dist_unit == "ft" || dist_unit == "feet") {
    km = 0.0003048
  } else if (dist_unit == "mi" || dist_unit == "miles") {
    km = 1.60934
  } else if (dist_unit == "nmi" || dist_unit == "NM" || dist_unit == "nautical miles") {
    km = 1.852
  } else {
    km = NA
  }
  return(km)
}


## Converstion to hours
conversion_to_hr <- function(time_unit) {
  if(time_unit == "s" || time_unit == "sec" || time_unit == "second" || time_unit == "seconds") {
    hr = 0.000277778
  } else if (time_unit == "min" || time_unit == "minute" || time_unit == "minutes") {
    hr = 0.0166667
  } else if (time_unit == "hr" || time_unit == "hour" || time_unit == "hours") {
    hr = 1
  } else {
    hr = NA
  }
  return(hr)
}


## uses the above functions to multiply the value by the dist. and time conversion intervals
conversion_to_km_per_hr <- function(value, dist_unit, time_unit){
  km = conversion_to_km2(dist_unit)
  hr = conversion_to_hr(time_unit)
  if(is.na(km)) {
    final_value = "Cannot comput! Please use the units feet, miles, nautical miles, and meters."
  } else if (is.na(hr)) {
    final_value = "Cannot comput! Please use the units seconds, minutes, and hours."
  } else {
    final_value = (value * (km/hr))
  }
  return(final_value)
}


