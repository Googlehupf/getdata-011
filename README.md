---
title: "Coursera getdata-011 Course Project - README"
author: "Googlehupf"
date: "2015-02-22"
output: html_document
---

The script `run_analysis.R` will write a tidy dataset `tidy_HAR_means.txt` to your working directory. It reads in both the training and the test set from the [Human Activity Recognition data set (HAR)](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and combines it into one complete set of measurements. The tidy set contains the average of all measurements on the mean and the standard deviation for each variable, each activity and each subject. In addition, a dataframe `tidy.HAR_means` will be available in your workspace.


## Prerequisites
The Samsung Data Folder `(UCI_HAR_DATASET)` must be in your active working directory.

You should have access to the `CodeBook.md` file.


## Running the script
Load `run_analysis.R` into R and run it, either line by line or in one take.

Once completed, you will have

  - a file `tidy_HAR_means.txt` in your active working directory;
  - an R object `tidy.HAR_means` in your R workspace.


## HAR data set: a brief recap
The HAR data set contains data on N = 30 subjects performing six different activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

Measurements were taken on 561 variables (denominated in the HAR file `"features.txt"`; explained in the HAR file `"features_info.txt"`).

The collected data were separated into a training set and a test set. Table 1 gives the general idea.

*Table 1. HAR original data, training set, and test set overview.*

| original data    | training set     | test set         |
|:-----------------|:-----------------|:-----------------|
| 561 measurements | 561 measurements | 561 measurements |
| 6 activities     | 6 activities     | 6 activities     |
| 30 subjects      | 21 subjects      | 9 subjects       |
| 10299 obs.       | 7352 obs.        | 2947 obs.        |

The data on measurements, the corresponding activities and the corresponding subjects were stored in three distinct files for both training and test set.


## Script explanation
The script `run_analysis.R` processes in six steps.

### Step 1: Read and form the training set
As stated, the HAR training set data is distributed over three files:

  1. `"X_train.txt"`, with the measurements,
  2. `"y_train.txt"`, with the activities measured,
  3. `"subject_train.txt"`, with the subject ID.

In step 1, all three files are read and combined to one data frame (subject, activity, measurements). The combined data are kept, and the source data are removed to economise on working memory.

### Step 2: Read and form the test set
The HAR test set data is also distributed over three files:

  1. `"X_test.txt"`, with the measurements,
  2. `"y_test.txt"`, with the activities measured,
  3. `"subject_test.txt"`, with the subject ID.
  
As before, it is being combined to one data frame and the source data then removed.
  
### Step 3: Append test.set to training.set
`training.set` (from step 1) and `test.set` (from step 2) are merged using `rbind()`.

The resulting `complete.set` is kept, the former sets are removed to economise on working memory.

### Step 4: Subset the complete.set to mean() and std() variables
As required, only the measurements on the mean and standard deviation for each measurement are needed.

A vector is created with the indices of all columns with mean or standard deviation measurements. This is done by reading in `"features.txt"` and looking up the strings "mean" and "std" in the variable names. All mean() and std() variables as well as meanFreq() (frequency means) from the original dataset will be included.

The resulting vector, with 79 variables in total, is corrected for the first two columns (subjects and activities), and the newly corrected vector of length 81 is then used to subset `complete.set` to a new data frame `data.chosen` which holds the data on subjects, activity, and the 79 variables with mean or standard deviation measurements.

`complete.set` is removed to economise on working memory.

### Step 5: Set variable names
Next, appropriate variable names are set.

This involves

  - labeling the first column (subjects) "subject",
  - labeling the second column (activities) "activity",
  - labeling the 79 columns with mean and standard deviation measurements with their informative names taken from `"features.txt"`,
  - substituting the activity code numbers 1 to 6 with plain text according to the HAR file `"activity_labels.txt"`.
  
Intermediaries are removed to economise on working memory.
  
### Step 6: Build and write the tidy dataset
The final tidy dataset is formed by employing the `dplyr` package. 

Using dplyr's piping and `summarise_each()`functionality, `data.chosen` is grouped by first subject, then activity, and the mean calculated over all 79 mean and std variables.

The result is assigned to a dataframe `tidy.HAR_means`, which is also written to a file `"tidy_HAR_means.txt"` using `write.table()`, rownames omitted.

Finally, `data.chosen` is removed to economise on working memory, and dplyr is unloaded from the workspace.
