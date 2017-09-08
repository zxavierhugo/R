#---------------TITANIC PROJECT-----------------------

# When the Titanic sank, 1502 of the 2224 passengers and crew got killed. One of the main reasons for this high level of casualties was the lack of lifeboats on this supposedly unsinkable ship.

#Those that have seen the movie know that some individuals were more likely to survive the sinking (lucky Rose) than others (poor Jack). In this course you wil apply machine learning techniques to predict a passenger's chance of surviving using R.

#Let's start with loading in the training and testing set into your R environment. You will use the training set to build your model, and the test set to validate it. The data is stored on the web as CSV files; their URLs are already available as character strings in the sample code. You can load this data with the read.csv() function.

# Import the training set: train
train_url <- "http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/train.csv"
train <- read.csv(train_url)

# Import the testing set: test
test_url <- "http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/test.csv"
test <- read.csv(test_url)

# Print train and test to the console
test
train

#How many people in your training set survived the disaster with the Titanic? To see this, you can use the table() command in combination with the $-operator to select a single column of a data frame:
  
# absolute numbers
#table(train$Survived) 

# proportions
#prop.table(table(train$Survived))
#If you run these commands in the console, you'll see that 549 individuals died (62%) and 342 survived (38%). A simple prediction heuristic could thus be "majority wins": you predict every unseen observation to not survive.

#In general, the table() command can help you to explore which variables have predictive value. For example, maybe gender could play a role as well? For a two-way comparison, also including gender, you can use

#table(train$Sex, train$Survived)
#To get proportions, you can again wrap prop.table() around table(), but you'll have to specify whether you want row-wise or column-wise proportions: This is done by setting the second argument of prop.table(), called margin, to 1 or 2, respectively.

#------------------Instructions
#Call table() on train$Survived to calculate the survival rates in absolute numbers.
#Calculate the survival rates as proportions by wrapping prop.table() around the previous table() call.
#Do a two-way comparison on the number of males and females that survived, in absolute numbers. Again, use the train data frame.
#Convert the numbers to row-wise proportions.

?str
#Compactly Display the Structure of an Arbitrary R Object and alternative to the summary

str(train)
summary(train) #less compact than str()
str(test)
summary(test)

# Survival rates in absolute numbers
table(train$Survived)

# Survival rates in proportions
prop.table(table(train$Survived))

# Two-way comparison: Sex and Survived
table(train$Sex, train$Survived)

# Two-way comparison: row-wise proportions. To find out the proportion of each gender who survived or was dead. If you use margin = 2, you are using column-wise proportion
# calculate the proportion of each gender who survived or dead. For this case, there were 81 female survivors and 233 dead females. So, what is the proportion of female who survived? 233/(81+233)= 0.74 <- row-wise proportion
prop.table(table(train$Sex, train$Survived), 1)  

#---Part 3-----

#In one of the previous exercises you discovered that in your training set, females had over a 50% chance of surviving and males had less than a 50% chance of surviving. Hence, you could use this information for your first prediction: all females in the test set survive and all males in the test set die.

#You use your test set for validating your predictions. You might have seen that, contrary to the training set, the test set has no Survived column. You add such a column using your predicted values. Next, when uploading your results, Kaggle will use this column (= your predictions) to score your performance.

#We already prepared a data frame test_one for you, that is a copy of the test variable.

# Copy of test
test_one <- test

# Initialize a Survived column to 0
test_one$Survived <- 0

# Set Survived to 1 if Sex equals "female"
test_one$Survived[test_one$Sex == "female"] <- 1 


#----Part 4 ----
#Another variable that could influence survival is age: it's probable children were saved first. You can test this by creating a new column with a categorical variable child.

#To add this new variable you need to do two things:

#Create a new column, which is done through the $ operator. To create a new column, lucky, for example:

#train$lucky <- NA
#Provide the values for each observation (i.e., row) based on the age of the passenger. You can use a boolean test inside square brackets for this. For example, to set the lucky column to TRUE for passengers that survived the disaster, and the others to FALSE, you could use:

#train$lucky[train$Survived == 1] <- TRUE
#train$lucky[train$Survived == 0] <- FALSE

# Create the column child, and indicate whether child or no child
#Finish the code on the right to create a new column Child whose default value is NA, whose value is 1 if the passenger's Age is < 18 years and whose value is 0 when the passenger's Age is >= 18 years.

train$Child <- NA
train$Child[train$Age < 18] <- 1
train$Child[train$Age >= 18] <- 0

# Two-way comparison in row-wise proportion
prop.table(table(train$Child, train$Survived),1)

#----Part 5 -------

#Inside rpart, there is therpart() function to build your first decision tree. The function takes multiple arguments:

#formula: specifying variable of interest, and the variables used for prediction (e.g. formula = Survived ~ Sex + Age).
#data: The data set to build the decision tree (here train).
#method: Type of prediction you want. We want to predict a categorical variable, so classification: method = "class".

#Your call could look like this:

#  my_tree <- rpart(Survived ~ Sex + Age,
#                   data = train,
#                   method ="class")

#To visualize the resulting tree, you can use the plot(my_tree) and text(my_tree). The resutling graphs will not be that informative, but R has packages to make it all fancier: rattle, rpart.plot, and RColorBrewer.

library(rpart)


# Build the decision tree
my_tree_two <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = train, method = "class")

# Visualize the decision tree using plot() and text()
plot(my_tree_two)
text(my_tree_two)

# Load in the packages to build a fancy plot
install.packages("RGtk2", depen=T) #problem of loading this package
library(RGtk2) #can't load this package
install.packages("rattle")
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Time to plot your fancy tree
fancyRpartPlot(my_tree_two) #cannot execute

#-----Part 6 ------

#To send a submission to Kaggle you need to predict the survival rates for the observations in the test set. In the previous chapter we created rather amateuristic predictions with manual subsetting operations. Now that we have a decision tree, we can make use of the predict() function to "generate" our answer:
  
#  predict(my_tree_two, test, type = "class")
#Here, my_tree_two is the tree model you've just built, test is the data set to build the preditions for, and type = "class" specifies that you want to classify observations.

#Before you can submit to Kaggle, you'll have to convert your predictions to a CSV file with exactly 418 entries and 2 columns PassengerId and Survived. Head over to the instructions to get to it!
  
# my_tree_two and test are available in the workspace

# Make predictions on the test set
my_prediction <- predict(my_tree_two, newdata = test, type = "class")

# Finish the data.frame() call
my_solution <- data.frame(PassengerId = test$PassengerId, Survived = my_prediction)

# Use nrow() on my_solution
nrow(my_solution)

# Finish the write.csv() call
write.csv(my_solution, file = "my_solution.csv", row.names = FALSE)  



