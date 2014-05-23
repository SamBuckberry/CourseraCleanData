install.packages("reshape2")
library(reshape2)

# Download the data
download.file(
        url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        file="UCI_HAR_Dataset.zip", method="curl")

# Extract the downloaded data
unzip(zipfile="UCI_HAR_Dataset.zip")

## Part 1. 
## Merges the training and the test sets to create one data set

# Read and merge data, subject and activity files
subject <- do.call("rbind",
                lapply(c("UCI HAR Dataset/test/subject_test.txt", 
                         "UCI HAR Dataset/train/subject_train.txt"),
                                FUN=function(x){read.table(x)}))

activity <- do.call("rbind",
                lapply(c("UCI HAR Dataset/test/y_test.txt", 
                         "UCI HAR Dataset/train/y_train.txt"),
                                FUN=function(x){read.table(x)}))

dataset <- do.call("rbind",
                   lapply(c("UCI HAR Dataset/test/X_test.txt",
                            "UCI HAR Dataset/train/X_train.txt"),
                          FUN=function(x){read.table(x)}))

# Combine subject, activity and variables data into data.frame
dat <- data.frame(subject, activity, dataset)

# Add column names for subject, activity and dataset variables
features <- t(read.table("UCI HAR Dataset/features.txt"))
colnames(dat) <- c("subject", "activity", features[2, ])

# Clean up
rm(subject, activity, dataset, features)

## Part 2.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive activity names. 

# Set patterns to match column names against and select columns
toMatch<- c("mean\\(\\)","std\\(\\)", "subject", "activity")
datMeanSd <- subset(dat, select= grep(paste(toMatch, collapse="|"), names(dat)))

#Add activity names to to dataset in place of integer keys
actLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Replace activity key with activity name
datMeanSd$activity <- actLabels$V2[match(datMeanSd$activity, actLabels$V1)]

# clean up
rm(toMatch, actLabels)

## Part 3. 
## Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject. 

# melt the data into subject-activity dataframe
meltData <- melt(datMeanSd, id.vars= c("subject", "activity"))
tidySubjectMeans <- dcast(meltData, subject + activity ~ variable, mean)

# write data to csv file
write.table(x=tidySubjectMeans, file="tidySubjectMeans.csv", sep=",")

# clean up 
rm(meltData)



