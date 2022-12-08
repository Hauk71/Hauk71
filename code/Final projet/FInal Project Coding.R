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

#data frame
Shelldata <- as.data.frame(Shell)
Survivaldata <- as.data.frame(Survival)
Recruitsdata <- as.data.frame(Recruits)
Firewormdata <- as.data.frame(Fireworm)
Physicaldata <- as.data.frame(Physical)
LandMdata <- as.data.frame(LandM)


#naming
colnames(Shelldata) <- c("River","Site", "Year", "Average.DO..mg.L.", "Shell.length..mm")
colnames(LandMdata) <- c("River","Site", "Year", "AFDM", "Shell.length..mm", "Average.DO..mg.L.")
colnames(Survivaldata) <- c("River","Year", "Site", "Survival", "Average.DO..mg.L.")

Length <- LandMdata[,-4] 

Master <- merge(Shelldata, Length, by= c("River","Site","Year"))
Masterdata <- merge(Master, Survivaldata, by= c("River","Site","Year"),all=T)
#aggregate
LandMName <- paste(LandMdata$Shell.length..mm, LandMdata$Average.DO..mg.L.)
LandM$Name <- LandMName

ShellName <- paste(Shelldata$Shell.length..mm, Shelldata$Average.DO..mg.L.)
Shell$Name <- ShellName

ShellMeans <- aggregate(x =Shelldata, by = list(Shell$Name), FUN = 'mean')
LandMMeans <- aggregate(x =LandMdata, by = list(LandM$Name), FUN = 'mean')

colnames(SurvivalMeans)
ord <- lm(ShellMeans ~ Survival, LandMMeans)

#histograms
as.numeric(as.character(Shelldata$Average.DO..mg.L.))


hist(Shelldata$Average.DO..mg.L.)

hist(Shelldata$Average.DO..mg.L.,
     main="DO affect on Shell length",
     xlab="DO levels",
     xlim=c(1,7),
     col="darkmagenta",
     freq=TRUE
)

hist(Shelldata$Shell.length..mm,
     main="Shell length",
     xlab="Shell length",
     xlim=c(1,50),
     col="darkmagenta",
     freq=TRUE
)





