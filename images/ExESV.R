pdf("ExESV.pdf", height = 4, width = 7)

options(OutDec= ",")

# Get the data

ESV = scan("ESVs.txt", what=list(0), skip=2)

esv = unlist(ESV[1])

# esv = esv[0:3080]

# First plot: ESVs

par( mar=c(0, 4, 0, 1), las=1)
plot(c(1, 2.5), c(-0.6, 1.2), axes=FALSE, type="n", xlab="Time (s)", ylab="")
# plot(c(0, 1.55), c(-0.3, 0.8), axes=FALSE, type="n", xlab="Time (s)", ylab="")
title(ylab="ECG (mV)", adj=0.5, line=3)
lines((1:length(esv))/ 2000, esv)
axis(2, at=c(0, 0.5, 1))
axis(1, line=-2, padj=-1, at=c(1, 1.25, 1.5), labels=c("", "0,5 s", ""), lwd=3, lwd.ticks=0, cex.axis=1.2)


pks = which(diff(sign(diff(esv, na.pad = FALSE)), na.pad = FALSE) < 0) + 2
pks = pks[esv[pks]>0.2]

lines(c(pks[9]/2000, 1.75), c(esv[pks[9]]+0.02, 1.05), lty=2)
lines(c(pks[11]/2000, 1.82), c(esv[pks[11]]+0.02, 1), lty=2)
lines(c(pks[13]/2000, 1.9), c(esv[pks[13]]+0.02, 1), lty=2)
text( 1.85, 1.05, labels="ESV", cex=0.8)

# lines(c(1825/2000, 1900/2000), c(0.13, 0.6), lty=2)
# text( 1900/2000, 0.63, labels="ESV", cex=0.8)
# arrows(1980/2000, 0.35, 2500/2000, 0.35, code=3, length=0.1)
# text(2250/2000, 0.38, labels="Pause compensatrice", cex=0.5)
dev.off()
