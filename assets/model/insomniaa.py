# -*- coding: utf-8 -*-
"""insomniaa.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/10hDPi96sTNRMFMbQUkNthfjcANshAuTn
"""

# Commented out IPython magic to ensure Python compatibility.
# Import needed libraries

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
# %matplotlib inline
import seaborn as sns
import re

from sklearn.svm import SVC
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier, AdaBoostClassifier, GradientBoostingClassifier
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report, make_scorer

from plotly.offline import iplot
import plotly as py
import plotly.tools as tls

import pickle

df = pd.read_csv('/content/insomniaa.csv')
df.head(30)

df.shape

df.info()

df.describe()

df.isnull().sum()

df['insomnia'].value_counts()

df['insomnia'].value_counts()/df.shape[0]*100

labels = ['yes', 'No']
values = df['insomnia'].value_counts().values

plt.pie(values, labels=labels, autopct='%1.0f%%')
plt.title('INSOMNIA')
plt.show()

plt.figure(figsize=(15, 15))
sns.heatmap(df.corr(), annot = True, cmap = "Blues")
plt.show()

df['age'].plot(kind = 'hist', title = 'Age Distribution')
plt.show()

print('Min age: ', min(df['age']))
print('Max age: ', max(df['age']))
print('Average age: ', df['age'].mean())

# Display age distribution based on insomnia
sns.distplot(df[df['insomnia'] == 1]['age'], label='Do not have insomnia')
sns.distplot(df[df['insomnia'] == 2]['age'], label = 'Have insomnia')
plt.xlabel('Frequency')
plt.ylabel('Age')
plt.title('Age Distribution based insomnia')
plt.legend()
plt.show()

# Get min, max and average of the age of the people do not have insomnia
print('Min age of people who do not have insomnia: ', min(df[df['insomnia'] == 1]['age']))
print('Max age of people who do not have insomnia: ', max(df[df['insomnia'] == 1]['age']))
print('Average age of people who do not have insomnia: ', df[df['insomnia'] == 1]['age'].mean())

df['coffee'].plot(kind = 'hist', title = 'coffee effects', figsize = (8, 6))
plt.show()

df['sleep_hrs'].plot(kind = 'hist', title = 'Sleep hours', figsize = (8, 6))
plt.show()

df['sleep_pills'].plot(kind = 'hist', title = 'Sleep pills', figsize = (8, 6))
plt.show()

target = df['insomnia']
features = df.drop(['insomnia'], axis = 1)

# Split the data into training set and testing set
X_train, X_test, y_train, y_test = train_test_split(features, target, test_size = 0.2, random_state = 0)

# Train and evaluate model
def fit_eval_model(model, train_features, y_train, test_features, y_test):
    
    """
    Function: train and evaluate a machine learning classifier.
    Args:
      model: machine learning classifier
      train_features: train data extracted features
      y_train: train data lables
      test_features: train data extracted features
      y_test: train data lables
    Return:
      results(dictionary): a dictionary of classification report
    """
    results = {}
    
    # Train the model
    model.fit(train_features, y_train)
    
    # Test the model
    train_predicted = model.predict(train_features)
    test_predicted = model.predict(test_features)
    
     # Classification report and Confusion Matrix
    results['classification_report'] = classification_report(y_test, test_predicted)
    results['confusion_matrix'] = confusion_matrix(y_test, test_predicted)
        
    return results

sv = SVC(random_state = 1)
rf = RandomForestClassifier(random_state = 1)
ab = AdaBoostClassifier(random_state = 1)
gb = GradientBoostingClassifier(random_state = 1)


# Fit and evaluate models
results = {}
for cls in [sv, rf, ab, gb]:
    cls_name = cls.__class__.__name__
    results[cls_name] = {}
    results[cls_name] = fit_eval_model(cls, X_train, y_train, X_test, y_test)

# Print classifiers results
for result in results:
    print (result)
    print()
    for i in results[result]:
        print (i, ':')
        print(results[result][i])
        print()
    print ('-----')
    print()

importance = rf.feature_importances_
# summarize feature importance
for i,v in enumerate(importance):
    print('Feature: %s, Score: %.5f' % (features.columns[i], v))
# plot feature importance
plt.bar([x for x in range(len(importance))], importance)
plt.show()

with open('model.pkl', 'wb') as file:
    pickle.dump(rf, file)