library("ggplot2")
library("ggthemes")
library("grid")
library("gridExtra")

set.seed(1337)

dat <- data.frame(xvar = 1:20 + rnorm(20, sd=3),
                  yvar = 1:20 + rnorm(20, sd=3))


plot.standard <- ggplot(dat, aes(x=xvar, y=yvar)) +
  geom_point(size=2) +
  ylab("") + xlab("theme()")

plot.bw <- plot.standard + theme_bw() + xlab("theme_bw()")
plot.minimal <- plot.standard + theme_minimal() + xlab("theme_minimal()")
plot.classic <- plot.standard + theme_classic() + xlab("theme_classic()")
plot.base <- plot.standard + theme_base() + xlab("theme_base()")
plot.economist <- plot.standard + theme_economist() + xlab("theme_economist()")
plot.fivethirtyeight <- plot.standard + theme_fivethirtyeight() + xlab("theme_fivethirtyeight()")
plot.tufte <- plot.standard + theme_tufte() + xlab("theme_tufte()")

pdf('ggthemes.pdf', height=10, width=6)
grid.arrange(plot.standard, plot.bw, plot.minimal, plot.classic, plot.base, plot.economist, plot.fivethirtyeight, plot.tufte, ncol=2)
dev.off()


