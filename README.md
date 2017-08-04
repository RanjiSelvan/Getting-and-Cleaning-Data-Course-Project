# Getting-and-Cleaning-Data-Course-Project
Submission for Getting and Cleaning Data Course in Coursera

### Overview
This project demonstrates the collection and cleaning of data using R to obtain a tidy data set tha can be used for subsequent analysis.

The dataset being used is: [Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Project Summary
The following is a summary description of what is required from this project:

1. All individual files are merged to create one data set.
2. Only the measurements on the mean and standard deviation for each measurement are extracted. 
3. Descriptive activity names are used to name the activities in the data set.
4. Data set labelled appropriately with descriptive variable names.
5. A second, independent tidy data set with the average of each variable for each activity and each subject is created. 

### Files

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` contains all the code to perform the analyses described in the 5 steps above. They can be launched in RStudio by just importing the file.

`averages_data.txt` is the output text file.
