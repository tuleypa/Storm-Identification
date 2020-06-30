## Function to convert feet, meters, nautical mile, and miles to kilometers. 
# Note, units but be in quotes. 

## Converstion to km
conversion_to_km <- function(value, unit){
  if (unit == "m" || unit == "meters") {
    km = value * 0.001
  } else if (unit == "ft" || unit == "feet"){
    km = value * 0.0003048
  } else if (unit == "km" || unit == "kilometers"){
    km = value * 1
  } else if (unit == "mi" || unit == "miles"){
    km = value * 1.60934
  } else if (unit == "nmi" || unit == "NM" || unit == "nautical miles"){
    km = value * 1.852
  } else {
    km = "Cannot comput! Please use the units feet, miles, nautical miles, and meters."
  }
  return(km)
}


