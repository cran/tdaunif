set.seed(28522L)

#Stratified sample in 1-dimension with 10 intervals
values <- sample_strat_segment(13, 10)
x <- cbind(values, rep(0, 13))
plot(x, asp = 1, pch = 19, cex = .5, xlab = 'x', ylab = '')
segments(x0 = seq(0, 1, .1), y0 = -1, y1 = 1)

#Stratified sample of a unit square with 100 cells
x <- sample_strat_square(110, 10)
plot(x, asp = 1, pch = 19, cex = .5, xlab = 'x', ylab = 'y')
segments(x0 = seq(0, 1, .1), y0 = 0, y1 = 1)
segments(y0 = seq(0, 1, .1), x0 = 0, x1 = 1)

#Stratified sample of a unit cube with 27 cells
x <- sample_strat_cube(27, 3)
#Bird's eye view of the cube
plot(x[, c(1, 2)], asp = 1, pch = 19, cex = .5, xlab = 'x', ylab = 'y')
segments(x0 = seq(0, 1, 1/3), y0 = 0, y1 = 1)
segments(y0 = seq(0, 1, 1/3), x0 = 0, x1 = 1)
#Side view of the cube
plot(x[,c(2,3)], asp = 1, pch = 19, cex = .5, xlab = 'y', ylab = 'z')
segments(x0 = seq(0,1,1/3),y0 = 0, y1 = 1)
segments(y0 = seq(0,1,1/3),x0 = 0, x1 = 1)

#All of the same illustrations, but only using sample_stratify()

#Stratified sample in 1-dimension with 10 intervals
values <- sample_stratify(13,10,1)
x <- cbind(values,rep(0,13))
plot(x, asp = 1, pch = 19, cex = .5, xlab = 'x', ylab = '')
segments(x0 = seq(0,1,.1),y0 = -1, y1 = 1)

#Stratified sample of a unit square with 100 cells
x <- sample_stratify(110,10, 2)
plot(x, asp = 1, pch = 19, cex = .5, xlab = 'x', ylab = 'y')
segments(x0 = seq(0,1,.1),y0 = 0, y1 = 1)
segments(y0 = seq(0,1,.1),x0 = 0, x1 = 1)

#Stratified sample of a unit cube with 27 cells
x <- sample_stratify(27,3, 3)
#Bird's eye view of the cube
plot(x[,c(1,2)], asp = 1, pch = 19, cex = .5, xlab = 'x', ylab = 'y')
segments(x0 = seq(0,1,1/3),y0 = 0, y1 = 1)
segments(y0 = seq(0,1,1/3),x0 = 0, x1 = 1)
#Side view of the cube
plot(x[,c(2,3)], asp = 1, pch = 19, cex = .5, xlab = 'y', ylab = 'z')
segments(x0 = seq(0,1,1/3),y0 = 0, y1 = 1)
segments(y0 = seq(0,1,1/3),x0 = 0, x1 = 1)

#Stratified sample of a unit 4-cube with 81 cells
x <- sample_stratify(81, 3, 4)
#One view of the cube
plot(x[,c(1,2)], asp = 1, pch = 19, cex = .5, xlab = 'x', ylab = 'y')
segments(x0 = seq(0,1,1/3),y0 = 0, y1 = 1)
segments(y0 = seq(0,1,1/3),x0 = 0, x1 = 1)
#Another view of the cube
plot(x[,c(2,3)], asp = 1, pch = 19, cex = .5, xlab = 'y', ylab = 'z')
segments(x0 = seq(0,1,1/3),y0 = 0, y1 = 1)
segments(y0 = seq(0,1,1/3),x0 = 0, x1 = 1)
