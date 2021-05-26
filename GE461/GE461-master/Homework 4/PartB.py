import pandas as pd
import numpy as np
from sklearn.svm import SVC
import random
from sklearn.neural_network import MLPClassifier

df = pd.read_csv('falldetection_dataset.csv', header = None)                    # Loading data
df = df.loc[:,1:]                                                               # Deleting index numbers

labels = np.array(df.loc[:,1])
features = np.array(df.loc[:,2:])


test = np.ones((85,), dtype = int)                                              # Preparing test and validation feature arrays
validation = np.ones((85,), dtype = int)

nofalls = np.argwhere(labels=='NF').reshape(253,)
for i in range(38):                                                             # Data seperation for 177/38/38 NoFall samples train/validation/test
    selection = random.choice(nofalls)
    test[i] = int(selection)
    nofalls = np.delete(nofalls,np.argwhere(nofalls == selection))
    
    selection = random.choice(nofalls)
    validation[i] = selection
    nofalls = np.delete(nofalls,np.argwhere(nofalls == selection))
           
falls = np.argwhere(labels=='F').reshape(313,)
for j in range(1,48):                                                           # Data seperation for 219/47/47 Fall samples train/validation/test
    selection = random.choice(falls)
    test[i+j] = selection
    falls = np.delete(falls,np.argwhere(falls == selection))
    
    selection = random.choice(falls)
    validation[i+j] = selection
    falls = np.delete(falls,np.argwhere(falls == selection))

train_labels = np.append(labels[nofalls,],labels[falls,] , axis = 0)            # Appending Labels     
test_labels = labels[test,]
validation_labels = labels[validation,]

train = np.append(features[nofalls,:],features[falls,:], axis=0)                # Appending Features
test = features[test,:]
validation = features[validation,:]                                             # In the end data sizes will be 396/85/85 by having labels as same ratios and all samples are selected randomly

svm = SVC(C = 1.0, degree = 3, max_iter = 10000, shrinking = True, kernel = 'linear')                   # SVM Preparation
svm.fit(train, train_labels)
validation_accuracy = sum(svm.predict(validation) == validation_labels)/len(validation_labels)          # Calculating validation accuracy
print("HyperParameters : C = 1.0, degree = 3, max_iter = 10000, shrinking = True, kernel = 'linear'")
print("SVM Validation Accuracy: " + str(validation_accuracy*100) + "%")
test_accuracy = sum(svm.predict(test) == test_labels)/len(test_labels)                                  # Calculating Test Accuracy
print("SVM Test Accuracy: " + str(test_accuracy*100) + "%")

mlp = MLPClassifier(solver='lbfgs', alpha=1e-5, hidden_layer_sizes=(10, 2), random_state=1, learning_rate_init = 0.0001, max_iter = 200)       # MLP Preparation
mlp.fit(train,train_labels)
validation_accuracy = sum(mlp.predict(validation) == validation_labels)/len(validation_labels)                                                 # Calculating Validation Accuracy         
print("Hyperparameters: solver='lbfgs', alpha=1e-5, hidden_layer_sizes=(10, 2), random_state=1, learning_rate_init = 0.0001, max_iter = 200")
print("MLP Validation Accuracy: " + str(test_accuracy*100) + "%")
test_accuracy = sum(mlp.predict(test) == test_labels)/len(test_labels)                                                                         # Calculating Test Accuracy
print("MLP Test Accuracy: " + str(test_accuracy*100) + "%")