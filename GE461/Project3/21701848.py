import math
import random

import numpy as np

import matplotlib.pyplot as plt


def smd(x):
    return 1 / (1 + math.exp(-x))


f = open("test1", "r")
# Reading into file
testData = np.ones(shape=(41, 3))
for i in range(41):
    line = f.readline()

    # Initializing read arrays
    testData[i, 0] = line[0:line.find('\t')]
    testData[i, 1] = line[line.find('\t')+1:line.find('\n')]

    # Manipulating input data for repurposing
    if smd(testData[i, 1]) >= 0.5:
        testData[i, 2] = 1
    else:
        testData[i, 2] = 0
f.close()


# Reading train data
f = open("train1", "r")
# Reading into file
trainData = np.ones(shape=(60, 3))
for i in range(60):
    line = f.readline()
    trainData[i, 0] = line[0:line.find('\t')]
    trainData[i, 1] = line[line.find('\t')+1:line.find('\n')]
    if smd(trainData[i, 1]) >= 0.5:
        trainData[i, 2] = 1

    else:
        trainData[i, 2] = 0
f.close()

# Setting up train data that is normalized
trainNormal = np.array(trainData)
testNormal = np.array(testData)

# Scaling data for usage in model
maxIn = max(max(trainData[:, 0]), max(testData[:, 0]))
maxOut = max(max(trainData[:, 1]), max(testData[:, 1]))


minIn = min(min(trainData[:, 0]), min(testData[:, 0]))

minOut = min(min(trainData[:, 1]), min(testData[:, 1]))

trainNormal[:, 0] = (trainData[:, 0] - minIn) / (maxIn - minIn)


trainNormal[:, 1] = (trainData[:, 1] - minOut) / (maxOut - minOut)

testNormal[:, 0] = (testData[:, 0] - minIn) / (maxIn - minIn)


testNormal[:, 1] = (testData[:, 1] - minOut) / (maxOut - minOut)

# Artifical Neural Network for Linear Regressor
w_lin = np.array([random.random(), random.random()]).reshape(2, 1)
rate = 0.0001
epochs = 10

for i in range(epochs):
    selection = np.arange(0, 60, 1)
    while len(selection) > 0:
        index = random.choice(selection)
        selection = np.delete(selection, np.argwhere(selection == index))
        w0 = w_lin[0]
        w1 = w_lin[1]
        xInput = trainData[index, 0]
        y = trainData[index, 1]
        fx = w0 + w1*xInput
        gradient0 = rate * (y - fx)
        gradient1 = rate * (y - fx) * xInput
        w_lin[0] += gradient0
        w_lin[1] += gradient1


xInput = trainData[:, 0].reshape(60, 1)
results = w_lin[0] + w_lin[1]*xInput
# Plotting output for these systems
loss = sum((results - trainData[:, 1].reshape(60, 1))**2) / len(trainData)
plt.plot(xInput, trainData[:, 1], 'ro', color='black')
plt.plot(xInput, results, color='green')
plt.title('Artificial Neural Network (ANN) | Linear Regressor w/h Train Data | Loss= ' + str(loss))
plt.xlabel('in')
plt.ylabel('out')
plt.show()

xInput = testData[:, 0].reshape(41, 1)
results = w_lin[0] + w_lin[1]*xInput
loss = sum((results - testData[:, 1].reshape(41, 1))**2) / len(testData)
plt.plot(xInput, testData[:, 1], 'ro', color='black')
plt.plot(xInput, results, color='green')
plt.title('Artificial Neural Network (ANN) | Linear Regressor w/h Test Data | Loss= ' + str(loss))
plt.xlabel('in')
plt.ylabel('out')
plt.show()

loss = sum((results - testData[:, 1].reshape(41, 1))**2) / len(testData)
# Artificial Neural network for normalized data
w_lin_normalized = np.array([random.random(), random.random()]).reshape(2, 1)
for i in range(epochs):
    selection = np.arange(0, 60, 1)
    while len(selection) > 0:
        index = random.choice(selection)
        selection = np.delete(selection, np.argwhere(selection == index))
        w0 = w_lin_normalized[0]
        w1 = w_lin_normalized[1]
        xInput = trainNormal[index, 0]
        y = trainNormal[index, 1]
        fx = w0 + w1*xInput
        gradient0 = rate * (y - fx)
        gradient1 = rate * (y - fx) * xInput
        w_lin_normalized[0] += gradient0
        w_lin_normalized[1] += gradient1


# Input verification and plot generation
xInput = trainNormal[:, 0].reshape(60, 1)
results = w_lin_normalized[0] + w_lin_normalized[1]*xInput
loss = sum((results - trainData[:, 1].reshape(60, 1))**2) / len(trainData)
plt.plot(xInput, trainNormal[:, 1], 'ro', color='black')


plt.plot(xInput, results, color='green')
plt.title('Artifical Neural Network (ANN) | Linear Regressor w/h Train Data (Normalized Data) | Loss= ' + str(loss))
plt.xlabel('in')


plt.ylabel('out')
plt.show()

# Plot generation
xInput = testData[:, 0].reshape(41, 1)

results = w_lin_normalized[0] + w_lin_normalized[1]*xInput
loss = sum((results - testData[:, 1].reshape(41, 1))**2) / len(testData)
plt.plot(xInput, testData[:, 1], 'ro', color='black')
plt.plot(xInput, results, color='green')
plt.title('Artifical Neural Network (ANN) | Linear Regressor w/h Test Data (Normalized Data) | Loss= ' + str(loss))
plt.xlabel('in')
plt.ylabel('out')
plt.show()
