pdf("ExESA.pdf", height = 4, width = 7)

options(OutDec= ",")

# Get the data

ESA = scan("ESAs.txt", what=list(0), skip=2)

esa = unlist(ESA[1])

esa = esa[0:3080]

# First plot: ESAs

par( mar=c(0, 4, 0, 1), las=1)
# plot(c(0, 2.5), c(-0.6, 1.2), axes=FALSE, type="n", xlab="Time (s)", ylab="")
plot(c(0, 1.55), c(-0.3, 0.8), axes=FALSE, type="n", xlab="Time (s)", ylab="")
title(ylab="ECG (mV)", adj=0.5, line=3)
lines((1:length(esa))/ 2000, esa)
axis(2, at=c(0, 0.5))
axis(1, line=-1.5, padj=-1, at=c(0, 0.25, 0.5), labels=c("", "0,5 s", ""), lwd=3, lwd.ticks=0, cex.axis=1.2)

lines(c(1825/2000, 1900/2000), c(0.13, 0.6), lty=2)
text( 1900/2000, 0.63, labels="ESA", cex=0.8)
arrows(1980/2000, 0.35, 2500/2000, 0.35, code=3, length=0.1)
text(2250/2000, 0.38, labels="Pause compensatrice", cex=0.5)

dev.off()
