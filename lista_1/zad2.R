set.seed(1313)
cena <- data.frame("pln" = round(rnorm(100, 50, 10), 2))
cena["eur"] = round((cena * 4.28), 0)

(c(min(cena$eur), max(cena$eur)))

uniqueValues <- (unique(eur))
