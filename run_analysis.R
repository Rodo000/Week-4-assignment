#IMPORTANT: to correctly run the code, please make sure to set your working 
#directory to the path where your 'UCI HAR Dataset' folder is located

#read data
Xtest <- read.table("test/X_test.txt")
subTest <- read.table("test/subject_test.txt")
ytest <- read.table("test/y_test.txt")
subTrain <- read.table("train/subject_train.txt")
Xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")

#1. Merges the training and the test sets to create one data set.
sub_merged <- rbind(subTest, subTrain)
Xmerged <- rbind(Xtest, Xtrain)
ymerged <- rbind(ytest, ytrain)

# 4. Appropriately labels the data set with descriptive variable names
features <- read.table("features.txt")
fnames <- features$V2

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std_indices <- grep("-(mean|std)\\(\\)", fnames)
X_mean_std <- Xmerged[, mean_std_indices]

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
ymerged$V1 <- factor(ymerged$V1, levels = activity_labels$V1, labels = activity_labels$V2)

#Combine into single dataframe
tidy_set <- cbind(sub_merged, ymerged, X_mean_std)
colnames(tidy_set) <- c("Subject", "Activity", fnames[mean_std_indices])

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.. 
tidy_set_means <- tidy_set %>%
      group_by(Subject, Activity) %>%
      summarize(across(everything(), mean, na.rm = TRUE), .groups = "drop")


