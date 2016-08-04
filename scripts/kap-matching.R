# Script til kapitel: Matching

library("ggplot2")
library("MatchIt")
library("RItools")

sult <- read.csv("petersenetal2014.csv")

treat.f <- treatment ~ female + ega + income + emp_priv + 
  emp_pub + pubtransfer + preschool

fit <- glm(treat.f, family=binomial, data=sult)
sult$pscores <- predict(fit, type="response")

m <- matchit(treat.f, method = "nearest", caliper=.1, data = sult)
m

m.data <- match.data(m)

ggplot(sult, aes(x=pscores, linetype=as.factor(treatment), 
                 fill = as.factor(treatment), 
                 colour = as.factor(treatment))) + 
  geom_density(alpha = .1, size = .9) +
  ylab("Densitet") +
  theme_minimal() +
  theme(legend.position="none") +
  scale_x_continuous("", limits=c(0,1))

ggplot(m.data, aes(x=distance, linetype=as.factor(treatment), 
                   fill = as.factor(treatment), 
                   colour = as.factor(treatment))) + 
  geom_density(alpha = .1, size = .9) +
  ylab("Densitet") +
  theme_minimal() +
  theme(legend.position="none") +
  scale_x_continuous("", limits=c(0,1))

xB.unmatched <- xBalance(treat.f, data=sult, report=c("all"))
xB.unmatched <- as.data.frame(xB.unmatched)
std.unmatched <- xB.unmatched[,"results.std.diff.unstrat"]
xB.matched <- xBalance(treat.f, data=m.data, report=c("all"))
xB.matched <- as.data.frame(xB.matched)
std.matched <- xB.matched[,"results.std.diff.unstrat"]
balance.df <- data.frame(covariate = row.names(xB.matched), 
                         unmatched=std.unmatched[row.names(xB.unmatched) 
                                                 %in% row.names(xB.matched)], 
                         matched=std.matched)


ggplot(balance.df, aes(x=covariate, y=unmatched)) + 
  geom_hline(yintercept=0, linetype="dashed", colour="gray50") +
  geom_text(vjust = 1.6, aes(label="U", y=unmatched, size=.9), 
            colour="red", alpha = 0.9) +
  geom_point(aes(y=unmatched, size=.9), colour="red", 
             alpha = 0.6) + 
  geom_text(vjust = 1.6, aes(label="M", y=matched, size=.9), 
            colour="blue", alpha = 0.9) +
  geom_point(aes(y=matched, size=.9), colour="blue", 
             alpha = 0.6) + 
  coord_flip() +
  xlab("Kontrolvariabel") +
  ylab("Standardiseret forskel") +
  theme_minimal() +
  theme(legend.position="none")

reg.unmatched <- lm(welfare ~ treatment +female + ega + income + 
                      emp_priv + emp_pub + pubtransfer + preschool, 
                    data=sult)
summary(reg.unmatched)

reg.matched <- lm(welfare ~ treatment + female + ega + income + 
                    emp_priv + emp_pub + pubtransfer + preschool, 
                  data=m.data)
summary(reg.matched)