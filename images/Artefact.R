pdf("Artefact.pdf", height = 5, width = 7)
# setEPS()
# postscript("Artefact.eps", height = 5, width = 7)

options(OutDec= ",")

Data = scan("Artefact.txt", what=list(0, 0), skip=1)

ecg = unlist(Data[1])
f_ecg = unlist(Data[2])

ecg = ecg[4600:7600]
f_ecg = f_ecg[4600:7600]

temps = (0:(length(ecg)-1)) / 2000

ecgpeak1_x = 4856 - 4600 + 1
ecgpeak2_x = 5237 - 4600 + 1
ecgpeak3_x = 5615 - 4600 + 1
ecgpeak4_x = 5999 - 4600 + 1
ecgpeak5_x = 6381 - 4600 + 1

ecgpeak1_y = ecg[ecgpeak1_x]
ecgpeak2_y = ecg[ecgpeak2_x]
ecgpeak3_y = ecg[ecgpeak3_x]
ecgpeak4_y = ecg[ecgpeak4_x]
ecgpeak5_y = ecg[ecgpeak5_x]

peak1_x = 4862 - 4600 + 1
peak2_x = 5242 - 4600 + 1
peak3_x = 5621 - 4600 + 1
peak4_x = 6006 - 4600 + 1
peak5_x = 6386 - 4600 + 1

peak1_y = f_ecg[peak1_x]
peak2_y = f_ecg[peak2_x]
peak3_y = f_ecg[peak3_x]
peak4_y = f_ecg[peak4_x]
peak5_y = f_ecg[peak5_x]

valleyleft_x = 6464 - 4600 + 1
bigpeak_x = 6554 - 4600 + 1
valleyright_x = 6574 - 4600 + 1

valleyleft_y = f_ecg[valleyleft_x]
bigpeak_y = f_ecg[bigpeak_x]
valleyright_y = f_ecg[valleyright_x]



par(mfcol=c(2, 1), mar=c(0.5, 4, 0.5, 4), las=1)
plot(temps, ecg, axes=FALSE, type="l", xlab="", ylab="ECG (mV)")
axis(2, cex.axis=0.8)


texte_x = 0.4
texte_y = 2

text( texte_x, texte_y, labels="Ondes R validées", cex=0.8)

lines(c(ecgpeak1_x/2000, texte_x-0.1), c(ecgpeak1_y, texte_y-0.15), lty=3)
lines(c(ecgpeak2_x/2000, texte_x-0.05), c(ecgpeak2_y, texte_y-0.15), lty=3)
lines(c(ecgpeak3_x/2000, texte_x), c(ecgpeak3_y, texte_y-0.15), lty=3)
lines(c(ecgpeak4_x/2000, texte_x+0.05), c(ecgpeak4_y, texte_y-0.15), lty=3)
lines(c(ecgpeak5_x/2000, texte_x+0.18), c(ecgpeak5_y, texte_y+0.000), lty=3)






par(mar=c(2, 4, 0.5, 4), las=1)

plot(temps, f_ecg, axes=FALSE, type="l", xlab="", ylab="ECG transformé (mV²)")
axis(2, at=c(0, peak3_y, 0.015), labels=c("0", expression(A[m]), "0.015"), cex.axis=0.8)
axis(4, at=c(0, valleyleft_y, valleyright_y, 0.015), labels=c("", expression(m[g]), expression(m[d]), ""))
axis(1, line=+0.5, padj=-1, at=c(0, 0.25, 0.5), labels=c("", "0,5 s", ""), lwd=3, lwd.ticks=0, cex.axis=1.2)

textv_x = 0.4
textv_y = 0.015

text( textv_x, textv_y, labels="Maximums validés", cex=0.8)

lines(c(peak1_x/2000, textv_x-0.1), c(peak1_y, textv_y-0.001), lty=3)
lines(c(peak2_x/2000, textv_x-0.05), c(peak2_y, textv_y-0.001), lty=3)
lines(c(peak3_x/2000, textv_x), c(peak3_y, textv_y-0.001), lty=3)
lines(c(peak4_x/2000, textv_x+0.05), c(peak4_y, textv_y-0.001), lty=3)
lines(c(peak5_x/2000, textv_x+0.18), c(peak5_y, textv_y+0.000), lty=3)

textc_x = 1.2
textc_y = 0.015
text( textc_x, textc_y, labels="Maximum à valider", cex=0.8)
lines(c(bigpeak_x/2000, textc_x), c(bigpeak_y, textc_y-0.001), lty=3)


lines(c(valleyleft_x/2000, 2), c(valleyleft_y, valleyleft_y), lty=2)
lines(c(valleyright_x/2000, 2), c(valleyright_y, valleyright_y), lty=2)
# lines(c(bigpeak_x/2000, 2), c(bigpeak_y, bigpeak_y), lty=2)

lines(c(peak3_x/2000, -1), c(peak3_y, peak3_y), lty=2)

dev.off()
