###Getting and Cleaning Data Codebook

Course Project January 2015 by Martin Wieck

####This document contains additional information about the variables and transformations needed in the course project from Getting and Cleaning Data.

You can find a full description of the source used in this project at  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The source data can be found here  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#####This part describes the output data from task 5 from the course project. For more information please read the README.md and features.txt files in the original dataset.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

Because in this task we only had to extract the features on the mean and standard deviation for each measurement, I only extract the measures containing "mean()" or "std()" by the grep function.

####Data Dictionary ("Project_Data.txt", 180 rows and 68 columns)

Name            Datatype    Values
activity        factor      "activity_labels.txt" (original Dataset)
subject_id      int         values from 1..30 (a number for each training/test person)

The features in the dataset are all numeric and are the calculated average from the original feature normalized and bounded within -1:+1 :

__The following table explains the abbreviations used in the feature variable names:__  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z direction  

Abbreviation | Explanation  
t            | time  

Abbreviation  | Explanation
------------- | -------------
t             | time         
f  | frequency
Body    |    Body-Signal  
Gravitiy |   Gravity-Signal  
Acc       |  Accelaration  
Gyro       | Gyroscope  
Mag         |Magnitude  
Jerk        |Jerk-Signal
mean | original feature mean
std | original feature standard deviation

__features__  (every feature has got a "mean" and "std" value)  

* tBodyAcc-XYZ
    + (e. g. tBodyAcc_mean_X, tBodyAcc_mean_Y, tBodyAcc_mean_Z, tBodyAcc_std_X, tBodyAcc_std_Y, tBodyAcc_std_Z )

* tGravityAcc-XYZ  
* tBodyAccJerk-XYZ  
* tBodyGyro-XYZ  
* tBodyGyroJerk-XYZ  
* tBodyAccMag  
* tGravityAccMag  
* tBodyAccJerkMag  
* tBodyGyroMag  
* tBodyGyroJerkMag  
* fBodyAcc-XYZ  
* fBodyAccJerk-XYZ  
* fBodyGyro-XYZ  
* fBodyAccMag  
* fBodyAccJerkMag  
* fBodyGyroMag  
* fBodyGyroJerkMag  


