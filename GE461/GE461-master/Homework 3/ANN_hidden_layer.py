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


hidden = 32                          ## Number of Hidden Units
weights = np.zeros((hidden,3))
epochs = 100
rate = 0.001


#INITIALIZATION
for row in range(hidden):
    weights[row,0] = random.random()    # w0's initialization
    weights[row,1] = random.random()    # w1's initialization
weights[:,2] = 1/hidden                 # wh's initialization
    

#ANN with One Hidden Layer
for i in range(epochs):
    selection = np.arange(0,60,1)
    while len(selection)>0:
        index = random.choice(selection)
        selection = np.delete(selection,np.argwhere(selection==index))
        
        w0 = weights[:,0]
        w1 = weights[:,1]
        wh = weights[:,2]
        
        x1 = train[index,0]
        y = train[index,2]
        
        hx = 1 / (1 + np.exp(- (w0 + w1*x1)) )
        output = sum(hx*wh)
        
        gradient0 = rate * (y - output) * wh * hx * (1-hx)
        gradient1 = rate * (y - output) * wh * hx * (1-hx) * x1
        gradient2 = rate * (y - output) * hx
        
        weights[:,0] += gradient0
        weights[:,1] += gradient1
        weights[:,2] += gradient2
        
        
w0 = weights[:,0].reshape(1,hidden)
w1 = weights[:,1].reshape(1,hidden)
wh = weights[:,2].reshape(hidden,1)     


x1 = train[:,0].reshape(60,1)       
y = train[:,2].reshape(60,1)
hx = 1 / (1 + np.exp(- (w0 + x1*w1 )))
results = np.dot(hx,wh)
loss = sum((results - y)**2)

plt.plot(x1, train[:,2], 'ro')
plt.plot(x1, results)
plt.xlabel('Inputs')
plt.ylabel('Probability')
plt.title('ANN with One Hidden Layer Train Data Loss: ' + str(loss))
plt.show()
print('Standard Deviation For Train: ' + str(np.std((results - y)**2)))
print('Loss For Train: ' + str(loss))

x1 = test[:,0].reshape(41,1)       
y = test[:,2].reshape(41,1)
hx = 1 / (1 + np.exp(- (w0 + x1*w1 )))
results = np.dot(hx,wh)
loss = sum((results - y)**2)

plt.plot(x1, test[:,2], 'ro')
plt.plot(x1, results)
plt.xlabel('Inputs')
plt.ylabel('Probability')
plt.title('ANN with One Hidden Layer Test Data Loss: ' + str(loss))
plt.show()
print('Standard Deviation For Test: ' + str(np.std((results - y)**2)))
print('Loss For Test: ' + str(loss))

#INITIALIZATION
weights_normalized = np.zeros((hidden,3))

for row in range(hidden):
    weights_normalized[row,0] = random.random()    # w0's initialization
    weights_normalized[row,1] = random.random()    # w1's initialization
weights_normalized[:,2] = 1/hidden                 # wh's initialization
    

#ANN with One Hidden Layer with Normalized Data
for i in range(epochs):
    selection = np.arange(0,60,1)
    while len(selection)>0:
        index = random.choice(selection)
        selection = np.delete(selection,np.argwhere(selection==index))
        
        w0 = weights_normalized[:,0]
        w1 = weights_normalized[:,1]
        wh = weights_normalized[:,2]
        
        x1 = train[index,0]
        y = train[index,2]
        
        hx = 1 / (1 + np.exp(- (w0 + w1*x1)) )
        output = sum(hx*wh)
        
        gradient0 = rate * (y - output) * wh * hx * (1-hx)
        gradient1 = rate * (y - output) * wh * hx * (1-hx) * x1
        gradient2 = rate * (y - output) * hx
        
        weights_normalized[:,0] += gradient0
        weights_normalized[:,1] += gradient1
        weights_normalized[:,2] += gradient2
        
        
w0 = weights_normalized[:,0].reshape(1,hidden)
w1 = weights_normalized[:,1].reshape(1,hidden)
wh = weights_normalized[:,2].reshape(hidden,1)     

x1 = train[:,0].reshape(60,1)       
y = train[:,2].reshape(60,1)
hx = 1 / (1 + np.exp(- (w0 + x1*w1 )))
results = np.dot(hx,wh)
loss = sum((results - y)**2)


plt.plot(x1, train_normalized[:,2], 'ro')
plt.plot(x1, results)
plt.xlabel('Inputs')
plt.ylabel('Probability')
plt.title('ANN with One Hidden Layer Normalized Train Data Loss: ' + str(loss))
plt.show()
print('Standard Deviation For Normalized-Train: ' + str(np.std((results - y)**2)))
print('Loss For Normalized Train: ' + str(loss))

x1 = test[:,0].reshape(41,1)       
y = test[:,2].reshape(41,1)
hx = 1 / (1 + np.exp(- (w0 + x1*w1 )))
results = np.dot(hx,wh)
loss = sum((results - y)**2)

plt.plot(x1, test_normalized[:,2], 'ro')
plt.plot(x1, results)
plt.xlabel('Inputs')
plt.ylabel('Probability')
plt.title('ANN with One Hidden Layer Normalized Test Data Loss: ' + str(loss))
plt.show()
print('Standard Deviation For Normalized-Test: ' + str(np.std((results - y)**2)))
print('Loss For Normalized Test: ' + str(loss))
