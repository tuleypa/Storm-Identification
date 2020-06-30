## uses the functions conversion_to_km, conversion_to_km_per_hr, and a optional buffer to calculate
# how may hours it would take wind to travel between the feature furthest from the Met station to the 
# met station it's self
recommended_storm_break <-
  function(avg_ws_km_hr, max_feature_dist_km, buff) {
    threshold <- ((max_feature_dist_km + buff) / (avg_ws_km_hr))
    return(threshold)
  }
