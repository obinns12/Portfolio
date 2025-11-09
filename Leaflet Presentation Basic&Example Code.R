# install.packages("leaflet")
library(leaflet)
head(leaflet)
?leaflet

#Simple Map of USA
leaflet() %>%
  addTiles() %>%
  setView(lng = -95, lat = 40, zoom = 2)

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


#Heart icon
heart_icon <- awesomeIcons(
  icon = 'heart',
  iconColor = 'black',
  markerColor = 'red'
)

#Philly = heart, others = normal
leaflet(cities) %>%
  addTiles() %>%
  addAwesomeMarkers(data = subset(cities, name == "Philadelphia, PA"),
                    ~lng, ~lat, icon = heart_icon, popup = ~name) %>%
  addMarkers(data = subset(cities, name != "Philadelphia, PA"),                  #Other cities
             ~lng, ~lat, popup = ~name)


