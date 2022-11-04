---
title: "wk4_homework"
output: html_document
---

library(tidyverse)
library(sf)
library(ggplot2)
library(plotly)
library(tmap)
library(tmaptools)
 
library(countrycode)



#read file
#ggi <-  read_csv('dataset/HDR21-22_Composite_indices_complete_time_series.csv',show_col_types = FALSE) 

ggi <- read_csv(here::here("wk4_homework","dataset","HDR21-22_Composite_indices_complete_time_series.csv"))
sdw <- st_read(here::here('wk4_homework','dataset','World_Countries__Generalized_.shp'))

sdw_1 <- sdw %>%
  mutate(iso3= countrycode(ISO,'iso2c', 'iso3c'))

#dont use country name to join, it may cause some problem
tmap_mode("plot")

ggi_diff <- ggi[,c(1,2,36)]

sdw_2 <- sdw_1 %>% left_join(.,
                         ggi_diff,
                         by=c('iso3'='iso3'))

qtm(sdw_2, fill='hdi_2019-2010')

