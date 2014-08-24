CodeBook for datasets produced by run_analysis.R
================================================

Introduction
------------
This file describes the data, the variables, and the work that has been performed to clean up the data.

Data Set Description
--------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record the provided data is as follows
-----------------------------------------------

1.  Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
2.  Triaxial Angular velocity from the gyroscope.
3.  A 561-feature vector with time and frequency domain variables.
4.  Its activity label.
5,  An identifier of the subject who carried out the experiment.



The resulting Data Sets are derived from [1].
---------------------------------------------
The differences from the original data set:

1.  Training and test sets are merged together.
2.  All variables are merged together.
3.  The resulting data frame is labeled.
4.  The activity field uses the activity names instead of numeric indicators.
5.  Only the variables listing means and Standard Deviations are included.
6.  The second data set groups all data by subject and activity, averaging over all observations.

Both data sets list observations over 81 variables:

	subject lists the subjects assigned number in the original experiment[1].

	activity is a factor indicating the activity type:

Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS

Reference:
----------
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012