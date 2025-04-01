# Biol1961 - Fall 2018
# Computational Microbiology Project
# R Nuggets

#In the previous R script, you learned some basics about R, R commands and R scripts.
#Now, you will apply what you learned to calculate the Shannon index vallues (alpha diversity) for two samples of example data. 

# Week 8 - Alpha and Beta Diversity
#We will use the example data from today's powerpoint presentation. It has two samples and five OTUs.
otu.table <- matrix(c(10,10,10,10,10,46,1,1,1,1),ncol=5,byrow=TRUE)
otu.table
colnames(otu.table) <- c("OTU1","OTU2","OTU3","OTU4","OTU5")
rownames(otu.table) <- c("Sample1","Sample2")


#Now is your challenge: You must calulate the Shannon diversity for each of the two samples (rows)
# We will break this down into steps

#Write a command below to select just the data from sample 1

#Use the sum() command to find the total number of OTUs (organisms) in sample 1:

n <- sum(otu.table[1,])

# save the results of your command to a viariable named "n"

#Look at what is stored inside N. Does that match what you expect?

#yes

#Repeat the above four commands for sample two and save the total number of OTUs to a variable called N

N <- sum(otu.table[2,])


#########################################################

# Calculate the Shannon index for each sample
#Remember, the shannon index (notated H') is sum of the proportion of each OTU times the natural logarithm of the proportion of each OTU, all multiplied by negative one.
#Note: in R, log() is the natural logarithm

#To find the proportion of each OTU, We can divide the sample's row by the total OTUs (stored in the variable n from earlier)
temp1 <- (otu.table[1,]/n)

#now use the log() command to take the natural logarithm of the whole row of the whole row
temp2 <- log(otu.table[1,]/n)

#Multiply the two (put parenthesis around each)
temp <- temp1*temp2

#Use the sum() command to add up all the values
sum(temp) 

#Last, multiply all of that by negative one:
temp <- -1*temp

#Great! Now, use the same process to build up a command that finds the shannon index of sample two. Make sure to use N for sample two instead of n.

-1 * sum((otu.table[1,]/n)*log(otu.table[1,]/n))
-1 * sum((otu.table[2,]/N)*log(otu.table[2,]/N))
