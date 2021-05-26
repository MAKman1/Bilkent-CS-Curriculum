import pandas as pd
import numpy as np
import sklearn.decomposition
import sklearn.cluster
import matplotlib as plt

df = pd.read_csv('falldetection_dataset.csv', header = None)                    # Loading data
df = df.loc[:,1:]                                                               # Deleting index numbers

labels = np.array(df.loc[:,1]).reshape(566,1)                                   
features = np.array(df.loc[:,2:])

labels [labels == 'F'] = 1                                                      # Making labels Falls 1 and Nofalls 0
labels [labels == 'NF'] = 0

pca = sklearn.decomposition.PCA(n_components = 2)                               # Preparing PCA for 2 components
pca.fit(features)                                                               # PCA performed to full data

variance_full = pca.explained_variance_ratio_                               # Explained Variances by the components
feature_reduced = pca.transform(features)                                       # Feature Reduction by PCA

fails = labels[:,0]==1                                                          # Fall indexes
nofails = labels[:,0]==0                                                        # Nofall indexes

plt.pyplot.scatter(feature_reduced[fails][:,0],feature_reduced[fails][:,1], label = 'F')
plt.pyplot.scatter(feature_reduced[nofails][:,0],feature_reduced[nofails][:,1], label = 'NF')
plt.pyplot.title("2-D Plot with Initial Labels")
plt.pyplot.legend()
plt.pyplot.savefig('2-D Plot with Initial Labels', dpi=1200)
plt.pyplot.show()                                                               # 2-D Plot with Initial Labels

                                                           
index1 = np.argwhere(feature_reduced[:,0]==max(feature_reduced[:,0]))[0,0]      # Deleting index 504, the first outlier.
new_features = np.delete(feature_reduced, index1, axis = 0)                        
new_labels = np.delete(labels, index1)

index2 = np.argwhere(new_features[:,1]==max(new_features[:,1]))[0,0]            # Deleting index_317, second outlier.
new_features = np.delete(new_features, index2, axis = 0)                        
new_labels = np.delete(new_labels, index2).reshape(len(new_features),1)

fails_new = new_labels[:,0]==1                                                  # Fall indexes for non_outlier data
nofails_new = new_labels[:,0]==0                                                # Nofall indexes for non_outlier data

plt.pyplot.scatter(new_features[fails_new][:,0],new_features[fails_new][:,1], label = 'F')
plt.pyplot.scatter(new_features[nofails_new][:,0],new_features[nofails_new][:,1], label = 'NF')
plt.pyplot.title("2-D Plot with Initial Labels and without Outliers")
plt.pyplot.legend()
plt.pyplot.savefig('2-D Plot with Initial Labels and without Outliers', dpi=1200)
plt.pyplot.show()                                                                  # 2-D Plot with Initial Labels without Outliers


features_nooutlier = np.delete(features, index1, axis = 0)                         # Non-outlier full featured data preparation for PCA
labels_nooutlier = np.delete(labels, index1)
features_nooutlier = np.delete(features_nooutlier, index2, axis = 0)
labels_nooutlier = np.delete(labels_nooutlier, index2).reshape(564,1)

pca.fit(features_nooutlier)                                                         # PCA performed to non_outlier data

variance_nooutlier = pca.explained_variance_ratio_
feature_reduced_nooutlier = pca.transform(features_nooutlier)

fails = labels_nooutlier[:,0]==1
nofails = labels_nooutlier[:,0]==0

plt.pyplot.scatter(feature_reduced_nooutlier[fails][:,0],feature_reduced_nooutlier[fails][:,1], label = 'F')
plt.pyplot.scatter(feature_reduced_nooutlier[nofails][:,0],feature_reduced_nooutlier[nofails][:,1], label = 'NF')
plt.pyplot.title("Dimension Reduction Without Outliers")
plt.pyplot.legend()
plt.pyplot.savefig('2-D Plot with Initial Labels', dpi=1200)                        
plt.pyplot.show()                                                               # Plotting non_outlier data in 2_Reduced dimensions                 

clusters = 2
kmeans = sklearn.cluster.KMeans(n_clusters = clusters)                          # Kmeans preparation
kmeans.fit(feature_reduced)                                                     # Kmeans For Full Data
pred_lab = kmeans.labels_

fails = pred_lab==1                                                             # Fall Indexes
nofails = pred_lab==0                                                           # Nofall Indexes    

plt.pyplot.scatter(feature_reduced[fails][:,0],feature_reduced[fails][:,1], label = "F" , c = '#7fbf7b')
plt.pyplot.scatter(feature_reduced[nofails][:,0],feature_reduced[nofails][:,1], label = "NF", c = '#af8dc3')
plt.pyplot.title("Full Data KMeans Clustering n=2")
plt.pyplot.legend()
plt.pyplot.savefig('Full Data KMeans Clustering n_2', dpi=1200)
plt.pyplot.show()

print("Accuracy of Kmeans For Full Data: " + str(sum(pred_lab != labels.reshape(566,)) / 566))

kmeans = sklearn.cluster.KMeans(n_clusters = clusters)                          # Kmeans for non_outlier data
kmeans.fit(feature_reduced_nooutlier)
pred_lab = kmeans.labels_

fails = pred_lab==0                                                             # Fall Indexes
nofails = pred_lab==1                                                        # Nofall Indexes

plt.pyplot.scatter(feature_reduced_nooutlier[fails][:,0],feature_reduced_nooutlier[fails][:,1], label = "F", c = '#7fbf7b')
plt.pyplot.scatter(feature_reduced_nooutlier[nofails][:,0],feature_reduced_nooutlier[nofails][:,1], label = "NF", c = '#af8dc3')
plt.pyplot.title("Non-outlier Data KMeans Clustering n=2")
plt.pyplot.legend()
plt.pyplot.savefig('Non-outlier Data KMeans Clustering n_2', dpi=1200)
plt.pyplot.show()                                                               # Plotting non_outlier data in 2_Reduced dimensions with knn

print("Accuracy of Kmeans For Non-Outlier Data: " + str(sum(pred_lab == labels_nooutlier.reshape(564,)) / 564))

clusters = np.array([4,6,8,10,12], dtype = int)                                 # Kmeans preparation for k = {4,6,8,10,12}

for k in clusters:
    kmeans = sklearn.cluster.KMeans(n_clusters = k)
    kmeans.fit(feature_reduced)
    pred_lab = kmeans.labels_
    
    labls = np.unique(pred_lab)
    filename = 'Full Data KMeans Clustering n_' + str(k)
    
    for i in labls:                                                             # Plotting Kmeans Results for k = {4,6,8,10,12}
        plt.pyplot.scatter(feature_reduced[pred_lab == i][:,0],feature_reduced[pred_lab == i][:,1], label = str(i))
    
    plt.pyplot.title(filename)
    plt.pyplot.legend()
    plt.pyplot.savefig(filename, dpi=1200)
    plt.pyplot.show()