import math
import random
import numpy

from scipy.io import loadmat
import matplotlib.pyplot as matplot
from sklearn import decomposition, naive_bayes, discriminant_analysis


# REFERENCES
#Loading mat files: https://towardsdatascience.com/how-to-load-matlab-mat-files-in-python-1f200e1287b5


#Importing data matrix and populating numpy arrays
matrix = loadmat('digits.mat')
d = numpy.ones((5000, 401))
d[:, 0:400] = numpy.array(matrix['digits'])
d[:, 400:401] = numpy.array(matrix['labels'])

# Generating the sort element array
argsrt = numpy.argsort(d[:, 400])
d = d[argsrt]

# Adding up the elements in rows for all digits
totals = numpy.empty((10, 1))
for x in range(10):
    totals[x, 0] = sum(d[:, 400][:] == x)

# Creating training set array from data
trainingSet = numpy.array(numpy.ones((1, 401)))
for x in range(10):
    maxVal = math.ceil(totals[x][0]/2)
    for y in range(maxVal):
        index = numpy.where(d[:, 400] == x)[0]
        sel = random.choice(index)
        trainingSet = numpy.append(trainingSet, d[sel:sel+1, :], axis=0)
		#nagating values for lower bounds in later comparisons
        d[sel] = numpy.ones((1, 401)) * -1

# Populating test comparison data
testComparison = d[numpy.where(d[:, 0] != -1)[0]]
trainingSet = trainingSet[1:2502, :]
testComparisonLabels = testComparison[:, 400]
trainingSetLabels = trainingSet[:, 400]
trainingSet = trainingSet[:, 0:400]
testComparison = testComparison[:, 0:400]

# Question 1

# Using PCA to find new set of bases
pcaOut = decomposition.PCA(n_components=400)
pcaOut.fit(trainingSet)
eigenvalues = pcaOut.explained_variance_
matplot.plot(eigenvalues)
# matplot.show()

# Finding sample mean of training data
pca_data_mean = pcaOut.mean_.reshape(20, 20).T
pca_image_mean = matplot.imshow(pca_data_mean)
# matplot.show() 

# Showing eigenvectors chosen in part 1.1
pcaOut = decomposition.PCA(n_components=70)
pcaOut.fit(trainingSet)
components = pcaOut.components_
for x in range(70):
	# Incrementing smaller subplots
    matplot.subplot(7, 10, x + 1)
    matplot.axis("off")
    matplot.imshow((components[x]).reshape(20, 20).T)
# matplot.show()


# Initializing classifier
classifier = naive_bayes.GaussianNB()

# //Initializzing data arrays
testResults = numpy.ones((20, 2))
trainingOutput = numpy.ones((20, 2))

# Choosing 20 random components
for x in range(20):
    x += 1
    pcaOut = decomposition.PCA(n_components= x * 20)
    pcaOut.fit(trainingSet)
    trainingProjection = pcaOut.transform(trainingSet)
    testResultsProjection = pcaOut.transform(testComparison)

	# Fitting data to the trained classifier and outputting data
    classifier.fit(trainingProjection, trainingSetLabels)
    testResultsPrediction = classifier.predict(testResultsProjection)
    trainingPrediction = classifier.predict(trainingProjection)

    accSum = sum(testResultsPrediction == testComparisonLabels)
    testAccumulative = accSum / len(testComparisonLabels)
    accSum = sum(trainingPrediction == trainingSetLabels)
    trainingAccumulative = accSum / len(trainingSetLabels)
    testResults[x - 1, 0] = x * 10
    testResults[x - 1, 1] = testAccumulative
    trainingOutput[x - 1, 0] = x * 10
    trainingOutput[x - 1, 1] = trainingAccumulative

# Printing the test and traning projection results
# print( testResults)
# print( trainingOutput)

# Displaying the plots
matplot.plot(testResults[:, 0], 1 - testResults[:, 1], label="testComparison")
matplot.plot(trainingOutput[:, 0], 1 - trainingOutput[:, 1], label="trainingSet")
# matplot.show()

# Displaying the accuracy plots
matplot.plot(testResults[:, 0], testResults[:, 1], label="testComparison")
matplot.plot(trainingOutput[:, 0], trainingOutput[:, 1], label="trainingSet")
# matplot.show()


# Question 2

# Obtaining a new set of bases using LDA
ldaOut = discriminant_analysis.LinearDiscriminantAnalysis(n_components=None)
ldaOut.fit(X=trainingSet, y=trainingSetLabels)
coefs = ldaOut.coef_
for x in range(10):
    matplot.subplot(5, 2, x + 1)
    matplot.imshow((ldaOut.coef_[x]).reshape(20, 20).T)
# matplot.show()

#Projection data using for subspaces between 1 and 9
ldaTestResults = numpy.ones((9, 2))
ldaTrainingResults = numpy.ones((9, 2))
for x in range(1, 10):

    # Projecting the data
    ldaOut = discriminant_analysis.LinearDiscriminantAnalysis( n_components=x)
    ldaOut.fit(X=trainingSet, y=trainingSetLabels)

    # Transforming data using matrix
    ldaTest = ldaOut.transform(X=testComparison)
    ldaTrain = ldaOut.transform(X=trainingSet)

    classifier.fit(ldaTrain, trainingSetLabels)
    ldaTestPrediction = classifier.predict(ldaTest)
    ldaTrainingPrediction = classifier.predict(ldaTrain)

    accSum = sum(ldaTestPrediction == testComparisonLabels)
    testDataAccuracy = accSum /len(testComparisonLabels)
    accSum = sum(ldaTrainingPrediction == trainingSetLabels)
    trainingDataAccuracy = accSum /len(trainingSetLabels)

    ldaTestResults[x -1, 0] = x
    ldaTestResults[x -1, 1] = testDataAccuracy
    ldaTrainingResults[x -1, 0] = x
    ldaTrainingResults[x -1, 1] = trainingDataAccuracy

# print( ldaTestResults)
# print()
# print( ldaTrainingResults)

# Plotting classificatio erron
matplot.plot(ldaTestResults[:, 0], ldaTestResults[:, 1], label="testComparison")
matplot.plot(ldaTrainingResults[:, 0], ldaTrainingResults[:, 1], label="trainingSet")
# matplot.show()



