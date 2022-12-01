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

summary(Shell)
summary(Survival)
summary(Recruits)

#data from hypoxia tolerance 
Fireworm <- read.csv("C:/GitHub/Hauk71/code/Final projet/fireworm_experiment.csv")
Physical <- read.csv("C:/GitHub/Hauk71/code/Final projet/physical_data.csv")

summary(Fireworm)
summary(Physical)

