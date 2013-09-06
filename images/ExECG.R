pdf("ExECG.pdf", height = 5, width = 7)
# setEPS()
# postscript("ExECG.eps", height = 5, width = 7)

# Peak detection

peaks = function( tab, over ){
	n = length(tab)
	which(( tab[2:(n-1)] > tab[1:(n-2)] ) & ( tab[2:(n-1)] >= tab[3:n] ) & ( tab[2:(n-1)] > over )) + 1
}

# Get the data

ESA = scan("ESAs.txt", what=list(0), skip=2)
ESV = scan("ESVs.txt", what=list(0), skip=2)

esa = unlist(ESA[1])
esv = unlist(ESV[1])

# esv = esv[1000:6000]
# esa = esa[1000:6000]

# First plot: ESAs

par(mfcol=c(2, 1), mar=c(0, 4, 0, 1), las=1)
# plot(c(0, 2.5), c(-0.6, 1.2), axes=FALSE, type="n", xlab="Time (s)", ylab="")
plot(c(0, 10), c(-0.6, 1.2), axes=FALSE, type="n", xlab="Time (s)", ylab="")
title(ylab="ECG (mV)", adj=0.65, line=3)
lines((1:length(esa))/ 2000, esa)
axis(2, at=c(0, 0.5, 1))

xp = peaks(esa, 0.4)/2000
yp = esa[peaks(esa, 0.4)] + 0.1

isESA = c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)

xN = xp[!isESA]
yN = yp[!isESA]
xA = xp[isESA]
yA = yp[isESA]

text(xN, yN, labels="N")
text(xA, yA, labels="A")


# Second plot: ESVs

plot(c(0, 2.5), c(-0.6, 1.2), axes=FALSE, type="n", xlab="Time (s)", ylab="")
title(ylab="ECG (mV)", adj=0.65, line=3)
lines((1:length(esv))/ 2000, esv)
axis(2, at=c(0, 0.5, 1))
axis(1, line=-1.5, padj=-1, at=c(0, 0.25, 0.5), labels=c("", "0.5 s", ""), lwd=3, lwd.ticks=0, cex.axis=1.2)

xp = peaks(esv, 0.3)/2000
yp = esv[peaks(esv, 0.3)] + 0.1

isESV = c(FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)

xN = xp[!isESV]
yN = yp[!isESV]
xV = xp[isESV]
yV = yp[isESV]

text(xN, yN, labels="N")
text(xV, yV, labels="V")

dev.off()
