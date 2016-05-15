# Getting and Cleaning Data homework project. 

## Process
The original data from the [UCI web site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) has been processed in the following manner: 

1. The training set(7352 rows) and the test set(2947 rows) are merged. That makes up to 10299 rows. 

2. The triaxis measurements (body acceleration, total acceleration, and gyroscope) are __only__ extracted by mean and standard deviation. The 128 samples are discarded. 

3. Use descriptive activity names instead of the integer identifier. However the mapping from the identifier to the names are reserved in activity_labels.txt . 

4. The 561 measurements are named with descriptive variable names. The names are also in features.txt, and features_info.txt. 

5. All the data processed are merged into a big data matrix. 

## Files

|File name              |  Description  |
|-----------------------|:-------------:|
|result.zip(result.csv) |  The data set result.csv is compressed into this zip file.               |
|codebook.md            |  The codebook that describes the data set.            |
|readme.md              | This file.                                            |  
|run_analysis.R         |The script file in R and does the above 1-5 process.   |
|activity_labels.txt    |The mapping between identifier and the activity names. |
|features.txt           |A list of the 561 values                               | 
|features_info.txst     | Description of the 561 features.                      | 






 

