# Assume that the data folder is in the current folder, with the .R script
dir1 <- "UCI HAR Dataset"
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

body_acc_x_test <- read_test( paste0(dir2, "body_acc_x_test.txt")) 
body_acc_y_test <- read_test( paste0(dir2, "body_acc_y_test.txt")) 
body_acc_z_test <- read_test( paste0(dir2, "body_acc_z_test.txt")) 

body_gyro_x_test <- read_test( paste0(dir2, "body_gyro_x_test.txt")) 
body_gyro_y_test <- read_test( paste0(dir2, "body_gyro_y_test.txt")) 
body_gyro_z_test <- read_test( paste0(dir2, "body_gyro_z_test.txt")) 

total_acc_x_test <- read_test( paste0(dir2, "total_acc_x_test.txt")) 
total_acc_y_test <- read_test( paste0(dir2, "total_acc_y_test.txt")) 
total_acc_z_test <- read_test( paste0(dir2, "total_acc_z_test.txt")) 


# Reading the training data set. 
#===============================================================
subject_train <- read_train("subject_train.txt") 
x_train <- read_train("X_train.txt") 
y_train <- read_train("y_train.txt") 

body_acc_x_train <- read_train( paste0(dir2, "body_acc_x_train.txt")) 
body_acc_y_train <- read_train( paste0(dir2, "body_acc_y_train.txt")) 
body_acc_z_train <- read_train( paste0(dir2, "body_acc_z_train.txt")) 

body_gyro_x_train <- read_train( paste0(dir2, "body_gyro_x_train.txt")) 
body_gyro_y_train <- read_train( paste0(dir2, "body_gyro_y_train.txt")) 
body_gyro_z_train <- read_train( paste0(dir2, "body_gyro_z_train.txt")) 

total_acc_x_train <- read_train( paste0(dir2, "total_acc_x_train.txt")) 
total_acc_y_train <- read_train( paste0(dir2, "total_acc_y_train.txt")) 
total_acc_z_train <- read_train( paste0(dir2, "total_acc_z_train.txt")) 

# Question 1. combine training and test data sets 

subject <- rbind(subject_train, subject_test) 
rm(subject_train, subject_test) 

x <- rbind( x_train, x_test) 
rm(x_train, x_test)
  
y <- rbind( y_train, y_test) 
rm(y_train, y_test)

body_acc_x <- rbind( body_acc_x_train, body_acc_x_test) 
rm(body_acc_x_train, body_acc_x_test)

body_acc_y <- rbind( body_acc_y_train, body_acc_y_test) 
rm(body_acc_y_train, body_acc_y_test)

body_acc_z <- rbind( body_acc_z_train, body_acc_z_test) 
rm(body_acc_z_train, body_acc_z_test)

body_gyro_x <- rbind( body_gyro_x_train, body_gyro_x_test) 
rm(body_gyro_x_train, body_gyro_x_test)

body_gyro_y <- rbind( body_gyro_y_train, body_gyro_y_test) 
rm(body_gyro_y_train, body_gyro_y_test)

body_gyro_z <- rbind( body_gyro_z_train, body_gyro_z_test) 
rm(body_gyro_z_train, body_gyro_z_test)

total_acc_x <- rbind( total_acc_x_train, total_acc_x_test) 
rm(total_acc_x_train, total_acc_x_test)

total_acc_y <- rbind( total_acc_y_train, total_acc_y_test) 
rm(total_acc_y_train, total_acc_y_test)

total_acc_z <- rbind( total_acc_z_train, total_acc_z_test) 
rm(total_acc_z_train, total_acc_z_test)


# Question 2. Convert sample window to mean and standard deviation

mt<- function(x){ mean(t(x)) }
sdt<- function(x){ sd(t(x))  } 

# body acc
body_acc_x_mean <- data.frame(body_acc_x_mean =apply(body_acc_x,1,mt ))
body_acc_x_sd   <- data.frame(body_acc_x_sd   =apply(body_acc_x,1,sdt))

body_acc_y_mean <- data.frame(body_acc_y_mean =apply(body_acc_y,1,mt ))
body_acc_y_sd   <- data.frame(body_acc_y_sd   =apply(body_acc_y,1,sdt))

body_acc_z_mean <- data.frame(body_acc_z_mean =apply(body_acc_z,1,mt ))
body_acc_z_sd   <- data.frame(body_acc_z_sd   =apply(body_acc_z,1,sdt))

rm(body_acc_x, body_acc_y, body_acc_z) 

# body gyro
body_gyro_x_mean <- data.frame(body_gyro_x_mean =apply(body_gyro_x,1,mt ))
body_gyro_x_sd   <- data.frame(body_gyro_x_sd   =apply(body_gyro_x,1,sdt))

body_gyro_y_mean <- data.frame(body_gyro_y_mean =apply(body_gyro_y,1,mt ))
body_gyro_y_sd   <- data.frame(body_gyro_y_sd   =apply(body_gyro_y,1,sdt))

body_gyro_z_mean <- data.frame(body_gyro_z_mean =apply(body_gyro_z,1,mt ))
body_gyro_z_sd   <- data.frame(body_gyro_z_sd   =apply(body_gyro_z,1,sdt))

rm(body_gyro_x, body_gyro_y, body_gyro_z) 

# total acc 
total_acc_x_mean <- data.frame(total_acc_x_mean =apply(total_acc_x,1,mt ))
total_acc_x_sd   <- data.frame(total_acc_x_sd   =apply(total_acc_x,1,sdt))

total_acc_y_mean <- data.frame(total_acc_y_mean =apply(total_acc_y,1,mt ))
total_acc_y_sd   <- data.frame(total_acc_y_sd   =apply(total_acc_y,1,sdt))

total_acc_z_mean <- data.frame(total_acc_z_mean =apply(total_acc_z,1,mt ))
total_acc_z_sd   <- data.frame(total_acc_z_sd   =apply(total_acc_z,1,sdt))

rm(total_acc_x, total_acc_y, total_acc_z) 

# Question 3. modify y to add activity name 
library(dplyr) 
activity_labels <- read.table( paste0(dir1, "\\activity_labels.txt"))
y <- inner_join(y, activity_labels) 
y_named <- data.frame(activity=y[,2]) 
rm(y) 

# Question 4. Appropriately labels the data set with descriptive variable names.
features <- read.table( paste0(dir1, "\\features.txt"))
names(x) <- t(features[,2]) 
names(subject) <- c("subject") 

# Question 5. 5. From the data set in step 4, creates a second, 
#  independent tidy data set with the average of 
#  each variable for each activity and each subject.

data <- cbind(
   subject, 
   y_named, x, 
   body_acc_x_mean, body_acc_x_sd, 
   body_acc_y_mean, body_acc_y_sd, 
   body_acc_z_mean, body_acc_z_sd, 

   body_gyro_x_mean, body_gyro_x_sd, 
   body_gyro_y_mean, body_gyro_y_sd, 
   body_gyro_z_mean, body_gyro_z_sd, 

   total_acc_x_mean, total_acc_x_sd, 
   total_acc_y_mean, total_acc_y_sd, 
   total_acc_z_mean, total_acc_z_sd
) 
 
print ("Writing tidy data to result.csv") 
write.csv(data, "result.csv") 
print ("Done." )

    



