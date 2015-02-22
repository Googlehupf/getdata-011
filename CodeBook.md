---
title: "Coursera getdata-011 Course Project - Code book"
author: "Googlehupf"
date: "2015-02-22"
output: html_document
---

NOTE. File has two sections:

  - Section A: Script variables used in `run_analysis.R`.
  - Section B: File variables in script output `"tidy_HAR_means.txt"`.
  

#### Section A: Script variables

Variables are given in the order as they appear in the script.

`train`  
:   measurements, training set, read in from HAR file `"X_train.txt"`  
:   numeric colClasses
        
`train_activity`
:   activities, training set, read in from HAR file `"y_train.txt"`  
:   colClasses will be integer

`train_subjects`  
:   subject IDs, training set, read in from HAR file `"subject_train.txt"`  
:   colClasses will be integer

`training.set`  
:   combined dataframe `train_subjects`, `train_activity`, `train`
    
`test`  
:   measurements, test set, read in from HAR file `"X_test.txt"`  
:   numeric colClasses
        
`test_activity`  
:   activities, test set, read in from HAR file `"y_test.txt"`  
:   colClasses will be integer

`test_subjects`  
:   subject IDs, test set, read in from HAR file `"subject_test.txt"`  
:   colClasses will be integer

`test.set`  
:   combined dataframe `test_subjects`, `test_activity`, `test`

`complete.set`  
:   combined dataframe `training.set`, `test.set` (row bound)

`features`  
:   variable names, read in from HAR file `"features.txt"`  
:   list (rownames removed)

`m`  
:   vector with the indices of `features` containing string "mean"

`std`  
:   vector with the indices of `features` containing string "std"

`mstd`  
:   vector with the combined indices `m`, `std`

`cols.chosen`  
:   vector with the chosen column indices  
:   `1:2` for subject and activity columns  
:   `mstd` corrected for the first two columns

`data.chosen`  
:   dataframe of `complete.set` subset by `cols.chosen`

`tidy.HAR_means`  
:   dataframe of `data.chosen` summarised over _subject_ and _activity_  
:   with the mean for each variable



#### Section B: File variables

`subject`
:    subject ID, 1 to 30

`activity`
:    activity in plain text (LAYING, SITTING, STANDING, WALKING, WALKING\_DOWNSTAIRS, WALKING\_UPSTAIRS)

`tBodyAcc-mean()-X`
:    mean of the body acceleration signal, X axis 

`tBodyAcc-mean()-Y`   
:    mean of the body acceleration signal, Y axis

`tBodyAcc-mean()-Z`
:    mean of the body acceleration signal, Z axis

`tGravityAcc-mean()-X`
:    mean of the gravity acceleration signal, X axis

`tGravityAcc-mean()-Y`
:    mean of the gravity acceleration signal, Y axis

`tGravityAcc-mean()-Z`
:    mean of the gravity acceleration signal, Z axis

`tBodyAccJerk-mean()-X`  
:    mean of the body acceleration Jerk signal, X axis

`tBodyAccJerk-mean()-Y`
:    mean of the body acceleration Jerk signal, Y axis

`tBodyAccJerk-mean()-Z`
:    mean of the body acceleration Jerk signal, Z axis

`tBodyGyro-mean()-X`
:    mean of the body gyroscope signal, X axis

`tBodyGyro-mean()-Y`
:    mean of the body gyroscope signal, Y axis

`tBodyGyro-mean()-Z`
:    mean of the body gyroscope signal, Z axis

`tBodyGyroJerk-mean()-X`
:    mean of the body gyroscope Jerk signal, X axis

`tBodyGyroJerk-mean()-Y`
:    mean of the body gyroscope Jerk signal, Y axis

`tBodyGyroJerk-mean()-Z`
:    mean of the body gyroscope Jerk signal, Z axis

`tBodyAccMag-mean()`
:    mean of the body acceleration magnitude

`tGravityAccMag-mean()`
:    mean of the gravity acceleration magnitude

`tBodyAccJerkMag-mean()`
:    mean of the body acceleration Jerk magnitude

`tBodyGyroMag-mean()`
:    mean of the body gyroscope magnitude

`tBodyGyroJerkMag-mean()`
:    mean of the body gyroscope Jerk magnitude

`fBodyAcc-mean()-X`
:    mean of the body acceleration signal, Fast Fourier Transform (FFT), X axis

`fBodyAcc-mean()-Y`
:    mean of the body acceleration signal, Fast Fourier Transform (FFT), Y axis

`fBodyAcc-mean()-Z`
:    mean of the body acceleration signal, Fast Fourier Transform (FFT), Z axis

`fBodyAcc-meanFreq()-X`
:    mean frequency of the body acceleration signal, X axis

`fBodyAcc-meanFreq()-Y`
:    mean frequency of the body acceleration signal, Y axis

`fBodyAcc-meanFreq()-Z`
:    mean frequency of the body acceleration signal, Z axis

`fBodyAccJerk-mean()-X`
:    mean of the body acceleration Jerk signal, Fast Fourier Transform (FFT), X axis

`fBodyAccJerk-mean()-Y`
:    mean of the body acceleration Jerk signal, Fast Fourier Transform (FFT), Y axis

`fBodyAccJerk-mean()-Z`
:    mean of the body acceleration Jerk signal, Fast Fourier Transform (FFT), Z axis

`fBodyAccJerk-meanFreq()-X`
:    mean frequency of the body acceleration Jerk signal, X axis

`fBodyAccJerk-meanFreq()-Y`
:    mean frequency of the body acceleration Jerk signal, Y axis

`fBodyAccJerk-meanFreq()-Z`
:    mean frequency of the body acceleration Jerk signal, Z axis

`fBodyGyro-mean()-X`
:    mean of the body gyroscope signal, Fast Fourier Transform (FFT), X axis

`fBodyGyro-mean()-Y`
:    mean of the body gyroscope signal, Fast Fourier Transform (FFT), Y axis

`fBodyGyro-mean()-Z`
:    mean of the body gyroscope signal, Fast Fourier Transform (FFT), Z axis

`fBodyGyro-meanFreq()-X`
:    mean frequency of the body gyroscope signal, X axis

`fBodyGyro-meanFreq()-Y`
:    mean frequency of the body gyroscope signal, Y axis

`fBodyGyro-meanFreq()-Z`
:    mean frequency of the body gyroscope signal, Z axis

`fBodyAccMag-mean()`
:    mean of the body acceleration magnitude, Fast Fourier Transform (FFT)

`fBodyAccMag-meanFreq()`
:    mean frequency of the body acceleration magnitude, Fast Fourier Transform (FFT)

`fBodyBodyAccJerkMag-mean()`
:    mean of the body acceleration Jerk magnitude, Fast Fourier Transform (FFT)

`fBodyBodyAccJerkMag-meanFreq()`
:    mean frequency of the body acceleration Jerk magnitude, Fast Fourier Transform (FFT)

`fBodyBodyGyroMag-mean()`
:    mean of the body gyroscope magnitude, Fast Fourier Transform (FFT)

`fBodyBodyGyroMag-meanFreq()`
:    mean frequency of the body gyroscope magnitude, Fast Fourier Transform (FFT)

`fBodyBodyGyroJerkMag-mean()`
:    mean of the body gyroscope Jerk magnitude, Fast Fourier Transform (FFT)

`fBodyBodyGyroJerkMag-meanFreq()`
:    mean frequency of the body gyroscope Jerk magnitude, Fast Fourier Transform (FFT)

`tBodyAcc-std()-X`
:    standard deviation of the body acceleration signal, X axis

`tBodyAcc-std()-Y`
:    standard deviation of the body acceleration signal, Y axis

`tBodyAcc-std()-Z`
:    standard deviation of the body acceleration signal, Z axis

`tGravityAcc-std()-X`
:    standard deviation of the gravity acceleration signal, X axis

`tGravityAcc-std()-Y`
:    standard deviation of the gravity acceleration signal, Y axis

`tGravityAcc-std()-Z`
:    standard deviation of the gravity acceleration signal, Z axis

`tBodyAccJerk-std()-X`
:    standard deviation of the body acceleration Jerk signal, X axis

`tBodyAccJerk-std()-Y`
:    standard deviation of the body acceleration Jerk signal, Y axis

`tBodyAccJerk-std()-Z`
:    standard deviation of the body acceleration Jerk signal, Z axis

`tBodyGyro-std()-X`
:    standard deviation of the body gyroscope signal, X axis

`tBodyGyro-std()-Y`
:    standard deviation of the body gyroscope signal, Y axis

`tBodyGyro-std()-Z`
:    standard deviation of the body gyroscope signal, Z axis

`tBodyGyroJerk-std()-X`
:    standard deviation of the body gyroscope Jerk signal, X axis

`tBodyGyroJerk-std()-Y`
:    standard deviation of the body gyroscope Jerk signal, Y axis

`tBodyGyroJerk-std()-Z`
:    standard deviation of the body gyroscope Jerk signal, Z axis

`tBodyAccMag-std()`
:    standard deviation of the body acceleration magnitude

`tGravityAccMag-std()` 
:    standard deviation of the gravity accerlation magnitude

`tBodyAccJerkMag-std()`
:    standard deviation of the body acceleration Jerk magnitude

`tBodyGyroMag-std()`
:    standard deviation of the body gyroscope magnitude

`tBodyGyroJerkMag-std()`
:    standard deviation of the body gyroscope Jerk magnitude

`fBodyAcc-std()-X`
:    standard deviation of the body acceleration signal, Fast Fourier Transform (FFT), X axis

`fBodyAcc-std()-Y`
:    standard deviation of the body acceleration signal, Fast Fourier Transform (FFT), Y axis

`fBodyAcc-std()-Z`
:    standard deviation of the body acceleration signal, Fast Fourier Transform (FFT), Z axis

`fBodyAccJerk-std()-X`
:    standard deviation of the body acceleration Jerk signal, Fast Fourier Transform (FFT), X axis

`fBodyAccJerk-std()-Y`
:    standard deviation of the body acceleration Jerk signal, Fast Fourier Transform (FFT), Y axis

`fBodyAccJerk-std()-Z`
:    standard deviation of the body acceleration Jerk signal, Fast Fourier Transform (FFT), Z axis

`fBodyGyro-std()-X`
:    standard deviation of the body gyroscope signal, Fast Fourier Transform (FFT), X axis

`fBodyGyro-std()-Y`
:    standard deviation of the body gyroscope signal, Fast Fourier Transform (FFT), Y axis

`fBodyGyro-std()-Z`
:    standard deviation of the body gyroscope signal, Fast Fourier Transform (FFT), Z axis

`fBodyAccMag-std()`
:    standard deviation of the body acceleration magnitude, Fast Fourier Transform (FFT)

`fBodyBodyAccJerkMag-std()`
:    standard deviation of the body acceleration Jerk magnitude, Fast Fourier Transform (FFT)

`fBodyBodyGyroMag-std()`
:    standard deviation of the body gyroscope magnitude, Fast Fourier Transform (FFT)

`fBodyBodyGyroJerkMag-std()`
:    standard deviation of the body gyroscope Jerk magnitude, Fast Fourier Transform (FFT)

