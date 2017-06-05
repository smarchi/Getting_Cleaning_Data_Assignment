# Codebook for "feature_mean.txt" dataset

The `feature_mean.txt` dataset was constructed from the data collected from the accelorometer and gyroscope from a Samsung Galaxy S II smartphone for different subjects performing different activities (the original dataset is included in the GitHub repository). It contains the mean values for different features of the raw dataset, for every subject and every activity.

In order to obtain this dataset, the following steps were performed over the raw data: 

1. A test and a train data frames were created by joining the subjects, the activities they performed and the data obtained for all the features for the test and train samples.
1. This two data frames were joint to create a general data frame containing all the feature information from the experiment. The first column is the subject, the second is the activity and each of the remaining columns contains a feature.
1. Only the features containing the `mean()` or `std()` tags in their name were selected.
1. Descriptive names were given to every numerical value in the activity column, according to the activity labels specified in the raw data. All names were lowercased and spaces replaced by underscores.
1. Descriptive names were given to the variables and follow the nomenclature established in the `feature_info.txt` file in the raw data, with minor variations for better variable handling in the tidy dataset (see variable description below for details).
1. This dataset was grouped by subject and activity and for each feature a mean value was calculated.
1. The data frame was saved in a text file.

The data frame in `feature_mean.txt` constitutes a tidy dataset, since every column contains only one variable and every row contains only one measurement for every variable.

## Variable description

* `subject`: Value from 1 to 30. Represents an id for every person perfoming the different activities.

* `activity`: The activity performed by the subject, which can be laying, sitting, standing, walking, walking downstairs and walking upstairs. They are denoted by the keywords `laying`, `sitting`, `standing`, `walking_downstairs` and `walking_downstairs`, respectively.

* Feature variables: Mean values of the selected features from the raw data. Every feature is contained in one column of the tidy dataset. The features considered are: `tBodyAcc[axis]_[func]`, `tGravity[axis]_[func]`, `tBodyAccJerk[axis]_[func]`, `tBodyGyro[axis]_[func]`, `tBodyGyroJerk[axis]_[func]`, `tBodyAccMag_[func]`, `tGravityAccMag_[func]`, `tBodyAccJerkMag_[func]`, `tBodyGyroMag_[func]`, `tBodyGyroJerkMag_[func]`, `fBodyAcc[axis]_[func]`, `fBodyAccJerk[axis]_[func]`, `fBodyGyro[axis]_[func]`, `fBodyAccMag_[func]`, `fBodyAccJerkMag_[func]`, `fBodyGyroMag_[func]`, `fBodyGyroJerkMag_[func]`. The `[axis]` part of each variable name can be X, Y or Z, one for every three dimensions axis. The `[func]` part can be `mean` or `std`, indicating if the variable is the mean or the standard deviation value, respectively, of the feature measured in the raw data. The total number of features considered in the tidy data is 66 and each one is located in a different column. Finally, the possible value for every feature is bounded within [-1,1]. Values are dimensionless.