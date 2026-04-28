
setwd("C:/Users/PC 15/Desktop/STQD6124_data_visualization/7_interactive_charts")
library(plotly)
library(leaflet)
library(ggplot2)
library(dplyr)

plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length)

# points
plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length) %>% 
  add_markers(alpha=0.5)

plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length) %>% 
  add_markers(symbol=1)

plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length) %>% 
  add_markers(symbol=I(1))

plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length,
        symbol = ~Species,symbols = I(1:3))

plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length,
        color  = ~Species,colors=c("red","blue","green"))

plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length) %>%
  add_markers(color  = ~Species,colors=c("red","blue","green"),
              symbol = ~Species,symbols = I(1:3))

plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length,z=~Sepal.Width,
        color  = ~Species,colors=c("red","blue","green"))

plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length) %>%
  add_lines()

plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length) %>%
  add_paths()

plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length,linetype = ~Species) %>%
  add_lines()

# 回去需要补充这部分，拍了照片
longley
m<-lm(Employed~Year,data = longley)
dnew<-data.frame(longley$Year,longley$Employed,m$fitted.values)
names(dnew)=c("Year","Employed","Fitted")

plot_ly(data=dnew,x=~Year) %>% add_markers(y=~Employed,color=I("skyblue")) %>%
  add_lines(y=~fitted,color=I("darkblue"))+
  add_ribbons(ymin = fitted-std,color=I("grey"))

# bars and histograms
plot_ly(diamonds,x=~price) %>% add_histogram()

x<-1:5
y<-c(7,8,4,3,5)
z<-data.frame(x,y)
plot_ly(z,x=~x,y=~y) %>% add_bars()

plot_ly(diamonds,x=~color,color = ~cut) %>% add_histogram() # defualt is grouped

plot_ly(diamonds,x=~color,color = ~cut) %>% add_histogram() %>% layout(barmode="stack")

subplot(
  plot_ly(diamonds,x=~color,color = ~cut) %>% add_histogram(name="cut"),
  plot_ly(diamonds,x=~color,color = ~clarity) %>% add_histogram(name="clarity"),
  plot_ly(diamonds,x=~color,color = ~color) %>% add_histogram(name="color")
)

# boxplot
plot_ly(data = diamonds,x=~cut,y=~price) %>% add_boxplot()

plot_ly(data = diamonds,x=~interaction(color,cut),y=~price) %>% add_boxplot(color=~cut)

plot_ly(data = diamonds,x=~interaction(color,cut),y=~price) %>% add_boxplot(color=~color)

# heatmap
Austin<-subset(txhousing,city="Austin")
plot_ly(data = Austin,x=~year,y=~factor(month),z=~sales) %>% add_heatmap()

# maps
library(maps)
world<-map_data("world")
world %>% group_by(group) %>% plot_ly(x=~long,y=~lat)

library(tmap)
library(sf)
selangor<-tm_shape(selangor)+tm_polygons()
tmap_mode("view")
map_selangor+tm_basemap(server = "OpenTopoMap")

library(leaflet)
leaflet() %>% addProviderTiles(providers$CartoDB.Positron)
leaflet() %>% addProviderTiles(providers$Esri.WorldImagery)
leaflet() %>% addProviderTiles(providers$Esri.WorldStreetMap)

# have problem
leaflet() %>% addProviderTiles(providers$Esri.WorldStreetMap) %>%
  addMarkers(lng = 102,lat = 3,popup = "Hello, Malaysia!")

leaflet() %>% addProviderTiles(providers$Esri.WorldStreetMap) %>%
  setView(lng = 102,lat = 3,zoom = 5)

name<-c("Kedah","Selangor","Johor")
lat<-c(6.1,3.1,1.4)
long<-c(100.3,101.7,103.7)
mydata<-data.frame(name,lat,long)
leaflet(mydata) %>% addProviderTiles(providers$Esri.WorldStreetMap) %>%
  addMarkers(~long,~lat,popup = name)

leaflet() %>% addProviderTiles(providers$Esri.WorldStreetMap) %>%
  addCircles(lng =102,lat=3,radius = 500,popup = "Circle area")

# Polygon
leaflet() %>% addProviderTiles(providers$Esri.WorldStreetMap) %>%
  addPolygons(lng =c(100.3,101.7,103.7),lat=c(6.1,3.1,1.4),popup = "Polygon area")

#have problem
leaflet(selangor) %>% addProviderTiles(providers$Esri.WorldStreetMap) %>%
  addPolygons(popup = ~NAME_1)

# finishing
library(dplyr)
f<-list(family="Courier New",size=18,color="navy")
x1<-list(title="Year",titlefont=f)
y1<-list(title="Month",titlefont=f)
plot_ly(data = Austin,x=~year,y=~factor(month),z=~sales) %>% add_heatmap() %>%
  layout(title="Heatmap for Housing sales in Austin",xaxis=x1,yaxis=y1)

plot_ly(data = Austin,x=~year,y=~factor(month),z=~sales) %>% add_heatmap() %>%
  layout(title="Heatmap for Housing sales in Austin",xaxis=list(title="Year",titlefont=f),
         yaxis=list(title="Month",titlefont=f))

# legend（需要补充）
f<-list(family="sans-serif",size=12,color="plum")
l<-list(font=f,bgcolor="ivory",bordercolor="purple",borderwidth=2,orientation="h")

plot_ly(data = iris,x=~Sepal.Length,y=~Petal.Length) %>%
  add_markers(color=~Species,symbol=~Species,color=c("red","blue","green"),symbols=I(3:5)) %>% 
  layout(legend=l)
# 这段需要补充！


gf<-ggplot(mpg,aes(x=displ,y=hwy))+geom_point()+facet_wrap(~class)
ggplotly(gf)



install.packages(c("gganimate","gifski","gapminder"))
library(gganimate)
library(gifski)
library(gapminder)

head(gapminder)

# static plot
ggplot(gapminder,aes(x=gdpPercap,y=lifeExp,size=pop,color=country))+geom_point(alpha=0.7)+
  scale_x_log10()+
  guides(color=F,size=F)+
  labs(x="GDP per capital",y="Life expectancy")

ggplot(gapminder,aes(x=gdpPercap,y=lifeExp,size=pop,color=country))+geom_point(alpha=0.7)+
  scale_x_log10()+
  guides(color=F,size=F)+
  labs(x="GDP per capital",y="Life expectancy")+
  transition_time(year)


ggplot(gapminder,aes(x=gdpPercap,y=lifeExp,size=pop,color=country))+geom_point(alpha=0.7)+
  scale_x_log10()+
  guides(color=F,size=F)+
  labs(x="GDP per capital",y="Life expectancy")+
  facet_wrap(~continent)
  transition_time(year) # don't moving but need moving
  
# add labels（这几个代码没有跟上）
ggplot(gapminder,aes(x=gdpPercap,y=lifeExp,size=pop,color=country))+geom_point(alpha=0.7)+
    scale_x_log10()+
    guides(color=F,size=F)+
    labs(x="GDP per capital",y="Life expectancy",
         title="Year:"{frame_time}"")+
    facet_wrap(~continent)+
  transition_time(year)+view_follow()

ggplot(gapminder,aes(x=gdpPercap,y=lifeExp,size=pop,color=country))+geom_point(alpha=0.7)+
  scale_x_log10()+
  guides(color=F,size=F)+
  labs(x="GDP per capital",y="Life expectancy",
         title="Year:{frame_time}“)+
  facet_wrap(~continent)+
  transition_time(year)
  


# shadows



# static plot
ggplot(airquality,aes(x=Day,y=Temp,group = Month,
                      color=factor(Month)))+geom_line()+
  labs(x="Day of Month",y="Temperature")+theme(legend.position = "top")

#animate
ggplot(airquality,aes(x=Day,y=Temp,group = Month,
                      color=factor(Month)))+geom_line()+
  labs(x="Day of Month",y="Temperature")+
  theme(legend.position = "top")+
  transition_time(Day)

ggplot(airquality,aes(x=Day,y=Temp,group = Month,
                      color=factor(Month)))+geom_line()+
  labs(x="Day of Month",y="Temperature")+
  theme(legend.position = "top")+
  transition_reveal(Day)

ggplot(airquality,aes(x=Day,y=Temp,group = Month,color=factor(Month)))
+geom_line()+
  geom_point(aes(group = seq_along(Day)))
  labs(x="Day of Month",y="Temperature")+
  theme(legend.position = "top")+
  transition_reveal(Day)
  
  
  
# Barplots
Month<-5:9
Temp<-c(65.55,79.1,83.9,84,76.9)
mean_temp<-data.frame(Month,Temp)
ggplot(mean_temp,aes(x=Month,y=Temp,,fill = Temp))+
  geom_bar(stat = "identity")+transition_states(Month)

ggplot(mean_temp,aes(x=Month,y=Temp,,fill = Temp))+
  geom_bar(stat = "identity")+transition_reveal(Month)

ggplot(mean_temp,aes(x=Month,y=Temp,,fill = Temp))+
  geom_bar(stat = "identity")+transition_states(Month)+shadow_mark()

ggplot(mean_temp,aes(x=Month,y=Temp,,fill = "hotpink",color="darkred"))+
  geom_bar(stat = "identity")+transition_states(Month)+shadow_mark()

ggplot(mean_temp,aes(x=Month,y=Temp,,fill = "hotpink",color="darkred"))+
  geom_bar(stat = "identity")+transition_states(Month)+shadow_mark()+
  labs(title="Class:{closet_state}")


