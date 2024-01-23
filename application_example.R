# A simple example of using the bootstrap Pettitt test introduced in:
# CONTE, L.C.; BAYER, D.M.; BAYER, F.M.. Bootstrap Pettitt test for detecting 
#    change points in hydroclimatological data: case study of Itaipu 
#    Hydroelectric Plant, Brazil. HYDROLOGICAL SCIENCES JOURNAL, 
#    v. 64, p. 1312-1326, 2019.
#    DOI: http://dx.doi.org/10.1080/02626667.2019.1632461


library(trend) # for standard Pettitt test 
source("boot_pettitt.R") # the main function with the bootstrap Pettitt test

# simulate some data: 
y <- rnorm(100, 50, 5) # iid normal sample
y[51:100] <- y[51:100]+3 # synthetic shift
plot.ts(y)

# P.s.: In your application, you just need to read the dataset and put it
#       as a vector in the object y. 

# application of the two tests:
boot.pettitttest(y) # corrected bootstrap Pettitt test 
pettitt.test(y) # standard Pettitt test 


