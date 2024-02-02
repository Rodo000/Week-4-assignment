# UCI HAR Dataset analysis Markdown documentation

This code book describes the variables, the data, and any transformations or work performed to clean up the data.

## Dataset description

- features.txt: List of all features.
- activity_labels.txt: description of the different activities performed
- subject_train.txt: description of the subject corresponding to the observations
- X_train.txt: training set.
- y_train.txt: training labels.
- subject_test.txt: description of the subject corresponding to the observations
- X_test.txt: test set.
- y_test.txt: test labels.

## Data cleaning and transformation
#### Step 1 - Reading data
The first step was reading the data into tables in R. As mentioned in the code, to correctly run the code it is important to set the working directory to the path where the 'UCI HAR Dataset' folder is located.

#### Step 2 - Merging datasets
The following dataset pairs were merged: Xmerged: Xtest-Xtrain, ymerged: ytest-ytrain, subject_merged: subject_test-subject_train.

#### Step 3 - Extracting means and std's
The names of the variables were extracted from features.txt into a vector. Then, the vector was filtered to look for the indexes of all labels that included the words 'mean' and 'std'. The resulting index vector was used to select the columns from Xmerged as to extract the columns containing only the measurements on the mean and standard deviation for each measurement.

#### Step 4 - labeling activities
The descriptive names of the activities in the label sets was extracted from "activity_labels.txt" and then sustituted for the numeric values in the ymerged set. 

#### Step 5 - Combine dataframe
The 3 merged datasets, Xmerged, ymerged and subject_merged were combined into a single, tidy dataset. The names for the subject_merged and ymerged columns were set to "Subject" and "Activity" respectively. 

#### Step 6 - Second dataset
A second, independent dataset was created by taking the tidy dataset and
grouping it Subject and Activity.  
