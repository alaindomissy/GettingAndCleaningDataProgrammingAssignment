Getting and Cleaning Data
=========================

Introduction :
--------------

This is my peer assessment project for the [Getting and Cleaning Data](https://class.coursera.org/getdata-002) course by [Jeffery Leek](http://www.biostat.jhsph.edu/~jleek/publications.html) from [Johns Hopkins University](https://www.coursera.org/jhu). This course is part of the [Coursera](https://www.coursera.org/) Data Science Signature Track.

This project's objective is to perform preliminary collecting and clean up analysis on a data set originating from the wearable computing area. The data set used as input for this project can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). A full description of this data set is available at the [UCI Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This repository contains :
--------------------------
* tidydataset2.txt : a space-delimited text file that provides a tidy data set as described below
* run_analysis.R : an R script that takes input data files as described below, performs clean up analysis and produces tidydataset.txt
* CodeBook.md : a markdown document describing the variables and data in tidydataset.txt, the assumpions and the applied processing 
* README.md : a markdown document giving a general explanation of the project and how the run_analysis.R script work   

Input Data Files :
------------------
The following input data files are required :
* X_train.txt
* X_test.txt
* y_train.txt
* y_test.txt
* subject_train.txt
* subject_test.txt
* features.txt
* activity_labels.txt

These files need to be present inside a subdirectory "input" which should exist in the same directory as the run_analysis.R script


Data clean up processing performed by the run_analysis.R script :
-----------------------------------------------------------------
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Saves this cleaned up intermediary data set in a space-delimited text file tidydataset1.txt
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject, this is saved in a space-delimited text file tidydataset2.txt

How to use the run_analysis.R script :
--------------------------------------
* Extract the downloaded zip dile to a folder named input 
* Place the input folder and the run_analysis.R in te same folder
* Set this folder as working directory in R or R-Studio.
* Run the script.
* Two files as descibed above will be created in the working directory: 
  "tidydataset1.txt" and "tidydataset2.txt"
* Perform further any data analysis you want

