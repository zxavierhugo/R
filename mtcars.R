library(lattice)
library(GGally)

data (mtcars)
head (mtcars)

#core graphics
boxplot (
  hp ~ mpg,
  data=mtcars,
  main="Horsepower for different mpg",
  xlab="Horsepower",
  ylab="Mpg"
)

densityplot( ~ mpg,
  data=mtcars,
  groups = cyl,
  plot.points=F,
  auto.key=list(columns = 3),
  title="Cylinder")


