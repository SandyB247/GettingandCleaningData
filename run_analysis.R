## Load required packages
library(dplyr)

## Download the dataset
fileName <- "Coursera_DS3_Final.zip"

#Check if archive already exists.
if(!file.exists(fileName)){
  fileURL <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL,fileName,method="curl")
}

#Check if folder exists
if(!file.exists("UCI HAR Dataset")){
  unzip(fileName)
}

## Assign all data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code","activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

### STEP 1: Merge training and test sets to create one data set
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject,Y,X)

### STEP 2: Extract ONLY measurements on MEAN and STDEV for each measurement
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

### STEP 3: Use descriptive activity names to name the activities in the data set
TidyData$code <- activities[TidyData$code,2]

### STEP 4: Appropriate labels for data set 
names(TidyData)[2] = "activity"
names(TidyData) <- gsub("Acc","Accelerometer", names(TidyData))
names(TidyData) <- gsub("BodyBody","Body", names(TidyData))
names(TidyData) <- gsub("Mag","Magnitude", names(TidyData))
names(TidyData) <- gsub("^t","Time", names(TidyData))
names(TidyData) <- gsub("^f","Frequency", names(TidyData))
names(TidyData) <- gsub("tBody","TimeBody", names(TidyData))
names(TidyData) <- gsub("-mean()","Mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-std()","STD", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-freq()","Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("angle","Angle", names(TidyData))
names(TidyData) <- gsub("gravity","Gravity", names(TidyData))

### STEP 5: From the data set in Step 4, create a second, independent tidy data set
### with average of each variable for each activity and subject
FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData,"FinalData.txt",row.name=FALSE)


### FINAL CHECK STAGE
str(FinalData)

### Look at FinalData
FinalData



