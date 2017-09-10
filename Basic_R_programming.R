# Basic R programming tutorial

#Now, let's create a small collection of numbers called a vector. Any object that contains data is called a data structure and numeric vectors are the simplest type of data structure in R. In fact, even a single number is considered a vector of length one.

#The easiest way to create a vector is with the c() function, which stands for 'concatenate' or 'combine'. To create a vector containing the numbers 1.1, 9, and 3.14, type c(1.1, 9, 3.14). Try it now and store the result in a variable called z.

z <- c(1.1, 9, 3.14)
z

#You can combine vectors to make a new vector. Create a new vector that contains z, 555, then z again in that order. Don't assign this vector to a new variable, so that we can just see the result immediately.

c(z, 555, z)

#Enter z * 2 + 100, without assigning the result to a variable. The `*` symbol is used for multiplication and shares a key with the number 8 on many keyboards. First, R multiplied each of the three elements in z by 2. Then it added 100 to each element to get the result you see below.

z*2+1000

# When given two vectors of the same length, R simply performs the specified arithmetic operation(`+`, `-`, `*`, etc.) element-by-element. If the vectors are of different lengths, R 'recycles' the shorter vector until it is the same length as the longer vector. When we did z * 2 + 100 in our earlier example, z was a vector of length 3, but technically 2 and 100 are each vectors of length 1. Behind the scenes, R is 'recycling' the 2 to make a vector of 2s and the 100 to make a vector of 100s. In other words, when you ask R to compute z * 2 + 100, what it really computes is this: z* c(2, 2, 2) + c(100, 100, 100).

# How to remove the object from the workspace
y <- 2* pi
rm(y)
y

# Mode function is to give you the type of input: numneric, character, etc..

mode(my_div)
mode(my_sqrt)
mode(x)
mode(z)
y <- c("Everyone", "loves", "R")
mode(y)

# Basic Statistics: mean(), median(), sd(), var(), cor(x,y), cov(x,y)
# Creating sequence - seq(), rep()

1:5
seq(from=1, to=5, by = 2) # to create a sequwnce with an increase by 2.
rep(1, times = 5) #to create a series of repeated values


# Comparing vectors using == !=, >, <, etc and give you the Boolean value.

w<-c(3, pi, 4)
v <- c(pi, pi, pi)
w == v # FALSE TRUE FALSE

# Selecting vector elements -- use xxx[0] with square bracket

z[2]
my_sqrt[4]
my_div[2:4]
my_div[-(2:4)] #exclude the element from stated position and print the remaining elements
my_div <2.8 #provide TRUE/FALSE answer if less than that stated value.

years <- c(1960, 1964, 1976, 1994)
names(years) <- c("Adrian" ,"Betty", "Charles", "Donald")
years # to print out the two rows of elements
?name() #A ???name??? (also known as a ???symbol???) is a way to refer to R objects by name (rather than the value of the object, if any, bound to that name).
years["Adrian"] # can refer to individual elements but not more than 1 element in the list
years[c("Adrian", "Betty")] # Need to put in c() in order to return the correct values. If not, return error -- years["Adrian, "Betty] <- error

b <- c(10,20,30,40,50,60,70,80,90)
b[3]
b[1:4]
b[c(5,6,7)]
b[5:7]
b[c(5,6,7)] == b[5:7] # both can be used to identify the elements based on the position value
b[c(5,2,6)] #advantage of using c() is to return any value from different orders


# Basic introduction to Data Structures

# Array id a multidimenstional vector and vectors and arrays are stored the same way internally. But the array may be displayed differently and accessed differently. 

d <- array(c(1,2,3,4,5,6,7,8,9,10,11,12), dim=c(3,4)) # arrange the elements from down to right
d
d[3,4]

# Another way to make the matrix 

e <- matrix(data=c(1,2,3,4,5,6,7,8,9,10,11,12), nrow = 3, ncol = 4)
e
e[1:2, 1:2]
e[1,]
e[,1]
e[1:2,]
e[c(1,2,3),]
e[c(1,3),] 

# Array can be expressed in 2 dimensions
f <- array(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18), dim=c(3,3,2))
f
f[1,2,2]

# Lists could construct more complicated structues with multiple data types. 

g <- list(thing = "hat", size = "7.34")
g # The output is $thing = "hot" and $size = 7.34

g$thing #to retrieve the value that refers to "thing"

# Dataframe is a list that contains multople named vectors that are the same length A data frame looks like a spreadsheet or database table. 

teams <- c("Phi", "Nym", "Fla", "Atl", "Wsn")
w <- c(91, 88, 23, 54, 29)
l <- c(23, 56 ,78, 98, 60)
nleast <- data.frame(teams, w, l)
nleast
nleast$l
nleast$teams == "Fla"
