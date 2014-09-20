Coursera - Getting and Cleaning Data Course Project - CodeBook

This file describes the variables, the data, and any transformations or work that has been  performed to clean up the data and get the desired resuts

Data Set

-"Human Activity Recognition Using Smartphones Data Set"
-URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Steps to transform and clean the data in run_analysis.R script

- Read and merge the training & test data sets from the training files (X_train.txt, y_train.txt & subject_train.txt) and test files (X_test.txt, y_test.txt and subject_test.txt) in the 'data' folder to generate a 10299x563 data frame in 'mergedDataSet'
- Read the 'features.txt' file from the "/data" folder and store the data in a 'features' variable.
- Clean the column names of 'features', for example "remove the '-' symbols in the names, make the first letter of "mean" and "std" a capital letter "M" and "S"
- Extract the measurements on the mean and standard deviation only. This results in a 66 indices list 'meanStdCols'.
- Add 'subject' & 'activity' columns to 'meanStdCols' and remove the rest of columns from the 'mergedDataSet' to obtain 'finalMergedData'
- Read the 'activity_labels.txt' file from the "./data"" folder and replace each of the activity variables in the 'finalMergedData' wth the corresponding activity names
- Generate an independent tidy data set "tidyDataSet" with the average of each measurement for each activity and each subject. With 30 unique subjects and 6 unique activities the resultant dimensions of the "tidyDataSet" should be 180x68.
- Write the result out to a 'tidyDataSet.txt' file and store it under current working directory

