#Final coding project

#Working question 
#How do the levels of dissolved oxygen in a marine environment affet the vaious organisms' survivability?
install.packages("readxl")
library(readxl)
setwd('C:/GitHub/Hauk71/code/Final projet')

#data from Chesapeake bay
Shell <- read.csv("C:/GitHub/Hauk71/code/Final projet/Macoma balthic shell lengths.csv")
Survival <- read.csv("C:/GitHub/Hauk71/code/Final projet/Macoma balthica survival.csv")
Recruits <- read.csv("C:/GitHub/Hauk71/code/Final projet/Macoma balthic recruits.csv")
LandM <- read.csv("C:/GitHub/Hauk71/code/Final projet/Macoma balthic lengths and masses.csv")

summary(Shell)
summary(Survival)
summary(Recruits)
summary(LandM)

#data from hypoxia tolerance 
Fireworm <- read.csv("C:/GitHub/Hauk71/code/Final projet/fireworm_experiment.csv")
Physical <- read.csv("C:/GitHub/Hauk71/code/Final projet/physical_data.csv")

summary(Fireworm)
summary(Physical)

#aggregate
Shelldata <- as.data.frame(Shell)
Survivaldata <- as.data.frame(Survival)
Recruitsdata <- as.data.frame(Recruits)
Firewormdata <- as.data.frame(Fireworm)
Physicaldata <- as.data.frame(Physical)
LandMdata <- as.data.frame(LandM)


#combining objects




#naming
LandMName <- paste(LandMdata$Shell.length..mm, LandMdata$Average.DO..mg.L.)
LandM$Name <- LandMName

ShellName <- paste(Shelldata$Shell.length..mm, Shelldata$Average.DO..mg.L.)
Shell$Name <- ShellName

ShellMeans <- aggregate(x =Shelldata, by = list(Shell$Name), FUN = 'mean')
LandMMeans <- aggregate(x =LandMdata, by = list(LandM$Name), FUN = 'mean')

colnames(SurvivalMeans)
ord <- lm(ShellMeans ~ Survival, LandMMeans)



