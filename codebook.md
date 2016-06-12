
# Human Activity Recognition Using Smartphones Data Set
## Abstract
Human Activity Recognition database built from the recordings of 30 subjects performing activities
of daily living (ADL) while carrying a waist mounted smartphone with embedded inertial sensors.

__Data Set Characteristics__: Multivariate, TimeSeries

__Number of Instances__(Rows) : 10299
 
__Number of Attributes__(Columns): 581 

## Source
Jorge L. ReyesOrtiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)

1. Smartlab NonLinear Complex Systems Laboratory
DITEN -- Università degli Studi di Genova, Genoa (I16145), Italy.

2. CETpD Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws


## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19--48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured triaxial
linear acceleration and triaxial angular velocity at a constant rate of 50Hz. The experiments have been videorecorded
to label the data manually.

The sensor signals (accelerometer and gyroscope) were preprocessed by applying noise filters and then sampled in fixedwidth
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth lowpass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. At last, the 128 samples in the same window are applied "mean" and "standard deviation", and only these 2 values are preserved.

The above sensor signals, as well as the other processed 561 variables, are averaged by each activity and each subject. 

## Attribute Information
1. Column 1 "activity", name of the activity. Values are in activity_labels.txt .
2. Column 2 "subject",  the subjects that perform the test, value from 1-30.
3. Column 3 to 563 are 561 values with names processed(replace special charactors) from features.txt. The descriptions for the features are in feature_info.txt and features.txt . 
4. Column 564 to 569 are the body_accelection triaxis data, which is the total acceleration minus the g. Mean and standard deviation of x,y,z samples. 
5. Column 570 to 575 are the gyroscope triaxis data. Mean and standard deviation of x,y,z samples. 
5. Column 576 to 581 are triaxial acceleration from the accelerometer (total acceleration). Mean and standard deviation of x,y,z samples. 
 

## Process
The original data from the [UCI web site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) has been processed in the following manner: 

1. The training set(7352 rows) and the test set(2947 rows) are merged. That makes up to 10299 rows. 

2. The triaxis measurements (body acceleration, total acceleration, and gyroscope) are __only__ extracted by mean and standard deviation. The 128 samples are discarded. 

3. Use descriptive activity names instead of the integer identifier. However the mapping from the identifier to the names are reserved in activity_labels.txt . 

4. The 561 measurements are named with descriptive variable names. The names are also in features.txt, and features_info.txt. 

5. All the data processed are merged into a big data matrix. 

6. The above data from point #2 and #4, are averaged by each activity and each subject. 





