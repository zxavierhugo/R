library(lattice)
library(GGally)

data (iris)
head (iris)

#core graphics
boxplot (
  Sepal.Length ~ Species,
  data=iris,
  main="Sepal Length for Various Species",
  xlab="Species",
  ylab="Sepal Length"
)

pie(table(iris$Species))

plot (
  Sepal.Length ~ Sepal.Width,
  data=iris,
  main="Sepal Length for Various Species",
  xlab="Sepal Length",
  ylab="Speal Width"
)

xyplot (
  Sepal.Width ~ Sepal.Length,
  data=iris,
  groups=Species,
  auto.key=TRUE
)

plot (
  Petal.Length ~ Petal.Width,
  data=iris,
  main="Petal Length for Various Species",
  xlab="Petal Length",
  ylab="Petal Width"
)

histogram (
  iris$Petal.Length, breaks = 10, main= "Histogram"
           )

densityplot(
  iris$Petal.Length, main="Kernel Density of Petal Length", xlab = "Petal Length"
)

densityplot( 
  ~ Petal.Width, data = iris,
  groups = Species,
  auto.key = TRUE,
  xlab = "Kernel Density of Petal Width",
  ylab = "Frequency",
  main = list (label = "Density of Petal Width by Species")
)


pairs(
  iris[,1:4],
  main = "Scatterplot Matrix"
)

splom (iris[1:4],
       groups = iris$Species)

ggpairs(iris,
        ggplot2::aes(color=Species))

