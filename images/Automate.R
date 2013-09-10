pdf("Automaton.pdf", width=8, height=3)
# setEPS()
# postscript("Automaton.eps", width=8, height=3)

library("diagram")

par(mar=c(1,1,1,1))
openplotmat(ylim=c(0, 0.35))

pos<-coordinates (c(3),mx=0,my=0)

arr1 = curvedarrow(from=pos[1,],to=pos[2,],curve=-0.2, lcol="black", lwd=2, arr.length=0.25, arr.pos=0.5)
text(arr1[1], arr1[2]-0.03, expression(RR[b] < k[A] * RR[n]), cex=1.5, col="black")
arr2 = selfarrow(pos[1,],curve=c(0.08, 0.05), lcol="black", lwd=2, path="D", arr.length=0.25, arr.pos=0.75, code = 2)
text(arr2[1], arr2[2]-0.03, expression(RR[b] > k[A] * RR[n]), cex=1.5, col="black")

arr3 = curvedarrow(from=pos[2,],to=pos[3,],curve=-0.2, lcol="black", lwd=2, arr.length=0.25, arr.pos=0.5)
text(arr3[1], arr3[2]-0.03, expression(RR[b] > k[P] * RR[n]), cex=1.5, col="black")
arr4 = selfarrow(pos[2,],curve=c(0.08, 0.05), lcol="black", lwd=2, path="D", arr.length=0.25, arr.pos=0.75, code = 2)
text(arr4[1], arr4[2]-0.03, expression(RR[b] < k[P] * RR[n]), cex=1.5, col="black")

curvedarrow(from=pos[3,],to=pos[1,],curve=0.25, lcol="black", lwd=2, arr.length=0.25, arr.pos=0.5)

curvedarrow(from=pos[2,],to=pos[1,],curve=0.3, lcol="black", lwd=2, lty=2, arr.length=0.25, arr.pos=0.5)

textellipse (pos[1,],0.05, lab="N",cex=1,shadow.col="black",shadow.size = 0.0025)
textellipse (pos[2,],0.05, lab="A",cex=1,shadow.col="black",shadow.size = 0.0025)
textellipse (pos[3,],0.05, lab="P",cex=1,shadow.col="black",shadow.size = 0.0025)

dev.off()
