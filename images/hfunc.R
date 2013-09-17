# setEPS()
# postscript("cv_seg.eps", width = 6, height = 6)
pdf("hfunc.pdf", height = 5, width = 5)

par(mar=c(3, 3, 2, 1), las=1)


plot(c(-1, 1), c(0, 1), type="n", axes=FALSE, xlab="", ylab="")

logistic = function(x, slope=1){
	1/(1 + exp(-2*slope*x))
}

xs = (-1000:1000) / 1000
lines(xs, logistic(xs, 2), lwd=2, lty=1)
lines(xs, logistic(xs, 4), lwd=2, lty=2)
lines(xs, logistic(xs, 8), lwd=2, lty=3)

axis(1, at=c(-1, 0, 1))
axis(2, at=c(0, 1))

legend(x="topleft", legend=c("pente = 2", "pente = 4", "pente = 8"), lwd=c(2, 2, 2), lty=c(1, 2, 3), bty="n")

dev.off()
