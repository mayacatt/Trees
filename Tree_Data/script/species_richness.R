total.species <- read.csv("output/Dawson.Trees.With.Origin.csv")
str(total.species)

library(tidyr)
library(tidyverse)
library(plyr)
library(dplyr)
install.packages("psych")
library(psych)
#total species richness/greenspacetype
tot.sp.table <- read.csv("output/total.sp.mat.csv")
pr.total<-ddply(total.sp.table, ~Var2, function(x) {
  data.frame(RICHNESS= sum((x[-1]>0)))})
names(pr.total)[names(pr.total)=='Var2'] <- 'GS.Type'
pr.total

#total sp richness/site
site.sp.table <- read.csv("output/site.sp.mat.csv")
per.site.total<-ddply(site.sp.table, ~X, function(x) {
  data.frame(RICHNESS= sum((x[-1]>0)))
})
per.site.total
describe(per.site.total$RICHNESS)

#SLL sp richness/site
SLL.site.sp.matrix<- read.csv("output/SLL.site.sp.mat.csv")
str(SLL.site.sp.matrix)
SLL.per.site.total<-ddply(SLL.site.sp.matrix, ~X, function(x) {
  data.frame(RICHNESS_NAT= sum((x[-1]>0)))
})
SLL.per.site.total
describe(SLL.per.site.total$RICHNESS)

#SLL.prop

SLL.rich.prop <- left_join(per.site.total, SLL.per.site.total)
SLL.rich.prop[is.na(SLL.rich.prop)] <-0
SLL.rich.prop$Proportion <- SLL.rich.prop$RICHNESS_NAT/SLL.rich.prop$RICHNESS
SLL.rich.prop$Site.Type <- substr(SLL.rich.prop$X, 1,1)
SLL.rich.prop$Region <- "SLL"
str(SLL.rich.prop)

boxplot(Proportion~Site.Type, SLL.rich.prop
        title="Native SLL Proportion per Green Space Type")

library(ggplot2)

SLL.prop <- ggplot(SLL.rich.prop, aes(Site.Type, Proportion))
SLL.prop

#ETF sp richness/site
ETF.site.sp.matrix<- read.csv("output/ETF.site.sp.mat.csv")
str(ETF.site.sp.matrix)
ETF.per.site.total<-ddply(ETF.site.sp.matrix, ~X, function(x) {
  data.frame(RICHNESS_NAT= sum((x[-1]>0)))
})
ETF.per.site.total
describe(ETF.per.site.total$RICHNESS)
#ETF richness / site
ETF.rich.prop <- left_join(per.site.total, ETF.per.site.total)
ETF.rich.prop[is.na(ETF.rich.prop)] <-0
ETF.rich.prop$Proportion <- ETF.rich.prop$RICHNESS_NAT/ETF.rich.prop$RICHNESS
ETF.rich.prop$Site.Type <- substr(ETF.rich.prop$X, 1,1)
ETF.rich.prop$Region <- "ETF"
str(ETF.rich.prop)

#ETF.prop

ETF.rich.prop <- left_join(per.site.total, ETF.per.site.total)
ETF.rich.prop[is.na(ETF.rich.prop)] <-0
ETF.rich.prop$Proportion <- ETF.rich.prop$RICHNESS_NAT/ETF.rich.prop$RICHNESS
ETF.rich.prop$Site.Type <- substr(ETF.rich.prop$X, 1,1)
ETF.rich.prop$Region <- "ETF"
str(SLL.rich.prop)


#JOIN ETF AND SLL

prop.rich.tot <- rbind(ETF.rich.prop, SLL.rich.prop)
View(prop.rich.tot)
prop.rich.tot <- prop.rich.tot %>%
  distinct()
prop.rich.tot <- dplyr::rename(prop.rich.tot, "Site.Code"=X)
prop.rich.tot$Region <- recode(prop.rich.tot$Region, "0"="NON-NAT")
View(prop.rich.tot)
write.csv(prop.rich.tot, "output/prop.rich.tot.csv")

#sp richness/park
park.sp.table <- read.csv("output/parks.sp.mat.csv")
str(park.sp.table)
per.park.total<-ddply(park.sp.table,~X, function(x) {
  data.frame(RICHNESS= sum((x[-1]>0)))
})
per.park.total
describe(per.park.total$RICHNESS)
#sprichness/street

s.sp.table <- read.csv("output/s.sp.mat.csv")
str(s.sp.table)
per.s.total<-ddply(s.sp.table,~X, function(x) {
  data.frame(RICHNESS= sum((x[-1]>0)))
})
per.s.total
describe(per.s.total$RICHNESS)
#sprichness/yard

res.sp.table <- read.csv("output/res.sp.mat.csv")
str(res.sp.table)
per.res.total<-ddply(res.sp.table, ~X, function(x) {
  data.frame(RICHNESS= sum((x[-1]>0)))
})
per.res.total
describe(per.res.total$RICHNESS)
#sprichness/institute

ins.sp.table <- read.csv("output/ins.sp.mat.csv")
str(ins.sp.table)
per.ins.total<-ddply(ins.sp.table,~X, function(x) {
  data.frame(RICHNESS= sum((x[-1]>0)))
})
per.ins.total
describe(per.ins.total$RICHNESS)
#sprichness/allyeyway

a.sp.table <- read.csv("output/a.sp.mat.csv")
str(a.sp.table)
per.a.total<-ddply(a.sp.table,~X, function(x) {
  data.frame(RICHNESS= sum((x[-1]>0)))
})
per.a.total
describe(per.a.total$RICHNESS)

