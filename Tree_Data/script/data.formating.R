setwd("~/Documents/GitHub/Trees/Tree_Data")
meta.csv <- read.csv("output/Dawson.Trees.With.Origin.csv")
library(tidyverse)

##table that summarizes species by green space type
total.sp.table <- table(meta.csv$Species.Code, meta.csv$GS.Type)
list.total.sp.table <- as.data.frame(total.sp.table)
total.sp.wide <- spread(list.total.sp.table, "Var1", "Freq")
rownames(total.sp.wide) <- total.sp.wide$Var2
total.sp.mat<-subset(total.sp.wide, select = -c(Var2))
View(total.sp.mat)
write.csv(total.sp.mat, file="output/total.sp.mat.csv")

##table that summarizes species by site code

site.sp.table <- table(meta.csv$Species.Code, meta.csv$Site.Code)
list.site.sp.table<- as.data.frame(site.sp.table)
site.sp.wide <- spread(list.site.sp.table, "Var1", "Freq")
rownames(site.sp.wide) <- site.sp.wide$Var2
site.sp.mat<-subset(site.sp.wide, select = -c(Var2))
View(site.sp.mat)
write.csv(site.sp.mat, file="output/site.sp.mat.csv")

#table that summarizes private vs public (management)

m.sp.table <- table(meta.csv$Species.Code, meta.csv$Classification)
write.csv(m.sp.table, file="output/m.sp.table.csv")
m.sp.df<- as.data.frame(m.sp.table)
str(m.sp.df)
m.sp.wide <- spread(m.sp.df, "Var1", "Freq")
rownames(m.sp.wide) <- m.sp.table$Var2
View(m.sp.table)
str(m.sp.table)
m.sp.mat <- m.sp.wide[, 2:131]
View(m.sp.mat)
write.csv(m.sp.mat, file="output/m.sp.mat.csv")

#table that summarizes species --> Residential 
meta.csv$Site.Type
res.data <- subset(meta.csv, meta.csv$Site.Type=="R")
View(res.data)
res.sp.table <- table(res.data$Species.Code, res.data$Site.Code)
write.csv(res.sp.table, file="output/res.sp.table.csv")
res.sp.df <- as.data.frame(res.sp.table)
res.wide <- spread(res.sp.df, "Var1", "Freq")
rownames(res.wide) <- res.wide$Var2
str(res.wide)
res.sp.mat <- res.wide[, 2:99]
write.csv(res.sp.mat, file="output/res.sp.mat.csv")

#species / institutional
ins.data <- subset(meta.csv, meta.csv$Site.Type=="I")
ins.sp.table <- table(ins.data$Species.Code, ins.data$Site.Code) 
write.csv(ins.sp.table, file="output/ins.sp.table.csv")
ins.sp.df <- as.data.frame(ins.sp.table)
ins.sp.wide <-spread(ins.sp.df, "Var1", "Freq")
rownames(ins.sp.wide) <- ins.sp.wide$Var2
str(ins.sp.wide)
ins.sp.mat <- ins.sp.wide[, 2:53]
write.csv(ins.sp.mat, file="output/ins.sp.mat.csv")

#species/park (will be adding more information with westmount)
parks.data <- subset(meta.csv, meta.csv$Site.Type=="P")
parks.sp.table <- table(parks.data$Species.Code, parks.data$Site.Code) 
write.csv(parks.sp.table, file="output/parks.sp.table.csv")
parks.sp.df <- as.data.frame(parks.sp.table)
parks.sp.wide <-spread(parks.sp.df, "Var1", "Freq")
rownames(parks.sp.wide) <- parks.sp.wide$Var2
str(parks.sp.wide)
parks.sp.mat <- parks.sp.wide[, 2:23]
write.csv(parks.sp.mat, file="output/parks.sp.mat.csv")

#species/street

s.data <- subset(meta.csv, meta.csv$Site.Type=="S")
s.sp.table <- table(s.data$Species.Code, s.data$Site.Code) 
write.csv(s.sp.table, file="output/s.sp.table.csv")
s.sp.df <- as.data.frame(s.sp.table)
s.sp.wide <-spread(s.sp.df, "Var1", "Freq")
rownames(s.sp.wide) <- s.sp.wide$Var2
str(s.sp.wide)
s.sp.mat <- s.sp.wide[, 2:42]
write.csv(s.sp.mat, file="output/s.sp.mat.csv")

# species/alleyway

a.data <- subset(meta.csv, meta.csv$Site.Type=="A")
a.sp.table <- table(a.data$Species.Code,a.data$Site.Code) 
write.csv(a.sp.table, file="output/a.sp.table.csv")
a.sp.df <- as.data.frame(a.sp.table)
a.sp.wide <-spread(a.sp.df, "Var1", "Freq")
rownames(a.sp.wide) <- a.sp.wide$Var2
str(a.sp.wide)
a.sp.mat <- a.sp.wide[, 2:28]
write.csv(a.sp.mat, file="output/a.sp.mat.csv")


#native spp /green space

SLL.data <- subset(meta.csv, meta.csv$Native_SLL=="Y")
SLL.sp.table <- table(SLL.data$Species.Code,SLL.data$Site.Code) 
write.csv(SLL.sp.table, file="output/SLL.sp.table.csv")
SLL.sp.df <- as.data.frame(SLL.sp.table)
SLL.sp.wide <-spread(SLL.sp.df, "Var1", "Freq")
rownames(SLL.sp.wide) <- SLL.sp.wide$Var2
str(SLL.sp.wide)
SLL.sp.mat <- SLL.sp.wide[, 2:28]
write.csv(SLL.sp.mat, file="output/SLL.sp.mat.csv")

#native spp/site 

SLL.site.sp.table <- table(SLL.data$Species.Code, SLL.data$Site.Code)
SLL.site.sp.df<- as.data.frame(SLL.site.sp.table)
SLL.site.sp.wide <- spread(SLL.site.sp.df, "Var1", "Freq")
rownames(SLL.site.sp.wide) <- SLL.site.sp.wide$Var2
SLL.site.sp.mat<-subset(SLL.site.sp.wide, select = -c(Var2))
View(SLL.site.sp.mat)
write.csv(SLL.site.sp.mat, file="output/SLL.site.sp.mat.csv")

#ETF PER GREENSPACE TYPE

ETF.data <- subset(meta.csv, meta.csv$Native_ETF=="Y")
ETF.sp.table <- table(ETF.data$Species.Code,ETF.data$Site.Code) 
write.csv(ETF.sp.table, file="output/ETF.sp.table.csv")
ETF.sp.df <- as.data.frame(ETF.sp.table)
ETF.sp.wide <-spread(ETF.sp.df, "Var1", "Freq")
rownames(ETF.sp.wide) <- ETF.sp.wide$Var2
str(ETF.sp.wide)
ETF.sp.mat <- ETF.sp.wide[, 2:28]
write.csv(ETF.sp.mat, file="output/ETF.sp.mat.csv")

#ETF PER SITE 
ETF.site.sp.table <- table(ETF.data$Species.Code, ETF.data$Site.Code)
ETF.site.sp.df<- as.data.frame(ETF.site.sp.table)
ETF.site.sp.wide <- spread(ETF.site.sp.df, "Var1", "Freq")
rownames(ETF.site.sp.wide) <- ETF.site.sp.wide$Var2
ETF.site.sp.mat<-subset(ETF.site.sp.wide, select = -c(Var2))
View(ETF.site.sp.mat)
write.csv(ETF.site.sp.mat, file="output/ETF.site.sp.mat.csv")
