saty <- read.table("satysfakcja.dat", header = TRUE, sep = "\t")

str(saty)

# a)
(edukacja <- saty$edukacja)
(lataNauki <- saty$naukaLata)

# b)
(people <- saty[which(saty$wiaraZyciePo == "Tak" & saty$zodiak == "Lew"),])

# c)
(peopleWithZodiaksStartingOnB <- grep("^B",saty$zodiak)) 
(peopleWithZodiaksStartingOnB <- saty[peopleWithZodiaksStartingOnB,])

# d)
(columns <- names(saty)[(grep("wiek", names(saty)):(grep("plec", names(saty))))])
(studyingForMoreThan19Years <- saty[which(saty$naukaLata > 19),columns])
 
# e)


# f)
(isAnInteger = sapply(saty, is.integer))
(sum(saty[,isAnInteger], na.rm = TRUE))
(range(saty[,isAnInteger], na.rm = TRUE))

# g)
(unique(saty$wiek))







