#Final coding project

#Working question 
#How do the levels of dissolved oxygen in a marine environment affect the various organisms' suitability?
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

ShellMeans1 <- as.data.frame(sapply(ShellMeans, as.numeric))
LandMMeans1 <- as.data.frame(sapply(LandMMeans, as.numeric))

unlist(ShellMeans1)
unlist(Survival)
unlist(LandMMeans1)

colnames(ShellMeans)
LinearModel <- lm(ShellMeans1$Average.DO..mg.L. ~ Survival$Survival, LandMMeans1$Shell.length..mm)

anova(LinearModel)
#This linear model and anova do not run following your code.
#You also have three completely separate data frames that you are pulling together in this line, which need to be together in a single data frame for analysis.
#It is not possible for me to recreate this without several merge and organziation steps that are not included in your code.

#Plotting
as.numeric(as.character(Shelldata$Average.DO..mg.L.))#This line is not directed to an object.


#plot shows the comparison between the levels of dissolved oxygen and the shell length and consistency
plot(Shelldata$Shell.length..mm ~ Shelldata$Average.DO..mg.L.)

plot(Shelldata$Shell.length..mm ~ Shelldata$Average.DO..mg.L., xlab = "Dissolved oxygen", ylab = "Shell Length", main = "Affects of DO on Shell Length")

#histograms show the overall frequency of each of the data groups
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
     xlim=c(1,40),
     col="darkmagenta",
     freq=TRUE
)
#Box plot 
#when looking at both of these bar graph notice a drop in the dissolved oxygen level there is a drop in the shell size and an increase in dissovled oxygen levels shows an increase in shell size there is a direct correlation 
barplot(Shelldata$Shell.length..mm,  ylim = c(0,40), xlab = 'Shell amount', ylab= 'size', main = "Shell length")
barplot(Shelldata$Average.DO..mg.L., ylim = c(0,8), xlab = 'Time', ylab= 'Do levels', main = "example")
#Your comment here says box plot but both figures are bar plots. 
#What direct correlation are you trying to show with these two figures? They do not have the same axes and are not comparable.
#There are also no statistics to compare them.

#Only one linear model included here - what about the other two stats?
#Very limited commenting - I needed to guess/interpret what you are doing based on the code itself.
#You never used the second data set! All of this is based on the data from Chesapeake Bay.


