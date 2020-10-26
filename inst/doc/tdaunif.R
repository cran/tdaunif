## ---- include=FALSE, results='hide'-------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.align='center', fig.width=6)

## ----attach and stabilize-----------------------------------------------------
library(tdaunif)
oldpar <- par(no.readonly = TRUE)
set.seed(0)

## ---- fig.height=6------------------------------------------------------------
hemi <- sample_2hemisphere(180L)
pairs(hemi, asp = 1, pch = 19, cex = .5)

## ---- fig.height=3------------------------------------------------------------
sq1 <- sample_strat_square(100L, bins = 1L)
sq4 <- sample_strat_square(100L, bins = 4L)
sq10 <- sample_strat_square(100L, bins = 10L)
par(mfrow = c(1, 3))
plot(sq1, asp = 1, pch = 19, cex = .5)
plot(sq4, asp = 1, pch = 19, cex = .5)
plot(sq10, asp = 1, pch = 19, cex = .5)

## ---- fig.height=6------------------------------------------------------------
hemi10 <- sample_2hemisphere(225L, bins = 10L)
pairs(hemi10, asp = 1, pch = 19, cex = .5)

## ---- fig.height=6------------------------------------------------------------
tref <- sample_trefoil(120L)
pairs(tref, asp = 1, pch = 19, cex = .5)

## -----------------------------------------------------------------------------
disk_parameterization <- function(s, t) cbind(
  x = s,
  y = t * sqrt(1 - s^2)
)
disk_jacobian <- function(s, t) sqrt(1 - s^2)
disk_sampler <- make_rejection_sampler(
  parameterization = disk_parameterization,
  jacobian = disk_jacobian,
  min_params = c(-1, -1), max_params = c(1, 1),
  max_jacobian = 1
)
disk1 <- disk_sampler(360L)

## ---- fig.height=4------------------------------------------------------------
disk2 <- sample_disk(360L)
par(mfrow = c(1L, 2L))
plot(disk1, asp = 1, pch = 19, cex = 1/3)
plot(disk2, asp = 1, pch = 19, cex = 1/3)

## ----restore------------------------------------------------------------------
par(oldpar)

