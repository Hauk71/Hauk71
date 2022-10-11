# Read in the "Toscano_Griffen_Data.csv" data from GitHub and load the three packages we used in the tutorial this week.
# The paper these data came from is uploaded to Canvas as "Toscano&Griffen_2014_JAE..."

library(MASS)
library(MuMIn) 
library(mgcv)

# First create models with the same (y) and method (GLMM) as the published paper, using the GLMM function from the tutorial. 
  #Create two different models using the same 3 predictor (x) variables from the dataset. (4 points each) 
    # In one model only include additive effects.
    # In the other model include one interactive effect.
    # Use a binomial distribution and block as a random effect in both models to match the paper's analyses. Remember ?family to find distribution names.
  
setwd('/GitHub/Hauk71/code/week 6')

Excel <- read.csv("Toscano_Griffen_Data.csv")

summary(Excel)


glmm.mod <- glmmPQL(eaten~activity.level, family = gaussian, random = ~ 1 | block, data = Excel)

r.squaredGLMM(glmm.mod)

plot(glmm.mod)

#first model
glmm.mod1 <- glmmPQL(eaten~activity.level + toadfish.cue.treatment, family = binomial, random = ~ 1 | block, data = Excel)

plot(glmm.mod1)

#second model
glmm.mod2 <- glmmPQL(eaten~activity.level * toadfish.cue.treatment, family = binomial, random = ~ 1 | block, data = Excel)

plot(glmm.mod2)


#additive affects
gam.mod1 <- gam(eaten~activity.level, family = gaussian, random = list(block=~ 1), data = Excel)

plot(gam.mod1$residuals, ylim = c(-.1,.1))


# The authors used proportional consumption of prey as the (y) in their model, but did not include this in the dataset.
  # So we are going to create it - run the following line, assuming df= your data frame (feel free to change that):
Excel$prop.cons <- Excel$eaten/Excel$prey 

# (Q1) - The code in line 8 is performing two operations at once. What are they? (2 pts)
#returning the first part of the object and the last part of the object

# (Q2) - Did the interactive effect change which variables predict proportional consumption? How, specifically, did the results change? (5 pts)
#the interactive effect did change the variables, the results changed by shifting the x axis to a higher number and quantity. 

# (Q3) - Plot the residuals of both models. Do you think either model is a good fit? Why or why not? (3 pts)
plot(gam.mod1$residuals, ylim = c(-.1,.1))
#yes because there is no correlation between the variables
# Re-run both models as generalized additive models instead (using gam). Then compare the AIC of both models. (4 points each)

gam.mod4 <- gam(eaten~activity.level + toadfish.cue.treatment, family = poisson, random = ~ 1 | block, data = Excel)

gam.mod5 <- gam(eaten~activity.level * toadfish.cue.treatment, family = quasi, random = ~ 1 | block, data = Excel)

# (Q4) - Which model is a better fit? (2 pt)
r.squaredGLMM(glmm.mod)
r.squaredGLMM(glmm.mod1)
r.squaredGLMM(glmm.mod2)
#The first one has the higher line of best fit because it has a higher R2m value

# (Q5) - Based on the residuals of your generalized additive models, how confident are you in these results? (2 pts)
#I am confident in my results because there is no correlation between the data points and variables







