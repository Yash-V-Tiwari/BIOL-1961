####Goals for this activity
#Import data from a .txt, .tsv, or .csv file
#make a taxa plot
  #Convert to relative abundance
  #I need to decide: ggplot2 or base graphics? probably ggplot2
#find help in R
#find help using an external resource

#This R script will be turned in as part of the post lab assignment


#Before getting started, we will make a sample OTU table for this exercise
otu.table <- matrix(c(2,0,5,1,4,10,9,3,4,12,10,2),nrow=3,byrow=TRUE)
otu.table
colnames(otu.table) <- c("Sample1","Sample2","Sample3","Sample4")
rownames(otu.table) <- c("OTU_A","OTU_B","OTU_C")
otu.table

##############################################################
#   Part I: Make a table of relative abundances #
##############################################################
#Pre-question: In your own words, how would you calculate the relative abundance of an OTU in a sample? Calculate the relative abundance as a proportion (a decimal betweeen zero and one). Answer in a comment below.
#

#Write commands that will accomplish each action described in the comments

#Select all of the rows in the fist column

otu.table[,1]


#find the total number of OTU counts in Sample 1
OTU_Counts_Sample_1 <- sum(otu.table[,1])

#make a new variable called relative.otu.table and assign the original otu.table to that variable

relative.otu.table <- otu.table


#divide the first column of otu.table by the sum of the first column

otu.table[,1] / OTU_Counts_Sample_1

#repeat that command, but assign it to the first column of relative.otu.table

relative.otu.table[,1] <- (otu.table[,1] / OTU_Counts_Sample_1)

#Write three more commands to convert Samples 2 through 4 into relative abundance and store themin the propoer column of relative.otu.table

relative.otu.table[,2] <- (otu.table[,2] / sum(otu.table[,2]))
relative.otu.table[,3] <- (otu.table[,3] / sum(otu.table[,3]))
relative.otu.table[,4] <- (otu.table[,4] / sum(otu.table[,4]))

#In your own workds, describe how you could check to see if a sample has been converted to relative abundance

# You can mannually check by calculating it by hand as there are 12 values. The sum of all rows should be equivalent to one

#Write a command to do that. Repeat for all the samples. 

print(sum(relative.otu.table[,1]))
print(sum(relative.otu.table[,2]))
print(sum(relative.otu.table[,3]))
print(sum(relative.otu.table[,4]))

#Now, use the command round() with the input relative.otu.table and the option digits=2 to round all of the decimals in your table to two decimal places. Store that in relative.otu.table

relative.otu.table <- round(relative.otu.table, digits = 2)

#For this sample data, we know the names of the OTUs and want to change the row names to match that. Change the row names in your relativde otu table to (in order) "Bacteroides_fragilis", "Bacteroides_ovatis", and "Bacteroides_ovatis"

rownames(relative.otu.table) <- c("Bacteroides_fragilis", "Bacteroides_ovatis", "Bacteroides_ovatis")

#It looks like two of the OTUs were the same species. Sometimes that happens during OTU picking, but we don't want them to be separate rows in our final table. To fix this, we need to combine rows two and three into a single row. We will do this step by step.

#Add the second row of your relative otu table to the the third row

relative.otu.table[2,] + relative.otu.table[3,]

#repreat the command, but assign the result to the second row of your relative OTU table

relative.otu.table[2,] <- relative.otu.table[2,] + relative.otu.table[3,]

#Great, the second row now contains the combined data. but we need to get rid of the third row, since it still contains some of the old data. 
#Select all of the columns from your relative otu table and just the first through second rows.Assign that to a new variable called collapsed.relative.otu.table Tip:try using tab complete to type relative.otu.table in your command.

collapsed.relative.otu.table <- relative.otu.table[(1:2),]

#Let's learn a new way to select data from a matrix. It's called "negative indexing" and instead of telling R what rows and columns you want, you tell R which ones you don't wan't. To use negative indexing, choose the row or column to delete by its number, and put a negative sign in front of the number.
#Try it out by selecting all the columns in relative.otu.table but drop the third row. (Don't assign it to anything)

relative.otu.table[-3,]

#Negative indexing also works for ranges. selecting all the columns in relative.otu.table but drop the first through second rows. Make sure to put the rangd in parenthesis (Don't assign it to anything)

relative.otu.table[-(1:2),]


##############################################################
#   Part II: graphing with ggplot2 #
##############################################################

# ggplot2 is  package (a set of commands written by a user and made available 
# to the R community) that is not immediately accessible to you when you open 
# RStudio.  Once you have it, though, you will gain access to a rich array of 
# interesting functions for plotting data. We will use this package to create 
# our figures. There is also a built in set of R commands for making figures, 
# called “base graphics”, but we will focus on ggplot2 for now. To get started 
# with ggplot2, you will complete a series of online tutorials and practice some 
# commands using a program within R (called a package) named swirl
#(Fun fact: The gg stands for Grammar of Graphics)

#Using swirl to practice ggplot2
#We will begin by using an interactive course in the swirl package 
#(within R Studio) to expose you to some of the basic concepts in using R.  
#These short tutorials will also allow you to practice with some of the commands 
#you will need to analyze your data in R. Instead of running commands from a
#script, swirl has you directly enter commands into the R console. 
#It's a good way to practice R, but remember that for our analyses outside of 
#swirl, we will always worte and run commands from a script.

#First, you’ll need to install the swirl package.  
#If you’re using one of the lab MacBooks, someone may have already 
#installed swirl.  In RStudio, look at the File System pane 
#(the lower-right pane, which has tabs for Files, Plots, Packages, etc.  
#Click on the Packages tab, and scroll through the list to see if 
#swirl is there.  If so, you do not need to install swirl.

#If you do need to install swirl on a lab MacBook, or are using your 
#own computer, there are two ways to install swirl.  
#The first method is by typing the following command into the console:

install.packages("swirl")

#This might display some dialogue boxes. 
#Continue through as you would for any installation.  
#The second method is to go to the lower-right pane in RStudio and click the 
#Packages tab.  Next, click on the Install button.  A window will pop up.  
#Inside the packages field, type swirl and then press enter or click install.  
#The command above will be automatically sent to the console, and the same 
#operation is run.

#Now you’re ready to run swirl.  Load the package using the library function.
library("swirl")

###################
#Intro to ggplot2
#Install the ggplot2 package either using the code below or the Install button 
#in the Packages tab in the pane on the right.  

install.packages("ggplot2")

#To learn more about ggplot2, read segments 2.1, 2.2, and 2.7 of the tutorial 
#located here: http://varianceexplained.org/RData/code/code_lesson2/ 
#(You will have to scroll down to find segment 7)

#Write the commands you use during each segment below:

# 2.1:
library("ggplot2")
data("diamonds")
View(diamonds)

# 2.2:
ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point()
ggplot(diamonds, aes(x=carat, y=price, color=color)) + geom_point()
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point()
ggplot(diamonds, aes(x=carat, y=price, color=clarity, size=cut)) + geom_point()
ggplot(diamonds, aes(x=carat, y=price, color=clarity, shape=cut)) + geom_point()
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth()
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(se=FALSE)
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(se=FALSE, method="lm")
ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point() + geom_smooth(se=FALSE)
ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_smooth(se=FALSE)

# 2.7:
ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
p = ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
ggsave(filename="diamonds.png", p)
ggsave(filename="diamonds.pdf", p)
ggsave(filename="diamonds.jpeg", p)
help(ggsave)
ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
ggsave("diamonds.png")

#For each segment, there is also a swirl quiz you must complete. 
#You can find information about loading and taking the swirl quizzes 
#at http://varianceexplained.org/RData/quizzes/

#These lessons are also available as videos:
#  Segment 1: http://varianceexplained.org/RData/lessons/lesson2/segment1/
#  Segment 2: http://varianceexplained.org/RData/lessons/lesson2/segment2/
#  Segment 7: http://varianceexplained.org/RData/lessons/lesson2/segment7/
  
#  If you watch the videos in lab, remember to use headphones!
  


###################
#Making a taxa summary with ggplot2
#To make a plot of the data, you’ll first need to tell R that you intend to use ggplot2.  
#You therefore have to call the library function.
library(ggplot2)

#Now you’re ready to make your taxa summary plot! 
#Fisrt, we need to put our data into a format that ggplot2 will recognize. 
#Instead of organizing out data in a matrix, we will use another type of data 
#structure called a "data frame". In R, data frames are very similar to 
#matricies but more flexible. In a matrix, all of the entries must be the same 
#type of data (numbers, character strings, TRUE/FALSE logical values). 
#Recall that our collapsed relative OTU tables contain only unmeric data. 
#In a data frame, you can mix and match different types of data. So some entries 
#can be numeric, but other entries might contain words (character strings). 
#This will be very useful for our plotting!

#To make a data frame, we will use the command data.frame() When you use that 
#sommand, you can add columns of data by assigning a some data to a column name 
#within the command. 
#Make a data frame with a single column called Numbers that contains the number 
#one through four and assign it to a variable named practice.df. 
#Good habit: Use the c() command around your series of numbers.


#You can assign multiple columns in data.frame() by separating them with a 
#comma. MAke the same data fram as above, but add a second column called 
#More.numbers that contains the numbers five through eight and assign that to 
#practice.df.
practice.df <- data.frame(Numbers = c(1, 2, 3, 4))
practice.df <- data.frame(
  Numbers = c(1, 2, 3, 4),
  More.numbers = c(5, 6, 7, 8)
)
print(practice.df)


#now we will use our OTU data to make a table that we can use with ggplot2. Look at the command below, run it and look at the what is saved in relative.otu.table.df. Then answer the questions below. (Note how a command can span multiple lines)
relative.otu.table.df <- data.frame(Sample=c(1:4,1:4),
                     Abundance=c(relative.otu.table[1,],relative.otu.table[2,]),
                     Taxa=c("Bacteroides_fragilis","Bacteroides_fragilis","Bacteroides_fragilis","Bacteroides_fragilis","Bacteroides_ovatis","Bacteroides_ovatis","Bacteroides_ovatis","Bacteroides_ovatis"))

#How many columns are in this data frame? Answer below
# Three 


#What are the values in the Sample column? How did the command get the numbers 
#to repeat? Answer below
# 1, 2, 3, 4, 1, 2, 3, 4
# The comand got the numbers to repeat because two arrays of 1 to 4 were combined


#Why are the names of the OTUs in quotation marks? Answer below
# They are strings


#Look at row 5 of the data frame. Write out a sentence using the information in this row.
# The relative abundance of Bacteroides_ovatis is 0.8.


#Now we will use that table with ggplot2 to make a stacked bar plot for ur taxa summary

ggplot(relative.otu.table.df,aes(x=Sample,y=Abundance,fill=Taxa))+geom_bar(stat="identity")

#ggplot2 commands are built from different parts within the ggplot() command. 
#Find the part of the command above that matches each description below:

#the source of the data: 
#relative.otu.table.df

#x axis data: 
#x=Sample

#y axis data:
#y=Abundance

#geom type:
#geom_bar(stat="identity")

#For more informaiton on building ggplot2 commands, 
#look at the official ggplot2 help page: https://ggplot2.tidyverse.org/reference/


#Use the commands that you learned in the ggplot2 tutorial, 
#segment 2.7 to save your graph. Make sure to include your name in the file name. 
#You will turn in this plot with your post lab. Write the commands below:
ggsave(filename = "taxa_summary_Yash_Tiwari.png", plot = last_plot())

##############################################################
#   Part III: finding help within R #
##############################################################
#Look back at the script from Part I of this activity. How do you access the help within R?
#help(), or click the help tab

#In this course, the lab manuals and in-class activities provide the basic tools 
#you need to work with data in R. However, there will be times when you want to 
#go beyond what you already know, can’t find what you need in the course materials, 
#or just want a new perspective on how to do something. In those cases, there is 
#a wide variety of help available online. For a computational researcher, 
#it is vital to learn to use those resources, search with an effective query, 
#and identify websites that you find helpful. Stopping your coding to search the 
#internet for an answer is a time-honored tradition in computational biology.

#In this exercise, you will find resources online and use them to solve a 
#new problem using R. Once you find what is helpful to you, keep that resource 
#and use it throughout the semester! It’s often the quickest way to solve a 
#problem you encounter using R.

#You have three data files that you want to merge into a single file. 
#To do this, you will need to load all three files into R, 
#combine them into a single data frame and then manipulate the contents of the data frame.

#You know that you want to use one or more of the following commands:
  
merge()

combine()

data.frame()
  
#Find an online resource to help you with this task. List the name of the resource, 
#a link to the page you used at this resource, 
#and list the things you like and didnt like about this resource. 
#There are many resources listed here: 
#https://canvas.umn.edu/courses/92217/pages/extra-practice-and-r-resources?module_item_id=2051645
#https://stackoverflow.com/questions/15291613/merge-3-data-frames-by-column-names
# The suggestion from stackoverflow is to use merge or merge_recurse
# I like stackoverflow because I have used it in the past

#Find a second online resource to help you with this task. 
#Again, list the name of the resource, a link to the page you used at this resource, 
#and list the things you liked more or less about this resource compared to the first one. 
#https://stats.stackexchange.com/questions/14332/efficient-way-to-merge-multiple-dataframes-in-r
# The suggestion from them is to use rbind if all the data is numerical
# This site is just like stackoverflow. 

#Which command would you use to combine the files into a single data.frame? Why?
#merge() as it does a database join on common columns 

