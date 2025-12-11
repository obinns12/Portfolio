install.packages("leaflet")

library("leaflet")
head(leaflet)
?leaflet

#Simple Map of USA
leaflet() %>%
  addTiles() %>%
  setView(lng = -95, lat = 40, zoom = 4)

#Data frame with multiple cities
cities <- data.frame(
  name = c("Philadelphia, PA", "Charlotte, NC", "New York City, NY", 
           "Los Angeles, CA", "Denver, CO"),
  lat = c(39.9526, 35.2271, 40.7128, 34.0522, 39.7392),
  lng = c(-75.1652, -80.8431, -74.0060, -118.2437, -104.9903)
)

#Map with markers
leaflet(cities) %>%
  addTiles() %>%
  addMarkers(~lng, ~lat, popup = ~name)





install.packages(c("readxl", "dplyr", "sf", "leaflet"))

library(readxl)    # Allows R to read Excel files (.xlsx, .xls)
library(dplyr)     # Provides data manipulation functions (mutate, filter, slice, joins, etc.)
library(sf)        # Handles spatial/vector data (shapefiles, geometries, CRS, etc.)
library(leaflet)   # Creates interactive web maps in R

# Load Excel
pa_data <- read_excel("C:/Users/OneDrive/Documents/R Stat Prog Lang/PA Ranks.xlsx") %>%
  mutate(GEOID20 = sprintf("%011.0f", as.numeric(GEOID20)))	    #creates/modifies Geoid columns to have same formatting

# Load shapefile
shapefile <- st_read("C:/Users/OneDrive/Documents/R Stat Prog Lang/tl_2024_42_bg/tl_2024_42_bg.shp")

# Join data
pa_joined <- shapefile %>%
  left_join(pa_data, by = c("GEOID" = "GEOID20")) %>%
  st_transform(4326)

# Select top 5 and compute centroids
pa_top5_centroids <- pa_joined %>%
  slice(1:5) %>%
  st_centroid()

pink_icon <- awesomeIcons(
  icon = 'circle',       # shape of the marker
  markerColor = 'pink',  # Leaflet predefined color
  iconColor = 'white'    # color of the inner icon
)

leaflet(pa_top5_centroids) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addAwesomeMarkers(
    icon = pink_icon,
    popup = ~paste0("GEOID20: ", GEOID)
  )
