import matplotlib.pyplot as plt
import numpy as np
import math
import random

def sigmoid(x):
  return 1 / (1 + math.exp(-x))


f = open("test1.txt", "r")
test = np.ones(shape = (41,3))
for i in range(41):
    line = f.readline() 
    test[i,0] = line[0:line.find('\t')]
    test[i,1] = line[line.find('\t')+1:line.find('\n')]
    if sigmoid(test[i,1])>=0.5:
        test[i,2] = 1
    else:
        test[i,2] = 0
f.close()  
   
f = open("train1.txt", "r")
train = np.ones(shape = (60,3))
for i in range(60):
    line = f.readline() 
    train[i,0] = line[0:line.find('\t')]
    train[i,1] = line[line.find('\t')+1:line.find('\n')]
    if sigmoid(train[i,1])>=0.5:
        train[i,2] = 1
    else:
        train[i,2] = 0
f.close()    

## NORMALIZATION Min-Max Feature Scaling
maximum_input = max(max(train[:,0]),max(test[:,0]))
maximum_output = max(max(train[:,1]),max(test[:,1]))
minimum_input = min(min(train[:,0]),min(test[:,0]))
minimum_output = min(min(train[:,1]),min(test[:,1]))

train_normalized = np.array(train)
test_normalized = np.array(test)

train_normalized[:,0] = (train[:,0] - minimum_input) / (maximum_input - minimum_input)
train_normalized[:,1] = (train[:,1] - minimum_output) / (maximum_output - minimum_output)

test_normalized[:,0] = (test[:,0] - minimum_input) / (maximum_input - minimum_input)
test_normalized[:,1] = (test[:,1] - minimum_output) / (maximum_output - minimum_output)


## ANN For Linear Regressor
weights_linreg = np.array([random.random(),random.random()]).reshape(2,1)
epochs = 1000
rate = 0.0001

for i in range(epochs):
    selection = np.arange(0,60,1)
    while len(selection)>0:
        index = random.choice(selection)
        selection = np.delete(selection,np.argwhere(selection==index))
        
        w0 = weights_linreg[0]
        w1 = weights_linreg[1]
        x1 = train[index,0]
        y = train[index,1]
        fx = w0 + w1*x1
        
        gradient0 = rate * (y - fx)
        gradient1 = rate * (y - fx) * x1
        
        weights_linreg[0] += gradient0
        weights_linreg[1] += gradient1
        
x1 = train[:,0].reshape(60,1) 
results = weights_linreg[0] + weights_linreg[1]*x1

loss = sum((results - train[:,1].reshape(60,1))**2) / len(train)
plt.plot(x1, train[:,1], 'ro')
plt.plot(x1, results)
plt.xlabel('Inputs')
plt.ylabel('Output')
plt.title('ANN for Linear Regressor Train Data - Loss= ' + str(loss))
plt.show()

x1 = test[:,0].reshape(41,1) 
results = weights_linreg[0] + weights_linreg[1]*x1

loss = sum((results - test[:,1].reshape(41,1))**2) / len(test)
plt.plot(x1, test[:,1], 'ro')
plt.plot(x1, results)
plt.xlabel('Inputs')
plt.ylabel('Output')
plt.title('ANN for Linear Regressor Test Data - Loss= ' + str(loss))
plt.show()

loss = sum((results - test[:,1].reshape(41,1))**2) / len(test)

## ANN For Linear Regressor with Normalized Data
weights_linreg_normalized = np.array([random.random(),random.random()]).reshape(2,1)

for i in range(epochs):
    selection = np.arange(0,60,1)
    while len(selection)>0:
        index = random.choice(selection)
        selection = np.delete(selection,np.argwhere(selection==index))
        
        w0 = weights_linreg_normalized[0]
        w1 = weights_linreg_normalized[1]
        x1 = train_normalized[index,0]
        y = train_normalized[index,1]
        fx = w0 + w1*x1
        
        gradient0 = rate * (y - fx)
        gradient1 = rate * (y - fx) * x1
        
        weights_linreg_normalized[0] += gradient0
        weights_linreg_normalized[1] += gradient1
        
x1 = train_normalized[:,0].reshape(60,1) 
results = weights_linreg_normalized[0] + weights_linreg_normalized[1]*x1

loss = sum((results - train[:,1].reshape(60,1))**2) / len(train)
plt.plot(x1, train_normalized[:,1], 'ro')
plt.plot(x1, results)
plt.xlabel('Inputs')
plt.ylabel('Outputs')
plt.title('ANN for Linear Regressor and Min Max Scaled Data Train Data - Loss= ' + str(loss))
plt.show()

x1 = test[:,0].reshape(41,1) 
results = weights_linreg_normalized[0] + weights_linreg_normalized[1]*x1

loss = sum((results - test[:,1].reshape(41,1))**2) / len(test)
plt.plot(x1, test[:,1], 'ro')
plt.plot(x1, results)
plt.xlabel('Inputs')
plt.ylabel('Output')
plt.title('ANN for Linear Regressor and Min Max Scaled Data Test Data - Loss= ' + str(loss))
plt.show()