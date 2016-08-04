# Script til kapitel: OLS regression

sult <- read.csv("petersenetal2014.csv")

head(sult)

summary(sult)

reg.sult <- lm(welfare ~ treatment, data=sult)

summary(reg.sult)

reg.sult.control <- lm(welfare ~ treatment + female + ega + 
                         income + emp_priv + emp_pub + 
                         pubtransfer + preschool, data=sult)

summary(reg.sult.control)