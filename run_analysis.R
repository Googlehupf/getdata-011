## COURSERA GETTING AND CLEANING DATA (2015, getdata-011)
## COURSE PROJECT

## submitted by: Googlehupf

## ....................................................................
## PREREQUISITES:
## - SAMSUNG DATA FOLDER (UCI_HAR_DATASET) MUST BE IN WORKING DIRECTORY
## ....................................................................
## This script is accompanied by
## - README.md
## - CodeBook.md
## ....................................................................
## DATA SOURCE:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## [retrieved 2015-02-02]


## Step 1: Read and form the training set -----
## reading data
train <- read.table(file = "UCI_HAR_Dataset/train/X_train.txt", header = FALSE, fileEncoding = "UTF-8", colClasses = "numeric")
train_activity <- read.table(file = "UCI_HAR_Dataset/train/y_train.txt", header = FALSE)
train_subjects <- read.table(file = "UCI_HAR_Dataset/train/subject_train.txt", header = FALSE)
## complete training.set
training.set <- data.frame(train_subjects, train_activity, train)
## clean up train source data
rm(train, train_activity, train_subjects)


## Step 2: Read and form the test set -----
## reading data
test <- read.table(file = "UCI_HAR_Dataset/test/X_test.txt", header = FALSE, fileEncoding = "UTF-8", colClasses = "numeric")
test_activity <- read.table(file = "UCI_HAR_Dataset/test/y_test.txt", header = FALSE)
test_subjects <- read.table(file = "UCI_HAR_Dataset/test/subject_test.txt", header = FALSE)
## complete test.set
test.set <- data.frame(test_subjects, test_activity, test)
## clean up test source data
rm(test, test_activity, test_subjects)


## Step 3: Append test.set to training.set -----
names(training.set) = names(test.set)  ## make sure the names match
complete.set <- rbind(training.set, test.set)
## clean up intermediaries
rm(training.set, test.set)


## Step 4: Subset the complete.set to mean() and std() variables ----
features <- read.table("UCI_HAR_Dataset/features.txt", header = FALSE, colClasses = "character")
features <- as.list(features$V2)  ## lose rownames
m <- grep("mean", features)
std <- grep("std", features)
mstd <- c(m, std)
cols.chosen <- c(1:2, mstd + 2)  ## subjects are in column 1, activities in 2, mstd corrected accordingly
data.chosen <- complete.set[, cols.chosen]
## clean up the complete set
rm(complete.set)


## Step 5: Set variable names -----
colnames(data.chosen)[1] <- "subject"  ## subjects are in column 1
colnames(data.chosen)[2] <- "activity"  ## activities are in 2
colnames(data.chosen)[3:81] <- features[mstd]
## replace activity codes with activities in clear text
data.chosen$activity[data.chosen$activity == 1] <- "WALKING"
data.chosen$activity[data.chosen$activity == 2] <- "WALKING_UPSTAIRS"
data.chosen$activity[data.chosen$activity == 3] <- "WALKING_DOWNSTAIRS"
data.chosen$activity[data.chosen$activity == 4] <- "SITTING"
data.chosen$activity[data.chosen$activity == 5] <- "STANDING"
data.chosen$activity[data.chosen$activity == 6] <- "LAYING"
## clean up intermediaries
rm(features, m, std, mstd, cols.chosen)


## Step 6: Build and write the tidy dataset -----
##         with average for each variable for each activity and each subject
library(dplyr)
## using dplyr's piping and summarise_each() functionality
tidy.HAR_means <- data.chosen %>%
                        group_by(subject, activity) %>%
                        summarise_each(funs(mean))
## write to file
write.table(tidy.HAR_means, file = "tidy_HAR_means.txt", fileEncoding = "UTF-8", row.names = FALSE)
## clean up
rm(data.chosen)
detach("package:dplyr")
