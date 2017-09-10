# Tutorial 2
# Learning how to retrieve the files using R programming

getwd()
ls() # to list all the objects in your local workspace using ls(). If you create a new vector, it will appear in your outcome

list.files() # to list all the files in your working directory
dir() # same as above.

# Using the args() function on a function name is also a handy way to see what arguments a function can take.

args(list.files) # Output ==> function (path = ".", pattern = NULL, all.files = FALSE, full.names = FALSE, recursive = FALSE, ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE) NULL

#Assign the value of the current working directory to a variable called "old.dir".
old.dir <- getwd()

# Use dir.create() to create a directory in the current working directory called "testdir".
dir.create("testdir")

#Set your working directory to "testdir" with the setwd() command.
setwd("testdir")

#Create a file in your working directory called "mytest.R" using the file.create() function.
file.create("mytest.R") # TRUE
list.files() # to find any new files created.

#Check to see if "mytest.R" exists in the working directory using the file.exists() function.
file.exists("mytest.R") # [1] TRUE

# Access information about the file "mytest.R" by using file.info().
file.info("mytest.R") 
#size isdir mode               mtime               ctime               atime uid gid 
# mytest.R    0 FALSE  644 2017-09-10 18:23:15 2017-09-10 18:23:15 2017-09-10 18:23:15 501  20 
# uname grname 
# mytest.R adrian  staff

# Change the name of the file "mytest.R" to "mytest2.R" by using file.rename().
file.rename("mytest.R", "mytest2.R") #[1] TRUE

#Make a copy of "mytest2.R" called "mytest3.R" using file.copy().
file.copy("mytest2.R", "mytest3.R") #[1] TRUE

#Create a directory in the current working directory called "testdir2" and a subdirectory for it called "testdir3", all in one command by using dir.create() and file.path().
dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE) # created the new subdirectory in the current directory testdir2.

