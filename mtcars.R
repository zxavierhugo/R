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

