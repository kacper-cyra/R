# Zad. 1
car <- mtcars[, 1:7]
avgs <- c()

for(i in colnames(car)){
  avgs <- c(avgs, mean(car[,i]))
}

avgs2 <- apply(car, MARGIN = c(2), FUN = "mean")

# Zad. 2
oceny <- data.frame(ocenaNum = sample(c(2:5, 3.5, 4.5), 100, replace = TRUE))

oceny[,"pozytywna"] <- oceny[,"ocenaNum"] > 2

for(i in c(1:100)){
  if(oceny[i,"ocenaNum"] < 5.5) {oceny[i,"ocenaSlownie"] <- "b. dobra"}
  if(oceny[i,"ocenaNum"] < 5) {oceny[i,"ocenaSlownie"] <- "dobra"}
  if(oceny[i,"ocenaNum"] < 4) {oceny[i,"ocenaSlownie"] <- "dostateczna"}
  if(oceny[i,"ocenaNum"] < 3) {oceny[i,"ocenaSlownie"] <- "niedostateczna"}
}
#lub
oceny$opis <- factor(oceny$ocenaNum, levels = c(2, 3, 3.5, 4, 4.5, 5), labels = c("niedostateczna", "dostateczna", "dostateczna", "dobry",  "dobry", "b. dobry"))

# Zad.3 
wspolRozklad <- function(wektor){
  N <- length(wektor)
  avg <- mean(wektor)
  S <- sd(wektor) 
  
  if(N<4){stop("Za malo liczb w wektorze c", call.=FALSE)}
  
  sk <- N/((N-2)*(N-1)) * sum((wektor - avg)^3)/S^3
  k <- N*(N+1)/((N-1)*(N-2)*(N-3)) * sum((wektor-avg)^4)/var(wektor)^2 - 3*(N-1)^2/((N-2)*(N-3))
  
  return (c(sk, k))
}

x <- wspolRozklad(c(5,8,9,3))
