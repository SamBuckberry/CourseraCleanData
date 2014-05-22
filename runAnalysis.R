# Download the data
download.file(
        url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        file="UCI_HAR_Dataset.zip", method="curl")

# Extract the downloaded data
unzip(zipfile="UCI_HAR_Dataset.zip")

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

features <- t(read.table("UCI HAR Dataset/features.txt")
colnames(dat) <- c("subject", "activity", features[2, ])

# Clean up
rm(subject, activity, dataset, features)


