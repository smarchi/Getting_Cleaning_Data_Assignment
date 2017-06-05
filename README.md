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