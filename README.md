Readme
========================================================

This repo contains a script 'runAnalysis.R' that performs the functions for the project associated with Coursera 'Getting and Cleaning Data' course.

The analysis.R script will:

* Merge the training and test datasets
* Extract the mean and standard deviation for each variable for each subject and activity
* Create a 'tidy' dataset with the average for each variable for each activity for each subject
* Write a tab-seperated text file withy the 'tidy' dataset.

A details of the analysis are available in the codebood.md file in this repo. The runAnalysis.R scipt also has comments detailing each operation within the script

Note that the runAnalysis.R script requires that the "reshape2" package.
This package can easily be installed by running:
```
install.packages("reshape2")
```