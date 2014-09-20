# 1. Merges the training and the test sets to create one data set.

# Training Data set

trainingDataSet <- read.csv("./data/train/X_train.txt", sep="", header=FALSE)
trainingDataSet[,562] <- read.csv("./data/train/y_train.txt", sep="", header=FALSE)
trainingDataSet[,563] <- read.csv("./data/train/subject_train.txt", sep="", header=FALSE)

# Test Data set
testDataSet <- read.csv("./data/test/X_test.txt", sep="", header=FALSE)
testDataSet[,562] <- read.csv("./data/test/y_test.txt", sep="", header=FALSE)
testDataSet[,563] <- read.csv("./data/test/subject_test.txt", sep="", header=FALSE)

# Merge Training & Test Data Sets
mergedDataSet <- rbind(trainingDataSet, testDataSet)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.csv("./data/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])

# Only Mean & Std Columns
meanStdCols <- grep("Mean\\(\\)|Std\\(\\)", features[, 2])

# Add the Mean and StD columns along with 'activity' & 'subject' columns
reqdCols <- c(meanStdCols, 562, 563)

# Remove unwanted columns from the previously merged data set
finalMergedData <- mergedDataSet[, reqdCols]

# 4. Appropriately labels the data set with descriptive variable names.

# In the final merged data set, replace column names with Mean & Std column names w/o "()" from features and add 'activity' & 'subject' as column names for the last two columns 
colnames(finalMergedData) <- c(gsub("\\(\\)", "", features[meanStdCols, 2]),"activity","subject")

# 3. Uses descriptive activity names to name the activities in the data set

activityLabels = read.csv("./data/activity_labels.txt", sep="", header=FALSE)
currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
        finalMergedData$activity <- gsub(currentActivity, currentActivityLabel, finalMergedData$activity)
        currentActivity <- currentActivity + 1
}


# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

finalMergedData$activity <- as.factor(finalMergedData$activity)
finalMergedData$subject <- as.factor(finalMergedData$subject)

dt <- data.table(finalMergedData)
tidyDataSet <- dt[,lapply(.SD,mean),by="activity,subject"]
write.table(tidyDataSet,file="tidyDataSet.txt",sep=",",row.names = FALSE)

