# Package ID: knb-lter-vcr.25.41 Cataloging System:https://pasta.edirepository.org.
# Data set title: Hourly Meteorological Data for the Virginia Coast Reserve LTER 1989-present.
# Data set creator:  John Porter -  
# Data set creator:  David Krovetz -  
# Data set creator:  William Nuttle -  
# Data set creator:  James Spitler -  
# Metadata Provider:    - Virginia Coast Reserve Long-Term Ecological Research Project 
# Contact:  John Porter -    - jhp7e@virginia.edu
# Contact:    - Information manager - Virginia Coast Reserve Long-Term Ecological Research Project   - jhp7e@virginia.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-vcr/25/41/32a020479d23312012444a5b4ff81658" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F 
               ,skip=24
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "STATION",     
                 "YEAR",     
                 "MONTH",     
                 "DAY",     
                 "TIME",     
                 "PPT",     
                 "AVG_T",     
                 "MIN_T",     
                 "MAX_T",     
                 "AVG_RH",     
                 "MIN_RH",     
                 "MAX_RH",     
                 "AVG_WS",     
                 "AVG_WANG",     
                 "STD_WANG",     
                 "RAD_SOL",     
                 "PAR",     
                 "SOIL_T"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$STATION)!="factor") dt1$STATION<- as.factor(dt1$STATION)
if (class(dt1$YEAR)=="factor") dt1$YEAR <-as.numeric(levels(dt1$YEAR))[as.integer(dt1$YEAR) ]               
if (class(dt1$YEAR)=="character") dt1$YEAR <-as.numeric(dt1$YEAR)
if (class(dt1$MONTH)=="factor") dt1$MONTH <-as.numeric(levels(dt1$MONTH))[as.integer(dt1$MONTH) ]               
if (class(dt1$MONTH)=="character") dt1$MONTH <-as.numeric(dt1$MONTH)
if (class(dt1$DAY)=="factor") dt1$DAY <-as.numeric(levels(dt1$DAY))[as.integer(dt1$DAY) ]               
if (class(dt1$DAY)=="character") dt1$DAY <-as.numeric(dt1$DAY)
if (class(dt1$TIME)=="factor") dt1$TIME <-as.numeric(levels(dt1$TIME))[as.integer(dt1$TIME) ]               
if (class(dt1$TIME)=="character") dt1$TIME <-as.numeric(dt1$TIME)
if (class(dt1$PPT)=="factor") dt1$PPT <-as.numeric(levels(dt1$PPT))[as.integer(dt1$PPT) ]               
if (class(dt1$PPT)=="character") dt1$PPT <-as.numeric(dt1$PPT)
if (class(dt1$AVG_T)=="factor") dt1$AVG_T <-as.numeric(levels(dt1$AVG_T))[as.integer(dt1$AVG_T) ]               
if (class(dt1$AVG_T)=="character") dt1$AVG_T <-as.numeric(dt1$AVG_T)
if (class(dt1$MIN_T)=="factor") dt1$MIN_T <-as.numeric(levels(dt1$MIN_T))[as.integer(dt1$MIN_T) ]               
if (class(dt1$MIN_T)=="character") dt1$MIN_T <-as.numeric(dt1$MIN_T)
if (class(dt1$MAX_T)=="factor") dt1$MAX_T <-as.numeric(levels(dt1$MAX_T))[as.integer(dt1$MAX_T) ]               
if (class(dt1$MAX_T)=="character") dt1$MAX_T <-as.numeric(dt1$MAX_T)
if (class(dt1$AVG_RH)=="factor") dt1$AVG_RH <-as.numeric(levels(dt1$AVG_RH))[as.integer(dt1$AVG_RH) ]               
if (class(dt1$AVG_RH)=="character") dt1$AVG_RH <-as.numeric(dt1$AVG_RH)
if (class(dt1$MIN_RH)=="factor") dt1$MIN_RH <-as.numeric(levels(dt1$MIN_RH))[as.integer(dt1$MIN_RH) ]               
if (class(dt1$MIN_RH)=="character") dt1$MIN_RH <-as.numeric(dt1$MIN_RH)
if (class(dt1$MAX_RH)=="factor") dt1$MAX_RH <-as.numeric(levels(dt1$MAX_RH))[as.integer(dt1$MAX_RH) ]               
if (class(dt1$MAX_RH)=="character") dt1$MAX_RH <-as.numeric(dt1$MAX_RH)
if (class(dt1$AVG_WS)=="factor") dt1$AVG_WS <-as.numeric(levels(dt1$AVG_WS))[as.integer(dt1$AVG_WS) ]               
if (class(dt1$AVG_WS)=="character") dt1$AVG_WS <-as.numeric(dt1$AVG_WS)
if (class(dt1$AVG_WANG)=="factor") dt1$AVG_WANG <-as.numeric(levels(dt1$AVG_WANG))[as.integer(dt1$AVG_WANG) ]               
if (class(dt1$AVG_WANG)=="character") dt1$AVG_WANG <-as.numeric(dt1$AVG_WANG)
if (class(dt1$STD_WANG)=="factor") dt1$STD_WANG <-as.numeric(levels(dt1$STD_WANG))[as.integer(dt1$STD_WANG) ]               
if (class(dt1$STD_WANG)=="character") dt1$STD_WANG <-as.numeric(dt1$STD_WANG)
if (class(dt1$RAD_SOL)=="factor") dt1$RAD_SOL <-as.numeric(levels(dt1$RAD_SOL))[as.integer(dt1$RAD_SOL) ]               
if (class(dt1$RAD_SOL)=="character") dt1$RAD_SOL <-as.numeric(dt1$RAD_SOL)
if (class(dt1$PAR)=="factor") dt1$PAR <-as.numeric(levels(dt1$PAR))[as.integer(dt1$PAR) ]               
if (class(dt1$PAR)=="character") dt1$PAR <-as.numeric(dt1$PAR)
if (class(dt1$SOIL_T)=="factor") dt1$SOIL_T <-as.numeric(levels(dt1$SOIL_T))[as.integer(dt1$SOIL_T) ]               
if (class(dt1$SOIL_T)=="character") dt1$SOIL_T <-as.numeric(dt1$SOIL_T)

# Convert Missing Values to NA for non-dates

dt1$PPT <- ifelse((trimws(as.character(dt1$PPT))==trimws(".")),NA,dt1$PPT)               
suppressWarnings(dt1$PPT <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$PPT))==as.character(as.numeric("."))),NA,dt1$PPT))
dt1$PPT <- ifelse((trimws(as.character(dt1$PPT))==trimws("9999")),NA,dt1$PPT)               
suppressWarnings(dt1$PPT <- ifelse(!is.na(as.numeric("9999")) & (trimws(as.character(dt1$PPT))==as.character(as.numeric("9999"))),NA,dt1$PPT))
dt1$AVG_T <- ifelse((trimws(as.character(dt1$AVG_T))==trimws(".")),NA,dt1$AVG_T)               
suppressWarnings(dt1$AVG_T <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$AVG_T))==as.character(as.numeric("."))),NA,dt1$AVG_T))
dt1$AVG_T <- ifelse((trimws(as.character(dt1$AVG_T))==trimws("99")),NA,dt1$AVG_T)               
suppressWarnings(dt1$AVG_T <- ifelse(!is.na(as.numeric("99")) & (trimws(as.character(dt1$AVG_T))==as.character(as.numeric("99"))),NA,dt1$AVG_T))
dt1$MIN_T <- ifelse((trimws(as.character(dt1$MIN_T))==trimws(".")),NA,dt1$MIN_T)               
suppressWarnings(dt1$MIN_T <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$MIN_T))==as.character(as.numeric("."))),NA,dt1$MIN_T))
dt1$MIN_T <- ifelse((trimws(as.character(dt1$MIN_T))==trimws("99")),NA,dt1$MIN_T)               
suppressWarnings(dt1$MIN_T <- ifelse(!is.na(as.numeric("99")) & (trimws(as.character(dt1$MIN_T))==as.character(as.numeric("99"))),NA,dt1$MIN_T))
dt1$MAX_T <- ifelse((trimws(as.character(dt1$MAX_T))==trimws(".")),NA,dt1$MAX_T)               
suppressWarnings(dt1$MAX_T <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$MAX_T))==as.character(as.numeric("."))),NA,dt1$MAX_T))
dt1$MAX_T <- ifelse((trimws(as.character(dt1$MAX_T))==trimws("99")),NA,dt1$MAX_T)               
suppressWarnings(dt1$MAX_T <- ifelse(!is.na(as.numeric("99")) & (trimws(as.character(dt1$MAX_T))==as.character(as.numeric("99"))),NA,dt1$MAX_T))
dt1$AVG_RH <- ifelse((trimws(as.character(dt1$AVG_RH))==trimws(".")),NA,dt1$AVG_RH)               
suppressWarnings(dt1$AVG_RH <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$AVG_RH))==as.character(as.numeric("."))),NA,dt1$AVG_RH))
dt1$AVG_RH <- ifelse((trimws(as.character(dt1$AVG_RH))==trimws("999")),NA,dt1$AVG_RH)               
suppressWarnings(dt1$AVG_RH <- ifelse(!is.na(as.numeric("999")) & (trimws(as.character(dt1$AVG_RH))==as.character(as.numeric("999"))),NA,dt1$AVG_RH))
dt1$MIN_RH <- ifelse((trimws(as.character(dt1$MIN_RH))==trimws(".")),NA,dt1$MIN_RH)               
suppressWarnings(dt1$MIN_RH <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$MIN_RH))==as.character(as.numeric("."))),NA,dt1$MIN_RH))
dt1$MIN_RH <- ifelse((trimws(as.character(dt1$MIN_RH))==trimws("999")),NA,dt1$MIN_RH)               
suppressWarnings(dt1$MIN_RH <- ifelse(!is.na(as.numeric("999")) & (trimws(as.character(dt1$MIN_RH))==as.character(as.numeric("999"))),NA,dt1$MIN_RH))
dt1$MAX_RH <- ifelse((trimws(as.character(dt1$MAX_RH))==trimws(".")),NA,dt1$MAX_RH)               
suppressWarnings(dt1$MAX_RH <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$MAX_RH))==as.character(as.numeric("."))),NA,dt1$MAX_RH))
dt1$MAX_RH <- ifelse((trimws(as.character(dt1$MAX_RH))==trimws("999")),NA,dt1$MAX_RH)               
suppressWarnings(dt1$MAX_RH <- ifelse(!is.na(as.numeric("999")) & (trimws(as.character(dt1$MAX_RH))==as.character(as.numeric("999"))),NA,dt1$MAX_RH))
dt1$AVG_WS <- ifelse((trimws(as.character(dt1$AVG_WS))==trimws(".")),NA,dt1$AVG_WS)               
suppressWarnings(dt1$AVG_WS <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$AVG_WS))==as.character(as.numeric("."))),NA,dt1$AVG_WS))
dt1$AVG_WS <- ifelse((trimws(as.character(dt1$AVG_WS))==trimws("999")),NA,dt1$AVG_WS)               
suppressWarnings(dt1$AVG_WS <- ifelse(!is.na(as.numeric("999")) & (trimws(as.character(dt1$AVG_WS))==as.character(as.numeric("999"))),NA,dt1$AVG_WS))
dt1$AVG_WANG <- ifelse((trimws(as.character(dt1$AVG_WANG))==trimws(".")),NA,dt1$AVG_WANG)               
suppressWarnings(dt1$AVG_WANG <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$AVG_WANG))==as.character(as.numeric("."))),NA,dt1$AVG_WANG))
dt1$AVG_WANG <- ifelse((trimws(as.character(dt1$AVG_WANG))==trimws("999")),NA,dt1$AVG_WANG)               
suppressWarnings(dt1$AVG_WANG <- ifelse(!is.na(as.numeric("999")) & (trimws(as.character(dt1$AVG_WANG))==as.character(as.numeric("999"))),NA,dt1$AVG_WANG))
dt1$STD_WANG <- ifelse((trimws(as.character(dt1$STD_WANG))==trimws(".")),NA,dt1$STD_WANG)               
suppressWarnings(dt1$STD_WANG <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$STD_WANG))==as.character(as.numeric("."))),NA,dt1$STD_WANG))
dt1$STD_WANG <- ifelse((trimws(as.character(dt1$STD_WANG))==trimws("999")),NA,dt1$STD_WANG)               
suppressWarnings(dt1$STD_WANG <- ifelse(!is.na(as.numeric("999")) & (trimws(as.character(dt1$STD_WANG))==as.character(as.numeric("999"))),NA,dt1$STD_WANG))
dt1$RAD_SOL <- ifelse((trimws(as.character(dt1$RAD_SOL))==trimws(".")),NA,dt1$RAD_SOL)               
suppressWarnings(dt1$RAD_SOL <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$RAD_SOL))==as.character(as.numeric("."))),NA,dt1$RAD_SOL))
dt1$RAD_SOL <- ifelse((trimws(as.character(dt1$RAD_SOL))==trimws("9999")),NA,dt1$RAD_SOL)               
suppressWarnings(dt1$RAD_SOL <- ifelse(!is.na(as.numeric("9999")) & (trimws(as.character(dt1$RAD_SOL))==as.character(as.numeric("9999"))),NA,dt1$RAD_SOL))
dt1$PAR <- ifelse((trimws(as.character(dt1$PAR))==trimws(".")),NA,dt1$PAR)               
suppressWarnings(dt1$PAR <- ifelse(!is.na(as.numeric(".")) & (trimws(as.character(dt1$PAR))==as.character(as.numeric("."))),NA,dt1$PAR))
dt1$PAR <- ifelse((trimws(as.character(dt1$PAR))==trimws("9999")),NA,dt1$PAR)               
suppressWarnings(dt1$PAR <- ifelse(!is.na(as.numeric("9999")) & (trimws(as.character(dt1$PAR))==as.character(as.numeric("9999"))),NA,dt1$PAR))
dt1$PAR <- ifelse((trimws(as.character(dt1$PAR))==trimws("6999")),NA,dt1$PAR)               
suppressWarnings(dt1$PAR <- ifelse(!is.na(as.numeric("6999")) & (trimws(as.character(dt1$PAR))==as.character(as.numeric("6999"))),NA,dt1$PAR))

#Met_data_raw <- dt1
# Met_data_raw <- dt1 %>% 
#   filter(STATION == "HOG2", YEAR == 2015)




