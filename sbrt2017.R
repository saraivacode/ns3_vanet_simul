##########################################Coleta dos dados#######################################
########Unterstrasss##########
umt01<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/mod_trg_01', header = TRUE, sep = ",")
umt02<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/mod_trg_02', header = TRUE, sep = ",")
umt03<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/mod_trg_03', header = TRUE, sep = ",")
umt04<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/mod_trg_04', header = TRUE, sep = ",")
umt05<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/mod_trg_05', header = TRUE, sep = ",")
umt06<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/mod_trg_06', header = TRUE, sep = ",")
umt07<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/mod_trg_07', header = TRUE, sep = ",")
umt08<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/mod_trg_08', header = TRUE, sep = ",")
umt09<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/mod_trg_09', header = TRUE, sep = ",")
umt010<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/mod_trg_010', header = TRUE, sep = ",")

umtt500 <- c(umt01[,16], umt02[,16], umt03[,16], umt04[,16], umt05[,16], umt06[,16], umt07[,16], umt08[,16],umt09[,16], umt010[,16])
umtm<- (umt01 + umt02 + umt03 + umt04 + umt05 + umt06 + umt07 + umt08 + umt09 +umt010)/10
umtpd500m<-umtm$BSM_PDR10
timeall <- c(umt01[,1], umt02[,1], umt03[,1], umt04[,1], umt05[,1], umt06[,1], umt07[,1], umt08[,1], umt09[,1], umt010[,1])

umf01<- read.table(file = '/home/tiago/source/ns-3.26/resultados/friis/delay-1/300bytes/mod_friis_01', header = TRUE, sep = ",")
umf02<- read.table(file = '/home/tiago/source/ns-3.26/resultados/friis/delay-1/300bytes/mod_friis_02', header = TRUE, sep = ",")
umf03<- read.table(file = '/home/tiago/source/ns-3.26/resultados/friis/delay-1/300bytes/mod_friis_03', header = TRUE, sep = ",")
umf04<- read.table(file = '/home/tiago/source/ns-3.26/resultados/friis/delay-1/300bytes/mod_friis_04', header = TRUE, sep = ",")
umf05<- read.table(file = '/home/tiago/source/ns-3.26/resultados/friis/delay-1/300bytes/mod_friis_05', header = TRUE, sep = ",")
umf06<- read.table(file = '/home/tiago/source/ns-3.26/resultados/friis/delay-1/300bytes/mod_friis_06', header = TRUE, sep = ",")
umf07<- read.table(file = '/home/tiago/source/ns-3.26/resultados/friis/delay-1/300bytes/mod_friis_07', header = TRUE, sep = ",")
umf08<- read.table(file = '/home/tiago/source/ns-3.26/resultados/friis/delay-1/300bytes/mod_friis_08', header = TRUE, sep = ",")
umf09<- read.table(file = '/home/tiago/source/ns-3.26/resultados/friis/delay-1/300bytes/mod_friis_09', header = TRUE, sep = ",")
umf010<- read.table(file = '/home/tiago/source/ns-3.26/resultados/friis/delay-1/300bytes/mod_friis_010', header = TRUE, sep = ",")

umft500 <- c(umf01[,16], umf02[,16], umf03[,16], umf04[,16], umf05[,16], umf06[,16], umf07[,16], umf08[,16],umf09[,16], umf010[,16])
umfm<- (umf01 + umf02 + umf03 + umf04 + umf05 + umf06 + umf07 + umf08 + umf09 +umf010)/10
umfpd500m<-umfm$BSM_PDR10

########Colonia##########

umtc01<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/colog/mod_trg_colog_01', header = TRUE, sep = ",")
umtc02<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/colog/mod_trg_colog_02', header = TRUE, sep = ",")
umtc03<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/colog/mod_trg_colog_03', header = TRUE, sep = ",")
umtc04<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/colog/mod_trg_colog_04', header = TRUE, sep = ",")
umtc05<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/colog/mod_trg_colog_05', header = TRUE, sep = ",")
umtc06<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/colog/mod_trg_colog_06', header = TRUE, sep = ",")
umtc07<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/colog/mod_trg_colog_07', header = TRUE, sep = ",")
umtc08<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/colog/mod_trg_colog_08', header = TRUE, sep = ",")
umtc09<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/colog/mod_trg_colog_09', header = TRUE, sep = ",")
umtc010<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/300bytes/colog/mod_trg_colog_010', header = TRUE, sep = ",")

umttc500 <- c(umtc01[,16], umtc02[,16], umtc03[,16], umtc04[,16], umtc05[,16], umtc06[,16], umtc07[,16], umtc08[,16],umtc09[,16], umtc010[,16])
umtcm<- (umtc01 + umtc02 + umtc03 + umtc04 + umtc05 + umtc06 + umtc07 + umtc08 + umtc09 +umtc010)/10
umtcpd500m<-umtcm$BSM_PDR10

#########################Gráficos TRG e Friis - todas as PDRs################################################
########Unterstrasss##########
par(mfrow=c(1,1))
plot(umtm$Tempo.s.,umtm$BSM_PDR1, main = "", ylab = "PDR", ylim = c(0.45, 0.9), xlab = "tempo (s)", xlim = c(0, 150), type = "l", col="red", lwd="2")
lines(umtm$Tempo.s.,umtm$BSM_PDR2, type = "l", col="darkgreen", lwd="2")
lines(umtm$Tempo.s.,umtm$BSM_PDR3, type = "l", col="black", lwd="2")
lines(umtm$Tempo.s.,umtm$BSM_PDR4, type = "l", col="yellow", lwd="2")
lines(umtm$Tempo.s.,umtm$BSM_PDR5, type = "l", col="pink", lwd="2")
lines(umtm$Tempo.s.,umtm$BSM_PDR6, type = "l", col="brown", lwd="2")
lines(umtm$Tempo.s.,umtm$BSM_PDR7, type = "l", col="gray", lwd="2")
lines(umtm$Tempo.s.,umtm$BSM_PDR8, type = "l", col="blue", lwd="2")
lines(umtm$Tempo.s.,umtm$BSM_PDR9, type = "l", col="purple", lwd="2")
lines(umtm$Tempo.s,umtm$BSM_PDR10, type = "l", col="gold", lwd="2")

lnames <- c('PDR 50', 'PDR 100', 'PDR 150', 'PDR 200', 'PDR 250', 'PDR 300', 'PDR 350', 'PDR 400', 'PDR 450', 'PDR 500') 
legend('topright', bty = "n", lnames, col = c("red", "darkgreen", "black", "yellow", "pink", "brown", "gray", "blue", "purple", "gold"), lty = 1)

plot(umfm$Tempo.s.,umfm$BSM_PDR1, main = "", ylab = "PDR", ylim = c(0.45, 0.9), xlab = "tempo (s)", xlim = c(0, 150), type = "l", col="red", lwd="2")
lines(umfm$Tempo.s.,umfm$BSM_PDR2, type = "l", col="darkgreen", lwd="2")
lines(umfm$Tempo.s.,umfm$BSM_PDR3, type = "l", col="black", lwd="2")
lines(umfm$Tempo.s.,umfm$BSM_PDR4, type = "l", col="yellow", lwd="2")
lines(umfm$Tempo.s.,umfm$BSM_PDR5, type = "l", col="pink", lwd="2")
lines(umfm$Tempo.s.,umfm$BSM_PDR6, type = "l", col="brown", lwd="2")
lines(umfm$Tempo.s.,umfm$BSM_PDR7, type = "l", col="gray", lwd="2")
lines(umfm$Tempo.s.,umfm$BSM_PDR8, type = "l", col="blue", lwd="2")
lines(umfm$Tempo.s.,umfm$BSM_PDR9, type = "l", col="purple", lwd="2")
lines(umfm$Tempo.s,umfm$BSM_PDR10, type = "l", col="gold", lwd="2")

lnames <- c('PDR 50', 'PDR 100', 'PDR 150', 'PDR 200', 'PDR 250', 'PDR 300', 'PDR 350', 'PDR 400', 'PDR 450', 'PDR 500') 
legend('topright', bty = "n", lnames, col = c("red", "darkgreen", "black", "yellow", "pink", "brown", "gray", "blue", "purple", "gold"), lty = 1)

########Colonia##########
par(mfrow=c(1,1))
plot(umtm$Tempo.s.,umtcm$BSM_PDR1, main = "", ylab = "PDR", ylim = c(0.45, 0.9), xlab = "tempo (s)", xlim = c(0, 150), type = "l", col="red", lwd="2")
lines(umtm$Tempo.s.,umtcm$BSM_PDR2, type = "l", col="darkgreen", lwd="2")
lines(umtm$Tempo.s.,umtcm$BSM_PDR3, type = "l", col="black", lwd="2")
lines(umtm$Tempo.s.,umtcm$BSM_PDR4, type = "l", col="yellow", lwd="2")
lines(umtm$Tempo.s.,umtcm$BSM_PDR5, type = "l", col="pink", lwd="2")
lines(umtm$Tempo.s.,umtcm$BSM_PDR6, type = "l", col="brown", lwd="2")
lines(umtm$Tempo.s.,umtcm$BSM_PDR7, type = "l", col="gray", lwd="2")
lines(umtm$Tempo.s.,umtcm$BSM_PDR8, type = "l", col="blue", lwd="2")
lines(umtm$Tempo.s.,umtcm$BSM_PDR9, type = "l", col="purple", lwd="2")
lines(umtm$Tempo.s.,umtcm$BSM_PDR10, type = "l", col="gold", lwd="2")

#############################################################Box Plots - PDR 500 - TRG/Friis#############################
########Unterstrasss##########
par(mfrow=c(1,1))
combined <- cbind(umft500,umtt500)
combined <- data.frame(combined)
names(combined) <-c('Friis', 'TRG')
boxplot(combined, xlab="", ylab="PDR", ylim=c(0.47, 0.73))

########Colonia##########
par(mfrow=c(1,1))
combined <- cbind(umtt500,umttc500)
combined <- data.frame(combined)
names(combined) <-c('Unterstrass', 'Cologne')
boxplot(combined,main="", xlab="", ylab="Taxa de entrega de pacotes - PDR", ylim=c(0.47, 0.75))

#############################################################Densidades#############################################################
########Unterstrasss##########
hist(umft500, breaks = 40, probability = TRUE, xlim = c(0, 1), ylim = c(0, 25),
     xlab = "Taxa de entrega de pacotes - PDR",
     main = "", ylab = "Probabilidade",
     col = "white", border = "white")
lines(density(umft500), lwd=2, col="blue")
lines(density(umtt500), lwd=2, col="red")
lnames <- c('2RayGround', 'Friss') 
legend('topright', bty = "n", lnames, col = c("blue", "red"), lty = 1)


plot(ecdf(umft500), lwd=2, col="blue", main="", xlab="PDR", ylab="ECDF")
lines(ecdf(umtt500), lwd=2, col="red")
names <- c('2RayGround', 'Friss') 
legend('topleft', bty = "n", lnames, col = c("blue", "red"), lty = 1)

########Colonia##########
hist(umttc500, breaks = 40, probability = TRUE, xlim = c(0, 1), ylim = c(0, 25),
     xlab = "Taxa de entrega de pacotes - PDR",
     main = "", ylab = "Probabilidade",
     col = "white", border = "white")
lines(density(umttc500), lwd=2, col="blue")

plot(ecdf(umttc500), lwd=2, col="blue", main="", xlab="PDR", ylab="ECDF")
lnames <- c('2RayGround') 
legend('topleft', bty = "n", lnames, col = c("blue"), lty = 1)

###########################Gráfico TRG vs Friis - PDR 500 com erro#############################
########Unterstrasss##########
require(Rmisc)
x<- cbind(timeall,umtt500)
x<-data.frame(x)
y<-group.CI(umtt500~timeall,x,ci = 0.95)
require(plotrix)
plotCI(umfm$Tempo.s., umtpd500m, ui=y$umtt500.upper, li=y$umtt500.lower, ylim = c(0.5, 0.7), col="red", ylab = "Taxa de entrega de pacotes - PDR", xlab = "tempo (s)")
lines(umfm$Tempo.s.,umtpd500m, type = "l", col="black", lwd="2")

x<- cbind(timeall,umft500)
x<-data.frame(x)
y<-group.CI(umft500~timeall,x,ci = 0.95)
plotCI(umfm$Tempo.s., umfpd500m, ui=y$umft500.upper, li=y$umft500.lower, ylim = c(0.5, 0.7), col="darkgreen", add = TRUE)
lines(umfm$Tempo.s.,umfpd500m, type = "l", col="black", lwd="2")
lnames <- c('TRG + NGK', 'Friis + NGK') 
legend('topright', bty = "n", lnames, col = c("red", "darkgreen"), lty = 1)

########Colonia##########
require(Rmisc)
x<- cbind(timeall,umttc500)
x<-data.frame(x)
y<-group.CI(umttc500~timeall,x,ci = 0.95)
require(plotrix)
plotCI(umfm$Tempo.s., umtcpd500m, ui=y$umttc500.upper, li=y$umttc500.lower, ylim = c(0.615, 0.63), col="red", ylab = "PDR", xlab = "tempo (s)")
lines(umfm$Tempo.s.,umtcpd500m, type = "l", col="black", lwd="2")

detach("package:Rmisc", unload = TRUE)
detach("package:plotrix", unload = TRUE)

#####################################################################################################################

########################Gráfico 1 - todas as PDRs dos dois traces - {150,300,600}bytes, 1s, trg#######################################
########Unterstrasss#####150#####

us15t01<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/150bytes/size_150_01', header = TRUE, sep = ",")
us15t02<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/150bytes/size_150_02', header = TRUE, sep = ",")
us15t03<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/150bytes/size_150_03', header = TRUE, sep = ",")
us15t04<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/150bytes/size_150_04', header = TRUE, sep = ",")
us15t05<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/150bytes/size_150_05', header = TRUE, sep = ",")
us15t06<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/150bytes/size_150_06', header = TRUE, sep = ",")
us15t07<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/150bytes/size_150_07', header = TRUE, sep = ",")
us15t08<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/150bytes/size_150_08', header = TRUE, sep = ",")
us15t09<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/150bytes/size_150_09', header = TRUE, sep = ",")
us15t010<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/150bytes/size_150_010', header = TRUE, sep = ",")

ust15500 <- c(us15t01[,16], us15t02[,16], us15t03[,16], us15t04[,16], us15t05[,16], us15t06[,16], us15t07[,16], us15t08[,16], 
              us15t09[,16], us15t010[,16])
ust15m<- (us15t01 + us15t02 + us15t03 + us15t04 + us15t05 + us15t06 + us15t07 + us15t08 + us15t09 +us15t010)/10
ust15pd500m<-ust15m$BSM_PDR10

#########600########

us60t01<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/600bytes/size_600_01', header = TRUE, sep = ",")
us60t02<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/600bytes/size_600_02', header = TRUE, sep = ",")
us60t03<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/600bytes/size_600_03', header = TRUE, sep = ",")
us60t04<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/600bytes/size_600_04', header = TRUE, sep = ",")
us60t05<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/600bytes/size_600_05', header = TRUE, sep = ",")
us60t06<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/600bytes/size_600_06', header = TRUE, sep = ",")
us60t07<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/600bytes/size_600_07', header = TRUE, sep = ",")
us60t08<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/600bytes/size_600_08', header = TRUE, sep = ",")
us60t09<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/600bytes/size_600_09', header = TRUE, sep = ",")
us60t010<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-1/600bytes/size_600_010', header = TRUE, sep = ",")

ust60500 <- c(us60t01[,16], us60t02[,16], us60t03[,16], us60t04[,16], us60t05[,16], us60t06[,16], us60t07[,16], us60t08[,16], 
              us60t09[,16], us60t010[,16])
ust60m<- (us60t01 + us60t02 + us60t03 + us60t04 + us60t05 + us60t06 + us60t07 + us60t08 + us60t09 +us60t010)/10
ust60pd500m<-ust60m$BSM_PDR10

#############################################################Box Plots - PDR 500 - Size, 150, 300 e 600#############################
par(mfrow=c(1,1))
combined <- cbind(ust15500,umtt500,ust60500)
combined <- data.frame(combined)
names(combined) <-c('150 bytes', '300 bytes', '600 bytes')
boxplot(combined,main="", xlab="", ylab="Taxa de entrega de pacotes - PDR", ylim=c(0.47, 0.75))
#############################################################Densidades#############################################################

#Comparação Size, 150, 300 e 600
hist(ust15500, breaks = 40, probability = TRUE, xlim = c(0, 1), ylim = c(0, 25),
     xlab = "Taxa de entrega de pacotes - PDR",
     main = "", ylab = "Probabilidade",
     col = "white", border = "white")
lines(density(ust15500), lwd=2, col="blue")
lines(density(umtt500), lwd=2, col="red")
lines(density(ust60500), lwd=2, col="darkgreen")
lnames <- c('150', '300', '600') 
legend('topright', bty = "n", lnames, col = c("blue", "red", "darkgreen"), lty = 1)

###########################Gráfico size, 150, 300 e 60 p/ trace de Unterstrass - PDR 500 com erro#############################

require(Rmisc)
x<- cbind(timeall,ust15500)
x<-data.frame(x)
y<-group.CI(ust15500~timeall,x,ci = 0.95)
require(plotrix)
plotCI(umfm$Tempo.s., ust15pd500m, ui=y$ust15500.upper, li=y$ust15500.lower, ylim = c(0.45, 0.73), col="blue", ylab = "Taxa de entrega de pacotes - PDR", xlab = "tempo (s)")
lines(umfm$Tempo.s.,ust15pd500m, type = "l", col="black", lwd="2")

x<- cbind(timeall,umtt500)
x<-data.frame(x)
y<-group.CI(umtt500~timeall,x,ci = 0.95)
plotCI(umfm$Tempo.s., umtpd500m, ui=y$umtt500.upper, li=y$umtt500.lower, col="red", add = TRUE)
lines(umfm$Tempo.s.,umtpd500m, type = "l", col="black", lwd="2")

x<- cbind(timeall,ust60500)
x<-data.frame(x)
y<-group.CI(ust60500~timeall,x,ci = 0.95)
plotCI(umfm$Tempo.s., ust60pd500m, ui=y$ust60500.upper, li=y$ust60500.lower, col="darkgreen", add = TRUE)
lines(umfm$Tempo.s.,ust60pd500m, type = "l", col="black", lwd="2")
lnames <- c('150 bytes', '300 bytes', '600 bytes') 
legend('topright', bty = "n", lnames, col = c("blue","red", "darkgreen"), lty = 1)

detach("package:Rmisc", unload = TRUE)
detach("package:plotrix", unload = TRUE)

#####################################################################################################################

########################Gráfico 1 - todas as PDRs dos dois traces - {0.1, 1, 10}s, 30bytes, trg#######################################
########Unterstrasss#####0.1#####

ui01t01<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-010/300bytes/time_10_ms_01', header = TRUE, sep = ",")
ui01t02<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-010/300bytes/time_10_ms_02', header = TRUE, sep = ",")
ui01t03<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-010/300bytes/time_10_ms_03', header = TRUE, sep = ",")
ui01t04<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-010/300bytes/time_10_ms_04', header = TRUE, sep = ",")
ui01t05<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-010/300bytes/time_10_ms_05', header = TRUE, sep = ",")
ui01t06<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-010/300bytes/time_10_ms_06', header = TRUE, sep = ",")
ui01t07<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-010/300bytes/time_10_ms_07', header = TRUE, sep = ",")
ui01t08<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-010/300bytes/time_10_ms_08', header = TRUE, sep = ",")
ui01t09<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-010/300bytes/time_10_ms_09', header = TRUE, sep = ",")
ui01t010<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-010/300bytes/time_10_ms_010', header = TRUE, sep = ",")

ui01500 <- c(ui01t01[,16], ui01t02[,16], ui01t03[,16], ui01t04[,16], ui01t05[,16], ui01t06[,16], ui01t07[,16], ui01t08[,16], 
            ui01t09[,16], ui01t010[,16])
ui01t00m<- (ui01t01 + ui01t02 + ui01t03 + ui01t04 + ui01t05 + ui01t06 + ui01t07 + ui01t08 + ui01t09 +ui01t010)/10
ui01pd500m<-ui01t00m$BSM_PDR10

#########10s########

ui10t01<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-10/300bytes/time_10_01', header = TRUE, sep = ",")
ui10t02<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-10/300bytes/time_10_02', header = TRUE, sep = ",")
ui10t03<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-10/300bytes/time_10_03', header = TRUE, sep = ",")
ui10t04<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-10/300bytes/time_10_04', header = TRUE, sep = ",")
ui10t05<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-10/300bytes/time_10_05', header = TRUE, sep = ",")
ui10t06<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-10/300bytes/time_10_06', header = TRUE, sep = ",")
ui10t07<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-10/300bytes/time_10_07', header = TRUE, sep = ",")
ui10t08<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-10/300bytes/time_10_08', header = TRUE, sep = ",")
ui10t09<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-10/300bytes/time_10_09', header = TRUE, sep = ",")
ui10t010<- read.table(file = '/home/tiago/source/ns-3.26/resultados/2rayground/delay-10/300bytes/time_10_010', header = TRUE, sep = ",")

ui10500 <- c(ui10t01[,16], ui10t02[,16], ui10t03[,16], ui10t04[,16], ui10t05[,16], ui10t06[,16], ui10t07[,16], ui10t08[,16], 
             ui10t09[,16], ui10t010[,16])
ui10m<- (ui10t01 + ui10t02 + ui10t03 + ui10t04 + ui10t05 + ui10t06 + ui10t07 + ui10t08 + ui10t09 + ui10t010)/10
uit10pd500m<-ui10m$BSM_PDR10

#############################################################Box Plots - PDR 500 - Int, 10ms, 1 e 10s#############################
par(mfrow=c(1,1))
combined <- cbind(ui01500,umtt500,ui10500)
combined <- data.frame(combined)
names(combined) <-c('10ms', '1s', '10s')
boxplot(combined,main="", xlab="", ylab="Taxa de entrega de pacotes - PDR", ylim=c(0.47, 0.75))

#############################################################Densidades#############################################################

#Comparação Size, 150, 300 e 600
hist(ui01500, breaks = 40, probability = TRUE, xlim = c(0, 1), ylim = c(0, 25),
     xlab = "Taxa de entrega de pacotes - PDR",
     main = "", ylab = "Probabilidade",
     col = "white", border = "white")
lines(density(ui01500), lwd=2, col="blue")
lines(density(umtt500), lwd=2, col="red")
lines(density(ui10500), lwd=2, col="darkgreen")
lnames <- c('10ms', '1', '10s') 
legend('topright', bty = "n", lnames, col = c("blue", "red", "darkgreen"), lty = 1)

###########################Gráfico intervalo, 10ms, 1 e 10s p/ trace de Unterstrass - PDR 500 com erro#############################

require(Rmisc)
x<- cbind(timeall,ui01500)
x<-data.frame(x)
y<-group.CI(ui01500~timeall,x,ci = 0.95)
require(plotrix)
plotCI(umfm$Tempo.s., ui01pd500m, ui=y$ui01500.upper, li=y$ui01500.lower, ylim = c(0.5, 0.7), col="blue", ylab = "Taxa de entrega de pacotes - PDR", xlab = "tempo (s)")

x<- cbind(timeall,umtt500)
x<-data.frame(x)
y<-group.CI(umtt500~timeall,x,ci = 0.95)
plotCI(umfm$Tempo.s., umtpd500m, ui=y$umtt500.upper, li=y$umtt500.lower, col="red", add = TRUE)

x<- cbind(timeall,ui10500)
x<-data.frame(x)
y<-group.CI(ui10500~timeall,x,ci = 0.95)
plotCI(umfm$Tempo.s., uit10pd500m, ui=y$ui10500.upper, li=y$ui10500.lower, col="darkgreen", add = TRUE)
lines(umfm$Tempo.s.,ui01pd500m, type = "l", col="black", lwd="2")
lines(umfm$Tempo.s.,umtpd500m, type = "l", col="black", lwd="2")
lines(umfm$Tempo.s.,uit10pd500m, type = "l", col="black", lwd="2")
lnames <- c('10ms', '1', '10s') 
legend('topright', bty = "n", lnames, col = c("blue","red", "darkgreen"), lty = 1)

detach("package:Rmisc", unload = TRUE)
detach("package:plotrix", unload = TRUE)

############################################################################Comparação traces##############################

require(Rmisc)
require(plotrix)
x<- cbind(timeall,umtt500)
x<-data.frame(x)
y<-group.CI(umtt500~timeall,x,ci = 0.95)
plotCI(umfm$Tempo.s., umtpd500m, ui=y$umtt500.upper, li=y$umtt500.lower, col="red", ylim = c(0.5, 0.7), ylab = "Taxa de entrega de pacotes - PDR", xlab = "tempo (s)")
lines(umfm$Tempo.s.,umtpd500m, type = "l", col="black", lwd="2")

x<- cbind(timeall,umttc500)
x<-data.frame(x)
y<-group.CI(umttc500~timeall,x,ci = 0.95)
plotCI(umfm$Tempo.s., umtcpd500m, ui=y$umttc500.upper, li=y$umttc500.lower, col="darkgreen", add = TRUE)
lines(umfm$Tempo.s.,umtcpd500m, type = "l", col="black", lwd="2")

lnames <- c('Unterstrass', 'Cologne') 
legend('topright', bty = "n", lnames, col = c("red", "darkgreen"), lty = 1)

detach("package:Rmisc", unload = TRUE)
detach("package:plotrix", unload = TRUE)

################################################################################################################################################
################################################################################################################################################
#################################################      Aqui começa a parte diferenciada    #####################################################
################################################################################################################################################
################################################################################################################################################

pdr500ts <- umtpd500m
pdr500tc <-umtcpd500m

#Summary - Estat?stica descritiva
summary(pdr500ts)
summary(pdr500tc)

#Desvio padrão
sd(pdr500ts)
sd(pdr500tc)

#Boxplot
par(mfrow=c(1,1))
boxplot(pdr500ts, main = "", ylab="PDR 500m - trace Unterstrass", xlab="", ylim = c(0.5, 0.65))
boxplot(pdr500tc, main = "", ylab="PDR 500m - trace Colônia", xlab="", ylim = c(0.624, 0.627))

#Curva CDF Empirica e complementar

require(EnvStats)
cdfCompare(pdr500ts, pdr500tc, main = "", ylab="CDF", xlab="PDR")
lnames <- c('Unterstrass', 'Colônia') 
legend('toplef', bty = "n", lnames, col = c("blue", "black"), lty = 1)
detach("package:EnvStats", unload = TRUE)

##################################Modelagem Markoviana#######################################

##########Define estados################
mcts <- pdr500ts *100; mcts<-floor(mcts+ .5); mcts <- mcts[2:300]; mcts #x <- unique(sort(mcts));x
mctc <- pdr500tc *100; mctc<-floor(mctc+ .5); mctc <- mctc[2:300]; mctc  #y <- unique(sort(mctc));y

##########Cria Matriz de Transi??o de Probabilidades#######
library("markovchain", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.3")
mctsFit <- markovchainFit(data=mcts); mctsFit<-mctsFit$estimate
mctcFit <- markovchainFit(data=mctc); mctcFit<-mctcFit$estimate
##################Separa estados das s?ries####################
estmcts <- as.numeric(as.vector(states(mctsFit)))
estmctc <- as.numeric(as.vector(states(mctcFit)))
##########Plota modelagem######################################
plot(mctsFit); mctsFit
plot(mctcFit); mctcFit

require(diagram)
plot(mctsFit, package="diagram", box.size = 0.04); mctsFit
plot(mctcFit, package="diagram", box.size = 0.04); mctcFit
detach("package:diagram", unload=TRUE)

##########Resolve para calcular valores estacion?rios###########
stdmcts <- steadyStates(mctsFit); stdmcts
stdmctc <- steadyStates(mctcFit); stdmctc

detach("package:markovchain", unload=TRUE)
