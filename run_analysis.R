# Assume that the data folder is in the current folder, with the .R script
dir1 <- "data"
dir2 <- "Inertial Signals\\"

read_test <- function(s){ 
    print(paste("Reading test file", s)) 
    r<- read.table( paste0(dir1, "\\test\\",s),header=FALSE) 
    print(dim(r)) 
    return (r) 
    } 

read_train <- function(s){ 
    print(paste("Reading train file", s)) 
    r<- read.table( paste0(dir1, "\\train\\",s),header=FALSE) 
    print(dim(r)) 
    return (r) 
    } 

# Reading the test data set 
#===============================================================
subject_test <- read_test("subject_test.txt") 
x_test <- read_test("X_test.txt") 
y_test <- read_test("y_test.txt") 

# Reading the training data set. 
#===============================================================
subject_train <- read_train("subject_train.txt") 
x_train <- read_train("X_train.txt") 
y_train <- read_train("y_train.txt") 

# Question 1. combine training and test data sets 

subject <- rbind(subject_train, subject_test) 
rm(subject_train, subject_test) 

x <- rbind( x_train, x_test) 
rm(x_train, x_test)
  
y <- rbind( y_train, y_test) 
rm(y_train, y_test)


# Question 2. Extracts only the measurements on the mean and
#   standard deviation for each measurement.
features <- read.table( paste0(dir1, "\\features.txt"))
selected <- selected <- grep("(mean|std)\\(", features[,2])
x_extracted <- x[,selected]
feature_names <- features[selected,2]
feature_names <- gsub("-", ".",   feature_names)
feature_names <- gsub("[()]", "", feature_names) 
names(x_extracted) <- feature_names

# Question 3. modify y to add activity name 
library(dplyr) 
activity_labels <- read.table( paste0(dir1, "\\activity_labels.txt"))
y <- inner_join(y, activity_labels) 
y_named <- data.frame(activity=y[,2]) 
rm(y) 

# Question 4. Appropriately labels the data set with descriptive variable names.
names(subject) <- c("subject") 

# Question 5. From the data set in step 4, creates a second, 
#  independent tidy data set with the average of 
#  each variable for each activity and each subject.

data <- cbind(   subject,    y_named, x_extracted) 
n_columns <- dim(data)[2]

library(plyr)
data_mean <- ddply(data, .(activity, subject), function(x) colMeans(x[3:n_columns]))

print ("Writing tidy data to data_set.txt") 
write.table(data_mean, "data_set.txt", row.names=FALSE) 


