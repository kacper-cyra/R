#Zad. 1. Tworzenie wektorów
(wektorA <- c(1,4,6,13,-10))
(wektorB <- seq(1,101,2))
(wektorC <- rep(c(4,7,9), 1, NA, 4))
(wektorD <- c("czy", "to", "jest", "wektor z NA"))
(wektorE <- rep(c(4,7,9), 6))

length(wektorA)
length(wektorB)
length(wektorC)
length(wektorD)
length(wektorE)

typeof(wektorA)
typeof(wektorB)
typeof(wektorC)
typeof(wektorD)
typeof(wektorE)

c(min(wektorA), max(wektorA))
c(min(wektorB), max(wektorB))
c(min(wektorC), max(wektorC))
c(min(wektorD), max(wektorD))
c(min(wektorE), max(wektorE))

sort(wektorE)