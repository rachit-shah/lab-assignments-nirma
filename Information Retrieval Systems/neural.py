
# coding: utf-8

# In[1]:


import matplotlib.pyplot as plt
get_ipython().magic('matplotlib inline')
from sklearn import datasets,metrics
from sklearn.neural_network import MLPClassifier


# In[2]:


digits = datasets.load_digits()


# In[3]:


data = list(digits.images)


# In[4]:


data = digits.images.reshape(len(data),-1)


# In[5]:


n_samples=len(data)


# In[6]:


model = MLPClassifier(hidden_layer_sizes=100,activation='relu',learning_rate_init=0.01,max_iter=100)


# In[7]:


from sklearn.model_selection import train_test_split
trainX, testX, trainY, testY = train_test_split(data,digits.target,test_size=0.33,random_state=42)


# In[8]:


model.fit(trainX,trainY)

model.score(testX,testY)

