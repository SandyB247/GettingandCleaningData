# GettingandCleaningData

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

You should create one R script called run_analysis.R that does the following:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Please upload the tidy data set created in step 5 of the instructions. 

Please upload your data set as a txt file created with write.table() using row.name=FALSE 
(do not cut and paste a dataset directly into the text box, as this may cause errors 
saving your submission).

**REPOSITORY STRUCTURE**
- directory/project_data contains all files needed for evaluation by run_analysis.R
- README.md, this file
- codebook.md, contains the description of variables produced by run_analysis.R
- run_analysis.R is the R Script that produces the tidyData.txt file
- tidyData.txt is the file generated by run_analysis.R, which contains the reshaped data set processed from /project_data

**RUNNING THE run_analysis.R SCRIPT**
1. Create a directory on your machine where you would like to clone the repository
2. Change directory into what you created in Step 1 above
3. Clone this repository: git clone https://github.com/SandyB247/GettingandCleaningData
4. Change directory into the GettingAndCleaningData directory
5. Start R from the command line
6. Source("run_analysis.R")

**HOW THE run_analysis.R SCRIPT WORKS**
Review the run_analysis.R script in the root of the cloned repository and the comments associated with it.


