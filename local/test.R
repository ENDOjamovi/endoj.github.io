library(lavaan)
data<-Demo.twolevel
data$group<-ifelse(data$cluster>100,"g1","g2")
str(data)

table(data$group)
model <- '
group: g1
    level: 1
        fw =~ y1 + y2 + y3
        fw ~ x1 + x2 + x3
    level: 2
        fb =~ y1 + y2 + y3
        fb ~ w1 + w2
group: g2
    level: 1
        fw =~ y1 + y2 + y3
        fw ~ x1 + x2 + x3
    level: 2
        fb =~ y1 + y2 + y3
        fb ~ w1 + w2

'

fit <- sem(model, data = data, cluster = "cluster", group = "group",fixed.x = FALSE)
summary(fit)

library(lavaan)
data<-Demo.twolevel
data$group<-factor(as.numeric(data$cluster>100))
table(data$group)
model <- '
    level: 1
        fw =~ y1 + y2 + y3
        fw ~ x1 + x2 + x3
    level: 2
        fb =~ y1 + y2 + y3
        fb ~ w1 + w2

'

fit <- sem(model, data = data,group="group",fixed.x = F, cluster="cluster")
summary(fit)
