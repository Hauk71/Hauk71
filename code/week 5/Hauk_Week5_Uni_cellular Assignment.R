# First, recreate Figure 4 from Herron et al. (2019). De novo origins of multicellularity in response to predation. Scientific Reports.
  # Search datadryad.org by the paper title and download the dataset. It will include .csv files and R scripts, organized by figure.
  # Save the script and change the working directory on lines 8 and 115 to match your GitHub repository. (6 points)
  # Export and save the plot you've created. (2 points)
  # Zoom into your plot to look at the distribution for different strains.

# Do all of the strains in the plot have the same distributions (yes/no)? (2 pt)
#No the strains do not have the same distribution 
# Based on these observations of your strain distributions, why did the authors use a Kruskal-Wallis test rather than ANOVA to compare the strains? (2 pts)
#Because each distributions do not have the same distributions or a normal distribution is why the authors used Kruskal-wallis test rather than ANOVA. ANOVA is used when the distribution is normal, but the Kruskal-wallis test is used when the data is anything but normal.

# Use the fitdist() and gofstat() functions to compare the poisson, negative binomial, and logistic distributions for:
  # (1) - The number of cells of progeny (data$Num.Cells.Progeny)
  # (2) - The replication time (data$RepTime.sec)
      # 3 points each
    #HINT- "Num.Cells.Progeny" has defined breaks. To display results, use the formula with the "chisqbreaks" argument as follows:
      #gofstat(list(fit.1, fit.2, fit.3, etc), chisqbreaks=c(1,2,4,8,16,32,64))

install.packages('fitdistrplus')

install.packages('logspline')

library(fitdistrplus)

library(logspline)

#Data 

setwd('C:/GitHub/Hauk71/code/week 5')

data <- read.csv('Figure4Data.csv', header = TRUE)

#1 Number of cells

fit.logis1 <- fitdist(c (na.exclude (data$Num.Cells.Progeny)),distr = 'logis')
fit.pois1 <- fitdist(c (na.exclude (data$Num.Cells.Progeny)), distr = 'pois')
fit.nbinom1 <- fitdist(c (na.exclude (data$Num.Cells.Progeny)), distr = 'nbinom')


#2 Replication time
fit.logis <- fitdist(c (na.exclude (data$RepTime.sec)),distr = 'logis')
fit.pois <- fitdist(c (na.exclude (data$RepTime.sec)), distr = 'pois')
fit.nbinom <- fitdist(c (na.exclude (data$RepTime.sec)), distr = 'nbinom')


#1
gofstat(list(fit.logis1, fit.pois1, fit.nbinom1), chisqbreaks=c(1,2,4,8,16,32,64))
#2
gofstat(list(fit.logis, fit.pois, fit.nbinom), chisqbreaks=c(1,2,4,8,16,32,64))

# Based on the AIC scores, which distribution is the best fit for: (4 pts)
  # (1) - The number of cells of progeny (data$Num.Cells.Progeny)?
  # (2) - The replication time (data$RepTime.sec)?

# the negative binomial distribution is the best fit for each of these data sets. The AIC score is the lowest amount with 7315.5 for progeny and 56169 for the time.



# Plot a generic histogram for the replication time (data$RepTime.sec) (2 pt)

hist(data$RepTime.sec)


# Based on the patterns of this histograms and Figure 4:
  #Give one hypothesis for an evolutionary process represented by the two tallest bars in your histogram. (6 pts)
  # Don't cheat by looking at the paper! 
    # This hypothesis does not need to be correct - it only needs to be ecologically rational based these two figures.


# One evolutionary process that would affect the growth rates of these uni cellular organisms would be natural selection
# for example if a type of bacteria would consume theses organisms at about 150,000 seconds it would be harder for them to gain enough energy to reproduce instead they need that energy to survive.
# The unicellular organisms would have a better chance at reproducing (mainly) prior to but can still reproduce better afterwards.







