add2 <- function(x, y){
  x + y
}

above10 <- function(x){
  use <- x > 10
  x[use]
}

above <- function(x, n = 10){
  use <- x > n
  x[use]
}

columnMean <- function(y){
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[,i])
  }
  means
}


lm <- function(x){
  x * x
}

f <- function(x , y){
  x^2 + y / z
}

make.power <- function(n){
  pow <- function(x){
    x ^ n
  }
  pow
}

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

noise <- function(n, mean, sd){
  rnorm(n, mean, sd)
}