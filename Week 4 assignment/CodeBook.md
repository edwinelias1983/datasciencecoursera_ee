---
title: "Codebook"
author: "EE"
date: "3/15/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Assignment 4: CODE BOOK INTRODUCTION
**INTRODUCTION**

This creation of this codebook is used for:
  •	To provide documentation of the data cleaning process and providing relevant information.
  •	To interpret the tidy.txt variables.
This version has been modified from the original code book provided by the Coursera Data Science Specialization- course 3: Peer-graded Assignment- Getting and Cleaning Course Assignment. To access the data see:<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## Analysis

**1.	Read in the files and merge data:** Data  is from the UCI Human Activity Recognition Using Smartphones Data Set.  

  a.	Files: activity_labels.txt;features_info.txt; and features.txt
  
  b.	Training data: X_train.txt; Y_train.txt; and subject_train.txt
  
  c.	Test data: X_train.txt; Y_train.txt
  
  d.	Merge all training files to create one training data set
  
  e.  Merge all test files to create on test data set
  
  f.  Merge test and training data sets 
  
**2.	Extract only the mean and standrd deviation of the measurement** 

  a.  Keep subid(subject id) and columns related to actlabel(activity)
  
  b.  Identify column names that contain 'mean' or 'std(standard deviatio)'
  
**3.	Use descriptive activity names to name the activities in the data set.**

  a.  Change actlabel from 1-6 to the following: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
  
**4.	Appropriately label the data set with descriptive variables names.**

  a.  Make column names easier to read and remove ()
  
  b.  For feature description see "Variable Selection" below
  
**5.	From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and subject.** 

  a. Use group_by to group the data set by subject id(subid) and activity (actlabel)

  b. Provide a summary of grouped data and provide the mean of each variable 

## VARIABLE SELECTION

**According to the UCI Data Set Description:**

**For more information see:**<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals    tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a     constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

## Variables

**Time signals**

- tBodyAcc-XYZ
  
- tGravityAcc-XYZ
  
- tBodyAccJerk-XYZ
  
- tBodyGyro-XYZ
  
- tBodyGyroJerk-XYZ
  
- tBodyAccMag
  
- tGravityAccMag
  
- tBodyAccJerkMag
  
- tBodyGyroMag
  
- tBodyGyroJerkMag
  
**Frequency domain signals**

- fBodyAcc-XYZ
  
- fBodyAccJerk-XYZ
  
- fBodyGyro-XYZ
  
- fBodyAccMag
  
- fBodyAccJerkMag
  
- fBodyGyroMag
  
- fBodyGyroJerkMag


**Variables that were estimated from these signals are:** 

- Mean value: mean()

- Standard Deviation: std()

**Additional Variables**

- gravityMean
  
- tBodyAccMean
  
- tBodyAccJerkMean
  
- tBodyGyroMean
  
- tBodyGyroJerkMea


**REFERENCE**

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.



Helpful Resources to complete this assignment:

- <https://regexone.com/>: Useful interactive website that helps to understand regular expressions.

-  rstudio tutorial: https://rstudio-pubs-static.s3.amazonaws.com/74603_76cd14d5983f47408fdf0b323550b846.html

-  https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html

-  Dyplr: <https://dplyr.tidyverse.org/articles/grouping.html>
    - helpful with group_by()
    
-  tidyr: <https://tidyr.tidyverse.org/reference/index.html#section-rectangling>

-  readr: <https://readr.tidyverse.org/reference/read_delim.html>
    - helpful with read_csv 





