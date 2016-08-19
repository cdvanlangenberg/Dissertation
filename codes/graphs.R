# process on a circle

library(MASS)
library(plotrix)

pdf("graphs/process_circle.pdf",
    width = 7,
    height = 7)
eqscplot(
  x = c(-1, 1),
  y = c(-1, 1),
  type = "n",
  xaxt = "n",
  yaxt = "n",
  bty = "n" ,
  xlab = " ",
  ylab = " ",
  col = "white"
)
draw.circle(
  x = 0,
  y = 0,
  radius = 1,
  lty = 2,
  lwd = 2
)
theta <- seq(-pi, pi, by = pi / 12)
size <-
  sample(seq(1, 2.5, length.out = 6),
         size = length(theta),
         replace = T)
points(
  x = cos(theta),
  y = sin(theta),
  col = 2,
  pch = 19,
  cex = size
)
dev.off()