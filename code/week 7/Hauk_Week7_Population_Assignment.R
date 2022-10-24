# Load the "anytime" and "ggplot2" packages to complete this week's assignment.

install.packages('anytime')
install.packages('ggplot2')

library('anytime')
library('ggplot2')

setwd('C:/GitHub/Hauk71/code/week 7')
#Read the CSV files
data <- read.csv('Plankton_move_average.csv')
# Read the "Plankton_move_average" CSV in from GitHub. 

# These are data from the Great Lakes Environmental Research Laboratory plankton sampling.

#Used the following lines to format the date and remove NAs from the dataset:

data$Date <- as.Date(data$Date, origin = "0001-01-01") # Setting values to "day zero".
data <- na.omit(data)

summary(data)

#Plot these population data over time with the following code:
ggplot(data)  +
  xlab("Numeric Date") + ylab("Density Individuals")+
  geom_line(data=data, aes(Date, D.mendotae), color="black", alpha = 0.7, size=1)+
  geom_line(data=data, aes(Date, LimncalanusF+LimncalanusM), color="orange",  alpha = 0.7, size=1)+ # adding males and females together, hint: this is actually spelled Limnocalanus
  geom_line(data=data, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  geom_line(data=data, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  theme_bw() 

# Export this plot to have on hand for reference in the next section of the assignment (and upload with your script).


# (1) - Which species is most likely to be r-selected prey and which its primary predator? (2 pts)
#D. mendotae is the most likely to be the r selected prey because it has the most offspring and less parenting so the population will increase and decrease at a rapid pace.
#Who is the primary predator?
# What is one relationship the third species MIGHT have to the first two? (2 pts)
# The data could be mutualistic becaue the popualation of the blue line is always at its highest when the other plots are at their highest point. And they drop off when the others drop off showing that they helpe one another and support each others living. 
#If you look closely the peaks appear in a consistent order rather than at the same time. Not saying there couldn't be mutualism, but your argument is flawed.
#Now copy/paste in the Lotka-Volterra function, plotting script, and load the "deSolve" package from the tutorial:
install.packages('deSolve')
library(deSolve)
LotVmod <- function (Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    dx = x*(alpha - beta*y)
    dy = -y*(gamma - delta*x)
    return(list(c(dx, dy)))
  })
}

    Pars <- c(alpha = 2, beta = 0.5, gamma = .2, delta = .6) 
    State <- c(x = 10, y = 10)
    Time <- seq(0, 100, by = 1)
    out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))
    
   #plotting  
    matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
    legend("topright", c("Limcalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)
    
    
# (2) - What do alpha, beta, gamma, and delta represent in this function? (4 pts)
    #alpha - rate of growth in the prey population
    #beta - rate of predation 
    #gamma - rate of prey consumption - pop stability 
    #delta - rate of prey consumption - Predation dies
    
    
    
# (3) - By only changing values for alpha, beta, gamma, and/or delta
# change the default parameters of the L-V model to best approximate the relationship between Limncalanus and D.mendotae, assuming both plots are on the same time scale.
# What are the changes you've made to alpha, beta, gamma, and delta from the default values; and what do they say in a relative sense about the plankton data? (4 pts)
# Are there other paramenter changes that could have created the same end result? (2 pts)
# Export your final L-V plot with a legend that includes the appropriate genus and/or species name as if the model results were the real plankton data, 
# and upload with your script. (hint - remember which one is the predator and which is the prey)

    Pars <- c(alpha = 1, beta = 0.2, gamma = .2, delta = .6) 
    State <- c(x = 10, y = 10)
    Time <- seq(0, 100, by = 1)
    out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))
    
    matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
    legend("topright", c("Limcalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)
#alpha changed decreasing 1 - By decreaseing the rate of predation growth, this shows that the growth rate is based around the population of predators affecting the final population of the k selected species
#Alpha is prey growth, not predator.
#Beta changed by decrease .3 - The rate of predation is decreased to help slow the death of the k selected species allowing the population to grow at a faster rate
#slow death of r species, not K.
#gamma and delta did not change
    
    
# I believe the enviornment could be another paramater changes. This would have a dramatic impact on the relationship between the predator and prey and in turn affect growth rates and consumption rates, altering the graph to becoming something simmilar to what is present. 
# The environment could also affect the data dramaticly in the opposite direction resulting in vary differnet results
  #True, but eh question was about changes to the L-V models, not external factors.
    
    
    
