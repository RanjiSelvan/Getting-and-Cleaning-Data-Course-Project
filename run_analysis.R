# STEP 0: Preparing Data
####################################################################################

# Set Working Directory that contains all necessary files
getwd()
setwd("C:/Users/ranji/Documents/Coursera/3. Getting and Cleaning Data/Assignment")
list.files()

# Read Data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

features <- read.table("features.txt", as.is = TRUE)

activities <- read.table("activity_labels.txt")
colnames(activities) <- c("oldlabel", "newlabel")


# STEP 1: Merge the training and the test sets to create one data set.
####################################################################################

# Merge data into one table
train_data <- cbind(subject_train, y_train, x_train)
test_data <- cbind(subject_test, y_test, x_test)
complete_data <- rbind(test_data, train_data)

# Change column names for "Subject" and "Y" variables 
colnames(complete_data) <- c("subject", "activity", features[, 2])


# STEP 2: Extract only the measurements on the mean and standard deviation for each 
# measurement
####################################################################################

keepcolumns <- grepl("subject|activity|mean|std", colnames(complete_data))
complete_data <- complete_data[, keepcolumns]


# STEP 3: Use descriptive activity names to name the activities in the data set
####################################################################################

complete_data$activity <- factor(complete_data$activity, 
                                 levels = activities$oldlabel, 
                                 labels = activities$newlabel)


# STEP 4: Appropriately label the data set with descriptive variable names
####################################################################################

# Extract all column names
columnheaders <- colnames(complete_data)

# Remove special characters and clean up names
columnheaders <- gsub("[\\(\\)-]", "", columnheaders)
columnheaders <- gsub("^f", "frequencyDomain", columnheaders)
columnheaders <- gsub("^t", "timeDomain", columnheaders)
columnheaders <- gsub("Acc", "Accelerometer", columnheaders)
columnheaders <- gsub("Gyro", "Gyroscope", columnheaders)
columnheaders <- gsub("Mag", "Magnitude", columnheaders)
columnheaders <- gsub("Freq", "Frequency", columnheaders)
columnheaders <- gsub("mean", "Mean", columnheaders)
columnheaders <- gsub("std", "StandardDeviation", columnheaders)
columnheaders <- gsub("BodyBody", "Body", columnheaders)

# Replace old headers with new headers
colnames(complete_data) <- columnheaders


# STEP 5: Create a second, independent tidy set with the average of each variable 
# for each activity and each subject
####################################################################################

# Find mean, grouped by subject and activity
Average <- complete_data %>% 
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

# Output of average written to working directory
write.table(Average, "tidy_data.txt", row.names = FALSE)
