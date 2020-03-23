library(tidyverse)
load('data/stations.RData')
load('data/phab.RData')
glimpse(phab)
glimpse(stations)

# testing missing stations from phab -------------------------------------
phab_station_missing <- phab %>% 
  filter(StationCode != stations$StationCode[1])

IPI(stations = stations, phab = phab_station_missing)


# testing missing stations from stations ----------------------------------
station_missing_station <- stations %>% 
  filter(StationCode != phab$StationCode[1])

IPI(stations = station_missing_station, phab = phab)


# testing missing variable in phab data  ----------------------------------
## should return NA for the variable
## can't be missing XSLOPE and XBKF_W yet

phab_missing_variable <- phab %>% 
  filter(!Variable %in% c('Ev_FlowHab'))

IPI(stations = stations, phab = phab_missing_variable)

IPI(stations = stations, phab = phab_missing_variable, qa = F)
