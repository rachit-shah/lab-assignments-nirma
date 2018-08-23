
# coding: utf-8

# In[1]:


from scipy.io import arff
import numpy as np
import random
from sklearn.naive_bayes import MultinomialNB, GaussianNB, BernoulliNB
from sklearn.svm import SVC, NuSVC, LinearSVC
from sklearn.metrics import confusion_matrix 


# In[2]:


data,meta = arff.loadarff('spambase.arff')


# In[3]:


#print(data)
#print(meta)


# In[4]:


random.shuffle(data)
train = data[:3000]
test = data[3000:]
print(train.shape)
print(type(train[0]))


# In[5]:


trainY = train['is_spam']
#print(trainY)

names = list(train.dtype.names)
trainX = train[names[:57]]
#print(trainX)

testY = test['is_spam']
#print(testY)

testX = test[names[:57]]
#print(testX)


# In[6]:


np.set_printoptions(threshold=np.nan)
print(trainY.shape)

trainX = np.array(trainX.tolist())
testX = np.array(testX.tolist())
#print(trainX)


# In[12]:


from sklearn.metrics import precision_recall_fscore_support
model = MultinomialNB()
model.fit(trainX,trainY)
prediction = model.predict(testX)
conf = confusion_matrix(testY,prediction)
print(conf)
accuracy = (conf[0][0] + conf[1][1])/(conf[0][0] + conf[1][1] + conf[0][1] + conf[1][0]) 
print('Accuracy = ',accuracy)
precision = conf[0][0]/(conf[0][0] + conf[0][1])*100
recall = conf[0][0]/(conf[0][0] + conf[1][0])*100

print('Precision =', precision )
print('Recall=', recall)
precision_recall_fscore_support(testY, prediction, average='weighted')


# In[13]:


model2 = BernoulliNB()
model2.fit(trainX,trainY)
prediction = model2.predict(testX)
conf = confusion_matrix(testY,prediction)
print(conf)
accuracy = (conf[0][0] + conf[1][1])/(conf[0][0] + conf[1][1] + conf[0][1] + conf[1][0]) 
print('Accuracy = ',accuracy)
precision = conf[0][0]/(conf[0][0] + conf[0][1])*100
recall = conf[0][0]/(conf[0][0] + conf[1][0])*100

print('Precision =', precision )
print('Recall=', recall)
precision_recall_fscore_support(testY, prediction, average='weighted')


# In[14]:


model3 = GaussianNB()
model3.fit(trainX,trainY)
prediction = model3.predict(testX)
conf = confusion_matrix(testY,prediction)
print(conf)
accuracy = (conf[0][0] + conf[1][1])/(conf[0][0] + conf[1][1] + conf[0][1] + conf[1][0]) 
print('Accuracy = ',accuracy)
precision = conf[0][0]/(conf[0][0] + conf[0][1])*100
recall = conf[0][0]/(conf[0][0] + conf[1][0])*100

print('Precision =', precision )
print('Recall=', recall)
precision_recall_fscore_support(testY, prediction, average='weighted')


# In[15]:


model4 = LinearSVC()
model4.fit(trainX,trainY)
prediction = model4.predict(testX)
conf = confusion_matrix(testY,prediction)
print(conf)
accuracy = (conf[0][0] + conf[1][1])/(conf[0][0] + conf[1][1] + conf[0][1] + conf[1][0]) 
print('Accuracy = ',accuracy)
precision = conf[0][0]/(conf[0][0] + conf[0][1])*100
recall = conf[0][0]/(conf[0][0] + conf[1][0])*100

print('Precision =', precision )
print('Recall=', recall)
precision_recall_fscore_support(testY, prediction, average='weighted')

