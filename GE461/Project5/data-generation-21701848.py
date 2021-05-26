#Muhammad Arham Khan
# 21701848
# GE 461 - 15 May

import numpy
from skmultiflow.data.sea_generator import SEAGenerator

from sklearn.neural_network import MLPClassifier
from skmultiflow.lazy import KNNClassifier
from skmultiflow.trees import HoeffdingTreeClassifier

from skmultiflow.evaluation import EvaluatePrequential as ev

from sklearn.metrics import accuracy_score as ac
from sklearn.model_selection import train_test_split as train
from sklearn.ensemble import VotingClassifier as vc


# Part 1: Generating Datasets
# ....................
#Generate a dataset with 20,000 instance using SEA Generator and write it into a file called “SEA Dataset”
outputFile = True

sea = SEAGenerator(classification_function=0,
                   balance_classes=False, noise_percentage=0.0)
sea.n_num_features = 3
sea.n_features = 3
sea.feature_names = ["att_num_" + str(i) for i in range(sea.n_features)]
sea.target_values = [i for i in range(sea.n_classes)]

sea10 = SEAGenerator(classification_function=0,
                     balance_classes=False, noise_percentage=0.1)
sea10.n_num_features = 3
sea10.n_features = 3
sea10.feature_names = ["att_num_" + str(i) for i in range(sea10.n_features)]
sea10.target_values = [i for i in range(sea10.n_classes)]

sea70 = SEAGenerator(classification_function=0,
                     balance_classes=False, noise_percentage=0.7)
sea70.n_num_features = 3
sea70.n_features = 3
sea70.feature_names = ["att_num_" + str(i) for i in range(sea70.n_features)]
sea70.target_values = [i for i in range(sea70.n_classes)]

s = sea.next_sample(20000)
s10 = sea10.next_sample(20000)
s70 = sea70.next_sample(20000)

if(outputFile == True):

    outputFile1 = numpy.append(s[0], s[1].reshape(20000, 1), axis=1)
    outputFile2 = numpy.append(s10[0], s10[1].reshape(20000, 1), axis=1)
    outputFile3 = numpy.append(s70[0], s70[1].reshape(20000, 1), axis=1)
    numpy.savetxt('SEA Dataset.txt', outputFile1, delimiter=',')
    numpy.savetxt('SEA Dataset 10.txt', outputFile2, delimiter=',')
    numpy.savetxt('SEA Dataset 70.txt', outputFile3, delimiter=',')

# Part 2
# ....................
#Write a script in Python that constructs and trains the following online classifiers using the three SEA Datasets generated in step 1.
print("Part 2")
print(".......")
HT = HoeffdingTreeClassifier()
MLP = MLPClassifier(hidden_layer_sizes=(200, 4))
KNN = KNNClassifier()

evaluate = ev(
    max_samples=20000, metrics=['accuracy'], show_plot=True)
evaluate.evaluate(stream=sea, model_names=[
                  'HT', 'MLP', 'KNN'], model=[HT, MLP, KNN])
evaluate.evaluate(stream=sea10, model_names=[
                  'HT', 'MLP', 'KNN'], model=[HT, MLP, KNN])
evaluate.evaluate(stream=sea70, model_names=[
                  'HT', 'MLP', 'KNN'], model=[HT, MLP, KNN])

# Part 3
# ....................
#Write a script in Python that constructs and trains the following ensemble classifiers that combines HT, KNN, and MLP for the three SEA Datasets generated in step 1
print("Part 3")
print(".......")
# Setting up the Ensemble Classifiers
ens_mv = vc(estimators=[(
    'HT', HT), ('MLP', MLP), ('KNN', KNN)], voting='hard', weights=[1, 1, 1])
ens_wmv = vc(weights=None,
             estimators=[('HT', HT), ('MLP', MLP), ('KNN', KNN)])
ens_mv.fit(s[0], s[1])
# Outputting the accuracy for MV on datasets generated in part 1
print("acc. | MV SEA Dataset: " +
      str(ac(s[1], ens_mv.predict(s[0]))))
ens_mv.fit(s10[0], s10[1])
print("acc. | MV SEA Dataset 10: " +
      str(ac(s10[1], ens_mv.predict(s10[0]))))
ens_mv.fit(s70[0], s70[1])
print("acc. | MV SEA Dataset 70: " +
      str(ac(s70[1], ens_mv.predict(s70[0]))))
# Outputting the accuracy for WMV on datasets generated in part 1
ens_wmv.fit(s[0], s[1])
print("acc. | WMV | SEA Dataset: " +
      str(ac(s[1], ens_wmv.predict(s[0]))))
ens_wmv.fit(s10[0], s10[1])
print("acc. | WMV | SEA Dataset 10: " +
      str(ac(s10[1], ens_wmv.predict(s10[0]))))
ens_wmv.fit(s70[0], s70[1])
print("acc. | WMV | SEA Dataset 70: " +
      str(ac(s10[1], ens_wmv.predict(s70[0]))))


# Part 4
# ....................
print("Part 4")
print(".......")
#Write a script in Python that constructs and trains the HT, KNN, and MLP as batch classifiers using the three SEA Datasets generated in step 1
# code that constructs and trains the HT, KNN, and MLP as batch classifiers using the three SEA Datasets generated in step 1

trainingDataX_1, testingDataX_1, trainingDataY_1, testingDataY_1 = train(
    s[0], s[1], test_size=0.2, random_state=0)
trainingDataX_2, testingDataX_2, trainingDataY_2, testingDataY_2 = train(
    s10[0], s10[1], test_size=0.2, random_state=0)
trainingDataX_3, testingDataX_3, trainingDataY_3, testingDataY_3 = train(
    s70[0], s70[1], test_size=0.2, random_state=0)

# Batch function fitting for Dataset
HT.fit(trainingDataX_1, trainingDataY_1)
MLP.fit(trainingDataX_1, trainingDataY_1)
KNN.fit(trainingDataX_1, trainingDataY_1)
print("acc. | HT SEA Dataset: " +
      str(ac(testingDataY_1, HT.predict(testingDataX_1))))
print("acc. | MLP SEA Dataset: " +
      str(ac(testingDataY_1, MLP.predict(testingDataX_1))))
print("acc. | KNN SEA Dataset: " +
      str(ac(testingDataY_1, KNN.predict(testingDataX_1))))
# Batch function fitting for Dataset 10
HT.fit(trainingDataX_2, trainingDataY_2)
MLP.fit(trainingDataX_2, trainingDataY_2)
KNN.fit(trainingDataX_2, trainingDataY_2)
print("acc. | HT SEA Dataset 10: " +
      str(ac(testingDataY_2, HT.predict(testingDataX_2))))
print("acc. | MLP SEA Dataset 10 " +
      str(ac(testingDataY_2, MLP.predict(testingDataX_2))))
print("acc. | KNN SEA Dataset 10: " +
      str(ac(testingDataY_2, KNN.predict(testingDataX_2))))

# Batch function fitting for Dataset 70
HT.fit(trainingDataX_3, trainingDataY_3)
MLP.fit(trainingDataX_3, trainingDataY_3)
KNN.fit(trainingDataX_3, trainingDataY_3)
print("acc. | HT SEA Dataset 70: " +
      str(ac(testingDataY_3, HT.predict(testingDataX_3))))
print("acc. | MLP SEA Dataset 70: " +
      str(ac(testingDataY_3, MLP.predict(testingDataX_3))))
print("acc. | KNN SEA Dataset 70: " +
      str(ac(testingDataY_3, KNN.predict(testingDataX_3))))


# Part 5.
# ....................
#Write a script in Python that constructs and trains the ensemble classifiers MV and WMV using the three SEA Datasets generated in step 1. For each dataset combine the three batch learners defined in step 4
print("Part 5")
print(".......")
# code that constructs and trains the ensemble classifiers MV and WMV using the three SEA Datasets generated in step 1
# Setting up ensemble functions for three batch learners defined in step 4
ens_mv = vc(estimators=[(
    'HT', HT), ('KNN', KNN), ('MLP', MLP)], voting='hard', weights=[1, 1, 1])
# weights = None assigns weights from a uniform distribution
ens_wmv = vc(
    estimators=[('HT', HT), ('KNN', KNN), ('MLP', MLP)], weights=None)

# Outputting Majority Voting results
ens_mv.fit(trainingDataX_1, trainingDataY_1)
print("acc. | MV SEA Dataset: " +
      str(ac(testingDataY_1, ens_mv.predict(testingDataX_1))))
ens_mv.fit(trainingDataX_2, trainingDataY_2)
print("acc. | MV SEA Dataset 10: " +
      str(ac(testingDataY_2, ens_mv.predict(testingDataX_2))))
ens_mv.fit(trainingDataX_3, trainingDataY_3)
print("acc. | MV SEA Dataset 70: " +
      str(ac(testingDataY_3, ens_mv.predict(testingDataX_3))))
# Outputting Weighted Majority Voting results
ens_wmv.fit(trainingDataX_1, trainingDataY_1)
print("acc. | WMV | SEA Dataset: " +
      str(ac(testingDataY_1, ens_wmv.predict(testingDataX_1))))
ens_wmv.fit(trainingDataX_2, trainingDataY_2)
print("acc. | WMV | SEA Dataset 10: " +
      str(ac(testingDataY_2, ens_wmv.predict(testingDataX_2))))
ens_wmv.fit(trainingDataX_3, trainingDataY_3)
print("acc. | WMV | SEA Dataset 70: " +
      str(ac(testingDataY_3, ens_wmv.predict(testingDataX_3))))
