
# Human Activity Recognition Using Smartphones Data Set
## Abstract
Human Activity Recognition database built from the recordings of 30 subjects performing activities
of daily living (ADL) while carrying a waist mounted smartphone with embedded inertial sensors.
**Data Set Characteristics**: Multivariate, TimeSeries
** Number of Instances **(Rows) : 10299
** Number of Attributes: **(Columns): 581 

### Instances 
The 10299 rows are composed of the training data ( 7352 rows) and the testing data set (2947 rows). 

**Source** :
Jorge L. ReyesOrtiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1. Smartlab NonLinear Complex Systems Laboratory
DITEN -- Università degli Studi di Genova, Genoa (I16145), Italy.
2. CETpD Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

### Attributes 
1. Column 1 "subject", is merged from subject_train.txt and subject_test.txt 
2. Column 2 "activity", is merged from y_train.txt and y_test.txt, and joined with activity_labels.txt to use the acitivity description instead of the integer identifier. 
3. Column 3 to 563 are merged from X_train.txt and X_test.txt, with names copied from features.txt. The descriptions for the features are in feature_info.txt 
4. Column 564 to 569 are the body_accelection triaxis triaxis data 
5. Column 570 to 575 are the gyroscope triaxis data
5. Column 576 to 581 are triaxial acceleration from the accelerometer (total acceleration)
 
## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19--48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured triaxial
linear acceleration and triaxial angular velocity at a constant rate of 50Hz. The experiments have been videorecorded
to label the data manually.

The sensor signals (accelerometer and gyroscope) were preprocessed by applying noise filters and then sampled in fixedwidth
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth lowpass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. At last, the 128 samples in the same window are applied "mean" and "standard deviation", and only these 2 values are preserved.










