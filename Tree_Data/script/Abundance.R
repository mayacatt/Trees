Dawson.trees.total <- read.csv("output/Metadata.Dawson.csv")
View(Dawson.trees.total)
str(Dawson.trees.total)
library(dplyr)

#SLL subset

SLL.Species <- subset(Dawson.trees.total, Native_SLL=='Y', select=c(Site.Type, Site.Code))
View(SLL.Species)
SLL.per.site <- count(SLL.Species, Site.Code, .drop=FALSE)
View(Sll.per.site)

#ETF subset
ETF.Species <- subset(Dawson.trees.total, Native_ETF=='Y')
View(ETF.Species)
ETF.per.site <- count(ETF.Species, Site.Code)
View(ETF.per.site)

#Total trees per site
Trees.per.site <- count(Dawson.trees.total, Site.Code)
View(Trees.per.site)

#Proportion per site
SLL.per.site$proportion.SLL <- Sll.per.site/Trees.per.site
