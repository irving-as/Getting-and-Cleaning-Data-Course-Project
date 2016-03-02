# Getting-and-Cleaning-Data-Course-Project
This script, cleans a dataset with measurements for wearable computing.

Steps
=====
- Extract the names of the features in X

- Read the subject who carried out the experiment

- Get the training set

- Name each feature in the training set

- Add the subject to each training example

- Read the training labels

- Read the subject who carried out the experiment

- Get the test set

- Name each feature in the test set

- Add the subject to each training example

- Read the test labels

- Join the train and test sets, and add the labels

- Convert the label set to a factor

- Name each label, so that it is more readable

- Name the labels column

- Extract only the measurements on the mean and standard deviation for each measurement

- Make the names in the dataset more readable, making them lower case, and removing parenthesis and hyphens

- Melt all the data, using the activity and subject as an id

- Cast the melted data to form the second dataset


Important variables
===================
- dataset: This variable holds the dataset that only has the measurements on the mean and standard deviation for each measurement.
- dataMean: This variable holds the second independent tidy data set with the average of each variable for each activity and each subject.
