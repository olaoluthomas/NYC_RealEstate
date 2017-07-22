find.package("rgeos")
find.package("rgdal")
install.packages("rgdal")
install.packages("rgeos")
install.packages("tydyverse")
install.packages("dplyr")

df <- read.csv("data.csv")
head(df)

library(dplyr)

df %>% group_by(borough) %>% summarise(avg_price = mean(price), max_price = max(price), min_price = min(price), total = n())

library(rgdal)
library(rgeos)

wgs.84  <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
mollweide  <- "+proj=moll +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"

points  <- SpatialPoints(df[c('latitude', 'longitude')], proj4string = CRS(wgs.84))
coast  <- readOGR(dsn="coastline_data",layer="ne_10m_coastline", p4s=wgs.84)

plot(points.moll)

coast.moll  <- spTransform(coast, CRS(mollweide))
points.moll  <- spTransform(points, CRS(mollweide))

getSlots("SpatialPoints")
getSlots("SpatialLinesDataFrame")

gDistance(points.moll, coast.moll)

test <- sample(1:length(points), 10)
test_result <- sapply(test, function(i)gDistance(points.moll[i], coast.moll))

test_result

len <- c(1:length(points))


coastdistance  <- sapply(len, function(i){
  gDistance(points.moll[i], coast.moll)
})

class(coastdistance)

df$coastdist <- coastdistance
df
write.csv(df, file = "data2.csv")
