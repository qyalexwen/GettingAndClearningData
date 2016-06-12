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
feature_names <- paste("f",features$V1,"-",features$V2, sep="")
feature_names <- gsub("-", "_",   feature_names)
feature_names <- gsub(",", "_",   feature_names)
feature_names <- gsub("[()]", "", feature_names) 
names(x) <- t(feature_names) 
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
 
# Calculate average value by each activity and each subject 
data_by_activity_subject <- group_by(data, activity, subject) 

# mean on each variable 
data_mean<- summarize(
   data_by_activity_subject, 
   f1_tBodyAcc_mean_X_mean=mean( f1_tBodyAcc_mean_X ),
   f2_tBodyAcc_mean_Y_mean=mean( f2_tBodyAcc_mean_Y ),
   f3_tBodyAcc_mean_Z_mean=mean( f3_tBodyAcc_mean_Z ),
   f4_tBodyAcc_std_X_mean=mean( f4_tBodyAcc_std_X ),
   f5_tBodyAcc_std_Y_mean=mean( f5_tBodyAcc_std_Y ),
   f6_tBodyAcc_std_Z_mean=mean( f6_tBodyAcc_std_Z ),
   f7_tBodyAcc_mad_X_mean=mean( f7_tBodyAcc_mad_X ),
   f8_tBodyAcc_mad_Y_mean=mean( f8_tBodyAcc_mad_Y ),
   f9_tBodyAcc_mad_Z_mean=mean( f9_tBodyAcc_mad_Z ),
   f10_tBodyAcc_max_X_mean=mean( f10_tBodyAcc_max_X ),
   f11_tBodyAcc_max_Y_mean=mean( f11_tBodyAcc_max_Y ),
   f12_tBodyAcc_max_Z_mean=mean( f12_tBodyAcc_max_Z ),
   f13_tBodyAcc_min_X_mean=mean( f13_tBodyAcc_min_X ),
   f14_tBodyAcc_min_Y_mean=mean( f14_tBodyAcc_min_Y ),
   f15_tBodyAcc_min_Z_mean=mean( f15_tBodyAcc_min_Z ),
   f16_tBodyAcc_sma_mean=mean( f16_tBodyAcc_sma ),
   f17_tBodyAcc_energy_X_mean=mean( f17_tBodyAcc_energy_X ),
   f18_tBodyAcc_energy_Y_mean=mean( f18_tBodyAcc_energy_Y ),
   f19_tBodyAcc_energy_Z_mean=mean( f19_tBodyAcc_energy_Z ),
   f20_tBodyAcc_iqr_X_mean=mean( f20_tBodyAcc_iqr_X ),
   f21_tBodyAcc_iqr_Y_mean=mean( f21_tBodyAcc_iqr_Y ),
   f22_tBodyAcc_iqr_Z_mean=mean( f22_tBodyAcc_iqr_Z ),
   f23_tBodyAcc_entropy_X_mean=mean( f23_tBodyAcc_entropy_X ),
   f24_tBodyAcc_entropy_Y_mean=mean( f24_tBodyAcc_entropy_Y ),
   f25_tBodyAcc_entropy_Z_mean=mean( f25_tBodyAcc_entropy_Z ),
   f26_tBodyAcc_arCoeff_X_1_mean=mean( f26_tBodyAcc_arCoeff_X_1 ),
   f27_tBodyAcc_arCoeff_X_2_mean=mean( f27_tBodyAcc_arCoeff_X_2 ),
   f28_tBodyAcc_arCoeff_X_3_mean=mean( f28_tBodyAcc_arCoeff_X_3 ),
   f29_tBodyAcc_arCoeff_X_4_mean=mean( f29_tBodyAcc_arCoeff_X_4 ),
   f30_tBodyAcc_arCoeff_Y_1_mean=mean( f30_tBodyAcc_arCoeff_Y_1 ),
   f31_tBodyAcc_arCoeff_Y_2_mean=mean( f31_tBodyAcc_arCoeff_Y_2 ),
   f32_tBodyAcc_arCoeff_Y_3_mean=mean( f32_tBodyAcc_arCoeff_Y_3 ),
   f33_tBodyAcc_arCoeff_Y_4_mean=mean( f33_tBodyAcc_arCoeff_Y_4 ),
   f34_tBodyAcc_arCoeff_Z_1_mean=mean( f34_tBodyAcc_arCoeff_Z_1 ),
   f35_tBodyAcc_arCoeff_Z_2_mean=mean( f35_tBodyAcc_arCoeff_Z_2 ),
   f36_tBodyAcc_arCoeff_Z_3_mean=mean( f36_tBodyAcc_arCoeff_Z_3 ),
   f37_tBodyAcc_arCoeff_Z_4_mean=mean( f37_tBodyAcc_arCoeff_Z_4 ),
   f38_tBodyAcc_correlation_X_Y_mean=mean( f38_tBodyAcc_correlation_X_Y ),
   f39_tBodyAcc_correlation_X_Z_mean=mean( f39_tBodyAcc_correlation_X_Z ),
   f40_tBodyAcc_correlation_Y_Z_mean=mean( f40_tBodyAcc_correlation_Y_Z ),
   f41_tGravityAcc_mean_X_mean=mean( f41_tGravityAcc_mean_X ),
   f42_tGravityAcc_mean_Y_mean=mean( f42_tGravityAcc_mean_Y ),
   f43_tGravityAcc_mean_Z_mean=mean( f43_tGravityAcc_mean_Z ),
   f44_tGravityAcc_std_X_mean=mean( f44_tGravityAcc_std_X ),
   f45_tGravityAcc_std_Y_mean=mean( f45_tGravityAcc_std_Y ),
   f46_tGravityAcc_std_Z_mean=mean( f46_tGravityAcc_std_Z ),
   f47_tGravityAcc_mad_X_mean=mean( f47_tGravityAcc_mad_X ),
   f48_tGravityAcc_mad_Y_mean=mean( f48_tGravityAcc_mad_Y ),
   f49_tGravityAcc_mad_Z_mean=mean( f49_tGravityAcc_mad_Z ),
   f50_tGravityAcc_max_X_mean=mean( f50_tGravityAcc_max_X ),
   f51_tGravityAcc_max_Y_mean=mean( f51_tGravityAcc_max_Y ),
   f52_tGravityAcc_max_Z_mean=mean( f52_tGravityAcc_max_Z ),
   f53_tGravityAcc_min_X_mean=mean( f53_tGravityAcc_min_X ),
   f54_tGravityAcc_min_Y_mean=mean( f54_tGravityAcc_min_Y ),
   f55_tGravityAcc_min_Z_mean=mean( f55_tGravityAcc_min_Z ),
   f56_tGravityAcc_sma_mean=mean( f56_tGravityAcc_sma ),
   f57_tGravityAcc_energy_X_mean=mean( f57_tGravityAcc_energy_X ),
   f58_tGravityAcc_energy_Y_mean=mean( f58_tGravityAcc_energy_Y ),
   f59_tGravityAcc_energy_Z_mean=mean( f59_tGravityAcc_energy_Z ),
   f60_tGravityAcc_iqr_X_mean=mean( f60_tGravityAcc_iqr_X ),
   f61_tGravityAcc_iqr_Y_mean=mean( f61_tGravityAcc_iqr_Y ),
   f62_tGravityAcc_iqr_Z_mean=mean( f62_tGravityAcc_iqr_Z ),
   f63_tGravityAcc_entropy_X_mean=mean( f63_tGravityAcc_entropy_X ),
   f64_tGravityAcc_entropy_Y_mean=mean( f64_tGravityAcc_entropy_Y ),
   f65_tGravityAcc_entropy_Z_mean=mean( f65_tGravityAcc_entropy_Z ),
   f66_tGravityAcc_arCoeff_X_1_mean=mean( f66_tGravityAcc_arCoeff_X_1 ),
   f67_tGravityAcc_arCoeff_X_2_mean=mean( f67_tGravityAcc_arCoeff_X_2 ),
   f68_tGravityAcc_arCoeff_X_3_mean=mean( f68_tGravityAcc_arCoeff_X_3 ),
   f69_tGravityAcc_arCoeff_X_4_mean=mean( f69_tGravityAcc_arCoeff_X_4 ),
   f70_tGravityAcc_arCoeff_Y_1_mean=mean( f70_tGravityAcc_arCoeff_Y_1 ),
   f71_tGravityAcc_arCoeff_Y_2_mean=mean( f71_tGravityAcc_arCoeff_Y_2 ),
   f72_tGravityAcc_arCoeff_Y_3_mean=mean( f72_tGravityAcc_arCoeff_Y_3 ),
   f73_tGravityAcc_arCoeff_Y_4_mean=mean( f73_tGravityAcc_arCoeff_Y_4 ),
   f74_tGravityAcc_arCoeff_Z_1_mean=mean( f74_tGravityAcc_arCoeff_Z_1 ),
   f75_tGravityAcc_arCoeff_Z_2_mean=mean( f75_tGravityAcc_arCoeff_Z_2 ),
   f76_tGravityAcc_arCoeff_Z_3_mean=mean( f76_tGravityAcc_arCoeff_Z_3 ),
   f77_tGravityAcc_arCoeff_Z_4_mean=mean( f77_tGravityAcc_arCoeff_Z_4 ),
   f78_tGravityAcc_correlation_X_Y_mean=mean( f78_tGravityAcc_correlation_X_Y ),
   f79_tGravityAcc_correlation_X_Z_mean=mean( f79_tGravityAcc_correlation_X_Z ),
   f80_tGravityAcc_correlation_Y_Z_mean=mean( f80_tGravityAcc_correlation_Y_Z ),
   f81_tBodyAccJerk_mean_X_mean=mean( f81_tBodyAccJerk_mean_X ),
   f82_tBodyAccJerk_mean_Y_mean=mean( f82_tBodyAccJerk_mean_Y ),
   f83_tBodyAccJerk_mean_Z_mean=mean( f83_tBodyAccJerk_mean_Z ),
   f84_tBodyAccJerk_std_X_mean=mean( f84_tBodyAccJerk_std_X ),
   f85_tBodyAccJerk_std_Y_mean=mean( f85_tBodyAccJerk_std_Y ),
   f86_tBodyAccJerk_std_Z_mean=mean( f86_tBodyAccJerk_std_Z ),
   f87_tBodyAccJerk_mad_X_mean=mean( f87_tBodyAccJerk_mad_X ),
   f88_tBodyAccJerk_mad_Y_mean=mean( f88_tBodyAccJerk_mad_Y ),
   f89_tBodyAccJerk_mad_Z_mean=mean( f89_tBodyAccJerk_mad_Z ),
   f90_tBodyAccJerk_max_X_mean=mean( f90_tBodyAccJerk_max_X ),
   f91_tBodyAccJerk_max_Y_mean=mean( f91_tBodyAccJerk_max_Y ),
   f92_tBodyAccJerk_max_Z_mean=mean( f92_tBodyAccJerk_max_Z ),
   f93_tBodyAccJerk_min_X_mean=mean( f93_tBodyAccJerk_min_X ),
   f94_tBodyAccJerk_min_Y_mean=mean( f94_tBodyAccJerk_min_Y ),
   f95_tBodyAccJerk_min_Z_mean=mean( f95_tBodyAccJerk_min_Z ),
   f96_tBodyAccJerk_sma_mean=mean( f96_tBodyAccJerk_sma ),
   f97_tBodyAccJerk_energy_X_mean=mean( f97_tBodyAccJerk_energy_X ),
   f98_tBodyAccJerk_energy_Y_mean=mean( f98_tBodyAccJerk_energy_Y ),
   f99_tBodyAccJerk_energy_Z_mean=mean( f99_tBodyAccJerk_energy_Z ),
   f100_tBodyAccJerk_iqr_X_mean=mean( f100_tBodyAccJerk_iqr_X ),
   f101_tBodyAccJerk_iqr_Y_mean=mean( f101_tBodyAccJerk_iqr_Y ),
   f102_tBodyAccJerk_iqr_Z_mean=mean( f102_tBodyAccJerk_iqr_Z ),
   f103_tBodyAccJerk_entropy_X_mean=mean( f103_tBodyAccJerk_entropy_X ),
   f104_tBodyAccJerk_entropy_Y_mean=mean( f104_tBodyAccJerk_entropy_Y ),
   f105_tBodyAccJerk_entropy_Z_mean=mean( f105_tBodyAccJerk_entropy_Z ),
   f106_tBodyAccJerk_arCoeff_X_1_mean=mean( f106_tBodyAccJerk_arCoeff_X_1 ),
   f107_tBodyAccJerk_arCoeff_X_2_mean=mean( f107_tBodyAccJerk_arCoeff_X_2 ),
   f108_tBodyAccJerk_arCoeff_X_3_mean=mean( f108_tBodyAccJerk_arCoeff_X_3 ),
   f109_tBodyAccJerk_arCoeff_X_4_mean=mean( f109_tBodyAccJerk_arCoeff_X_4 ),
   f110_tBodyAccJerk_arCoeff_Y_1_mean=mean( f110_tBodyAccJerk_arCoeff_Y_1 ),
   f111_tBodyAccJerk_arCoeff_Y_2_mean=mean( f111_tBodyAccJerk_arCoeff_Y_2 ),
   f112_tBodyAccJerk_arCoeff_Y_3_mean=mean( f112_tBodyAccJerk_arCoeff_Y_3 ),
   f113_tBodyAccJerk_arCoeff_Y_4_mean=mean( f113_tBodyAccJerk_arCoeff_Y_4 ),
   f114_tBodyAccJerk_arCoeff_Z_1_mean=mean( f114_tBodyAccJerk_arCoeff_Z_1 ),
   f115_tBodyAccJerk_arCoeff_Z_2_mean=mean( f115_tBodyAccJerk_arCoeff_Z_2 ),
   f116_tBodyAccJerk_arCoeff_Z_3_mean=mean( f116_tBodyAccJerk_arCoeff_Z_3 ),
   f117_tBodyAccJerk_arCoeff_Z_4_mean=mean( f117_tBodyAccJerk_arCoeff_Z_4 ),
   f118_tBodyAccJerk_correlation_X_Y_mean=mean( f118_tBodyAccJerk_correlation_X_Y ),
   f119_tBodyAccJerk_correlation_X_Z_mean=mean( f119_tBodyAccJerk_correlation_X_Z ),
   f120_tBodyAccJerk_correlation_Y_Z_mean=mean( f120_tBodyAccJerk_correlation_Y_Z ),
   f121_tBodyGyro_mean_X_mean=mean( f121_tBodyGyro_mean_X ),
   f122_tBodyGyro_mean_Y_mean=mean( f122_tBodyGyro_mean_Y ),
   f123_tBodyGyro_mean_Z_mean=mean( f123_tBodyGyro_mean_Z ),
   f124_tBodyGyro_std_X_mean=mean( f124_tBodyGyro_std_X ),
   f125_tBodyGyro_std_Y_mean=mean( f125_tBodyGyro_std_Y ),
   f126_tBodyGyro_std_Z_mean=mean( f126_tBodyGyro_std_Z ),
   f127_tBodyGyro_mad_X_mean=mean( f127_tBodyGyro_mad_X ),
   f128_tBodyGyro_mad_Y_mean=mean( f128_tBodyGyro_mad_Y ),
   f129_tBodyGyro_mad_Z_mean=mean( f129_tBodyGyro_mad_Z ),
   f130_tBodyGyro_max_X_mean=mean( f130_tBodyGyro_max_X ),
   f131_tBodyGyro_max_Y_mean=mean( f131_tBodyGyro_max_Y ),
   f132_tBodyGyro_max_Z_mean=mean( f132_tBodyGyro_max_Z ),
   f133_tBodyGyro_min_X_mean=mean( f133_tBodyGyro_min_X ),
   f134_tBodyGyro_min_Y_mean=mean( f134_tBodyGyro_min_Y ),
   f135_tBodyGyro_min_Z_mean=mean( f135_tBodyGyro_min_Z ),
   f136_tBodyGyro_sma_mean=mean( f136_tBodyGyro_sma ),
   f137_tBodyGyro_energy_X_mean=mean( f137_tBodyGyro_energy_X ),
   f138_tBodyGyro_energy_Y_mean=mean( f138_tBodyGyro_energy_Y ),
   f139_tBodyGyro_energy_Z_mean=mean( f139_tBodyGyro_energy_Z ),
   f140_tBodyGyro_iqr_X_mean=mean( f140_tBodyGyro_iqr_X ),
   f141_tBodyGyro_iqr_Y_mean=mean( f141_tBodyGyro_iqr_Y ),
   f142_tBodyGyro_iqr_Z_mean=mean( f142_tBodyGyro_iqr_Z ),
   f143_tBodyGyro_entropy_X_mean=mean( f143_tBodyGyro_entropy_X ),
   f144_tBodyGyro_entropy_Y_mean=mean( f144_tBodyGyro_entropy_Y ),
   f145_tBodyGyro_entropy_Z_mean=mean( f145_tBodyGyro_entropy_Z ),
   f146_tBodyGyro_arCoeff_X_1_mean=mean( f146_tBodyGyro_arCoeff_X_1 ),
   f147_tBodyGyro_arCoeff_X_2_mean=mean( f147_tBodyGyro_arCoeff_X_2 ),
   f148_tBodyGyro_arCoeff_X_3_mean=mean( f148_tBodyGyro_arCoeff_X_3 ),
   f149_tBodyGyro_arCoeff_X_4_mean=mean( f149_tBodyGyro_arCoeff_X_4 ),
   f150_tBodyGyro_arCoeff_Y_1_mean=mean( f150_tBodyGyro_arCoeff_Y_1 ),
   f151_tBodyGyro_arCoeff_Y_2_mean=mean( f151_tBodyGyro_arCoeff_Y_2 ),
   f152_tBodyGyro_arCoeff_Y_3_mean=mean( f152_tBodyGyro_arCoeff_Y_3 ),
   f153_tBodyGyro_arCoeff_Y_4_mean=mean( f153_tBodyGyro_arCoeff_Y_4 ),
   f154_tBodyGyro_arCoeff_Z_1_mean=mean( f154_tBodyGyro_arCoeff_Z_1 ),
   f155_tBodyGyro_arCoeff_Z_2_mean=mean( f155_tBodyGyro_arCoeff_Z_2 ),
   f156_tBodyGyro_arCoeff_Z_3_mean=mean( f156_tBodyGyro_arCoeff_Z_3 ),
   f157_tBodyGyro_arCoeff_Z_4_mean=mean( f157_tBodyGyro_arCoeff_Z_4 ),
   f158_tBodyGyro_correlation_X_Y_mean=mean( f158_tBodyGyro_correlation_X_Y ),
   f159_tBodyGyro_correlation_X_Z_mean=mean( f159_tBodyGyro_correlation_X_Z ),
   f160_tBodyGyro_correlation_Y_Z_mean=mean( f160_tBodyGyro_correlation_Y_Z ),
   f161_tBodyGyroJerk_mean_X_mean=mean( f161_tBodyGyroJerk_mean_X ),
   f162_tBodyGyroJerk_mean_Y_mean=mean( f162_tBodyGyroJerk_mean_Y ),
   f163_tBodyGyroJerk_mean_Z_mean=mean( f163_tBodyGyroJerk_mean_Z ),
   f164_tBodyGyroJerk_std_X_mean=mean( f164_tBodyGyroJerk_std_X ),
   f165_tBodyGyroJerk_std_Y_mean=mean( f165_tBodyGyroJerk_std_Y ),
   f166_tBodyGyroJerk_std_Z_mean=mean( f166_tBodyGyroJerk_std_Z ),
   f167_tBodyGyroJerk_mad_X_mean=mean( f167_tBodyGyroJerk_mad_X ),
   f168_tBodyGyroJerk_mad_Y_mean=mean( f168_tBodyGyroJerk_mad_Y ),
   f169_tBodyGyroJerk_mad_Z_mean=mean( f169_tBodyGyroJerk_mad_Z ),
   f170_tBodyGyroJerk_max_X_mean=mean( f170_tBodyGyroJerk_max_X ),
   f171_tBodyGyroJerk_max_Y_mean=mean( f171_tBodyGyroJerk_max_Y ),
   f172_tBodyGyroJerk_max_Z_mean=mean( f172_tBodyGyroJerk_max_Z ),
   f173_tBodyGyroJerk_min_X_mean=mean( f173_tBodyGyroJerk_min_X ),
   f174_tBodyGyroJerk_min_Y_mean=mean( f174_tBodyGyroJerk_min_Y ),
   f175_tBodyGyroJerk_min_Z_mean=mean( f175_tBodyGyroJerk_min_Z ),
   f176_tBodyGyroJerk_sma_mean=mean( f176_tBodyGyroJerk_sma ),
   f177_tBodyGyroJerk_energy_X_mean=mean( f177_tBodyGyroJerk_energy_X ),
   f178_tBodyGyroJerk_energy_Y_mean=mean( f178_tBodyGyroJerk_energy_Y ),
   f179_tBodyGyroJerk_energy_Z_mean=mean( f179_tBodyGyroJerk_energy_Z ),
   f180_tBodyGyroJerk_iqr_X_mean=mean( f180_tBodyGyroJerk_iqr_X ),
   f181_tBodyGyroJerk_iqr_Y_mean=mean( f181_tBodyGyroJerk_iqr_Y ),
   f182_tBodyGyroJerk_iqr_Z_mean=mean( f182_tBodyGyroJerk_iqr_Z ),
   f183_tBodyGyroJerk_entropy_X_mean=mean( f183_tBodyGyroJerk_entropy_X ),
   f184_tBodyGyroJerk_entropy_Y_mean=mean( f184_tBodyGyroJerk_entropy_Y ),
   f185_tBodyGyroJerk_entropy_Z_mean=mean( f185_tBodyGyroJerk_entropy_Z ),
   f186_tBodyGyroJerk_arCoeff_X_1_mean=mean( f186_tBodyGyroJerk_arCoeff_X_1 ),
   f187_tBodyGyroJerk_arCoeff_X_2_mean=mean( f187_tBodyGyroJerk_arCoeff_X_2 ),
   f188_tBodyGyroJerk_arCoeff_X_3_mean=mean( f188_tBodyGyroJerk_arCoeff_X_3 ),
   f189_tBodyGyroJerk_arCoeff_X_4_mean=mean( f189_tBodyGyroJerk_arCoeff_X_4 ),
   f190_tBodyGyroJerk_arCoeff_Y_1_mean=mean( f190_tBodyGyroJerk_arCoeff_Y_1 ),
   f191_tBodyGyroJerk_arCoeff_Y_2_mean=mean( f191_tBodyGyroJerk_arCoeff_Y_2 ),
   f192_tBodyGyroJerk_arCoeff_Y_3_mean=mean( f192_tBodyGyroJerk_arCoeff_Y_3 ),
   f193_tBodyGyroJerk_arCoeff_Y_4_mean=mean( f193_tBodyGyroJerk_arCoeff_Y_4 ),
   f194_tBodyGyroJerk_arCoeff_Z_1_mean=mean( f194_tBodyGyroJerk_arCoeff_Z_1 ),
   f195_tBodyGyroJerk_arCoeff_Z_2_mean=mean( f195_tBodyGyroJerk_arCoeff_Z_2 ),
   f196_tBodyGyroJerk_arCoeff_Z_3_mean=mean( f196_tBodyGyroJerk_arCoeff_Z_3 ),
   f197_tBodyGyroJerk_arCoeff_Z_4_mean=mean( f197_tBodyGyroJerk_arCoeff_Z_4 ),
   f198_tBodyGyroJerk_correlation_X_Y_mean=mean( f198_tBodyGyroJerk_correlation_X_Y ),
   f199_tBodyGyroJerk_correlation_X_Z_mean=mean( f199_tBodyGyroJerk_correlation_X_Z ),
   f200_tBodyGyroJerk_correlation_Y_Z_mean=mean( f200_tBodyGyroJerk_correlation_Y_Z ),
   f201_tBodyAccMag_mean_mean=mean( f201_tBodyAccMag_mean ),
   f202_tBodyAccMag_std_mean=mean( f202_tBodyAccMag_std ),
   f203_tBodyAccMag_mad_mean=mean( f203_tBodyAccMag_mad ),
   f204_tBodyAccMag_max_mean=mean( f204_tBodyAccMag_max ),
   f205_tBodyAccMag_min_mean=mean( f205_tBodyAccMag_min ),
   f206_tBodyAccMag_sma_mean=mean( f206_tBodyAccMag_sma ),
   f207_tBodyAccMag_energy_mean=mean( f207_tBodyAccMag_energy ),
   f208_tBodyAccMag_iqr_mean=mean( f208_tBodyAccMag_iqr ),
   f209_tBodyAccMag_entropy_mean=mean( f209_tBodyAccMag_entropy ),
   f210_tBodyAccMag_arCoeff1_mean=mean( f210_tBodyAccMag_arCoeff1 ),
   f211_tBodyAccMag_arCoeff2_mean=mean( f211_tBodyAccMag_arCoeff2 ),
   f212_tBodyAccMag_arCoeff3_mean=mean( f212_tBodyAccMag_arCoeff3 ),
   f213_tBodyAccMag_arCoeff4_mean=mean( f213_tBodyAccMag_arCoeff4 ),
   f214_tGravityAccMag_mean_mean=mean( f214_tGravityAccMag_mean ),
   f215_tGravityAccMag_std_mean=mean( f215_tGravityAccMag_std ),
   f216_tGravityAccMag_mad_mean=mean( f216_tGravityAccMag_mad ),
   f217_tGravityAccMag_max_mean=mean( f217_tGravityAccMag_max ),
   f218_tGravityAccMag_min_mean=mean( f218_tGravityAccMag_min ),
   f219_tGravityAccMag_sma_mean=mean( f219_tGravityAccMag_sma ),
   f220_tGravityAccMag_energy_mean=mean( f220_tGravityAccMag_energy ),
   f221_tGravityAccMag_iqr_mean=mean( f221_tGravityAccMag_iqr ),
   f222_tGravityAccMag_entropy_mean=mean( f222_tGravityAccMag_entropy ),
   f223_tGravityAccMag_arCoeff1_mean=mean( f223_tGravityAccMag_arCoeff1 ),
   f224_tGravityAccMag_arCoeff2_mean=mean( f224_tGravityAccMag_arCoeff2 ),
   f225_tGravityAccMag_arCoeff3_mean=mean( f225_tGravityAccMag_arCoeff3 ),
   f226_tGravityAccMag_arCoeff4_mean=mean( f226_tGravityAccMag_arCoeff4 ),
   f227_tBodyAccJerkMag_mean_mean=mean( f227_tBodyAccJerkMag_mean ),
   f228_tBodyAccJerkMag_std_mean=mean( f228_tBodyAccJerkMag_std ),
   f229_tBodyAccJerkMag_mad_mean=mean( f229_tBodyAccJerkMag_mad ),
   f230_tBodyAccJerkMag_max_mean=mean( f230_tBodyAccJerkMag_max ),
   f231_tBodyAccJerkMag_min_mean=mean( f231_tBodyAccJerkMag_min ),
   f232_tBodyAccJerkMag_sma_mean=mean( f232_tBodyAccJerkMag_sma ),
   f233_tBodyAccJerkMag_energy_mean=mean( f233_tBodyAccJerkMag_energy ),
   f234_tBodyAccJerkMag_iqr_mean=mean( f234_tBodyAccJerkMag_iqr ),
   f235_tBodyAccJerkMag_entropy_mean=mean( f235_tBodyAccJerkMag_entropy ),
   f236_tBodyAccJerkMag_arCoeff1_mean=mean( f236_tBodyAccJerkMag_arCoeff1 ),
   f237_tBodyAccJerkMag_arCoeff2_mean=mean( f237_tBodyAccJerkMag_arCoeff2 ),
   f238_tBodyAccJerkMag_arCoeff3_mean=mean( f238_tBodyAccJerkMag_arCoeff3 ),
   f239_tBodyAccJerkMag_arCoeff4_mean=mean( f239_tBodyAccJerkMag_arCoeff4 ),
   f240_tBodyGyroMag_mean_mean=mean( f240_tBodyGyroMag_mean ),
   f241_tBodyGyroMag_std_mean=mean( f241_tBodyGyroMag_std ),
   f242_tBodyGyroMag_mad_mean=mean( f242_tBodyGyroMag_mad ),
   f243_tBodyGyroMag_max_mean=mean( f243_tBodyGyroMag_max ),
   f244_tBodyGyroMag_min_mean=mean( f244_tBodyGyroMag_min ),
   f245_tBodyGyroMag_sma_mean=mean( f245_tBodyGyroMag_sma ),
   f246_tBodyGyroMag_energy_mean=mean( f246_tBodyGyroMag_energy ),
   f247_tBodyGyroMag_iqr_mean=mean( f247_tBodyGyroMag_iqr ),
   f248_tBodyGyroMag_entropy_mean=mean( f248_tBodyGyroMag_entropy ),
   f249_tBodyGyroMag_arCoeff1_mean=mean( f249_tBodyGyroMag_arCoeff1 ),
   f250_tBodyGyroMag_arCoeff2_mean=mean( f250_tBodyGyroMag_arCoeff2 ),
   f251_tBodyGyroMag_arCoeff3_mean=mean( f251_tBodyGyroMag_arCoeff3 ),
   f252_tBodyGyroMag_arCoeff4_mean=mean( f252_tBodyGyroMag_arCoeff4 ),
   f253_tBodyGyroJerkMag_mean_mean=mean( f253_tBodyGyroJerkMag_mean ),
   f254_tBodyGyroJerkMag_std_mean=mean( f254_tBodyGyroJerkMag_std ),
   f255_tBodyGyroJerkMag_mad_mean=mean( f255_tBodyGyroJerkMag_mad ),
   f256_tBodyGyroJerkMag_max_mean=mean( f256_tBodyGyroJerkMag_max ),
   f257_tBodyGyroJerkMag_min_mean=mean( f257_tBodyGyroJerkMag_min ),
   f258_tBodyGyroJerkMag_sma_mean=mean( f258_tBodyGyroJerkMag_sma ),
   f259_tBodyGyroJerkMag_energy_mean=mean( f259_tBodyGyroJerkMag_energy ),
   f260_tBodyGyroJerkMag_iqr_mean=mean( f260_tBodyGyroJerkMag_iqr ),
   f261_tBodyGyroJerkMag_entropy_mean=mean( f261_tBodyGyroJerkMag_entropy ),
   f262_tBodyGyroJerkMag_arCoeff1_mean=mean( f262_tBodyGyroJerkMag_arCoeff1 ),
   f263_tBodyGyroJerkMag_arCoeff2_mean=mean( f263_tBodyGyroJerkMag_arCoeff2 ),
   f264_tBodyGyroJerkMag_arCoeff3_mean=mean( f264_tBodyGyroJerkMag_arCoeff3 ),
   f265_tBodyGyroJerkMag_arCoeff4_mean=mean( f265_tBodyGyroJerkMag_arCoeff4 ),
   f266_fBodyAcc_mean_X_mean=mean( f266_fBodyAcc_mean_X ),
   f267_fBodyAcc_mean_Y_mean=mean( f267_fBodyAcc_mean_Y ),
   f268_fBodyAcc_mean_Z_mean=mean( f268_fBodyAcc_mean_Z ),
   f269_fBodyAcc_std_X_mean=mean( f269_fBodyAcc_std_X ),
   f270_fBodyAcc_std_Y_mean=mean( f270_fBodyAcc_std_Y ),
   f271_fBodyAcc_std_Z_mean=mean( f271_fBodyAcc_std_Z ),
   f272_fBodyAcc_mad_X_mean=mean( f272_fBodyAcc_mad_X ),
   f273_fBodyAcc_mad_Y_mean=mean( f273_fBodyAcc_mad_Y ),
   f274_fBodyAcc_mad_Z_mean=mean( f274_fBodyAcc_mad_Z ),
   f275_fBodyAcc_max_X_mean=mean( f275_fBodyAcc_max_X ),
   f276_fBodyAcc_max_Y_mean=mean( f276_fBodyAcc_max_Y ),
   f277_fBodyAcc_max_Z_mean=mean( f277_fBodyAcc_max_Z ),
   f278_fBodyAcc_min_X_mean=mean( f278_fBodyAcc_min_X ),
   f279_fBodyAcc_min_Y_mean=mean( f279_fBodyAcc_min_Y ),
   f280_fBodyAcc_min_Z_mean=mean( f280_fBodyAcc_min_Z ),
   f281_fBodyAcc_sma_mean=mean( f281_fBodyAcc_sma ),
   f282_fBodyAcc_energy_X_mean=mean( f282_fBodyAcc_energy_X ),
   f283_fBodyAcc_energy_Y_mean=mean( f283_fBodyAcc_energy_Y ),
   f284_fBodyAcc_energy_Z_mean=mean( f284_fBodyAcc_energy_Z ),
   f285_fBodyAcc_iqr_X_mean=mean( f285_fBodyAcc_iqr_X ),
   f286_fBodyAcc_iqr_Y_mean=mean( f286_fBodyAcc_iqr_Y ),
   f287_fBodyAcc_iqr_Z_mean=mean( f287_fBodyAcc_iqr_Z ),
   f288_fBodyAcc_entropy_X_mean=mean( f288_fBodyAcc_entropy_X ),
   f289_fBodyAcc_entropy_Y_mean=mean( f289_fBodyAcc_entropy_Y ),
   f290_fBodyAcc_entropy_Z_mean=mean( f290_fBodyAcc_entropy_Z ),
   f291_fBodyAcc_maxInds_X_mean=mean( f291_fBodyAcc_maxInds_X ),
   f292_fBodyAcc_maxInds_Y_mean=mean( f292_fBodyAcc_maxInds_Y ),
   f293_fBodyAcc_maxInds_Z_mean=mean( f293_fBodyAcc_maxInds_Z ),
   f294_fBodyAcc_meanFreq_X_mean=mean( f294_fBodyAcc_meanFreq_X ),
   f295_fBodyAcc_meanFreq_Y_mean=mean( f295_fBodyAcc_meanFreq_Y ),
   f296_fBodyAcc_meanFreq_Z_mean=mean( f296_fBodyAcc_meanFreq_Z ),
   f297_fBodyAcc_skewness_X_mean=mean( f297_fBodyAcc_skewness_X ),
   f298_fBodyAcc_kurtosis_X_mean=mean( f298_fBodyAcc_kurtosis_X ),
   f299_fBodyAcc_skewness_Y_mean=mean( f299_fBodyAcc_skewness_Y ),
   f300_fBodyAcc_kurtosis_Y_mean=mean( f300_fBodyAcc_kurtosis_Y ),
   f301_fBodyAcc_skewness_Z_mean=mean( f301_fBodyAcc_skewness_Z ),
   f302_fBodyAcc_kurtosis_Z_mean=mean( f302_fBodyAcc_kurtosis_Z ),
   f303_fBodyAcc_bandsEnergy_1_8_mean=mean( f303_fBodyAcc_bandsEnergy_1_8 ),
   f304_fBodyAcc_bandsEnergy_9_16_mean=mean( f304_fBodyAcc_bandsEnergy_9_16 ),
   f305_fBodyAcc_bandsEnergy_17_24_mean=mean( f305_fBodyAcc_bandsEnergy_17_24 ),
   f306_fBodyAcc_bandsEnergy_25_32_mean=mean( f306_fBodyAcc_bandsEnergy_25_32 ),
   f307_fBodyAcc_bandsEnergy_33_40_mean=mean( f307_fBodyAcc_bandsEnergy_33_40 ),
   f308_fBodyAcc_bandsEnergy_41_48_mean=mean( f308_fBodyAcc_bandsEnergy_41_48 ),
   f309_fBodyAcc_bandsEnergy_49_56_mean=mean( f309_fBodyAcc_bandsEnergy_49_56 ),
   f310_fBodyAcc_bandsEnergy_57_64_mean=mean( f310_fBodyAcc_bandsEnergy_57_64 ),
   f311_fBodyAcc_bandsEnergy_1_16_mean=mean( f311_fBodyAcc_bandsEnergy_1_16 ),
   f312_fBodyAcc_bandsEnergy_17_32_mean=mean( f312_fBodyAcc_bandsEnergy_17_32 ),
   f313_fBodyAcc_bandsEnergy_33_48_mean=mean( f313_fBodyAcc_bandsEnergy_33_48 ),
   f314_fBodyAcc_bandsEnergy_49_64_mean=mean( f314_fBodyAcc_bandsEnergy_49_64 ),
   f315_fBodyAcc_bandsEnergy_1_24_mean=mean( f315_fBodyAcc_bandsEnergy_1_24 ),
   f316_fBodyAcc_bandsEnergy_25_48_mean=mean( f316_fBodyAcc_bandsEnergy_25_48 ),
   f317_fBodyAcc_bandsEnergy_1_8_mean=mean( f317_fBodyAcc_bandsEnergy_1_8 ),
   f318_fBodyAcc_bandsEnergy_9_16_mean=mean( f318_fBodyAcc_bandsEnergy_9_16 ),
   f319_fBodyAcc_bandsEnergy_17_24_mean=mean( f319_fBodyAcc_bandsEnergy_17_24 ),
   f320_fBodyAcc_bandsEnergy_25_32_mean=mean( f320_fBodyAcc_bandsEnergy_25_32 ),
   f321_fBodyAcc_bandsEnergy_33_40_mean=mean( f321_fBodyAcc_bandsEnergy_33_40 ),
   f322_fBodyAcc_bandsEnergy_41_48_mean=mean( f322_fBodyAcc_bandsEnergy_41_48 ),
   f323_fBodyAcc_bandsEnergy_49_56_mean=mean( f323_fBodyAcc_bandsEnergy_49_56 ),
   f324_fBodyAcc_bandsEnergy_57_64_mean=mean( f324_fBodyAcc_bandsEnergy_57_64 ),
   f325_fBodyAcc_bandsEnergy_1_16_mean=mean( f325_fBodyAcc_bandsEnergy_1_16 ),
   f326_fBodyAcc_bandsEnergy_17_32_mean=mean( f326_fBodyAcc_bandsEnergy_17_32 ),
   f327_fBodyAcc_bandsEnergy_33_48_mean=mean( f327_fBodyAcc_bandsEnergy_33_48 ),
   f328_fBodyAcc_bandsEnergy_49_64_mean=mean( f328_fBodyAcc_bandsEnergy_49_64 ),
   f329_fBodyAcc_bandsEnergy_1_24_mean=mean( f329_fBodyAcc_bandsEnergy_1_24 ),
   f330_fBodyAcc_bandsEnergy_25_48_mean=mean( f330_fBodyAcc_bandsEnergy_25_48 ),
   f331_fBodyAcc_bandsEnergy_1_8_mean=mean( f331_fBodyAcc_bandsEnergy_1_8 ),
   f332_fBodyAcc_bandsEnergy_9_16_mean=mean( f332_fBodyAcc_bandsEnergy_9_16 ),
   f333_fBodyAcc_bandsEnergy_17_24_mean=mean( f333_fBodyAcc_bandsEnergy_17_24 ),
   f334_fBodyAcc_bandsEnergy_25_32_mean=mean( f334_fBodyAcc_bandsEnergy_25_32 ),
   f335_fBodyAcc_bandsEnergy_33_40_mean=mean( f335_fBodyAcc_bandsEnergy_33_40 ),
   f336_fBodyAcc_bandsEnergy_41_48_mean=mean( f336_fBodyAcc_bandsEnergy_41_48 ),
   f337_fBodyAcc_bandsEnergy_49_56_mean=mean( f337_fBodyAcc_bandsEnergy_49_56 ),
   f338_fBodyAcc_bandsEnergy_57_64_mean=mean( f338_fBodyAcc_bandsEnergy_57_64 ),
   f339_fBodyAcc_bandsEnergy_1_16_mean=mean( f339_fBodyAcc_bandsEnergy_1_16 ),
   f340_fBodyAcc_bandsEnergy_17_32_mean=mean( f340_fBodyAcc_bandsEnergy_17_32 ),
   f341_fBodyAcc_bandsEnergy_33_48_mean=mean( f341_fBodyAcc_bandsEnergy_33_48 ),
   f342_fBodyAcc_bandsEnergy_49_64_mean=mean( f342_fBodyAcc_bandsEnergy_49_64 ),
   f343_fBodyAcc_bandsEnergy_1_24_mean=mean( f343_fBodyAcc_bandsEnergy_1_24 ),
   f344_fBodyAcc_bandsEnergy_25_48_mean=mean( f344_fBodyAcc_bandsEnergy_25_48 ),
   f345_fBodyAccJerk_mean_X_mean=mean( f345_fBodyAccJerk_mean_X ),
   f346_fBodyAccJerk_mean_Y_mean=mean( f346_fBodyAccJerk_mean_Y ),
   f347_fBodyAccJerk_mean_Z_mean=mean( f347_fBodyAccJerk_mean_Z ),
   f348_fBodyAccJerk_std_X_mean=mean( f348_fBodyAccJerk_std_X ),
   f349_fBodyAccJerk_std_Y_mean=mean( f349_fBodyAccJerk_std_Y ),
   f350_fBodyAccJerk_std_Z_mean=mean( f350_fBodyAccJerk_std_Z ),
   f351_fBodyAccJerk_mad_X_mean=mean( f351_fBodyAccJerk_mad_X ),
   f352_fBodyAccJerk_mad_Y_mean=mean( f352_fBodyAccJerk_mad_Y ),
   f353_fBodyAccJerk_mad_Z_mean=mean( f353_fBodyAccJerk_mad_Z ),
   f354_fBodyAccJerk_max_X_mean=mean( f354_fBodyAccJerk_max_X ),
   f355_fBodyAccJerk_max_Y_mean=mean( f355_fBodyAccJerk_max_Y ),
   f356_fBodyAccJerk_max_Z_mean=mean( f356_fBodyAccJerk_max_Z ),
   f357_fBodyAccJerk_min_X_mean=mean( f357_fBodyAccJerk_min_X ),
   f358_fBodyAccJerk_min_Y_mean=mean( f358_fBodyAccJerk_min_Y ),
   f359_fBodyAccJerk_min_Z_mean=mean( f359_fBodyAccJerk_min_Z ),
   f360_fBodyAccJerk_sma_mean=mean( f360_fBodyAccJerk_sma ),
   f361_fBodyAccJerk_energy_X_mean=mean( f361_fBodyAccJerk_energy_X ),
   f362_fBodyAccJerk_energy_Y_mean=mean( f362_fBodyAccJerk_energy_Y ),
   f363_fBodyAccJerk_energy_Z_mean=mean( f363_fBodyAccJerk_energy_Z ),
   f364_fBodyAccJerk_iqr_X_mean=mean( f364_fBodyAccJerk_iqr_X ),
   f365_fBodyAccJerk_iqr_Y_mean=mean( f365_fBodyAccJerk_iqr_Y ),
   f366_fBodyAccJerk_iqr_Z_mean=mean( f366_fBodyAccJerk_iqr_Z ),
   f367_fBodyAccJerk_entropy_X_mean=mean( f367_fBodyAccJerk_entropy_X ),
   f368_fBodyAccJerk_entropy_Y_mean=mean( f368_fBodyAccJerk_entropy_Y ),
   f369_fBodyAccJerk_entropy_Z_mean=mean( f369_fBodyAccJerk_entropy_Z ),
   f370_fBodyAccJerk_maxInds_X_mean=mean( f370_fBodyAccJerk_maxInds_X ),
   f371_fBodyAccJerk_maxInds_Y_mean=mean( f371_fBodyAccJerk_maxInds_Y ),
   f372_fBodyAccJerk_maxInds_Z_mean=mean( f372_fBodyAccJerk_maxInds_Z ),
   f373_fBodyAccJerk_meanFreq_X_mean=mean( f373_fBodyAccJerk_meanFreq_X ),
   f374_fBodyAccJerk_meanFreq_Y_mean=mean( f374_fBodyAccJerk_meanFreq_Y ),
   f375_fBodyAccJerk_meanFreq_Z_mean=mean( f375_fBodyAccJerk_meanFreq_Z ),
   f376_fBodyAccJerk_skewness_X_mean=mean( f376_fBodyAccJerk_skewness_X ),
   f377_fBodyAccJerk_kurtosis_X_mean=mean( f377_fBodyAccJerk_kurtosis_X ),
   f378_fBodyAccJerk_skewness_Y_mean=mean( f378_fBodyAccJerk_skewness_Y ),
   f379_fBodyAccJerk_kurtosis_Y_mean=mean( f379_fBodyAccJerk_kurtosis_Y ),
   f380_fBodyAccJerk_skewness_Z_mean=mean( f380_fBodyAccJerk_skewness_Z ),
   f381_fBodyAccJerk_kurtosis_Z_mean=mean( f381_fBodyAccJerk_kurtosis_Z ),
   f382_fBodyAccJerk_bandsEnergy_1_8_mean=mean( f382_fBodyAccJerk_bandsEnergy_1_8 ),
   f383_fBodyAccJerk_bandsEnergy_9_16_mean=mean( f383_fBodyAccJerk_bandsEnergy_9_16 ),
   f384_fBodyAccJerk_bandsEnergy_17_24_mean=mean( f384_fBodyAccJerk_bandsEnergy_17_24 ),
   f385_fBodyAccJerk_bandsEnergy_25_32_mean=mean( f385_fBodyAccJerk_bandsEnergy_25_32 ),
   f386_fBodyAccJerk_bandsEnergy_33_40_mean=mean( f386_fBodyAccJerk_bandsEnergy_33_40 ),
   f387_fBodyAccJerk_bandsEnergy_41_48_mean=mean( f387_fBodyAccJerk_bandsEnergy_41_48 ),
   f388_fBodyAccJerk_bandsEnergy_49_56_mean=mean( f388_fBodyAccJerk_bandsEnergy_49_56 ),
   f389_fBodyAccJerk_bandsEnergy_57_64_mean=mean( f389_fBodyAccJerk_bandsEnergy_57_64 ),
   f390_fBodyAccJerk_bandsEnergy_1_16_mean=mean( f390_fBodyAccJerk_bandsEnergy_1_16 ),
   f391_fBodyAccJerk_bandsEnergy_17_32_mean=mean( f391_fBodyAccJerk_bandsEnergy_17_32 ),
   f392_fBodyAccJerk_bandsEnergy_33_48_mean=mean( f392_fBodyAccJerk_bandsEnergy_33_48 ),
   f393_fBodyAccJerk_bandsEnergy_49_64_mean=mean( f393_fBodyAccJerk_bandsEnergy_49_64 ),
   f394_fBodyAccJerk_bandsEnergy_1_24_mean=mean( f394_fBodyAccJerk_bandsEnergy_1_24 ),
   f395_fBodyAccJerk_bandsEnergy_25_48_mean=mean( f395_fBodyAccJerk_bandsEnergy_25_48 ),
   f396_fBodyAccJerk_bandsEnergy_1_8_mean=mean( f396_fBodyAccJerk_bandsEnergy_1_8 ),
   f397_fBodyAccJerk_bandsEnergy_9_16_mean=mean( f397_fBodyAccJerk_bandsEnergy_9_16 ),
   f398_fBodyAccJerk_bandsEnergy_17_24_mean=mean( f398_fBodyAccJerk_bandsEnergy_17_24 ),
   f399_fBodyAccJerk_bandsEnergy_25_32_mean=mean( f399_fBodyAccJerk_bandsEnergy_25_32 ),
   f400_fBodyAccJerk_bandsEnergy_33_40_mean=mean( f400_fBodyAccJerk_bandsEnergy_33_40 ),
   f401_fBodyAccJerk_bandsEnergy_41_48_mean=mean( f401_fBodyAccJerk_bandsEnergy_41_48 ),
   f402_fBodyAccJerk_bandsEnergy_49_56_mean=mean( f402_fBodyAccJerk_bandsEnergy_49_56 ),
   f403_fBodyAccJerk_bandsEnergy_57_64_mean=mean( f403_fBodyAccJerk_bandsEnergy_57_64 ),
   f404_fBodyAccJerk_bandsEnergy_1_16_mean=mean( f404_fBodyAccJerk_bandsEnergy_1_16 ),
   f405_fBodyAccJerk_bandsEnergy_17_32_mean=mean( f405_fBodyAccJerk_bandsEnergy_17_32 ),
   f406_fBodyAccJerk_bandsEnergy_33_48_mean=mean( f406_fBodyAccJerk_bandsEnergy_33_48 ),
   f407_fBodyAccJerk_bandsEnergy_49_64_mean=mean( f407_fBodyAccJerk_bandsEnergy_49_64 ),
   f408_fBodyAccJerk_bandsEnergy_1_24_mean=mean( f408_fBodyAccJerk_bandsEnergy_1_24 ),
   f409_fBodyAccJerk_bandsEnergy_25_48_mean=mean( f409_fBodyAccJerk_bandsEnergy_25_48 ),
   f410_fBodyAccJerk_bandsEnergy_1_8_mean=mean( f410_fBodyAccJerk_bandsEnergy_1_8 ),
   f411_fBodyAccJerk_bandsEnergy_9_16_mean=mean( f411_fBodyAccJerk_bandsEnergy_9_16 ),
   f412_fBodyAccJerk_bandsEnergy_17_24_mean=mean( f412_fBodyAccJerk_bandsEnergy_17_24 ),
   f413_fBodyAccJerk_bandsEnergy_25_32_mean=mean( f413_fBodyAccJerk_bandsEnergy_25_32 ),
   f414_fBodyAccJerk_bandsEnergy_33_40_mean=mean( f414_fBodyAccJerk_bandsEnergy_33_40 ),
   f415_fBodyAccJerk_bandsEnergy_41_48_mean=mean( f415_fBodyAccJerk_bandsEnergy_41_48 ),
   f416_fBodyAccJerk_bandsEnergy_49_56_mean=mean( f416_fBodyAccJerk_bandsEnergy_49_56 ),
   f417_fBodyAccJerk_bandsEnergy_57_64_mean=mean( f417_fBodyAccJerk_bandsEnergy_57_64 ),
   f418_fBodyAccJerk_bandsEnergy_1_16_mean=mean( f418_fBodyAccJerk_bandsEnergy_1_16 ),
   f419_fBodyAccJerk_bandsEnergy_17_32_mean=mean( f419_fBodyAccJerk_bandsEnergy_17_32 ),
   f420_fBodyAccJerk_bandsEnergy_33_48_mean=mean( f420_fBodyAccJerk_bandsEnergy_33_48 ),
   f421_fBodyAccJerk_bandsEnergy_49_64_mean=mean( f421_fBodyAccJerk_bandsEnergy_49_64 ),
   f422_fBodyAccJerk_bandsEnergy_1_24_mean=mean( f422_fBodyAccJerk_bandsEnergy_1_24 ),
   f423_fBodyAccJerk_bandsEnergy_25_48_mean=mean( f423_fBodyAccJerk_bandsEnergy_25_48 ),
   f424_fBodyGyro_mean_X_mean=mean( f424_fBodyGyro_mean_X ),
   f425_fBodyGyro_mean_Y_mean=mean( f425_fBodyGyro_mean_Y ),
   f426_fBodyGyro_mean_Z_mean=mean( f426_fBodyGyro_mean_Z ),
   f427_fBodyGyro_std_X_mean=mean( f427_fBodyGyro_std_X ),
   f428_fBodyGyro_std_Y_mean=mean( f428_fBodyGyro_std_Y ),
   f429_fBodyGyro_std_Z_mean=mean( f429_fBodyGyro_std_Z ),
   f430_fBodyGyro_mad_X_mean=mean( f430_fBodyGyro_mad_X ),
   f431_fBodyGyro_mad_Y_mean=mean( f431_fBodyGyro_mad_Y ),
   f432_fBodyGyro_mad_Z_mean=mean( f432_fBodyGyro_mad_Z ),
   f433_fBodyGyro_max_X_mean=mean( f433_fBodyGyro_max_X ),
   f434_fBodyGyro_max_Y_mean=mean( f434_fBodyGyro_max_Y ),
   f435_fBodyGyro_max_Z_mean=mean( f435_fBodyGyro_max_Z ),
   f436_fBodyGyro_min_X_mean=mean( f436_fBodyGyro_min_X ),
   f437_fBodyGyro_min_Y_mean=mean( f437_fBodyGyro_min_Y ),
   f438_fBodyGyro_min_Z_mean=mean( f438_fBodyGyro_min_Z ),
   f439_fBodyGyro_sma_mean=mean( f439_fBodyGyro_sma ),
   f440_fBodyGyro_energy_X_mean=mean( f440_fBodyGyro_energy_X ),
   f441_fBodyGyro_energy_Y_mean=mean( f441_fBodyGyro_energy_Y ),
   f442_fBodyGyro_energy_Z_mean=mean( f442_fBodyGyro_energy_Z ),
   f443_fBodyGyro_iqr_X_mean=mean( f443_fBodyGyro_iqr_X ),
   f444_fBodyGyro_iqr_Y_mean=mean( f444_fBodyGyro_iqr_Y ),
   f445_fBodyGyro_iqr_Z_mean=mean( f445_fBodyGyro_iqr_Z ),
   f446_fBodyGyro_entropy_X_mean=mean( f446_fBodyGyro_entropy_X ),
   f447_fBodyGyro_entropy_Y_mean=mean( f447_fBodyGyro_entropy_Y ),
   f448_fBodyGyro_entropy_Z_mean=mean( f448_fBodyGyro_entropy_Z ),
   f449_fBodyGyro_maxInds_X_mean=mean( f449_fBodyGyro_maxInds_X ),
   f450_fBodyGyro_maxInds_Y_mean=mean( f450_fBodyGyro_maxInds_Y ),
   f451_fBodyGyro_maxInds_Z_mean=mean( f451_fBodyGyro_maxInds_Z ),
   f452_fBodyGyro_meanFreq_X_mean=mean( f452_fBodyGyro_meanFreq_X ),
   f453_fBodyGyro_meanFreq_Y_mean=mean( f453_fBodyGyro_meanFreq_Y ),
   f454_fBodyGyro_meanFreq_Z_mean=mean( f454_fBodyGyro_meanFreq_Z ),
   f455_fBodyGyro_skewness_X_mean=mean( f455_fBodyGyro_skewness_X ),
   f456_fBodyGyro_kurtosis_X_mean=mean( f456_fBodyGyro_kurtosis_X ),
   f457_fBodyGyro_skewness_Y_mean=mean( f457_fBodyGyro_skewness_Y ),
   f458_fBodyGyro_kurtosis_Y_mean=mean( f458_fBodyGyro_kurtosis_Y ),
   f459_fBodyGyro_skewness_Z_mean=mean( f459_fBodyGyro_skewness_Z ),
   f460_fBodyGyro_kurtosis_Z_mean=mean( f460_fBodyGyro_kurtosis_Z ),
   f461_fBodyGyro_bandsEnergy_1_8_mean=mean( f461_fBodyGyro_bandsEnergy_1_8 ),
   f462_fBodyGyro_bandsEnergy_9_16_mean=mean( f462_fBodyGyro_bandsEnergy_9_16 ),
   f463_fBodyGyro_bandsEnergy_17_24_mean=mean( f463_fBodyGyro_bandsEnergy_17_24 ),
   f464_fBodyGyro_bandsEnergy_25_32_mean=mean( f464_fBodyGyro_bandsEnergy_25_32 ),
   f465_fBodyGyro_bandsEnergy_33_40_mean=mean( f465_fBodyGyro_bandsEnergy_33_40 ),
   f466_fBodyGyro_bandsEnergy_41_48_mean=mean( f466_fBodyGyro_bandsEnergy_41_48 ),
   f467_fBodyGyro_bandsEnergy_49_56_mean=mean( f467_fBodyGyro_bandsEnergy_49_56 ),
   f468_fBodyGyro_bandsEnergy_57_64_mean=mean( f468_fBodyGyro_bandsEnergy_57_64 ),
   f469_fBodyGyro_bandsEnergy_1_16_mean=mean( f469_fBodyGyro_bandsEnergy_1_16 ),
   f470_fBodyGyro_bandsEnergy_17_32_mean=mean( f470_fBodyGyro_bandsEnergy_17_32 ),
   f471_fBodyGyro_bandsEnergy_33_48_mean=mean( f471_fBodyGyro_bandsEnergy_33_48 ),
   f472_fBodyGyro_bandsEnergy_49_64_mean=mean( f472_fBodyGyro_bandsEnergy_49_64 ),
   f473_fBodyGyro_bandsEnergy_1_24_mean=mean( f473_fBodyGyro_bandsEnergy_1_24 ),
   f474_fBodyGyro_bandsEnergy_25_48_mean=mean( f474_fBodyGyro_bandsEnergy_25_48 ),
   f475_fBodyGyro_bandsEnergy_1_8_mean=mean( f475_fBodyGyro_bandsEnergy_1_8 ),
   f476_fBodyGyro_bandsEnergy_9_16_mean=mean( f476_fBodyGyro_bandsEnergy_9_16 ),
   f477_fBodyGyro_bandsEnergy_17_24_mean=mean( f477_fBodyGyro_bandsEnergy_17_24 ),
   f478_fBodyGyro_bandsEnergy_25_32_mean=mean( f478_fBodyGyro_bandsEnergy_25_32 ),
   f479_fBodyGyro_bandsEnergy_33_40_mean=mean( f479_fBodyGyro_bandsEnergy_33_40 ),
   f480_fBodyGyro_bandsEnergy_41_48_mean=mean( f480_fBodyGyro_bandsEnergy_41_48 ),
   f481_fBodyGyro_bandsEnergy_49_56_mean=mean( f481_fBodyGyro_bandsEnergy_49_56 ),
   f482_fBodyGyro_bandsEnergy_57_64_mean=mean( f482_fBodyGyro_bandsEnergy_57_64 ),
   f483_fBodyGyro_bandsEnergy_1_16_mean=mean( f483_fBodyGyro_bandsEnergy_1_16 ),
   f484_fBodyGyro_bandsEnergy_17_32_mean=mean( f484_fBodyGyro_bandsEnergy_17_32 ),
   f485_fBodyGyro_bandsEnergy_33_48_mean=mean( f485_fBodyGyro_bandsEnergy_33_48 ),
   f486_fBodyGyro_bandsEnergy_49_64_mean=mean( f486_fBodyGyro_bandsEnergy_49_64 ),
   f487_fBodyGyro_bandsEnergy_1_24_mean=mean( f487_fBodyGyro_bandsEnergy_1_24 ),
   f488_fBodyGyro_bandsEnergy_25_48_mean=mean( f488_fBodyGyro_bandsEnergy_25_48 ),
   f489_fBodyGyro_bandsEnergy_1_8_mean=mean( f489_fBodyGyro_bandsEnergy_1_8 ),
   f490_fBodyGyro_bandsEnergy_9_16_mean=mean( f490_fBodyGyro_bandsEnergy_9_16 ),
   f491_fBodyGyro_bandsEnergy_17_24_mean=mean( f491_fBodyGyro_bandsEnergy_17_24 ),
   f492_fBodyGyro_bandsEnergy_25_32_mean=mean( f492_fBodyGyro_bandsEnergy_25_32 ),
   f493_fBodyGyro_bandsEnergy_33_40_mean=mean( f493_fBodyGyro_bandsEnergy_33_40 ),
   f494_fBodyGyro_bandsEnergy_41_48_mean=mean( f494_fBodyGyro_bandsEnergy_41_48 ),
   f495_fBodyGyro_bandsEnergy_49_56_mean=mean( f495_fBodyGyro_bandsEnergy_49_56 ),
   f496_fBodyGyro_bandsEnergy_57_64_mean=mean( f496_fBodyGyro_bandsEnergy_57_64 ),
   f497_fBodyGyro_bandsEnergy_1_16_mean=mean( f497_fBodyGyro_bandsEnergy_1_16 ),
   f498_fBodyGyro_bandsEnergy_17_32_mean=mean( f498_fBodyGyro_bandsEnergy_17_32 ),
   f499_fBodyGyro_bandsEnergy_33_48_mean=mean( f499_fBodyGyro_bandsEnergy_33_48 ),
   f500_fBodyGyro_bandsEnergy_49_64_mean=mean( f500_fBodyGyro_bandsEnergy_49_64 ),
   f501_fBodyGyro_bandsEnergy_1_24_mean=mean( f501_fBodyGyro_bandsEnergy_1_24 ),
   f502_fBodyGyro_bandsEnergy_25_48_mean=mean( f502_fBodyGyro_bandsEnergy_25_48 ),
   f503_fBodyAccMag_mean_mean=mean( f503_fBodyAccMag_mean ),
   f504_fBodyAccMag_std_mean=mean( f504_fBodyAccMag_std ),
   f505_fBodyAccMag_mad_mean=mean( f505_fBodyAccMag_mad ),
   f506_fBodyAccMag_max_mean=mean( f506_fBodyAccMag_max ),
   f507_fBodyAccMag_min_mean=mean( f507_fBodyAccMag_min ),
   f508_fBodyAccMag_sma_mean=mean( f508_fBodyAccMag_sma ),
   f509_fBodyAccMag_energy_mean=mean( f509_fBodyAccMag_energy ),
   f510_fBodyAccMag_iqr_mean=mean( f510_fBodyAccMag_iqr ),
   f511_fBodyAccMag_entropy_mean=mean( f511_fBodyAccMag_entropy ),
   f512_fBodyAccMag_maxInds_mean=mean( f512_fBodyAccMag_maxInds ),
   f513_fBodyAccMag_meanFreq_mean=mean( f513_fBodyAccMag_meanFreq ),
   f514_fBodyAccMag_skewness_mean=mean( f514_fBodyAccMag_skewness ),
   f515_fBodyAccMag_kurtosis_mean=mean( f515_fBodyAccMag_kurtosis ),
   f516_fBodyBodyAccJerkMag_mean_mean=mean( f516_fBodyBodyAccJerkMag_mean ),
   f517_fBodyBodyAccJerkMag_std_mean=mean( f517_fBodyBodyAccJerkMag_std ),
   f518_fBodyBodyAccJerkMag_mad_mean=mean( f518_fBodyBodyAccJerkMag_mad ),
   f519_fBodyBodyAccJerkMag_max_mean=mean( f519_fBodyBodyAccJerkMag_max ),
   f520_fBodyBodyAccJerkMag_min_mean=mean( f520_fBodyBodyAccJerkMag_min ),
   f521_fBodyBodyAccJerkMag_sma_mean=mean( f521_fBodyBodyAccJerkMag_sma ),
   f522_fBodyBodyAccJerkMag_energy_mean=mean( f522_fBodyBodyAccJerkMag_energy ),
   f523_fBodyBodyAccJerkMag_iqr_mean=mean( f523_fBodyBodyAccJerkMag_iqr ),
   f524_fBodyBodyAccJerkMag_entropy_mean=mean( f524_fBodyBodyAccJerkMag_entropy ),
   f525_fBodyBodyAccJerkMag_maxInds_mean=mean( f525_fBodyBodyAccJerkMag_maxInds ),
   f526_fBodyBodyAccJerkMag_meanFreq_mean=mean( f526_fBodyBodyAccJerkMag_meanFreq ),
   f527_fBodyBodyAccJerkMag_skewness_mean=mean( f527_fBodyBodyAccJerkMag_skewness ),
   f528_fBodyBodyAccJerkMag_kurtosis_mean=mean( f528_fBodyBodyAccJerkMag_kurtosis ),
   f529_fBodyBodyGyroMag_mean_mean=mean( f529_fBodyBodyGyroMag_mean ),
   f530_fBodyBodyGyroMag_std_mean=mean( f530_fBodyBodyGyroMag_std ),
   f531_fBodyBodyGyroMag_mad_mean=mean( f531_fBodyBodyGyroMag_mad ),
   f532_fBodyBodyGyroMag_max_mean=mean( f532_fBodyBodyGyroMag_max ),
   f533_fBodyBodyGyroMag_min_mean=mean( f533_fBodyBodyGyroMag_min ),
   f534_fBodyBodyGyroMag_sma_mean=mean( f534_fBodyBodyGyroMag_sma ),
   f535_fBodyBodyGyroMag_energy_mean=mean( f535_fBodyBodyGyroMag_energy ),
   f536_fBodyBodyGyroMag_iqr_mean=mean( f536_fBodyBodyGyroMag_iqr ),
   f537_fBodyBodyGyroMag_entropy_mean=mean( f537_fBodyBodyGyroMag_entropy ),
   f538_fBodyBodyGyroMag_maxInds_mean=mean( f538_fBodyBodyGyroMag_maxInds ),
   f539_fBodyBodyGyroMag_meanFreq_mean=mean( f539_fBodyBodyGyroMag_meanFreq ),
   f540_fBodyBodyGyroMag_skewness_mean=mean( f540_fBodyBodyGyroMag_skewness ),
   f541_fBodyBodyGyroMag_kurtosis_mean=mean( f541_fBodyBodyGyroMag_kurtosis ),
   f542_fBodyBodyGyroJerkMag_mean_mean=mean( f542_fBodyBodyGyroJerkMag_mean ),
   f543_fBodyBodyGyroJerkMag_std_mean=mean( f543_fBodyBodyGyroJerkMag_std ),
   f544_fBodyBodyGyroJerkMag_mad_mean=mean( f544_fBodyBodyGyroJerkMag_mad ),
   f545_fBodyBodyGyroJerkMag_max_mean=mean( f545_fBodyBodyGyroJerkMag_max ),
   f546_fBodyBodyGyroJerkMag_min_mean=mean( f546_fBodyBodyGyroJerkMag_min ),
   f547_fBodyBodyGyroJerkMag_sma_mean=mean( f547_fBodyBodyGyroJerkMag_sma ),
   f548_fBodyBodyGyroJerkMag_energy_mean=mean( f548_fBodyBodyGyroJerkMag_energy ),
   f549_fBodyBodyGyroJerkMag_iqr_mean=mean( f549_fBodyBodyGyroJerkMag_iqr ),
   f550_fBodyBodyGyroJerkMag_entropy_mean=mean( f550_fBodyBodyGyroJerkMag_entropy ),
   f551_fBodyBodyGyroJerkMag_maxInds_mean=mean( f551_fBodyBodyGyroJerkMag_maxInds ),
   f552_fBodyBodyGyroJerkMag_meanFreq_mean=mean( f552_fBodyBodyGyroJerkMag_meanFreq ),
   f553_fBodyBodyGyroJerkMag_skewness_mean=mean( f553_fBodyBodyGyroJerkMag_skewness ),
   f554_fBodyBodyGyroJerkMag_kurtosis_mean=mean( f554_fBodyBodyGyroJerkMag_kurtosis ),
   f555_angletBodyAccMean_gravity_mean=mean( f555_angletBodyAccMean_gravity ),
   f556_angletBodyAccJerkMean_gravityMean_mean=mean( f556_angletBodyAccJerkMean_gravityMean ),
   f557_angletBodyGyroMean_gravityMean_mean=mean( f557_angletBodyGyroMean_gravityMean ),
   f558_angletBodyGyroJerkMean_gravityMean_mean=mean( f558_angletBodyGyroJerkMean_gravityMean ),
   f559_angleX_gravityMean_mean=mean( f559_angleX_gravityMean ),
   f560_angleY_gravityMean_mean=mean( f560_angleY_gravityMean ),
   f561_angleZ_gravityMean_mean=mean( f561_angleZ_gravityMean ),
   body_acc_x_mean_mean=mean( body_acc_x_mean ),
   body_acc_x_sd_mean=mean( body_acc_x_sd ),
   body_acc_y_mean_mean=mean( body_acc_y_mean ),
   body_acc_y_sd_mean=mean( body_acc_y_sd ),
   body_acc_z_mean_mean=mean( body_acc_z_mean ),
   body_acc_z_sd_mean=mean( body_acc_z_sd ),
   body_gyro_x_mean_mean=mean( body_gyro_x_mean ),
   body_gyro_x_sd_mean=mean( body_gyro_x_sd ),
   body_gyro_y_mean_mean=mean( body_gyro_y_mean ),
   body_gyro_y_sd_mean=mean( body_gyro_y_sd ),
   body_gyro_z_mean_mean=mean( body_gyro_z_mean ),
   body_gyro_z_sd_mean=mean( body_gyro_z_sd ),
   total_acc_x_mean_mean=mean( total_acc_x_mean ),
   total_acc_x_sd_mean=mean( total_acc_x_sd ),
   total_acc_y_mean_mean=mean( total_acc_y_mean ),
   total_acc_y_sd_mean=mean( total_acc_y_sd ),
   total_acc_z_mean_mean=mean( total_acc_z_mean ),
   total_acc_z_sd_mean=mean( total_acc_z_sd )
   )

print ("Writing tidy data to data_set.txt") 
write.table(data_mean, "data_set.txt", row.names=FALSE) 


