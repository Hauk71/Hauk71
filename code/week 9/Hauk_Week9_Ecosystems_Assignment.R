# For this week it's time to start exploring your own ideas and questions in R.
  # There are at least five options in the dataset to create the following comparisons.

# (Q1 - 12 pts) Use the dataset from the tutorial to complete one redundancy analysis (RDA) with variance partitioning on a different community (NOT the nematodes).
  # Explain the ecological importance of your significant predictor variables, or the importance if none are significant for your community.

# (Q2 - 12 pts) Then use the dataset from the tutorial to create a linear model related to your RDA. Try multiple predictors to find the best fit model.
  # Explain the ecological importance of the significant predictors, or lack of significant predictors.

# (Q3 - 6 pts) Provide a 3-4 sentence synthesis of how these results relate to one another and the value of considering both together for interpreting biotic-abiotic interactions.
library(vegan)
library(readxl)
setwd('C:/GitHub/Hauk71/code/week 9')


#Q1
abiotic.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Abiotic factors")

abiotic <- as.data.frame(abiotic.tibble)

head(abiotic)
tail(abiotic)
invert.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Invertebrate_community")

invert <- as.data.frame(invert.tibble)

head(invert)
tail(invert)


abiotic.names <- paste(abiotic$Parcel, abiotic$Land_Use)
abiotic$names <- abiotic.names

invert.names <- paste(invert$Parcel, invert$Land_Use)
invert$names <- invert.names



AB.means <- aggregate(x =abiotic, by = list(abiotic$names), FUN = 'mean')

IV.means <- aggregate(x = invert, by = list(invert$names), FUN = 'mean')


Iv.mean1 <- IV.means[-5,c(-1:-3,-73)]
Iv.mean2 <- as.data.frame(sapply(Iv.mean1, as.numeric))

AB.mean1 <- AB.means[,c(-1,-2,-3,-5,-6,-16)]
AB.mean2 <- as.data.frame(sapply(AB.mean1, as.numeric))


#RDA 
colnames(AB.mean2)
ord <- rda(Iv.mean2 ~ totalN, AB.mean2)
anova(ord)
plot(ord, ylim = c(-2,2), xlim = c(-5,5))
#This data shows that there is a significant difference between the variance of the model vs the residual. The plot shows that the toatlN is a limiting factor in this environment due to the lack of support from the data points. 
#I do not get a significant result when running this code. Even if significant, you need to think about what the result tells you mode - this just demonstrates that the communities are related to nitrogen - some communities are a result of more N, some from less N.

#Q2
plants.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Data_intro_exp_4_species")
plants <- as.data.frame(plants.tibble)
AB.mean2$Parcel <- unique(abiotic$Parcel)


soil.plants <- merge(AB.mean2, plants, by = "Parcel")
mod1 <- lm(Leaves ~ pH + totalN + Kalium + Magnesium + Ca + Al + TotalP + Land_use + Species_code,soil.plants)
summary(mod1)
anova(mod1)
AIC(mod1)
plot(mod1$residuals)

#Removing the unnecessary 
mod2 <- lm(Leaves ~ pH + totalN + Kalium + Species_code,soil.plants)
summary(mod2)
anova(mod2)
AIC(mod1,mod2)
plot(mod2$residuals)



#The data does not change to much due to the fact that there are data points that outweigh others or have a greater impact on the environment making the removal of these data points insignificant. 
#this can be seen with the removal of calcium and aluminum, where the total N is much more important and takes over most of the data points. This can also be seen in the environment because nitrogen is a limiting reagent in plants and other autographs, making it significantly more important the the uptake of Al.
#Where does uptake of Al fit into your results? I'm confused. I think I know what you are saying here, but your terminology is confusing.
#Data never change during an analysis, only the results/models change from changing data that are a part of the model. This is also the same data I used in the tutorial...

#Q3
#These results relate to one another by emphasizing the significant and insignificant data. The data shows that the removal of certain smaller points played no major role or affect in the final output of the linear model. 
#The abiotic and biotic interactions throughout life are important even at the smallest levels, With some of these data points affecting abiotic factors, some neutrally like calcium, and others more significant like nitrogen intake, we are able to see how they ultimately impact biotic aspects of this world.
#Most abiotic factors have an impact on biotic for example plants need nitrogen to grow and the abiotic factors in the atmosphere help the nitrogen flow to be intake by the plants. 
#Nitrogen cycle does not work by direct uptake of N by plants - need bacteria for that to happen.

#non-significant, not insignificant.


