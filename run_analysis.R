library(reshape2)

#Extract the names of the features in X
features <- read.table("features.txt", sep=" ")


#Read the subject who carried out the experiment
subject_train <- read.table("train/subject_train.txt", sep= " ")
names(subject_train)[1] <- "subject"

#Get the training set
x_train <- read.table("train/X_train.txt")
#Name each feature in the training set
names(x_train) <- features[,2]

#Add the subject to each training example
x_train <- cbind(x_train,subject_train)

#Read the training labels
y_train <- read.table("train/y_train.txt", sep = " ")

#Read the subject who carried out the experiment
subject_test <- read.table("test/subject_test.txt", sep= " ")
names(subject_test)[1] <- "subject"

#Get the test set
x_test <- read.table("test/X_test.txt")
#Name each feature in the test set
names(x_test) <- features[,2]

#Add the subject to each training example
x_test <- cbind(x_test,subject_test)

#Read the test labels
y_test <- read.table("test/y_test.txt", sep = " ")

#Join the train and test sets, and add the labels
dataset <- cbind(rbind(x_train, x_test), rbind(y_train, y_test))
    
#Convert the label set to a factor
dataset[,ncol(dataset)] <- as.factor(dataset[,ncol(dataset)])
#Name each label, so that it is more readable
levels(dataset[,ncol(dataset)]) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
#Name the labels column
names(dataset)[ncol(dataset)] <- "Activity"

#Extract only the measurements on the mean and standard deviation for each measurement.
dataset <- dataset[,grep("mean\\(|std|Activity|subject", names(dataset))]

#Make the names in the dataset more readable, making them lower case, and removing parenthesis and hyphens
names(dataset) <- tolower(names(dataset))
names(dataset) <- gsub("\\(", "", names(dataset))
names(dataset) <- gsub("\\)", "", names(dataset))
names(dataset) <- gsub("-", "", names(dataset))

#Melt all the data, using the activity and subject as an id
dataMelt <- melt(dataset, id=c("activity", "subject"))

#Cast the melted data to form the second dataset
dataMean <- dcast(dataMelt, activity + subject ~ variable, mean)

