###################################
####### Section 1: comments #######
###################################

#Hello! This is an R script. An R script is a simple text document that contains a list of commands you want to run in R. You can send the lines of code in this script to R one by one, or you can run all of the lines at once. Today, we will send the lines to R one by one. 

#Lines that begin with the hash tag symbol (#) are comments, which means R will ignore this line when you run your script. 
#Comments are an essential part of an R script. They remind you and your collaborators what your code does.
#When you write code, make sure to include comments. There is no limit to the number of comments un a script. Go nuts!

#What makes a line of code into a comment?

#This is not a comment
#This is a comment

#What's the difference? Figure it out, then go back and make both lines into a comments.

#One last note: you can also use comments to divide your script into sections!

#########################################################
####### Section 2: Running commands from a script #######
#########################################################
#In this section, you will run some commands from this R script. Commands tell R to do somehting, then R will do that thing, and usually give you an output. 
#Below is a command
getwd()

#What does it look like in the script? How can you tell it's a command?
#Now run the command.
#How did you run the command? What was the output?
# I put it in the console, the output was my working directory 
# In RStudio, what are the threee main ways that you can run a command (line of code) from your script in the console?
    #1: With your cursor on the line in your script that you want to run, hit command-return 
    #2: With your cursor on the line in your script that you want to run, hit the run button in the upper right corner of the script pane 
    #3: Copy paste the line of code into the console
    # (NOTE: you can run multiple lines with any of these techniques by first highlighting the multiple lines)

#Try running the command above using all three approaches

#The output from the command tells you your current working directory (what file you are "in" on your computer).

#########################################################
####### Section 3: Saving a script ######################
#########################################################
#To save your R script, you can choose "File > Save" from the top menu on your screen, or click on the small disk icon at the top left of the Rscript pane in RStudio. 
#When you save your script, it will end with .R, for example myscript.R 
#This tell your computer that this is an R script file. (Just as a file ending in .docx is a Wrd document) 
#Your R script will be saved in the file you saw in the getwd() command above (unless you chose another spot). Try opening that folder on your computer and see if your R script is there.

#########################################################
####### Section 4: Basic R commands a script ############
#########################################################
#Now that you know how to save and run commands from an R script, we will cover some basic commands that you will use with R. 
#Later in today's activity, you will use R to calculate alpha diversity values for some sample data. 

#Data is stored in R can be similar to an excel spreadsheet. In a spreadsheet, there are rows (horizontal) and columns (vertical). 
#By default, Excel will show you an infinite number of rows and columns in a spreadsheet. Keep scrolling and  it will keep showing you more rows.
#Like excel, R stores data in rows and coulmns. Unlike Excel, you need to decide how many rows and columns you want. Don't stress about choosing the right number, you can always add more later. 

#In R, data with rows and coumns is called a matrix or a data.frame. We will use both in this class.
# we can use the command matrix() to make a new matrix. We will add additional informaiton inside the parentheses to tell R what we want in our matrix. 
#Run the following command:
matrix(c(1,2,3,4,5,6,7,8,9,10), ncol=5, byrow=TRUE)

#What did R output? Talk with your neighbor, lab partner or instructor.
# a 2x5 matrix

#In the command above, there were three elements within the parenthesis, each separated by a comma:
# A list of numbers, separated by commas: c(1,2,3,4,5,6,7,8,9,10)
# We told R how many columns we wanted: ncol=5
# We told R to fill up the matrix by rows: byrow=TRUE

#Each of the elements inside the parenthsis is called an argument. Different commads have different arguments. A single command can have many arguments, but usually there are only a few required to run the command.

#You may have noticed that for our list of numbers, we used the c() command. Try looking up the help information for c() by running the following command:
?c()

#What is the offical name of this command? 
# c [base] or Combine Values into a Vector or List
#To stay simple, we will call it combine (or sometimes concatenate).
#We used this command to tell R that this is a list of numbers. In R, you can run commands within commands. 

#Great, we now have a command to make a matrix. Next, we can save this matrix so that we dont have to remake it constanly. You can save your data in R and give it a name all at one time. To do this, we use the <- symbol. This creates a variable that stores your data and names that variable whatever you choose. We will name our variable "otu.table" (Variable names can't include spaces, so use a period instead)

otu.table <- matrix(c(1,2,3,4,5,6,7,8,9,10),ncol=5,byrow=TRUE)

# Now our matrix is saved to the varibale we just created. You will create, delete, and modify many variables while using R. 
#To see our matrix, we just type the name of the variable. 

otu.table

#In R, you can name the rows and columns in a data table.
#The commands rownames() and colnames() are used to see current names and add new names. Let's look at our otu.table. run the following two commands:
colnames(otu.table)
rownames(otu.table)

#The output from those commands was NULL because we didn't give any names to our rows or columns. We can fix that now.
#We assign new names to the rows and columns using the same <- symbol we used before. Use that and the colnames()/rownames() command to set a list of words as the names:

colnames(otu.table) <- c("OTU1","OTU2","OTU3","OTU4","OTU5")
rownames(otu.table) <- c("SampleA","SampleB")



#notice how we have to put the words in quotation makes. This is so that R recognizes that they are characters/words, not variable names
#Let's look at our table again, now with row and column names:
otu.table

#########################################################
####### Section 5: Selecting data form a matrix ############
#########################################################
#Sometimes we want to select just some of the data in a matrix. To do this, we can use the name of the matrix, followed by square brackets []
#Inside the square brackets, you tell R which row and column you want to choose. (The order will always be row, then column)
#For example to choose that data in row two, coulmn three, we would use the command:
otu.table[2,3]

#Does that output match with what you expected? 

#If we leave the rows or columns blank, R selects all of the rows or columns. For example, to see row one, all of the columns, we would use the command 
otu.table[1,]

#We can also select a range of rows/columns using a colon. To select row one, columns three through five, we would use the command 
otu.table[1,3:5]

#lastly, to select a list of columns, we can use... a list of numbers :) To select row two, columns one, three, and five, we would use the command:
otu.table[2, c(1,3,5)]

#Try writing a command that selects columns two and four from all of the rows:
otu.table[,c(2,4)]


#########################################################
####### Section 6: Doing simple math in R  ############
#########################################################
#R is good at storing and selecting data, but you can also you is to do calculations. 
#All of the basic mathematical symbols for in R:
#Addition: +
1+2
#Subtraction: -
1-2
#Multiplication: *
1*2
#And division: /
1/2

#We can also use commands to do some calculations. For example, the sum() commands will add up whatever input you put into the parentheses.
sum(otu.table)

#We can combine commands to select specific data and then do calculations on only that data. For example, to find the sum of all the columns in row 2, we use:
sum(otu.table[2,])


#Try writing a command that calulates the sum of columns one and five in row two. 
sum(otu.table[2,c(1,5)])



