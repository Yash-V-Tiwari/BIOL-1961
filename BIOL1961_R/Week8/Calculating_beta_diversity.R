#Last class, we came up with some R code to calculate Alpha diversity metrics for some example  data.
#Today, you will try a bigger challenge: calulating the Bray Curtis diversity metric between three samples. 

#First, let's make the a new OTU table (from today's presentation):
otutable2 <- matrix(c(10,10,10,10,10,46,1,1,1,1,10,20,20,0,0),ncol=5,byrow=TRUE)
colnames(otutable2) <- c("OTU1","OTU2","OTU3","OTU4","OTU5")
rownames(otutable2) <- c("Sample1","Sample2", "Sample3")

otutable2 #look at the OTU table

# Now let's calculate the Bray Curtic Value for Sample 1 vs. Sample 2

#To review the Bray Curtis formula, see https://docs.google.com/presentation/d/1HkSyTWEJaw5rMtbHlsk9c575-fbnm3nOC35fEI5howw/edit#slide=id.p8

#Fill in the commands below that accomplich the tasks described:

###### Part I:
#First, subtract the first row of the otu table from the second row:

dif <- otutable2[2,] - otutable2[1,]

#Now take the absoulte value of that difference using the abs() command:

dif <- abs(dif)

#Now take the sum of all those values:

sumDif <- sum(dif)

###### Part II
#Now we build the denominator of the equation. Add the first row of the otu table from the second row:

#Now take the sum of all those values:

sumRows <- sum(otutable2[2,] + otutable2[1,])


###### Part III: 
#Divide your Part I by your Part II:


#Subtract the whole thing from one:


#Assign the result to a variable called BC_Sample1.2 

BC_Sample1.2 = 1 - (sumDif/sumRows)


#Check the value of your new variable


##### Part IV:
#Now modify your code to calculate the Bray Curtis value for Sample 1 vs. Sample 3
BC_Sample1.3 = 1 - (sum(abs(otutable2[3,] - otutable2[1,]))/sum(otutable2[3,] + otutable2[1,]))


#Now modify your code to calculate the Bray Curtis value for Sample 2 vs. Sample 3
BC_Sample2.3 = 1 - (sum(abs(otutable2[3,] - otutable2[2,]))/sum(otutable2[3,] + otutable2[2,]))


#Which samples are most similar?? Most different?
#Samples 1 and 3 are the most similar and samples 2 and 3 are the most different  

#Lastly, let's do a quick check. Modify your code to calculate the Bray Curtis value for Sample 1 vs. Sample 1
BC_Sample1.1 = 1 - (sum(abs(otutable2[1,] - otutable2[1,]))/sum(otutable2[1,] + otutable2[1,]))

#What value to you expect to get? Is this what you get? 
#I expect to get 1 as this would show that they are perfectly similar 


