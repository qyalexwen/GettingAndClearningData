
# Human Activity Recognition Using Smartphones Data Set
**Abstract**: Human Activity Recognition database built from the recordings of 30 subjects performing activities
of daily living (ADL) while carrying a waist mounted smartphone with embedded inertial sensors.

## Data field list
The data set has 10299 rows and 581 columns. 

### Rows 
The 10299 rows are composed of the training data ( 7352 rows) and the testing data set (2947 rows). 

### Columns
The 581 columns are composed of 

1. Column 1 "subject", is merged from subject_train.txt and subject_test.txt 
2. Column 2 "activity", is merged from y_train.txt and y_test.txt, and joined with activity_labels.txt to use the acitivity description instead of the integer identifier. 
3. Column 3 to 563 are merged from X_train.txt and X_test.txt, with names copied from features.txt. The descriptions for the features are in feature_info.txt 
4. Column 564 to 569 are the body_accelection triaxis triaxis data 
5. Column 570 to 575 are the gyroscope triaxis data
5. Column 576 to 581 are triaxial acceleration from the accelerometer (total acceleration)
 


