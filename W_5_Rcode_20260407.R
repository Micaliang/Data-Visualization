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

#Excercise

setwd("C:/Users/PC 14 - MAKMAL BETA/Desktop\W6")
#Q1
library(ggplot2)
table(infert$induced,infert$age)
mytab<-table(infert$induced,infert$age)
mydata<-data.frame(mytab)

names(mydata)<-c("Included","Age","Freq")
mydata
ggplot(data=mydata,aes(x=Age,y=Freq,fill = Included))+
  geom_bar(stat="identity",Position="dodge")

#Q2
final<-read.table(file = "clipboard",header = TRUE,sep = "\t")
mlab<-read.table(file = "clipboard",header = TRUE,sep = "\t")
icut<-unique(final$pcut)

ggplot(data = final,aes(x=pcut,y=prop,fill=pcol))+
  geom_bar(stat = "identity")+
  geom_text(aes(x=x,y=y,label = mylab),
            data=mlab,inherit.aes = F,vjust=1,size=3)+
  scale_x_discrete(limits=icut)


# Line chart
g<-ggplot(trees,aes(x=Girth,y=Height))
g+geom_line()

ggplot(trees,aes(x=Girth,y=Height))+geom_line()

# expand limits
g+geom_line()+expand_limits(x=5,y=50)
g+geom_line()+expand_limits(x=c(5,25))

# adding points
g+geom_line()+geom_point()

# log_scale limits
g+geom_line()+scale_y_log10()
g+geom_line()+scale_x_log10()

# if x is discrete,we can force it into treated
# as continuous using as.numeric()
ggplot(sleep,aes(x=as.numeric(ID),y=extra))+geom_line()

# multiple lines
# the 3rd variable is discrete

ggplot(mpg,aes(x=displ,y=cty,colour = drv))+geom_line()
ggplot(mpg,aes(x=displ,y=cty,linetype = drv))+geom_line()
ggplot(mpg,aes(x=displ,y=cty,group = drv))+geom_line()
ggplot(mpg,aes(x=displ,y=cty,shape = drv))+geom_line()+geom_point()

# change line and point features
g+geom_line(colour="red",linetype = "dashed",size=2)
g+geom_line(colour="red",linetype = "dotted",size=1)
g+geom_line(colour="red",linetype = "dotted",size=1)+
  geom_point(shape=19,size=2,colour="red",fill="hotpink") 
# 因为shape=19是实点，所以fill="hotpink在这里不起作用，只是例子.

g+geom_line(colour="red",linetype = "dotted",size=1)+
  geom_point(shape=21,size=2,colour="red",fill="green")
# shape=21 是空心点

# area chart
ggplot(longley,aes(x=Year,y=Armed.Forces))+geom_area()
ggplot(longley,aes(x=Year,y=Armed.Forces))+
  geom_area(fill="lightpink")

ggplot(longley,aes(x=Year,y=Armed.Forces))+
  geom_area(fill="lightpink",colour="blue")

ggplot(longley,aes(x=Year,y=Armed.Forces))+
  geom_area(fill="lightpink",colour="blue",alpha=0.2) # 80% transparent

ggplot(longley,aes(x=Year,y=Armed.Forces))+
  geom_area(fill="lightpink",colour="blue",alpha=0.4) # 60% transparent

# stacked area chart
library(babynames)
baby<-subset(babynames,subset=(sex=="F"&name%in%
                                 c("Ashley","Amanda","Jessica","Patricia",
                                   "Linda","Deborah","Dorothy","Betty","Helen")))
ggplot(baby,aes(x=year,y=n,fill = name))+geom_area()
ggplot(baby,aes(x=year,y=n,fill = name))+geom_area(alpha=0.6)

# add confidence intervals
longley
std<-sd(longley$Armed.Forces)

# use geom_ribbon(
ggplot(longley,aes(x=Year,y=Armed.Forces))+
  geom_ribbon(aes(ymin = Armed.Forces-std,ymax = Armed.Forces+std),
              alpha=0.3)+geom_line()

#这样会看不到虚线
ggplot(longley,aes(x=Year,y=Armed.Forces))+geom_line()+
  geom_ribbon(aes(ymin = Armed.Forces-std,ymax = Armed.Forces+std))

# or use geom_line()
ggplot(longley,aes(x=Year,y=Armed.Forces))+
  geom_line(aes(y=Armed.Forces-std),linetype = "dashed",colour="blue")+
  geom_line(aes(y=Armed.Forces+std),linetype = "dashed",colour="blue")+
  geom_line()

# dual-axes chart
x<-1:100
var1<-cumsum(rnorm(100))
var2<-var1^1
mydata<-data.frame(x,var1,var2)
ggplot(mydata,aes(x=x))+geom_line(aes(y=var1),color="red")+
  geom_line(aes(y=var2/10),color="blue")+
  scale_y_continuous(sec.axis = sec_axis(~.*10),name = "var2")

ggplot(mydata,aes(x=x))+geom_line(aes(y=var1),color="red")+
  geom_line(aes(y=var2/10),color="blue")
# 这个拍了照片，回去要复习一下，老师能出来3条线，但是我不能。






































