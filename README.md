# Coursera-Getting-and-Cleaning-Data-Course-Project
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.

Contents on this repository:


## CODEBOOK.MD
Contains the explanation of the dataset generated variables


## run_analysis.R
Contains the R code that is in charge of generated the tidy dataset based on the following request:
1) Merges the training and the test sets to create one data set.  
2) Extracts only the measurements on the mean and standard deviation for each measurement.  
3) Uses descriptive activity names to name the activities in the data set  
4) Appropriately labels the data set with descriptive variable names.  
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  


## How to execute the run_analysis.R script
* Put the UCI HAR data folder in your R current working directory. If you don´t have this files download them from [here.](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)

* After adding the UCI HAR folder in your R working directory, source the run_analysis.R script by using R or R Studio and the script will do the rest. 

`source('run_analysis.R')`  
`[1] "Generating dataset file, please wait..."`  
`[1] "The new dataset file (tidySummary.txt) was generated successfully in your current working directory."`

If the folder is not present in your working directory you might an error similar than the following:

` [1] "A problem has occurred. The UCI HAR Dataset folder was not found in your current working directory /home/ds/Documents/Coursera Data Science/3 - Getting and Cleaning Data"`


## Details regarding the run_analysis.R code
The run_analysis.R script follows this workflow:

* Checks if the "UCI HAR Dataset" directory exists. If it doesn´t exist it shows a message
* Gets the labels for the features available in this experiment from "UCI HAR Dataset/features.txt"
* Starts generating the Test data from the "subject_test.txt", "y_test.txt" and "X_test.txt" files. This creates the tables that will end up being the *subject*, *activity* and *features* variables in the Test data. Finally, it selects the mean and standard deviation features only.
* Starts generating the Training data from the "subject_train.txt", "y_train.txt" and "X_train.txt" files. This creates the tables that will end up being the *subject*, *activity* and *features* variables in the Training data. Finally, it selects the mean and standard deviation features only.
* Combines the test and training data into a single data set
* Summarizes this data set by averaging each variable grouped by each activity and each subject
* Finally, it creates a file called tidySummary.txt with the resulting tidy dataset

