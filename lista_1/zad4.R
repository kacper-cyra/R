medic <- data.frame(
  c(82.5, 65.1, 90.5, 80.9, 74, 74.4, 73.5, 75.6, 70.1, 61.8, 80.6, 82.2, 54.1, 60),
  c(181, 169, 178, 189, 178, 175, 173, 187, 175, 165, 185, 178, 162, 185))

# a)
colnames(medic) <- c("masa","wysokosc")

# b)
medic$BMI <- medic$masa/(medic$wysokosc/100)^2
medic[1:4,]

# c)*
(waga <- ((medic$BMI > 0) + (medic$BMI >= 18.5) + (medic$BMI > 24.99)))

# d)
medic$waga <- (c("niedowaga", "prawidlowa", "nadwaga")[waga])

# e)
rbind(medic, c(80, 176, 25.826446281, "nadwaga"))

# f) 3 sposoby pobierania danych
medic["waga"]
medic["masa"]
medic["wysokosc"]

medic[["waga"]]
medic[["masa"]]
medic[["wysokosc"]]

medic$waga
medic$masa
medic$wysokosc

# g)

