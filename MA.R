library(haven)
library(readxl)
library(readr)
library(tidyverse)
library(sf)
library(leaflet)


shapefile_path <- "/Users/carlogress/Desktop/MA/Data sources/btw21_geometrie_wahlkreise_vg250_geo_shp/Geometrie_Wahlkreise_20DBT_VG250_geo.shp"

shapefile_data <- st_read(shapefile_path)

data_frame <- as.data.frame(shapefile_data)



btw21_strukturdaten <- read.csv("Desktop/MA/Data sources/btw21_strukturdaten.csv", 
                                  sep = ";", dec = "," , skip = 8)

btw21_strukturdaten <- btw21_strukturdaten %>% 
  filter(Wahlkreis.Name != "Land insgesamt")

btw21_strukturdaten$wk <- as.integer(btw21_strukturdaten$Wahlkreis.Nr.)

merged_data <- merge(shapefile_data, btw21_strukturdaten, by.x = "WKR_NR", by.y = "wk", all.x = TRUE)

# Map

sf_shapefile <- st_as_sf(merged_data, coords = c("geometry"))

# If your geometry column contains MULTIPOLYGON, use st_cast to separate the polygons
sf_shapefile <- st_cast(sf_shapefile, "POLYGON")

# Create a simple leaflet map
leaflet(sf_shapefile) %>%
  addTiles() %>%
  addPolygons() 

sf_data <- st_as_sf(merged_data, coords = c("geometry"))

# If your geometry column contains MULTIPOLYGON, use st_cast to separate the polygons
sf_data <- st_cast(sf_data, "POLYGON")

# Create a leaflet map with colored polygons
leaflet(sf_data) %>%
  addTiles() %>%
  addPolygons(fillColor = ~colorNumeric(palette = "YlOrRd", domain = sf_data$Bevölkerung.am.31.12.2019...Ausländer..innen....)(sf_data$Bevölkerung.am.31.12.2019...Ausländer..innen....),
              fillOpacity = 0.7,
              color = "white",
              stroke = TRUE,
              weight = 1,
              label = ~paste("District: ", WKR_NR, "<br>Population: ", Bevölkerung.am.31.12.2019...Ausländer..innen....)) %>%
  addLegend(pal = colorNumeric(palette = "YlOrRd", domain = sf_data$Bevölkerung.am.31.12.2019...Ausländer..innen....),
            values = ~sf_data$Bevölkerung.am.31.12.2019...Ausländer..innen....,
            title = "Population",
            opacity = 0.7)