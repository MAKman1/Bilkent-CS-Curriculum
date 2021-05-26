from scipy.io import loadmat
import random
import numpy as np
import math 
import sklearn.decomposition
import sklearn.naive_bayes
import sklearn.discriminant_analysis
import matplotlib.pyplot as plt

data = loadmat('digits.mat')

d = np.ones((5000,401))
d[:,0:400] = np.array(data['digits'])
d[:,400:401] = np.array(data['labels'])

d = d[np.argsort(d[:,400])]

totals = np.empty((10,1))
for i in range(10):
    totals[i,0] = sum(d[:,400][:]==i)


train = np.array(np.ones((1,401)))
for i in range(10):
    kk = math.ceil(totals[i][0]/2)
    for j in range(kk):
        selection = random.choice(np.where(d[:,400]==i)[0])
        train = np.append(train,d[selection:selection+1,:], axis =0)
        d[selection] = np.ones((1,401))*-1       

test = d[np.where(d[:,0]!=-1)[0]]
train = train[1:2502,:]

test_labels = test[:,400]
train_labels = train[:,400]

train = train [:,0:400] 
test = test [:,0:400] 


## QUESTION 1.1 ##
pca = sklearn.decomposition.PCA(n_components = 400)
pca.fit(train)
eigenvalues = pca.explained_variance_
plt.plot(eigenvalues)   ## plot for 1.1


mean_picture_pca = plt.imshow((pca.mean_).reshape(20,20))
plt.axis("off")
plt.savefig("pca_mean.png",dpi = 300)

pca = sklearn.decomposition.PCA(n_components = 50)
pca.fit(train)
components = pca.components_

for i in range(50):
    plt.subplot(5,10,i+1)
    plt.axis("off")
    plt.imshow((components[i]).reshape(20,20))  
    

clf = sklearn.naive_bayes.GaussianNB()

results_test = np.ones((20,2))
results_train = np.ones((20,2))

for i in range(20):
    i = i + 1
    
    pca = sklearn.decomposition.PCA(n_components = i*20)
    pca.fit(train)
    
    proj_train =  pca.transform(train)
    proj_test  =  pca.transform(test)
    
    clf.fit(proj_train,train_labels)
    
    pred_test = clf.predict(proj_test)
    pred_train = clf.predict(proj_train)
    
    acc_test = (sum(pred_test == test_labels))/len(test_labels)
    acc_train = (sum(pred_train == train_labels))/len(train_labels)
    
    results_test[i-1,0] = i*10
    results_test[i-1,1] = acc_test

    results_train[i-1,0] = i*10
    results_train[i-1,1] = acc_train
    
plt.plot(results_test[:,0],results_test[:,1],label = "test")
plt.plot(results_train[:,0],results_train[:,1],label = "train")
## ACCURACY PLOTS

plt.plot(results_test[:,0], 1 - results_test[:,1],label = "test")
plt.plot(results_train[:,0],1 - results_train[:,1],label = "train")
## ERROR PLOTS


lda = sklearn.iscriminant_analysis.LinearDiscriminantAnalysis(n_components=None)
lda.fit(X = train, y = train_labels)

coefs = lda.coef_

for i in range(10):
    plt.subplot(2,5,i+1)
    plt.axis("off")
    plt.imshow((lda.coef_[i]).reshape(20,20))  

results_test_lda = np.ones((9,2))
results_train_lda = np.ones((9,2))

for i in range(1,10):
    
    lda = sklearn.discriminant_analysis.LinearDiscriminantAnalysis(n_components=i)
    lda.fit(X = train, y = train_labels)
    
    lda_test =  lda.transform(X = test)
    lda_train = lda.transform(X = train)
    
    clf.fit(lda_train,train_labels)
    
    pred_test_lda = clf.predict(lda_test) 
    pred_train_lda = clf.predict(lda_train)
    
    acc_test = (sum(pred_test_lda == test_labels))/len(test_labels)
    acc_train = (sum(pred_train_lda == train_labels))/len(train_labels)
    
    results_test_lda[i-1,0] = i
    results_test_lda[i-1,1] = acc_test

    results_train_lda[i-1,0] = i
    results_train_lda[i-1,1] = acc_train
    
plt.plot(results_test_lda[:,0],results_test_lda[:,1], label = "test")
plt.plot(results_train_lda[:,0],results_train_lda[:,1], label = "train")
## ACCURACY PLOTS

plt.plot(results_test_lda[:,0],1 - results_test_lda[:,1], label = "test")
plt.plot(results_train_lda[:,0],1 - results_train_lda[:,1], label = "train")
## ERROR PLOTS