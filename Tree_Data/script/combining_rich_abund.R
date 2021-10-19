#summary stats

meta <- read.csv("output/Dawson.Trees.With.Origin.csv")
meta <- meta[,c(2:9, 10, 13:14)]
str(meta)

Sites <- meta[, c(1:4)]

Site.Rich <- read.csv("output/prop.rich.tot.csv")
str(Site.Rich)

Sites.Abund <- read.csv("output/prop.abund.tot.csv")
str(Sites.Abund)
Sites.Abund <- dplyr::rename(Sites.Abund, "Site.Code"=X)
Sites.Abund <- subset(Sites.Abund, select = -c(X.1))
Meta.Final <- left_join(Sites, Site.Rich)
Meta.Final
str(Meta.Final)
Meta.Final <- subset(Meta.Final, select = -c(X))
Meta.Final <- left_join(Meta.Final, Sites.Abund)
View(Meta.Final)
Meta.Final <- Meta.Final[, c(1:4, 8, 5:7, 9:11)]

write.csv(Meta.Final, "output/meta.analysis.csv")
