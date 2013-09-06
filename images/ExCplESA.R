pdf("ExCplESA.pdf", height = 4, width = 7)

options(OutDec= ",")

# Get the data

ESA = scan("ESAs.txt", what=list(0), skip=2)

esa = unlist(ESA[1])

# esa = esa[0:3080]

# First plot: ESAs

par( mar=c(0, 4, 0, 1), las=1)
# plot(c(0, 2.5), c(-0.6, 1.2), axes=FALSE, type="n", xlab="Time (s)", ylab="")
plot(c(1.7, 3.3), c(-0.3, 0.8), axes=FALSE, type="n", xlab="Time (s)", ylab="")
title(ylab="ECG (mV)", adj=0.65, line=3)
lines((1:length(esa))/ 2000, esa)
axis(2, at=c(0, 0.5))
axis(1, line=-1.5, padj=-1, at=c(1.7, 1.95, 2.2), labels=c("", "0,5 s", ""), lwd=3, lwd.ticks=0, cex.axis=1.2)

pks = which(diff(sign(diff(esa, na.pad = FALSE)), na.pad = FALSE) < 0) + 2
pks = pks[esa[pks]>0.5]



interTA <- function(xbegin, xend, ytop){
deltax = 0.02
deltay = 0.02
lines(c(xbegin-deltax, xbegin-deltax, xend+deltax, xend+deltax), c(ytop-deltay, ytop+deltay, ytop+deltay, ytop-deltay))
# mtext("Couplet d'ESA", side=3, at=(xbegin+xend)/2, adj=0.5)
text((xbegin+xend)/2, 0.77, labels="Couplet d'ESA", cex=0.8)
} 

interTA(pks[12]/2000, pks[13]/2000, 0.71)

dev.off()
