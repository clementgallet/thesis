pdf("compareOndes.pdf", height = 5, width = 5)
# setEPS()
# postscript("compareOndes.eps", height = 5, width = 5)

options(OutDec= ",")
 
ondesT = scan("ondesT.txt", what=list(0, 0), skip=1)
ondesF = scan("ondesF.txt", what=list(0, 0), skip=1)

ART = unlist(ondesT[1])
NLT = unlist(ondesT[2])
ARF = unlist(ondesF[1])
NLF = unlist(ondesF[2])

filterT = ART<5 & NLT>0.003
filterF = ARF<5

NLT = NLT[filterT]
ART = ART[filterT]
NLF = NLF[filterF]
ARF = ARF[filterF]

par(mar=c(3, 3, 0, 3), las=1)

plot(c(0, 1), c(1, 5), axes=FALSE, type="n", xlab="", ylab="")
title(xlab="Niveau de bruit", ylab="Rapport d'amplitude", line=1.8)

points( NLT, ART, pch='o', cex=0.5, col="grey60", xpd=NA )

x1 = c( seq((1/4), 1, 0.01))
x2 = c( seq((0.104/4), 0.1, 0.001), seq(0.1, 1, 0.01))
x3 = c( seq((0.01/4), 0.1, 0.001), seq(0.1, 1, 0.01))

th1 = 1/x1 + 1
# th2 = 0.104/x2 + 1
th2 = 0.1/x2 + 1
th3 = 0.01/x3 + 1

lines(x1, th1, lty=1, lwd=2, col="grey40")
lines(x2, th2, lty=1, lwd=2, col="grey40")
lines(x3, th3, lty=1, lwd=2, col="grey40")

points( NLF, ARF, pch=4, cex=0.5, xpd=FALSE )
axis(1, padj=-0.5)
axis(2, hadj=0.5)
# axis(4, at=c(1.02, 1.18, 2.05), labels=c(expression(tau == 0.01), expression(tau == 0.104), expression(tau == 1)), tick=FALSE, line=-1.5)
axis(4, at=c(1.02, 1.18, 2.05), labels=c(expression(tau == 0.01), expression(tau == 0.1), expression(tau == 1)), tick=FALSE, line=-1.5)

dev.off()
