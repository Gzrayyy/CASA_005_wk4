---
title: "wk4_homework"
output: html_document
---
```{r}
library(tidyverse)
library(sf)
library(ggplot2)
library(plotly)
library(tmap)
library(tmaptools)
```


```{r}
#read file
ggi <-  read_csv('dataset/HDR21-22_Composite_indices_complete_time_series.csv',show_col_types = FALSE) 
sdw <- st_read(here::here('wk4_homework','dataset','World_Countries__Generalized_.shp'))

```

```{r}
tmap_mode("plot")
ggi_year <- ggi[,c(2,36)]
sdw_2 <- sdw%>%left_join(.,
                         ggi_year,
                         by=c('COUNTRY'='country'))
sdw_3 <- st_as_sf(sdw_2)
qtm(sdw_2,fill='hid_2019-2010')

```

