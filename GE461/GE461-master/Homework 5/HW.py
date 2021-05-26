# -*- coding: utf-8 -*-
"""
Created on Sun May 24 15:10:28 2020

@author: Batihan Akca
"""
import numpy as np
import skmultiflow

rbf = skmultiflow.data.RandomRBFGenerator(n_classes = 2, n_features = 10)
rbf10 = skmultiflow.data.RandomRBFGeneratorDrift(n_classes = 2, n_features = 10, change_speed = 10)
rbf70 = skmultiflow.data.RandomRBFGeneratorDrift(n_classes = 2, n_features = 10, change_speed = 70)

rbf.prepare_for_use()
d = rbf.next_sample(10000)

rbf10.prepare_for_use()
d10 = rbf10.next_sample(10000)

rbf70.prepare_for_use()
d70 = rbf70.next_sample(10000)

file1 = np.append(d[0], d[1].reshape(10000,1) , axis = 1)
file2 = np.append(d10[0], d10[1].reshape(10000,1) , axis = 1)
file3 = np.append(d70[0], d70[1].reshape(10000,1) , axis = 1)

np.savetxt('RBF Dataset.txt', file1, delimiter=',')
np.savetxt('RBF Dataset 10.txt', file2, delimiter=',')
np.savetxt('RBF Dataset 70.txt', file3, delimiter=',')
