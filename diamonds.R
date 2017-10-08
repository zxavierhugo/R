library(ggplot2)
data(diamonds)
head(diamonds)

ggplot(diamonds,aes(x=carat))+
         geom_histogram()

ggplot(diamonds)+
  geom_density(aes(x=carat),
  fill="gray50")
      
ggplot(diamonds)+
  aes(x=carat, y=price)+
  geom_point()

g<-ggplot(diamonds,
  aes(x=carat, y=price))
g+geom_point(aes)

g<-ggplot(diamonds,
          aes(x=carat, y=price))
g + geom_point(aes(color=color))+facet_wrap(~ color) 

g<-ggplot(diamonds,
          aes(x=carat, y=price))
g + geom_point(aes(color=clarity))+facet_wrap(~ color) 

g<-ggplot(diamonds,
          aes(x=carat, y=price))
g + geom_point(aes(color=color))+facet_grid(cut ~ clarity) 

g<-ggplot(diamonds,
          aes(x=carat, y=price))
g + geom_point(aes(color=clarity))+facet_grid(cut ~ clarity) 

