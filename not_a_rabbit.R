print(load(url("https://raw.githubusercontent.com/ibecav/r-user-group/mapping_example/town_county_borders.RData")))

# town_esri_data <-
#   sf::st_read("shapefiles/cb_2017_09_cousub_500k.shp") %>%
#   sf::st_transform('+proj=longlat +datum=WGS84') %>%
#   mutate(town_center = sf::st_centroid(geometry))
# 
# county_esri_data <-
#   sf::st_read("shapefiles/countyct_37800_0000_1990_s100_CENSUS_1_shp_wgs84.shp") %>%
#   sf::st_transform('+proj=longlat +datum=WGS84') %>%
#   mutate(county_center = sf::st_centroid(geometry))

# save(town_esri_data, county_esri_data, file = "town_county_borders.RData")

leaflet::leaflet(county_esri_data) %>% 
  leaflet::addTiles() %>%
  leaflet::setView(
    lng = -72.74587984553425,
    lat = 41.60828560557468,
    zoom = 8.8
  ) %>%
  # leaflet::addProviderTiles("Stamen.Toner") %>% 
  leaflet::addPolygons(
    fill = NA,
    color = "red"
  ) %>% 
  leaflet::addLabelOnlyMarkers(
    data = county_esri_data$county_center,
    label = county_esri_data$NAME,
    labelOptions = leaflet::labelOptions(noHide = TRUE, 
                                         direction = 'top', 
                                         textOnly = TRUE, 
                                         color = "blue")
  )

