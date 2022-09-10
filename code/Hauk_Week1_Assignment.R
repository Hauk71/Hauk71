# Now it is time to create your own data frame using the tools we have learned this week.
# First, resave this script as: your last name_Week1_Assignment
  # e.g. mine would be Wilson_Week1_Assignemnt


# Create 3 numeric vectors and 2 character vectors that are each 15 values in length with the following structures:
  # One character vector with all unique values
  # One character vector with exactly 3 unique values
  # One numeric vector with all unique values
  # One numeric vector with some repeated values (number of your choosing)
  # One numeric vector with some decimal values (of your choosing)

# Bind the vectors into a single data frame, rename the columns, and make the character vector with unique values the row names.

# Remove the character vector with unique values from the data frame.

# Add 1 row with unique numeric values to the data frame.

# Export the data frame as a .csv file 

# Generate summary statistics of your data frame and copy them as text into your script under a new section heading.

# Push your script and your .csv file to GitHub in a new "Week1" folder.

#### one numeric with all unique values
X <- c(4,8,9,7,10,53,11,67,74,72,74567,456,5,1,14)
typeof(X)
# one numeric with some repeated values
Y <- c(36,42,57,77,24,56,77,33,43,47,78,12,45,36,1)
typeof(Y)
# one numeric with some decimal values
Z <- c(36777,4848,3862,192.34,387.34,37.45,267.5,23,245,34,78,15,3,66,24)
typeof(Z)

# one character with all unique values
W <- c('A','B','C','D','L','F','G','H','I','e','J','t','K','z','q')
# one character with exactly 3 unique values
V <- c('w','a','w','a','a','w','b','w','b','w','b','b','a','b','a')

# binds the data to a single data frame
data <- cbind(V,W,X,Y,Z,ZZ) #What is ZZ?? this is not in your script and it breaks the rest of your code.
data
# reconfigure to allow numeric values
df <- as.data.frame(data)
df

#renaming column names
colnames(df) <- c("one","two","three","four","five",'six') #Too many names - make sure you are paying attention to the errors in the console.
df

#renaming the row
row.names(df) <- df$two
df

#deleting a column
df[,-2]#this only prints the data frame without that column, it does not create a new object.

#add one row
ZZ <- c(53,765,8552,852,95,71,83,64,5810,2,56,25,12,76,32) #this is a column
#repeat by adding into the data from above

####summary of the data
summary(df) #summary should have numeric values for the numeric columns.

#export data frame to csv file
df <- data.frame('one' = c('w','a','w','a','a','w','b','w','b','w','b','b','a','b','a'), 'three' = c(4,8,9,7,10,53,11,67,74,72,74567,456,5,1,14), 'four' = c(36,42,57,77,24,56,77,33,43,47,78,12,45,36,1), 'five' = c(36777,4848,3862,192.34,387.34,37.45,267.5,23,245,34,78,15,3,66,24), 'six' = c(53,765,8552,852,95,71,83,64,5810,2,56,25,12,76,32)) #what is this? Not how you shold be doing this.
print(df)
write.csv(df,C:\\Users\\Documents\\GitHub\\R4Eco_2022\\week1) #you need quotes around the file path, also wrong location.


# one                two               three               four               five               six           
#Length:15          Length:15          Length:15          Length:15          Length:15          Length:15         
#Class :character   Class :character   Class :character   Class :character   Class :character   Class :character  
#Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character 