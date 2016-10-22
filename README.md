# Pattern Recognition - Arrhytmia
MASCHINELLES LERNEN - ARRHYTMIA

To start the algorithms you only have to start the main_knn or the main_nn script. These scripts load automatically the data from the /data folder and perform a preprocessing (you find it in the similar named script) to the data. After that the learning algorithms train and test for several times (you can configure that with the parameter xval). Finally you will see a plot with the accuracy of the algorithm in percent.

# Note:

Because of the bad distribution of examples on the 16 different classes (some classes have less than five or even zero examples) we decided to map all examples in two classes:
1 - normal
2 - disease

# Result:

You will find the results of the two used algorithms as .jpg file in the same directory as the main-files.
