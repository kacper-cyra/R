r <- 0.05 #oprocentowanie roczne
rr <- 1+r/12
K <- 300000 #kwota kredytu
L <- 20 #ile lat
N <- 12*L #liczba rat (ile miesięcy)
n <- 1:N #wektor zawierający kolejne okresy
rataKredytu <- K*rr^N*(rr-1)/(rr^N-1)
zadluzenie <- K*(rr^N-rr^n)/(rr^N-1)
odsetki <- K*(rr^N-rr^(n-1))/(rr^N-1)*(rr-1)
rataKapitalu <- rataKredytu - odsetki

kredyt <- data.frame("rataKapitalu" = rataKapitalu, "odsetki" = odsetki, "rataKredytu" = rataKredytu, "zadluzenie" = zadluzenie)
class(kredyt)

# a)
head(kredyt, 10)

# b)
str(kredyt)

# c)
dim(kredyt)

# d)
kredyt[(100:125),]

kredyt[(1:20),]

(rowsTotal = length(kredyt[,1]))
kredyt[((rowsTotal-30):rowsTotal),]

kredyt[c(20:30, 50:60),]

kredyt[seq(1, rowsTotal, 10),]

# e)
(sum(kredyt$odsetki)+sum(kredyt$rataKredytu)+sum(kredyt$rataKapitalu))

# f)*
which(kredyt$rataKapitalu > kredyt$odsetki)[1]
