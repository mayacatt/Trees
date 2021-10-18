Dawson.trees.total <- read.csv("output/Dawson.Trees.With.Origin.csv")
View(Dawson.trees.total)
str(Dawson.trees.total)
library(dplyr)
length(unique(Dawson.trees.total$Site.Code))

#SLL subset

SLL.Species <- subset(Dawson.trees.total, Native_SLL=='Y', select=c(Site.Type, Site.Code))
SLL.Species <- SLL.Species %>% 
  add_count(Site.Code) %>%
  distinct() %>%
  rename("SLL.per.site"=n)
SLL.Species$Region <- "SLL"
View(SLL.Species)

#ETF subset
ETF.Species <- subset(Dawson.trees.total, Native_ETF=='Y',select=c(Site.Type, Site.Code))
ETF.Species <- ETF.Species %>%
  add_count(Site.Code) %>%
  distinct() %>%
  rename("ETF.per.site"=n)
ETF.Species$Region <- "ETF"
View(ETF.Species)


str(Dawson.trees.total)
#Total trees per site
Trees.per.site <- Dawson.trees.total[,4:5] %>%
  add_count(Site.Code) %>%
  distinct() %>%
  rename("total.per.site"=n)
View(Trees.per.site)

#Proportion per site

SLL.proportions <- left_join(Trees.per.site, SLL.Species)
SLL.proportions[is.na(SLL.proportions)] <- 0
View(Native.proportions)
str(Native.proportions)
SLL.proportions$Proportion <- SLL.proportions$SLL.per.site/SLL.proportions$total.per.site

ETF.proportions <- left_join(Trees.per.site, ETF.Species)
ETF.proportions[is.na(ETF.proportions)] <-0
ETF.proportions$Proportion <- ETF.proportions$ETF.per.site/ETF.proportions$total.per.site

Dawson.proportions <- merge(SLL.proportions, ETF.proportions, all=TRUE)
View(Dawson.proportions)

install.packages("car")
library(car)
str(Dawson.proportions)
glm.abundance <- glm(Proportion~ Site.Type+Region,weights=total.per.site, family=binomial, Dawson.proportions)
anova(glm.abundance)
Anova(glm.abundance)
summary(glm.abundance)

install.packages("emmeans")
Yes
library(emmeans)
lsmeans(glm.abundance, pairwise~Site.Type|Region, adjust=Tukey)
