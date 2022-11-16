# Load the packages from this week's tutorial.
#In the tutorial we looked at the community as a whole and the swimmers which ultimately matched a prediction we had for their distribution.
setwd('C:/GitHub/Hauk71/code/week 10')
library(spdep)
library(adespatial)
library(vegan)
PatchLatLon.csv <- read.csv("PatchLatLon.csv", header=T)
BugsByPatch.csv <- read.csv("BugsByPatch.csv", header=T)
HabitatbyPatch.csv <- read.csv("HabitatbyPatch.csv", header=T)
Swimmers.csv <- read.csv("Swimmers.csv", header=T)

PatchLatLon.mat <- as.matrix(PatchLatLon.csv[,-1])
BugsByPatch.mat <- as.matrix(BugsByPatch.csv)
HabitatbyPatch.mat <- as.matrix(HabitatbyPatch.csv)
Swimmers.mat <- as.matrix(Swimmers.csv)

#Part 1: Look at two other subsets of the community and determine the relative influence of space and habitat on each following the methods in the tutorial. (10 points)
#The options include groupings by taxonomy, where Diptera (true flies) have the strongest flight ability, Trichoptera the 2nd strongest, 
    #Ephememeroptera are 3rd, and non insects are 4th...because they don't have wings.
#Groupings by habits include the swimmers (off limits for the assignment) as most mobile, sprawlers as 2nd (they move in search of food, but not quickly),
    #and the clingers come in last (they might move up and down on individual rocks).
#Trichoptera - the 2nd strongest flying
#Sprawlers - the 2nd strongest crawlers 

Trichoptera.csv <- read.csv ('Trichoptera.csv', header = T)
Trichoptera.mat <- as.matrix(Trichoptera.csv)

Sprawlers.csv <- read.csv('Sprawlers.csv')
Sprawlers.mat <- as.matrix(Sprawlers.csv)


nb<-cell2nb(3,30,"queen") 
nb1 <- droplinks(nb, 19, sym=TRUE)
nb2 <- droplinks(nb1, 22, sym=TRUE)
nb3 <- droplinks(nb2, 25, sym=TRUE)
nb4 <- droplinks(nb3, 30, sym=TRUE)


bin.mat <- aem.build.binary(nb4, PatchLatLon.mat, unit.angle = "degrees", rot.angle = 90, rm.same.y = TRUE, plot.connexions = TRUE)
plot(PatchLatLon.mat[,2]~PatchLatLon.mat[,3], xlim = rev(c(76.75,77)))


aem.ev <- aem(aem.build.binary=bin.mat)
aem.df <- aem.ev$vectors[c(-19,-22,-25,-30),]
aem.df


Space.rda <- rda(Trichoptera.mat, as.data.frame(aem.df))
Space.r2a <- RsquareAdj(Space.rda)$adj.r.squared

aem.fwd <- forward.sel(BugsByPatch.mat,aem.df, adjR2thresh=Space.r2a)
aem.fwd$order

#high R squared space stuff controlling
SpaceNoHab.rda <- rda(Trichoptera.mat, as.data.frame(aem.df[,aem.fwd$order]), HabitatbyPatch.mat)
SpaceNoHab.rda 
anova(SpaceNoHab.rda, perm.max = 10000)
RsquareAdj(SpaceNoHab.rda)

#habitat controlling stuff
HabNoSpace.rda <- rda(Trichoptera.mat, HabitatbyPatch.mat, as.data.frame(aem.df[,aem.fwd$order]))
HabNoSpace.rda 
anova(HabNoSpace.rda, perm.max = 10000)
RsquareAdj(HabNoSpace.rda)

#Where are the sprawlers? You did everything right for Trichoptera but don't have anything to compare them to.

#Part 2: What is your interpretation of the pattern for each group individually, and the two in comparison, based on their mobility? (5 points)
#With the habitat to space RDA there is a higher conditional number showing that the interaction between the space and the habitat is much higher in comparison to the interaction between the species and the space 
#this shows that the species is more stationary compared to other organisms which is also shown by both of these species not being the best at flying and or crawling 
#Your answer is great for the first part of the question but doesn't get to the second part (i.e. comparing Trichoptera and sprawlers).

#Part 3: For each of your chosen groups of bugs, perform variable selection for the habitat data rather than the AEM data. Which habitat variables are significant for each? (10 points)
  # Definitions for the habitat column names:
    #Inorg = total suspended inorganic solids in the water column
    #Organ = total suspended organic solids in the water column
    #Chla = Chlorophyll a concentration from benthic rocks collected in-stream
    #BOM = total benthic organic matter in the sample
    #Depth = water depth
    #Flow	= water velocity where samples were collected
    #Fines = Percent of the substrate as "fines" i.e. small particles too small to measure
    #AveAr = The average size of rocks where each sample was collected

Trichoptera.mat <- rda(HabitatbyPatch.mat, as.data.frame(aem.df))
Trichoptera.mat <- RsquareAdj(Space.rda)$adj.r.squared

aem.fwd <- forward.sel(HabitatbyPatch.mat,aem.df, adjR2thresh=Space.r2a)


Sprawlers.mat <- rda(HabitatbyPatch.mat, as.data.frame(aem.df))
Sprawlers.mat <- RsquareAdj(Space.rda)$adj.r.squared

aem.fwd <- forward.sel(HabitatbyPatch.mat,aem.df, adjR2thresh=Space.r2a)

#Think about what the code is actually doing here. Changing the name of the object you are creating does not change the operation.
#Because of the slight random variability in the foward selection process you got different answers, but that has nothing to do with trichoptera and sprawlers.
#Habitat was supposed to replace space, not the bugs, in the model.

#the Sprawlers were closer to significance than the Trichoptera with a data point of 0.068 compared to Trichoptera with a point of 0.076.
#What do you mean by this? The question was which variables were significant.

#Part 4: How do you expect selecting both the spatial and the habitat variables would change the results of the RDAs from Part 1 above? (5 points)
  #(You do not need to redo the RDAs, unless you *want* to.)

# I believe selecting both of the spatial and habitat variables would decrease the difference between the conditional and constrained. Because they both have an impact on one another and an unique interaction with the species, this will drop the difference between the values.
#This might happen, but it's not relevant to the question. Without selecting variables for habitat, you are likely overfitting that part of the model.
#So the "real" influence of space is likely much stronger than what you generated with the above models.











