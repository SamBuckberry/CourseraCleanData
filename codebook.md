Codebook
========================================================

### Obtaining the raw data

The raw data were downloaded and extracted into the working directory for this analysis were downloaded using the following link and method:
```
# Download the data
download.file
(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="UCI_HAR_Dataset.zip", method="curl")

# Extract the downloaded data
unzip(zipfile="UCI_HAR_Dataset.zip")
```

### The data files used
The following files are used in the runAnalysis.R script:

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* 'train/subject_train.txt' and 'test/subject_test': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

### Variable information

#### Variables created within the script

Part 1
* subject: merged subject id's for training and test datasets

* activity: merged activity identifiers for training and test datasets

* dataset: merged data variables for training and test datasets

* dat: a data frame with measurements for all variables for all activities and subjects

Part 2
* toMatch: a character vector of text patterns to match against for selecting columns for the 'tidy' dataset. This excludes the selection of columns with the 'meanFreq' variable as  these columns did not have the associated standard deviation data associated with the other 'mean()' columns. 

* actLabels: The activity names corresponding to the activity identifiers in variable 'activity'

* datMeanSd: A tidy dataset containing the mean and sd columns for each subject and activity in a data frame. 

* datMeanSd: A 'tidy' data.frame that contains the mean and standard deviation for each measurement.

Part 3
* meltData: A data.frame which contains datMeanSd data which was 'melted' in the 'subject' and 'activity' variables.

* tidySubjectMeans: A data.frame containing the mean for each variable for each activity and each subject.

#### Variables used in the datasets
The 'features.txt' file contains a complete list of the variables (561) which includes summary statisitcs (mean, standard deviation) for the variables. 

The subject variable identifies the subject who performed the activity for each variable. The activity variable identifies the activity being performed when the data variables were collected.

Column names for data.frames dat, datMeanSd, tidySubjectMeans correspond to the labels in the 'features.txt' file. These variables are explained in detail in the 'features_info.txt' file.

### Steps in creating the tidy dataset

The runAnalysis.R script:

* Merges the training and test datasets into one data.frame using rbind.
* Extracts the mean and standard deviation data for each variable using grep.
* Adds descriptive activity names in place of the activity codes.
* Calculates the mean for each mean and standard deviation variable for each activity and each subject using melt and dcast. 
* Writes a 'tidy' dataset to a tab-seperated text file named "tidySubjectMeans.txt".
