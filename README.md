###Getting and Cleaning Data Course Project

####Project Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here you can find the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

####The task which had te be performed:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


####The repository contains the following files:

* run_analysis.R  the script for creating the tidy data set from step 1 to step 5
* README.MD       this file
* CodeBook.md     detailed information about the data in the tidy data set

__You can create the tidy data set this way:__
1. uncompress the raw data (original data from UCI (link above)) in the working directory from R 
2. start the run_analysis.R script (source("run_analysis.R"))
3. in the working directory you are going to get a tidy data set with the means of each variable grouped by activity and subject

__The script requires the following packages tu run properly:__  

* library(plyr)
* library(dplyr)
* library(data.table)

__The following files from the raw data are used to fullfill the steps 1 to 5:__  

file  | Content
------------- | -------------
features.txt  | descriptive labels for every feature (561 names)
activity_labels.txt  | descriptive labels for the activities
features.txt      |      descriptive labels for every feature (561 names with 7352 rows)
activity_labels.txt|     descriptive labels for the activities
subject_train.txt  |     subject id from the person from the training data
x_train.txt         |    training data set (561 features)
y_train.txt          |   activity_id for every row for the training data
subject_test.txt      |  subject id from the person from the test data
x_test.txt             | test data set (561 features with 2947 rows)
y_test.txt              |activity_id for every row for the test data


__The script "run_analysis.R" performs the steps listed here:__  
1. Read the preceding files from the original data set.  
2. Clean up the column names from "features.txt" and remove the hyphen and parentheses and replace them with an underscore for avoiding trouble with the naming conventions in R.  
3. Subsetting the data set with the grep function and select only columns which are the mean or the standard deviation.  
4. Bind the subject_id and activity_id to the respective test and training data set.  
5. Merge the train and test data sets to one big data set.  
6. Replace the activity_id with a descriptive name.
7. Create a data frame (data_mean) containing the average of every feature grouped by the subject_id and activity.
8. Write the tidy data frame to a file called "Project_Data.txt"