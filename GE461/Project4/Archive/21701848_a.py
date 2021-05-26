import matplotlib.pyplot as matplot
import numpy

import sklearn.cluster as skcluster
import sklearn.decomposition as skdecomp

import pandas

# Importing data and sanitizing it
dataset = pandas.read_csv(
    'falldetection_dataset.csv',
    header=None)
dataset = dataset.loc[:, 1:]

# Importing features and labels from data
datafeatures = numpy.array(dataset.loc[:, 2:])
datalabels = numpy.array(dataset.loc[:, 1]).reshape(566, 1)


# Sanitizing the data for our usage as 1 and 0
datalabels[datalabels == 'NF'] = 0
datalabels[datalabels == 'F'] = 1

# Doing Principal component analysis and setting it up
# Reducing feature variance
principalAnalysis = skdecomp.PCA(n_components=2)
principalAnalysis.fit(datafeatures)
variance_full = principalAnalysis.explained_variance_ratio_
reducedFeaturesPCA = principalAnalysis.transform(datafeatures)

# Updating all indexes in regards to fall or no fall
nofails = datalabels[:, 0] == 0
fails = datalabels[:, 0] == 1

# plotting first scatter with original data labels
matplot.scatter(reducedFeaturesPCA[fails][:, 0],
                reducedFeaturesPCA[fails][:, 1], label='Fall', c='coral')
matplot.scatter(reducedFeaturesPCA[nofails][:, 0],
                reducedFeaturesPCA[nofails][:, 1], label='NoFall',  c='yellow')
matplot.legend()
matplot.title("Plot (Original data labels)")
matplot.savefig('Plot (Original data labels)', dpi=300)
matplot.show()


# DDeleting the first outlier
outlier1 = numpy.argwhere(
    reducedFeaturesPCA[:, 0] == max(reducedFeaturesPCA[:, 0]))[0, 0]
new_datafeatures = numpy.delete(reducedFeaturesPCA, outlier1, axis=0)
new_datalabels = numpy.delete(datalabels, outlier1)

# Deleting second outlier
outlier2 = numpy.argwhere(
    new_datafeatures[:, 1] == max(new_datafeatures[:, 1]))[0, 0]
new_datafeatures = numpy.delete(new_datafeatures, outlier2, axis=0)
new_datalabels = numpy.delete(
    new_datalabels, outlier2).reshape(len(new_datafeatures), 1)


# Plotting with new indexes
fails_new = new_datalabels[:, 0] == 1
nofails_new = new_datalabels[:, 0] == 0

matplot.scatter(new_datafeatures[fails_new][:, 0],
                new_datafeatures[fails_new][:, 1], label='Fall', c="coral")
matplot.scatter(new_datafeatures[nofails_new][:, 0],
                new_datafeatures[nofails_new][:, 1], label='NoFall', c="yellow")
matplot.title("Plot (Initial datalabels | without Outliers)")
matplot.legend()
matplot.savefig('Plot (Initial datalabels | without Outliers)', dpi=300)
matplot.show()


# Non-outlier full featured data preparation for PCA
datafeatures_nooutlier = numpy.delete(datafeatures, outlier1, axis=0)
datalabels_nooutlier = numpy.delete(datalabels, outlier1)
datafeatures_nooutlier = numpy.delete(
    datafeatures_nooutlier, outlier2, axis=0)
datalabels_nooutlier = numpy.delete(
    datalabels_nooutlier, outlier2).reshape(564, 1)

# PCA on non outlier data
principalAnalysis.fit(datafeatures_nooutlier)
varianceNonOutlier = principalAnalysis.explained_variance_ratio_
rfpcaNoOutlierss = principalAnalysis.transform(datafeatures_nooutlier)
fails = datalabels_nooutlier[:, 0] == 1
nofails = datalabels_nooutlier[:, 0] == 0

# Plotting with non outlier data and reduced data
matplot.scatter(
    rfpcaNoOutlierss[fails][:, 0], rfpcaNoOutlierss[fails][:, 1], label='Fall', c="coral")
matplot.scatter(rfpcaNoOutlierss[nofails][:, 0],
                rfpcaNoOutlierss[nofails][:, 1], label='NoFall', c="yellow")
matplot.title("Dimension Reduction Without Outliers")
matplot.legend()
matplot.savefig('Plot (Initial datalabels)', dpi=300)
matplot.show()

# Setting up kmeans clustering
clusters = 2
KmeansC = skcluster.KMeans(n_clusters=clusters)
KmeansC.fit(reducedFeaturesPCA)
predictionL = KmeansC.labels_

fails = predictionL == 1
nofails = predictionL == 0

matplot.scatter(reducedFeaturesPCA[fails][:, 0],
                reducedFeaturesPCA[fails][:, 1], label="Fall", c='coral')
matplot.scatter(reducedFeaturesPCA[nofails][:, 0],
                reducedFeaturesPCA[nofails][:, 1], label="NoFall", c='yellow')
matplot.title("KMeans Clustering n=2")
matplot.legend()
matplot.savefig('KMeans Clustering n=2', dpi=300)
matplot.show()

print("Accuracy of Kmeans: " +
      str(sum(predictionL != datalabels.reshape(566,)) / 566))


# Non outlier data clustering
KmeansC = skcluster.KMeans(n_clusters=clusters)
KmeansC.fit(rfpcaNoOutlierss)
predictionL = KmeansC.labels_
fails = predictionL == 0
nofails = predictionL == 1

matplot.scatter(rfpcaNoOutlierss[fails][:, 0],
                rfpcaNoOutlierss[fails][:, 1], label="Fall", c='coral')
matplot.scatter(rfpcaNoOutlierss[nofails][:, 0],
                rfpcaNoOutlierss[nofails][:, 1], label="NoFall", c='yellow')
matplot.title("KMeans Clustering (Non-outlier Data) n=2")
matplot.legend()
matplot.savefig('KMeans Clustering (Non-outlier Data) n=2', dpi=300)
matplot.show()

print("Accuracy of Kmeans" +
      str(sum(predictionL == datalabels_nooutlier.reshape(564,)) / 564))

clusters = numpy.array([4, 6, 8, 10, 12], dtype=int)
for k in clusters:
    KmeansC = skcluster.KMeans(n_clusters=k)
    KmeansC.fit(reducedFeaturesPCA)
    predictionL = KmeansC.labels_
    labls = numpy.unique(predictionL)
    filename = 'Full-Data KMeans n_' + str(k)
    for i in labls:
        matplot.scatter(
            reducedFeaturesPCA[predictionL == i][:, 0], reducedFeaturesPCA[predictionL == i][:, 1], label=str(i))

    matplot.title(filename)
    matplot.legend()
    matplot.savefig(filename, dpi=300)
    matplot.show()
