# loading the required packages
library(ggplot2)
library(ggmap)

data = read.csv("2012_onwards_w_gps_w_google.csv",stringsAsFactors=FALSE)

# creating a sample data.frame with your lat/lon points
lon <- data$longitude
lat <- data$latitude
resale <- data$resale_price
df <- as.data.frame(cbind(lon,lat,resale))

# getting the map
# maptype can be toggled between 'satellite', 'hybrid' and 'roadmap
mapgilbert <- get_map(location = c(lon = mean(df$lon), lat = mean(df$lat)), zoom = 11,
                      maptype = "roadmap", scale = 1)

# plotting the map with data points on it
ggmap(mapgilbert) + scale_fill_gradient(low='blue',high='red',name='Resale Pricing (Log)') + 
  geom_point(data = df, aes(x = lon, y = lat, fill = log10(resale), alpha = 0.25), size = 1, shape = 21) +
  guides(fill='colourbar', alpha=FALSE, size=FALSE) + scale_y_continuous(limits = c(1.2, 1.5), expand = c(0, 0)) + 
  labs(x='Longitude',y='Latitude') + ggtitle('Housing Resale Pricing')
