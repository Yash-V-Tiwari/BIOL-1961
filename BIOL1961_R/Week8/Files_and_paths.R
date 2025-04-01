############################
####### Introduction #######
############################
#For today’s practice, you will continue to move away from using a computer with a graphical user interface (GUI, pronounced “gooey”) and start working with a computer using a command line interface. you will also learn how to save and open files using R commands. This is a big change for most people, so be prepared for some frustration. However, with the resources in this course and plenty of practice, you can become comfortable using the command line and use those skills to investigate and analyze some amazing biology. Good luck!

##############################################
##### What is a computer fundamentally? ######
##############################################
#When you think of a computer, you might think of a laptop, a desktop computer, a tablet or a smart phone with a touch screen. Those are all very sophisticated examples of a computer. We can also think of a much simpler version of a computer: a machine that takes input, does something to that input, and returns the newly transformed thing as output. For now, we won’t worry about what the computer does to transform the input. This can be a simple as a hand held calculator. You type in “2 x 2” (input), the calculator does something with that information, and returns “4” (output). As you know, R can also work as a simple calculator. Input "2*2" and R will output the answer "4"

#For computers in this class, you will usually give input as a simple text file. This can be a file that ends in .txt, csv, or sometimes has not file type at all at the end of its name. You have likely already input a .csv file into R to make graphs during the first six weeks of lab.

#Output also often comes as a text. The text can be sent to different places: printed directly onto your screen or sent into a file. In the case of your graphs in R, the output was the graph and you (likely) saved it to a file.


################################################
##### How are files stored in a computer? ######
################################################

#With all that output, you will need somewhere to save it. This semester, you will also use different text files as input for analyses. In both cases, you need to locate files on your computer. In the MacOS and Windows (graphical) operating systems, there are actual file icons that you click, then a window opens and you can see the files inside. Let’s explore some files. Choose a file on the desktop of your computer (or create a new one). Right-click or control click-on that file and choose "Get Info" or "Properties". On the menu that opens, look for the "Location" or "General > Where"  section. Type the informaiton in that area below:


#On you computer, files are stored in folders. There can also be folders within folders. So, if you go back far enough, there is always the orignal folder for a computer, known as the "root folder". Every file and folder on the cpmuter lives within this folder. On Mac, this is usually called "Macintosh HD". On Windows, this is usually called "C:". Can you find either of those folders in the address you typed above? If not, what is the name of the root folder on your computer?

#To visualize the files and folders on a computer, you can think of an inverted tree diagram (see https://drive.google.com/a/umn.edu/file/d/1YzQju963yyRlmKNtWZDiOO2o34_vQSFq/view?usp=sharing for reference). At the top is the root folder. Below that are all the files and folders within the root folder. And then within each folder are the files and folders within that one. You could map out your entire computer this way (though it would be an enourmous diagram).

#This same map is the basis for how we find files using a command line, such as R. Instead of a diagram, we can list the location of a file as an address, starting with the root folder. Each folder in the address is spearated by a slash (the / character). For example, the file named "Sample_file" in the folder "Desktop", in the folder "Your_name" in the folder "Users" would be at the following address:

# C:/Users/Your_name/Desktop/Sample_file (for Windows)
# /Users/Your_name/Desktop/Sample_file (For Mac. Mac omits the root "Macintosh HD" from the file address)

#Choose three folders or files on your computer and type their full address below:
#1.
#2.
#3.

#A quick note about vocabulary used in computational projects:
#The address for a file or folder is called the "file path"
#A folder is called a "directory"
#A file is still called a file
#A "file extenstion" is the a short (<6 letter) ending for a file name that comes after a period in the file name. It tells you (and the computer) what kind of file this is. For example, a text file ends in ".txt"
#

#################################
###### Working Directories #####
#################################

#In a graphical interface, when you click on a file, it opens a new window. Now you can see all the fils and foders within that folder. There is a simlar, but slighty modified idea used in the command line. At any given time, you are "in" a folder on your computer. This is called your "working directory" If you type a command to open a file or save a file, your computer will look in this folder.
#Open R and let's look at some files and locaitons. Run the following commands:

getwd()
#the above command gives you the file address (file path) you are currently "in" (working directory).
#You can move into a new working directory using the command setwd(), with the file path in the parenthesis. Make sure to put the file path in quotes ("file_path")
#use the setwd() to change your working directory to the folder that contains your current working directory (up one directory in computaitonal speak):
setwd("C:/Users/yashv/OneDrive/Documents/BIOL1961_R")

#now, write a command that takes you back to you original working directory:
setwd("C:/Users/yashv/OneDrive/Documents")

#For the above two commands, how would you check that they worked? Figure that out  and then repeat your caommands and checked that they worked at each step.
# You can use getwd() to check the current working directory

#Note: No matter what working direcotry you are in, you can always type the full file path of a folder/file to access that file.

########################################
##### Making a new folder #############
#######################################

#Let's say your are starting a new data analysis project and you want to make a new directory to store all of your data files, scripts, and results. You can do that from the command line in R!
# The dir.create() command makes a new direcotry inside your current working directory. You just need to include the name you choose for your new directory inside the parenthesis (and in quotes).

#While in your Desktop working directory, wroite a command to create a new directory named "My_directory" :

dir.create("My_directory")

#Now write a command to move into that new directory:

setwd("C:/Users/yashv/OneDrive/Documents/My_directory")

#Now write a command to move back to your Desktop directory

setwd("C:/Users/yashv/OneDrive/Documents")

#We can also ask R for a list of all the files and direcotries in the current working directory, using either the the list.files() command or the dir() command. Try it out while in your Desktop directory. Do you see the new file you created?

dir()

#######################
###### Conclusion #####
#######################

# After working through this activity, you should have a good start on learning:

#How and where files are stored on a computer
#What a working directory is on the command line
#How to change working directories using the R the command line
#How to make a new direcotry using the R command line
