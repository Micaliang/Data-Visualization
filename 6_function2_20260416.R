
setwd("C:/Users/PC 15/Desktop/STQD6124_data_visualization")
library(ggplot2)

install.packages("MASS")
library(MASS)
        
## Legends
gg<-ggplot(birthwt,aes(x=factor(race),
                       y=bwt,fill=factor(race)))

gg+geom_boxplot()


#remove
gg+geom_boxplot()+guides(fill="none")
gg+geom_boxplot()+scale_fill_discrete(guide="none")

#change position
gg+geom_boxplot()+theme(legend.position = "top")
gg+geom_boxplot()+theme(legend.position = c(1,1),legend.justification = c(1,1))

#(0,0)->bottom left
#(1,0)-> bottom right

#(0,1)->top left
#(1,1)->top right

# legend.justification_.which part of the legend should be put at enged.posiztion
gg+geom_boxplot()+theme(legend.position = c(1,1),
                        lengend.justification=c(1,1))+
  theme(legend.background = element_blank())

gg+geom_boxplot()+theme(legend.position = c(1,1),
                        lengend.justification=c(1,1))+
  theme(legend.background = element_blank())+
  theme(legend.key = element_blank())

gg+geom_boxplot()+theme(legend.position = c(1,1),
                        lengend.justification=c(1,1))+
  theme(legend.background = element_rect(fill = "skyblue",color = "darkblue"))


gg+geom_boxplot()+theme(legend.position = c(1,1),
                        lengend.justification=c(1,1))+
  theme(legend.background = element_rect(fill = "skyblue",color = "darkblue"))+
  theme(legend.key = element_rect(fill =  "skyblue",color = "darkblue"))


# recorder
gg+geom_boxplot()+
  scale_fill_discrete(limits=as.character(c(1,3,2)))

# reverse
gg+geom_boxplot()+guides(fill=guide_legend(reverse = T))
gg+geom_boxplot()+scale_fill_hue(guide=guide_legend(reverse = T))

# title
gg+geom_boxplot()+labs(fill="RACE")
gg+geom_boxplot()+scale_fill_discrete(name="RACE")

# Multiples legends
ggplot(mtcars,aes(x=drat,y=wt,shape = factor(am),color=factor(vs)))+
  geom_point()+labs(shape="am",color="vs")

# appearance of title
gg+geom_boxplot()+
  theme(legend.title = element_text(face = "bold",color = "seagreen",size = 10))
gg+geom_boxplot()+
  guides(fill=guide_legend(title.theme=element_text(face="bold",angle = 30)))

gg+geom_boxplot()+guides(fill=guide_legend(title = NULL))

# appearance of labels
gg+geom_boxplot()+scale_fill_discrete(labels=c("ONE","TWO","THREE"))
gg+geom_boxplot()+theme(legend.text = element_text(face = "bold",color = "seagreen",size = 10))
gg+geom_boxplot()+guides(fill=guide_legend(label.theme=element_text(face = "bold",angle = 30)))


##Facets
#multiple pannels
ggplot(mpg,aes(x=displ,y=hwy))+geom_point()
ggplot(mpg,aes(x=displ,y=hwy))+geom_point()+facet_grid(drv~.) #vertical
ggplot(mpg,aes(x=displ,y=hwy))+geom_point()+facet_grid(.~cyl) #horizontal
ggplot(mpg,aes(x=displ,y=hwy))+geom_point()+facet_grid(drv~cyl)
ggplot(mpg,aes(x=displ,y=hwy))+geom_point()+facet_wrap(~class,ncol=2)

ggplot(mpg,aes(x=displ,y=hwy))+geom_point()+facet_grid(drv~cyl,scales="free")
ggplot(mpg,aes(x=displ,y=hwy))+geom_point()+facet_grid(drv~cyl,scales="free_y")

ggplot(mpg,aes(x=displ,y=hwy))+geom_point()+facet_grid(drv~cyl)+
  theme(strip.text = element_text(face="bold",color = "blue",size = 10),
        strip.background = element_rect(fill = "skyblue",color="darkblue"))

#color palletes
ggplot(mpg,aes(x=displ,y=hwy,color=class))+geom_point()+
  scale_color_hue(l=30) #default=65

library(babynames)
baby<-subset(babynames,subset = (sex=="F"&name %in% c("Asheley","Amanda","Jessica","Patricia","Linda",
                                                      "Deborah","Dorothy","Betty","Helen")))
ggplot(baby,aes(x=year,y=n,fill = name))+geom_area(alpha=0.7)
ggplot(baby,aes(x=year,y=n,fill = name))+geom_area(alpha=0.7)+scale_fill_hue()
ggplot(baby,aes(x=year,y=n,fill = name))+geom_area(alpha=0.7)+scale_fill_grey()

library(RColorBrewer)
ggplot(baby,aes(x=year,y=n,fill = name))+geom_area(alpha=0.7)+scale_fill_brewer(palette = "BrBG")
mypal<-brewer.pal(9,"Greens")
ggplot(baby,aes(x=year,y=n,fill = name))+geom_area(alpha=0.7)+scale_fill_manual(values = mypal)


#Themes
ggplot(mpg,aes(x=displ,y=hwy,color=class))+geom_point()+
  theme_grey()
ggplot(mpg,aes(x=displ,y=hwy,color=class))+geom_point()+
  theme_bw()
ggplot(mpg,aes(x=displ,y=hwy,color=class))+geom_point()+
  theme_grey(base_size = 12)
ggplot(mpg,aes(x=displ,y=hwy,color=class))+geom_point()+
  theme(panel.grid.major = element_line(color = "blue"),
        panel.grid.minor = element_line(color="skyblue",linetype = "dashed"),
        panel.background = element_rect(fill="lightblue"),
        panel.border = element_rect(color = "darkblue"))

ggplot(mpg,aes(x=displ,y=hwy,color=class))+geom_point()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill="lightblue"),
        panel.border = element_rect(color = "darkblue"))

















