import sys
import numpy as np

from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay
import matplotlib.pyplot as plt

print(f"==> Current Python : {sys.executable}")

# Récupération des images au format numpy
# ---------------------------------------
import tensorflow as tf

(x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()
assert x_train.shape == (60000, 28, 28)
assert y_train.shape == (60000,)
assert x_test.shape == (10000, 28, 28)
assert y_test.shape == (10000,)

# Mise au bon format
nb_entry = 1000
nb_entry_test = 100
x_0, y_0 = x_train[:nb_entry], y_train[:nb_entry]
x_1, y_1 = x_train[:nb_entry_test], y_train[:nb_entry_test]

x_A = [i.flatten() for i in x_0]
x_B = [i.flatten() for i in x_1]

y_A = [[int(i == label) for i in range(10)] for label in y_0]
y_B = [[int(i == label) for i in range(10)] for label in y_1]

x_A = np.asarray(x_A, dtype=np.double).transpose()
y_A = np.asarray(y_A, dtype=np.double).transpose()
x_B = np.asarray(x_B, dtype=np.double).transpose()
y_B = np.asarray(y_B, dtype=np.double).transpose()

print(f"x_A.shape : {x_A.shape}")
print(f"y_A.shape : {y_A.shape}")
print(f"x_B.shape : {x_B.shape}")
print(f"y_B.shape : {y_B.shape}")

# Perceptron Cpp
# --------------
from perceptron import Layer

l = Layer(0, 0)
print( l )


