# With the data frame you created last week you will:

# Create a barplot for one numeric column, grouped by the character vector with 3 unique values
  # Add error bars with mean and standard deviation to the plot
  # Change the x and y labels and add a title
  # Export the plot as a PDF that is 4 inches wide and 7 inches tall.

# Create a scatter plot between two of your numeric columns.
  # Change the point shape and color to something NOT used in the example.
  # Change the x and y labels and add a title
  # Export the plot as a JPEG by using the "Export" button in the plotting pane.

# Upload both plots with the script used to create them to GitHub.
  # Follow the same file naming format as last week for the script.
  # Name plots as Lastname_barplot or Lastname_scatterplot. Save them to your "plots" folder.


#data from previous week
X <- c(4,8,9,7,10,53,11,67,74,72,747,456,5,1,14)
Y <- c(36,42,57,77,24,56,77,33,43,47,78,12,45,36,1)
Z <- c(367,488,362,192.34,387.34,37.45,267.5,23,245,34,78,15,3,66,24)
W <- c('A','B','C','D','L','F','G','H','I','e','J','t','K','z','q')
V <- c('w','a','w','a','a','w','b','w','b','w','b','b','a','b','a')

#Combine vector into data frame 
df <- as.data.frame(cbind(X,Y,Z,W,V))
df

df$X <- as.numeric(as.character(df$X))
df$Y <- as.numeric(as.character(df$Y))
df$Z <- as.numeric(as.character(df$Z))


#Create rows
add.row <- data.frame("X","Y",'Z','W','V')

#Match the names of the columns
colnames(add.row) <- colnames(df)

#Bind rows
df1 <- rbind(df, add.row)

#Move row names and Delete columns
row.names(df1) <- df1$W
df1 <- df1[,-4]
df1

#adding error bars
arrows(b.plot, df.mean$Mean-df.sd$StanDev,
       b.plot, df.mean$Mean+df.sd$StanDev,angle=90,code=3)



#Box plots 
boxplot(df)

#combine into groups 
df.mean <- aggregate(df$'Y' ~df$'V', FUN = "mean")
df.mean

#give column names
colnames(df.mean) <- c("Factor","Mean")
df.mean

#plotting the mean values
barplot(df.mean$Mean)

#giving an x axis 
barplot(df.mean$Mean, names.arg = df.mean$Factor)

#adding standard deviation 
df.sd <- aggregate(df$'Y' ~df$'V', FUN = "sd")

#naming columns
colnames(df.sd) <- c("Factor","StanDev")
df.sd

barplot(df.mean$Mean, names.arg = df.mean$Factor,  ylim = c(0,60), xlab = 'Explanatory', ylab= 'response', main = "example")

#error bars
arrows(b.plot, df.mean$Mean-df.sd$StanDev,
      b.plot, df.mean$Mean+df.sd$StanDev,angle=90,code=3)


#scatter plot 
plot(df1$Z ~ df1$Y),

plot(df1$Z ~ df1$X),

plot(df1$Z ~ df1$X, xlab = "Independent", ylab = "Dependent")

plot(df1$Z ~ df1$X, xlab = "Independent", ylab = "Dependent", main = "R for Ecology")

plot(df1$Z ~ df1$X, xlab = "Independent", ylab = "Dependent", main = "R for Ecology", 
     cex.axis=0.8, cex.main = 0.5, cex.lab = 1.25, pch=56)

plot(df1$Z ~ df1$X, xlab = "Independent", ylab = "Dependent", main = "R for Ecology", 
     cex.axis=0.8, cex.main = 0.5, cex.lab = 1.25, pch=56, col = 'orchid4')



setwd("C:/GitHub/Hauk71/code")








