# Look at the plot and model results for our Dryad data in the tutorial. Part 1: Without knowing which points represent which groups, 
  # give one explanation for why these data might be difficult to draw spatial inferences about genes.(3 points)
  # Part 2: Despite the drawbacks, give the result or interpretation that you feel most confident in (3 points), and EXPLAIN WHY (4 points).

# Part 1 The only way to understand the data points is to look at the direct lineage. The spatial difference does not play a factor because points can look further away in distance than others but in reality have a closer relationship.
# part 1 This is more of a flow chart and shows connections more so than shows the spatial relationships

# part 2 seq24 to seq16 and seq5 to seq16 are equally the furthest data points from one another. this is because each set of data points has a collective 10 point difference between one another. Where as the rest of the data can be connected in less than 10 points. 



# For your scripting assignment we will use the "ge_data" data frame found in the "stability" package.
  # Install the "stability" package, load it into your R environment, and use the data() function to load the "ge_data". (2 points)

install.packages('stability')

library('stability')

data('ge_data')




# Create two linear models for Yield Response: one related to the Environment and one to the Genotype. (2 points each)
  # 'Yield Response' in this dataset is a measure of phenotype expression.
  # Hint: Look at the help file for this dataset.

Tyler <- lm(ge_data$Yield ~ ge_data$Env)

Hauk <- lm(ge_data$Yield ~ ge_data$Gen)



# Test the significance of both models and look at the model summary. (3 points each)
  # Which model is a better fit to explain the yield response, and WHY? (6 points)
  # Hint: Does one model seem more likely to be over-fitted?

# Which environment would be your very WORST choice for generating a strong yield response? (2 points)


anova(Tyler) 


summary(Tyler) 
#r squared for Yield vs env is 0.4359 

anova(Hauk)


summary(Hauk)
#r squared for Yield vs gen is 0.1183  


  #the data with better fit would be the Yield to environmental because the R squared value is significantly higher  
  #The R squared value represents the line of best fit and shows which data plot is the best based on which points follow a better trend. 
  #This data shows that there is a lower R squared between the Yield and the genotype data compared to the significant higher R squared value between the Yield and the Env. showing that the env follows a better trend line. 


#Sargodha has the highest Pr value at 0.7138 and is a noticeable difference between the other data points. The higher the Pr value the higher the variation between points.







