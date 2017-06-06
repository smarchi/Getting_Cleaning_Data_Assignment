# Analysis procedure

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

# How to run the script

To run the `run_analysis.R` script, go to the directory whre th script is and type in a R console

```
source("run_analysis.R")
```
# How to read the tidy dataset table

To read the tidy dataset table produced by `run_analysis.R`, named `feature_mean.txt`, go to the directory where the script is located and type in a R console

```
read.table("feature_mean.txt", header = TRUE)
```