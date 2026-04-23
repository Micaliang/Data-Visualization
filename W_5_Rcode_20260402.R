setwd("C:/Users/PC 15/Desktop/5_dv")
library(ggplot2)
#Bar charts
#Basic bar charts
x<-1:5
y<-c(4,9,6,5,1)
z<-data.frame(x,y)

ggplot(data=z,aes(x=x,y=y))+geom_bar(stat = "identity")
ggplot(data=z,aes(x,y))+geom_bar(stat = "identity")

# if data is continuous(change x to factor)
x<-c(1,1.3,1.4,2.0,2.5)
y<-c(4,9,6,5,1)
z<-data.frame(x,y)
ggplot(data=z,aes(factor(x),y))+geom_bar(stat = "identity")

# change color
ggplot(data=z,aes(factor(x),y))+geom_bar(stat = "identity",
                                         fill="lightgreen",color="blue")
# count data
ggplot(data=mpg)+geom_bar(aes(x=class))
ggplot(data=mpg,aes(x=class))+geom_bar() #if table need to identify
ggplot(data=mpg,aes(x=class))+
  geom_bar(fill="steelblue",color="darkblue")

# histogram(continuoes data)
ggplot(data=mpg,aes(x=displ))+
  geom_histogram()

# change color with category
a<-c("A","B","C","D","E","F","G","H","I","J")
b<-c(11,11,11,12,13,11,13,12,13,13)
c<-c(10,8,14,6,17,6,20,14,11,19)
d<-data.frame(a,b,c)

ggplot(data=d,aes(x=a,y=b,fill = b))+
  geom_bar(stat="identity")

ggplot(data=d,aes(x=a,y=b,fill = factor(b)))+
  geom_bar(stat="identity")

ggplot(data=d,aes(x=a,y=c))+
  geom_bar(stat="identity",fill=b)

f<-factor(b,labels=c("First","Second","Thord"))
e<-data.frame(a,f,c)
ggplot(data=e,aes(x=a,y=c))+
  geom_bar(stat="identity",fill=f)

f<-factor(b,labels=c("red","blue","green"))
e<-data.frame(a,f,c)
ggplot(data=e,aes(x=a,y=c))+
  geom_bar(stat="identity",fill=f)

# stacked barchart
x<-rep(1:3,2)
y<-rep(1:2,3)
r<-c(8,3,8,6,3,7)
z<-data.frame(x,y,r)
ggplot(data=z,aes(x=factor(x),y=r,fill=factor(y)))+
         geom_bar(stat = "identity")

# group barchart
ggplot(data=z,aes(x=factor(x),y=r,fill=factor(y)))+
  geom_bar(stat = "identity",position = "dodge")

ggplot(data=z,aes(x=factor(x),y=r,fill=factor(y)))+
  geom_bar(stat = "identity",position = position_dodge())

z1<-z[-6,]
ggplot(data=z1,aes(x=factor(x),y=r,fill=factor(y)))+
  geom_bar(stat = "identity")

ggplot(data=z1,aes(x=factor(x),y=r,fill=factor(y)))+
  geom_bar(stat = "identity",position = position_dodge())

z2<-rbind(z1,c(3,2,0))
ggplot(data=z2,aes(x=factor(x),y=r,fill=factor(y)))+
  geom_bar(stat = "identity",position = position_dodge())

ggplot(data=mpg,aes(x=class,fill = drv))+geom_bar()

ggplot(data=mpg,aes(x=class,fill = drv))+geom_bar(position = "dodge")

d<-data.frame(table(mpg$class,mpg$drv))
ggplot(data=d,aes(x=Var1,y=Freq,fill = Var2))+geom_bar(stat = "identity",
                                                       position = "dodge")

# setting width and spacing
ggplot(data=mpg,aes(x=class,fill = drv))+geom_bar()
# default=0.9(prinary setting)

ggplot(data=mpg,aes(x=class,fill = drv))+geom_bar(width=0.5)
ggplot(data=mpg,aes(x=class,fill = drv))+geom_bar(width=1.2)

ggplot(data=mpg,aes(x=class,fill = drv))+
  geom_bar(position=position_dodge(0.6),width=0.5)
# width=x makes each group takes up a total width of x
# where it would be if the bar width were x and touching

# Adding labels
x<-1:5
y<-c(4,9,6,5,1)
z<-data.frame(x,y)

ggplot(data=z,aes(x=x,y=y))+geom_bar(stat="identity")
ggplot(data=z,aes(x=x,y=y))+geom_bar(stat="identity")+
  geom_text(aes(label=y),vjust=-0.5,color="red")

tab<-data.frame(table(mpg$class))
ggplot(data=mpg)+geom_bar(aes(x=class),color="darkblue",fill="steelblue")+
  geom_text(aes(x=1:7,y=Freq,label = Freq),data=tab,vjust=1.2,size = 4,color="white")


# Order bars
a<-c("A","B","C","D","E","F","G","H","I","J")
b<-c(11,11,11,12,13,11,13,12,13,13)
c<-c(10,8,14,6,17,6,20,14,11,19)
d<-data.frame(a,b,c)
ggplot(data=d,aes(x=a,y=c))+geom_bar(stat="identity")+
  scale_x_discrete(limits=c("A","C","E","G","I","B","D","F","H","J"))

ggplot(data = d,aes(reorder(a,b),y=c))+geom_bar(stat = "identity")






