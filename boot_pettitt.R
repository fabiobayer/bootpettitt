# Authors: CONTE, L.C.; BAYER, D.M.; BAYER, F.M.. 
# Title: Bootstrap Pettitt test for detecting change points in 
#   hydroclimatological data: case study of Itaipu Hydroelectric Plant, Brazil. 
# Journal: Hydrological Sciences Journal 
# Volume: 64
# Issue: 11
# Pages: 1312-1326
# Year: 2019
# DOI: http://dx.doi.org/10.1080/02626667.2019.1632461

boot.pettitttest <- function(y, B = 1000)
{
  #library(trend)
  n <- length(y)
  # -------------------------------------------------- Pettitt test
  teste1 <- pettitt.test(y)
  pvalor1 <- teste1$p.value
  estat1 <- teste1$statistic
  loca <- teste1$estimate
  
  # -------------------------------------------------- bootstrap Pettitt
  estat_boot <- rep(0,B)
  for (j in 1:B)
  {
    indice <- sample(1:n, replace = T)
    y_boot <- y[indice]
    teste_boot <- pettitt.test(y_boot)
    estat_boot[j] <- teste_boot$statistic
  }
  pvalor2 <-
    (1 + sum(abs(estat_boot) >= abs(estat1))) / (B + 1)
  
  
  mresults <- matrix(rep(NA,2),nrow = 2) 
  colnames(mresults) <- c("p-value")
  rownames(mresults) <- c("Pettitt test", "Bootstrap Pettitt test")
  mresults[,1] <- c(pvalor1, pvalor2)

  print("H0: no change point", quote = F)
  print(mresults, quote = F) 
  print(loca)

}
