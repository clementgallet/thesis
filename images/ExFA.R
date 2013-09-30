pdf("ExFA.pdf", width=7, height=4) 

options(OutDec= ",")

interTA <- function(xbegin, xend, ytop){
deltax = 0.02
deltay = 0.05
lines(c(xbegin-deltax, xbegin-deltax, xend+deltax, xend+deltax), c(ytop-deltay, ytop+deltay, ytop+deltay, ytop-deltay))
mtext("TA", side=3, at=(xbegin+xend)/2, adj=0.5)
} 




par(mar=c(2.5, 4.5, 1.5, 0.5), las=1)

ECGi = scan("ExFA.txt", what=list(0, 0))
times = unlist(ECGi[1])
ECG = unlist(ECGi[2])
ECG = ECG + 0.1
ECG=ECG[times<1.8]
times=times[times<1.8]

plot(times, ECG, type="l", xlab="", ylab="ECG (mV)", axes=FALSE, xaxs="i")

pks = which(diff(sign(diff(ECG, na.pad = FALSE)), na.pad = FALSE) < 0) + 2
pks = pks[ECG[pks]>1]
interTA(times[pks[5]], times[pks[8]], max(ECG))

axis(1, line=0.5, padj=-1, at=c(0, 0.25, 0.5), labels=c("", "0,5 s", ""), lwd=3, lwd.ticks=0, cex.axis=1.2)
# axis(1)
axis(2)
dev.off()
