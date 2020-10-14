set.seed(1313)
cena <- (round(rnorm(100, 50, 10), 2))
eur = list("values" = round((cena * 4.28), 0))

# a)
(range(eur$values))

# b)
eur$uniqueValues <- unique(eur$values)
length(eur$uniqueValues)
sort(eur$uniqueValues)

# c)
(eur$sum <- sum(eur$values))
(eur$avg <- mean(eur$values))
(eur$gAvg <- prod(eur$values)^(1/length(eur$values)))

# d)
(length(which(eur$values > 13)))
(length(which(eur$values < 15 & eur$values > 10)))

# e)
ramka <- data.frame("cenaPLN" = cena, "cenaEUR" = eur$values)
