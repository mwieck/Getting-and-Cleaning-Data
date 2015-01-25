#requires the following packages
#library(plyr)
#library(dplyr)
#library(data.table)

#
# reading the test and training data from the working directory
#

y_train <- read.table("y_train.txt", sep = "", header = FALSE)
X_train <- read.table("X_train.txt", sep = "", header = FALSE)
subject_train <- read.table("subject_train.txt", sep = "", header = FALSE)

y_test <- read.table("y_test.txt", sep = "", header = FALSE)
X_test <- read.table("X_test.txt", sep = "", header = FALSE)
subject_test <- read.table("subject_test.txt", sep = "", header = FALSE)

#
# Eliminating the hyphen and parentheses from the column names
#

features<-read.table("features.txt", sep="", header = FALSE)
features$V3 <- gsub("-","_",features$V2)
features$V3 <- gsub("\\(","",features$V3)
features$V3 <- gsub("\\)","_",features$V3)
features$V3 <- gsub("\\,","_",features$V3)
features$V3 <- gsub("__","_",features$V3)

activities <- read.table("dataP/activity_labels.txt", sep="", header = FALSE)
names(activities) <- c("activity_id","activity")

names(y_train) <- "activity_id"

#
# subsetting only colums with the mean and the standard deviation from the training data
#

X_train <- subset(X_train, select = grepl("_mean_|_std_", features$V3))
names(X_train) <- features$V3[grep("_mean_|_std_", features$V3)]
names(subject_train) <- "subject_id"

names(y_test) <- "activity_id"

#
# subsetting only colums with the mean and the standard deviation from the test data
#

X_test<- subset(X_test, select = grepl("_mean_|_std_", features$V3))
names(X_test) <- features$V3[grep("_mean_|_std_", features$V3)]
names(subject_test) <- "subject_id"

#
# bind the subject_id and activity_id to the data
#

train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)

#
# New column "action" for later recognition what is test and what is training data 
#

#train <- mutate(train, action = "train")
#test <- mutate(test, action = "test")

#
# load and bind a descriptive name for the activity and eliminate the activity_id from the tidy data set
#

data <- rbind(train, test)
data <- merge(activities, data)
data <- data.table(select(data, -activity_id))
data <- group_by(data, activity, subject_id)

#
# calculation the mean for every column in the data set except for action, activity and subject_id
#

#data_mean <- data[,lapply(.SD,mean), by=c("action","activity","subject_id")]
data_mean <- data[,lapply(.SD,mean), by=c("activity","subject_id")]
data_mean <- data_mean[order(subject_id,activity)]

#
# write the tidy data with the means in the working directory with the name "Project_Data.txt"
#


write.table(data_mean, file="Project_Data.txt", row.names=FALSE)