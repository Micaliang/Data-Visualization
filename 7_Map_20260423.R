
setwd("C:/Users/PC 15/Desktop/STQD6124_data_visualization/map")
library(ggplot2)
library(RColorBrewer)

install.packages("maps")
library(maps)

install.packages("sf")
library(sf)

install.packages("tmap")
library(tmap)

install.packages("ggmap")
library(ggmap)

install.packages("osmdata")
library(osmdata)

# Heatmaps
Austin<-subset(txhousing,city=="Austin")

# geom_tile()
ggplot(Austin,aes(x=year,y=factor(month),fill = sales))+geom_tile()

ggplot(Austin,aes(x=year,y=factor(month),fill = sales))+geom_tile()+
  scale_fill_gradient2(midpoint = 2000,mid = "plum",limits=c(0,3500))

# geom_raster()
ggplot(Austin,aes(x=year,y=factor(month),fill = sales))+geom_raster()

ggplot(Austin,aes(x=year,y=factor(month),fill = sales))+geom_raster()+
  scale_fill_gradient2(midpoint = 2000,mid = "plum",low = "hotpink",high = "darkblue")

ggplot(Austin,aes(x=year,y=factor(month),fill = sales))+geom_tile(color="white",lwd=1.5,linetype = 1)+
  scale_fill_gradient2(midpoint = 2000,mid = "plum",low = "hotpink",high = "darkblue")

ggplot(Austin,aes(x=year,y=factor(month),fill = sales))+geom_tile(color="white",lwd=1.5,linetype = 1)+
  scale_fill_gradient2(midpoint = 2000,mid = "plum",low = "hotpink",high = "darkblue")+
  coord_fixed()

ggplot(Austin,aes(x=year,y=factor(month),fill = sales))+geom_tile(color="white",lwd=1.5,linetype = 1)+
  scale_fill_gradient2(midpoint = 2000,mid = "plum",low = "hotpink",high = "darkblue")+
  coord_fixed()+geom_text(aes(label = sales),color="white",size = 2)

# Maps
# world map
map1<-map_data("world")

ggplot(map1,aes(x=long,y=lat,group = group))+geom_polygon(fill="skyblue",color="darkblue")

ggplot(map1,aes(x=long,y=lat,group = group))+geom_path(color="darkblue") # no fill

# new zealand,italy,france,usa
map2<-map_data("italy")

ggplot(map2,aes(x=long,y=lat,group = group))+geom_polygon(fill="bisque",color="chocolate")

# malaysia
msia<-map_data("world",region = "Malaysia")
ggplot(msia,aes(x=long,y=lat,group = group))+geom_polygon(fill="skyblue",color="darkblue")

ggplot(msia,aes(x=long,y=lat,group = group,fill = subregion))+geom_polygon(color="darkblue")

selangor<-st_read(file.choose())  # Selangor SHP
ggplot(selangor)+geom_sf(fill="wheat",color="tan4")

# add points
mymap<-read.csv(file = "rain_selangor.csv",header = T)
ggplot(selangor)+geom_sf(fill="wheat",color="tan4")+
  geom_point(data=mymap,aes(x=longitude,y=latitude),
             inherit.aes = F,shape=3)

ggplot(selangor)+geom_sf(fill="wheat",color="tan4")+
  geom_point(data=mymap,aes(x=longitude,y=latitude,size = ave),
             inherit.aes = F,alpha=0.5)

# cloropleth
ggplot(selangor)+geom_sf(aes(fill=NAME_1),color="black")

mypal<-colorRampPalette(brewer.pal(3,"Dark2"))(3)
ggplot(selangor)+geom_sf(aes(fill=NAME_1),color="black")+
  scale_fill_manual(values = mypal)


library(tmap)
tm_shape(selangor)+tm_fill()
tm_shape(selangor)+tm_borders()
tm_shape(selangor)+tm_fill()+tm_borders()
tm_shape(selangor)+tm_polygons()

tm_shape(selangor)+tm_fill(col="red",fill_alpha=0.3)+tm_borders(col = "blue",lwd=3,lty=2)

tm_shape(selangor)+tm_polygons("NAME_1")

tm_shape(selangor)+tm_fill(col="NAME_1",fill_alpha=0.7)+tm_borders()#有问题
tm_shape(selangor)+tm_fill(col="ID_1",fill_alpha=0.7)+tm_borders()#有问题

legend_title<-expression("Area(km"^2*")")
tm_shape(selangor)+tm_fill(col="ID_1",fill_alpha=0.7,title=legend_title)+tm_borders() #有问题

map_selangor<-tm_shape(selangor)+tm_polygons()
map_selangor+tm_layout(title="Selangor")
map_selangor+tm_layout(scale = 5)
map_selangor+tm_layout(bg.color = "floralwhite")
map_selangor+tm_layout(frame = FALSE)

map_selangor+tm_style("bw")
map_selangor+tm_style("classic")
map_selangor+tm_style("cobalt")

tm_shape(selangor)+tm_polygons("NAME_1")+
  tm_compass(position = c("left","top"))+
  tm_scalebar(position = c("right","bottom"))+
  tm_layout(legend.position=c("left","bottom"))

mymap_sf<-st_as_sf(mymap,coords = c("longitude","latitude"),
                   crs=4326)

tm_shape(selangor)+tm_polygons()+
  tm_shape(mymap_sf)+tm_dots(size=0.5,alpha=0.5,col="red")

tm_shape(selangor)+tm_polygons("NAME_1")+
  tm_text("NAME_1",size = 0.6)

tm_shape(selangor[selangor$NAME_1=="Kuala Lumpur",])+
  tm_polygons()+tm_fill(col="blue",alpha=0.3)

install.packages("osmdata")
library(osmdata)
head(available_features())

register_stadiamap("a289fbd2-b481-438a-b0b1-54b0e2f489b7")
map_map<-get_stadiamap(getbb("Madrid"),
                       maptype = "stamen_toner")
ggmap(mad_map)
q<-add_osm_feature(opq(getbb("Madrid")),"amenity","cinema")

str(q)
cinema<-osmdata_sf(q)

ggmap(mad_map)+geom_sf(data = cinema$osm_points,inherit.aes = F,
                       color="seagreen",fill="darkgreen",
                       alpha=0.5,size=4,shape=21,labs(x="",y=""))
m<-c(-10,30,5,46)
q<-add_osm_feature(add_osm_feature(opq(m,timeout = 25*10),
                                   "name","Mercadona"),"shop","supermarket")

str(q)
mrecadona<-osmdata_sf(q)
ggplot(mercadona$osm_points)+
  geom_sf(color="darkblue",fill="steelblue",alpha=0.5,
          size=2,shape=21)+labs(x="",y="")+theme_void()

m<-c(99,1,120,6)
q<-add_osm_feature(opq(m,timeout = 25*10),"shop","coffee")
coffee<-osmdata_sf(q)
msia<-get_stadiamap(m,maptype = "stamen_toner_line")

ggmap(msia)+geom_sf(data = coffee$osm_points,inherit.aes = F,
                    color="darkred",fill="lightpink",
                    alpha=0.5,size=4,shape=21)+labs(x="",y="")

msia2<-map_data("world",region="Malaysia")

ggplot(msia2,aes(x=long,y=lat,group=group))+
  geom_polygon(fill="skyblue",color="darkblue")+
  geom_sf(data = coffee$osm_points,inherit.aes = F,
                    color="darkred",fill="lightpink",
                    alpha=0.5,size=4,shape=21)+labs(x="",y="")





















