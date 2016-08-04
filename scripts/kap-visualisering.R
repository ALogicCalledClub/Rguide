# Script til kapitel: Visualisering

pol <- read.csv("ft2015.csv")

plot(pol$vote, pol$seat)

library("ggplot2")

ggplot(pol, aes(x=vote, y=seat)) +
  geom_point(size=3)

ggplot(pol, aes(x=vote, y=seat)) +
  geom_point(col=ifelse(pol$rw==1, "blue", "red"), 
             alpha=0.6, size=3) +
  theme_minimal() +
  ylab("Mandater") +
  xlab("Stemmer (%)") +
  geom_text(aes(label=ifelse(party == "Socialdemokraterne", 
                             "Socialdemokraterne",""), 
                hjust=1.1, vjust=0.5), size=4.5)