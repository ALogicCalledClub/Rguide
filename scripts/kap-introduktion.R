# Script til kapitel: Introduktion

2+2

50*149
3**2        # 3^2
2**3        # 2^3
sqrt(81)    # 81^0.5

x <- 2

x
x * 2
x * x 
x + x

x == 2        
x == 3        # "==" betyder "lig med"
x != 2        # "!=" betyder "ikke lig med"
x < 1
x > 1
x <= 2
x >= 2.01

(y <- x + 7)

1:10

1:10 + 2

c(2, 2, 2)

x <- c(14, 6, 23, 2)
x

x * 2

x[3]

x[-2]

length(x)     # antallet af numre i vektoren
min(x)        # minimumsværdien
max(x)        # maksimumværdien
median(x)     # medianen
sum(x)        # summen
mean(x)       # gennemsnittet
var(x)        # variansen
sd(x)         # standardafvigelsen

sqrt(var(x)) == sd(x)

x <- c(x, 5)
x

mean(x)

x <- c(x, NA)

mean(x) 

mean(x, na.rm=TRUE)

z <- c("Venstre", "Socialdemokraterne") 

z

class(z)

class(x)      

is.numeric(x)
is.character(x)

party <- c(z, "Enhedslisten", "SF", "Radikale", "Konservative", 
           "Dansk Folkeparti", "Liberal Alliance", "Alternativet")

party

rw <- c(1, 0, 0, 0, 0, 1, 1, 1, 0)
vote <- c(19.5, 26.3, 7.8, 4.2, 4.6, 3.4, 21.1, 7.5, 4.8)
seat <- c(34, 47, 14, 7, 8, 6, 37, 13, 9)

pol <- data.frame(party, vote, seat, rw)
pol

head(pol)

head(pol, 3)

tail(pol)

pol$vote

#View(pol)

pol[1, 1] # første række, første kolonne
pol[1,] # første række
pol[,1] # første kolonne

summary(pol)

max(pol$vote)

pol$party[1]

pol$party[pol$vote == max(pol$vote)]

pol$party[pol$vote == min(pol$vote)]

cor(pol$vote, pol$seat)

pol$big <- NA
pol$big[pol$vote >= 20] <- 1
pol$big[pol$vote < 20] <- 0

table(pol$party, pol$big)

pol$big[pol$party == "Socialdemokraterne" | pol$party == "Dansk Folkeparti"] <- 1
pol$big[pol$party %in% c("Socialdemokraterne", "Dansk Folkeparti")] <- 1

pol$big[pol$party != "Socialdemokraterne" & pol$party != "Dansk Folkeparti"] <- 0
pol$big[is.na(pol$big)] <- 0

getwd()

#setwd("C:/Users/Erik/Desktop/Rintro")

write.csv(pol, "ft2015.csv")

pol <- read.csv("ft2015.csv")

#install.packages("ggplot2")

library("ggplot2")

ls()

rm(x)

ls()

rm(list = ls())

ls()